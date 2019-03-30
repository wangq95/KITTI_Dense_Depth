# KITTI Dense Depth

This is a simple implementation to in-painting sparse depth map of KITTI Dataset for monocular depth estimation task training or result visulization.

## Requirements

These code has been tested with Python 2.7 and Matlab-linux on Ubuntu 16.04 LTS.

## Dataset preparation

For in-painting depth maps for training task or result visulization, you should download the ``KITTI raw dataset`` with the offical split by running the bash script in the specific data directory:

```bash
sudo bash download_kitti_raw_data.sh
```

You would want to follow the traditional split of Eigen, the training list file ``eigen_train_files.txt`` and testing list file ``eigen_test_files.txt`` can be found in ``./utils``.


## In-painting

- Firstly, you can generate the **projected** depth ground-truth by running the python code provided by:

https://github.com/danxuhk/StructuredAttentionDepthEstimation

Do not change the file structure of the **kitti raw data**. Modify the kitti raw data path ``data_path`` and save path ``gt16bit_dir`` in ``save_16bitpng_gt.py``, then

```bash
python save_16bitpng_gt.py
```

- Secondly, run the script ``extract_depth.m`` in Matlab before you modify the **index file** and **save path** of the code. Taken RGB image and projected depth groud-truth as input, this script can generate the dense depth map with **relative depth** value.

- Finally, you can remap them to a colorful result for **visulization**:

```python
import cv2
im = cv2.imread('image/path')
im_color = cv2.applyColorMap(im, cv2.COLORMAP_JET)
```

## Example

original rgb image:
![rgb](https://github.com/QianshengGu/KITTI_Dense_Depth/blob/master/misc/simple_rgb.png)

Sparse depth map that only about ``16%`` pixels available:
![sparse](https://github.com/QianshengGu/KITTI_Dense_Depth/blob/master/misc/simple_depth_sparse_jet.png)

Colorful dense map:
![dense](https://github.com/QianshengGu/KITTI_Dense_Depth/blob/master/misc/simple_depth_dense_jet.png)
