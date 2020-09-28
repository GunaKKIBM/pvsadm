package images

import (
	"fmt"
	"github.com/ppc64le-cloud/pvsadm/pkg"
	"github.com/ppc64le-cloud/pvsadm/pkg/client"
	"github.com/ppc64le-cloud/pvsadm/pkg/utils"
	"github.com/spf13/cobra"
	"k8s.io/klog/v2"
)

const deletePromptMessage = "Deleting all the above images, images can't be claimed back once deleted. Do you really want to continue?"

var Cmd = &cobra.Command{
	Use:   "images",
	Short: "Purge the powervs images",
	Long:  `Purge the powervs images!`,
	RunE: func(cmd *cobra.Command, args []string) error {
		klog.Infof("Purge the images for the instance: %v", pkg.Options.InstanceID)
		opt := pkg.Options

		c, err := client.NewClient(opt.APIKey)
		if err != nil {
			return err
		}

		pvmclient, err := client.NewPVMClient(c, opt.InstanceID, opt.InstanceName)
		if err != nil {
			return err
		}

		images, err := pvmclient.ImgClient.GetAll()
		if err != nil {
			return fmt.Errorf("failed to get the list of images: %v", err)
		}
		table := utils.NewTable()

		table.Render(images.Images, []string{})
		if !opt.DryRun && len(images.Images) != 0 {
			if opt.NoPrompt || utils.AskYesOrNo(deletePromptMessage) {
				for _, image := range images.Images {
					klog.Infof("Deleting the %s, and ID: %s", *image.Name, *image.ImageID)
					err = pvmclient.ImgClient.Delete(*image.ImageID)
					if err != nil && !opt.IgnoreErrors {
						return err
					}

				}
			}
		}
		return nil
	},
}
