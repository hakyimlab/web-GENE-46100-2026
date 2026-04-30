Hi Haky,

 

Yes I think what I mentioned is to rerun Puffin first stage training and obtain a more permissive set of motifs than what we included in Puffin. In first stage training, we train multiple Puffin replicates to identify replicable motifs, we used a stringent high threshold and some motifs we didn’t include should also be true motifs for transcription initiation. So it is possible to obtain an improved Puffin with expanded alphabet.

The code is here
https://github.com/jzhoulab/puffin_manuscript/blob/main/train/train_puffin_stage1.py


Processing script to extract consensus motifs:

https://github.com/jzhoulab/puffin_manuscript/blob/main/train/Process_models.ipynb

../train/Process_models.ipynb
 

Then run stage 2 training with the consensus motif (running stage 3 is not strictly necessary):

https://github.com/jzhoulab/puffin_manuscript/blob/main/train/train_puffin_stage2.py
../train/train_puffin_stage2.py
 

Stage 1 and 2 training each takes about a day  (can be reduced substantially if need to see results quickly) so it’s realistic to complete in 10-12 days.

 

Data is part of

https://zenodo.org/records/7954971

this is a big package (37G), training data is a subset of this.

 

No problem for students to contact me for questions!