#!/bin/bash
eval "$(conda shell.bash hook)"
conda activate actor

## get 360 degrees of 3D human 
for angle in {1..360}
do
    echo "start: angle is pi / 180 * $angle"
    python -m src.render.rendermotion --filename pretrained_models/uestc/generation.npy --angle $angle
    mv pretrained_models/uestc/generation ../generation_360/generation_pi180_${angle}
    echo "complete: angle is pi / 180 * $angle"
done

