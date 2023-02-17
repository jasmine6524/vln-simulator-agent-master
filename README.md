# vln-agent

This repo is for action generation and action recognition for add 3D human in real-world environment

## How to run:
### 1. Create conda environment

```
conda create --name vln_demo python=3.8
conda activate vln_demo
```

### 2. install the following packages in your environnement:
```bash
pip install tensorboard
pip install matplotlib
pip install ipdb
pip install sklearn
pip install pandas
pip install tqdm
pip install imageio
pip install pyyaml
pip install smplx
pip install chumpy
pip install trimesh
pip install pyrender
pip install imageio-ffmpeg

```

you can download our 40 categories of 360 degrees generated human motions (46G) from [**google drive**](https://drive.google.com/file/d/1P1xKbzquhBtDEmoR1qOC8BPKi_nXk1LV/view?usp=sharing), 
unzip the human folder under ``/vln-agent/generation_360``

Or you can generate them yourself by

```bash
cd action_generator
bash generate_360degree.sh

```

you can download checkpoint from [**google drive**](https://drive.google.com/file/d/1OsmrSp2ELchRHWgG_Z_kWbAPEivWnbY7/view?usp=sharing), 
unzip the human folder under ``/vln-agent/action_generator/pretrained_model/uestc``

### 3. train action recognition model
```bash
cd action_recognition
python -m src.train.train_stgcn --dataset uestc --extraction_method vibe --pose_rep rot6d --num_epochs 100 --snapshot 50 --batch_size 64 --lr 0.0001 --num_frames 60 --view all --sampling conseq --sampling_step 1 --glob --no-translation --folder recognition_training
```
