# Final Project Description - Deep Learning in Genomics

**Announced**: April 23, 2026 (week 5, Thursday)  
**Project Idea Presentations**: April 30, 2026 (week 6, Thursday)  
**Final Presentations**: May 19-21, 2026 (week 9)

## Overview

The final project is your opportunity to apply deep learning techniques to address a biological question of your interest in genomics. This is a chance to integrate the skills you've developed throughout the course and explore an area that aligns with your research interests. You have the freedom to choose your own biological question, dataset, and deep learning approach.

## Timeline and Milestones

- **Project Description Release**: April 23, 2026
- **Project Idea Presentations**: April 30, 2026
  - 3-minute presentation outlining your biological question and motivation, dataset(s) you plan to use, deep learning approach you intend to implement, and preliminary analysis plan
- **Final Project Presentations**: May 19-21, 2026
  - 10 minutes total (8-minute presentation + 2 minutes for questions): see full description below

## Project Requirements

Your final project should demonstrate your ability to apply deep learning techniques to solve meaningful problems in genomics. The following requirements are designed to ensure a complete and rigorous project:

**Scientific Question and Hypothesis.** Formulate a clear, well-defined biological question that can be addressed using genomic data and deep learning approaches. Your project should include an explicit hypothesis or set of hypotheses that your computational approach will test. The question should be specific enough to be answerable within the project timeframe, and preferably contribute meaningful biological insights.

**Data Selection and Processing.** Select appropriate dataset(s) for your project from public repositories or other sources. You should justify your data selection and demonstrate understanding of the data characteristics. Your project should include proper data preprocessing steps, which should all be documented.

**Model Implementation.** Implement at least one deep learning approach. It is completely up to you which approach to use (it does not have to be an approach covered in the course). Your implementation should demonstrate proper understanding of the model architecture and training procedure. The code should be well-documented, modular, and reproducible. You are encouraged to experiment with hyperparameter tuning and model variations to optimize performance.

**Evaluation and Benchmarking.** Design and implement evaluation metrics appropriate for your specific task. Your project should include proper train/validation/test splits or cross-validation procedures to avoid overfitting. When applicable, compare your approach against baseline methods or existing approaches to contextualize your results.

**Biological Interpretation.** Go beyond model performance metrics to extract biological insights from your results. This might include feature importance analysis, visualization of learned representations, or connecting predictions to existing biological knowledge. Your project should demonstrate how computational approaches can enhance our understanding of biological systems and processes.

**Reproducibility and Documentation.** Create a well-organized GitHub repository with clear documentation, requirements file, and instructions for reproducing your results. The code should include modular design, appropriate commenting, and error handling. Include a README file that explains the project purpose, data sources, model implementation, and key findings.

## Potential Project Ideas

These are suggestions to inspire your thinking. You are encouraged to develop your own project idea that aligns with your interests:

**Enhancer Prediction and Interpretation:** Develop a deep learning model to predict enhancer activity directly from DNA sequence data using resources like ENCODE or FANTOM5. Your analysis could focus on interpreting model weights to identify specific sequence motifs and regulatory grammar that drive enhancer function across different cell types.

**Variant Effect Prediction:** Create a model to predict the functional impact of genetic variants using datasets like ClinVar or the BRCA1 saturation mutagenesis benchmark. This project would involve encoding variant information appropriately for deep learning and can also include performance evaluation against existing prediction methods to improve our interpretation of disease-associated mutations.

**Single-Cell RNA-Seq Analysis:** Design a deep learning approach for dimensionality reduction, cell type classification, or trajectory inference in single-cell data from resources like the Human Cell Atlas. Your method can leverage architectures such as variational autoencoders or transformers to reveal new insights into cellular states and transitions in development or disease.

**Protein Structure Prediction:** Implement a simplified version of AlphaFold to predict protein structure from sequence. Your model could be trained using the Protein Data Bank and evaluated on CASP benchmark datasets to explore how deep learning can capture the biophysical principles of protein folding.

**Multi-Modal Data Integration:** Develop a model that integrates multiple genomic data types from resources like TCGA or ENCODE to address a specific biological question. Your approach would explore architectures that effectively combine heterogeneous data to provide more comprehensive insights than any single data type alone.

**Promoter Grammar and Transcription Initiation:** Use models like Puffin to analyze sequence features in promoter regions using CAGE data from FANTOM5 or GRO-seq datasets. Your analysis could investigate patterns in transcription initiation across cell types to reveal regulatory elements and rules governing promoter architecture.

**Microbiome Analysis:** Apply deep learning to analyze microbiome composition data from the Human Microbiome Project or iHMP to predict host phenotypes or identify disease-associated microbial signatures. Your model would handle the compositional nature of microbiome data to uncover microbial interactions and potential biomarkers of disease.

**Automated Model Improvement with AutoResearch:** Use Karpathy's autoresearch framework to iteratively improve the Puffin promoter grammar model. This project would explore how automated research pipelines can optimize deep learning architectures and training procedures for genomic sequence analysis. Supercomputer access at Argonne National Laboratory can be arranged if needed.

## Final Presentation

Your final presentation (8 minutes + 2 minutes for questions) should include:

**Introduction (1-2 minutes)**

- Background on the biological problem
- Clear statement of your research question
- Motivation and significance

**Methods (2-3 minutes)**

- Description of dataset(s) used
- Data preprocessing steps
- Detailed explanation of your deep learning approach
- Implementation details (architecture, hyperparameters, training procedure)
- Evaluation metrics

**Results (2-3 minutes)**

- Quantitative evaluation of model performance
- Comparison to baseline or existing methods
- Visualization of results (e.g., plots, heatmaps, feature importance)
- Biological interpretation of findings

**Discussion and Conclusion (1 minute)**

- Summary of main findings
- Limitations of your approach
- Future directions
- Broader implications for the field

## Evaluation Criteria

Your project will be evaluated based on:

**Scientific Merit (25%)**

- Clarity and significance of the biological question
- Appropriate use of data and methods
- Depth of analysis and interpretation

**Technical Implementation (25%)**

- Correct implementation of deep learning methods
- Appropriate model evaluation
- Code quality and reproducibility

**Results and Interpretation (25%)**

- Quality and clarity of results
- Depth of biological interpretation
- Critical evaluation of approach

**Presentation (25%)**

- Organization and clarity
- Quality of slides and visualizations
- Ability to answer questions

## Submission Requirements

**Project Idea**

- Presentation in class of your project idea on April 30

**Final Project Submission (due May 18)**

- GitHub repository with code, README, and documentation
- Final presentation slides

## Presentation Order

**May 19 (Tuesday)**

| Time | Student |
|------|---------|
| 11:00 – 11:10 | Kaivallya Dasu |
| 11:10 – 11:20 | Camryn Franke |
| 11:20 – 11:30 | Yanming Gan |
| 11:30 – 11:40 | Sneha Gummadi |
| 11:40 – 11:50 | Nainika Gupta |
| 11:50 – 12:00 | Haoyang Hu |
| 12:00 – 12:10 | Vincent Lam |

**May 21 (Thursday)**

| Time | Student |
|------|---------|
| 11:00 – 11:10 | Hanqing Li |
| 11:10 – 11:20 | Jiaming Liu |
| 11:20 – 11:30 | AJ Lonski |
| 11:30 – 11:40 | Jenitha Patel |
| 11:40 – 11:50 | Crystal Shan |
| 11:50 – 12:00 | Austin Szatrowski |
| 12:00 – 12:10 | Laura Xie |

## Resources and Links

**Public Data Repositories**

- ENCODE: <https://www.encodeproject.org/>
- FANTOM5: <https://fantom.gsc.riken.jp/5/>
- ClinVar: <https://www.ncbi.nlm.nih.gov/clinvar/>
- Human Cell Atlas: <https://www.humancellatlas.org/>
- Protein Data Bank (PDB): <https://www.rcsb.org/>
- CASP (protein structure prediction benchmarks): <https://predictioncenter.org/>
- TCGA (The Cancer Genome Atlas): <https://portal.gdc.cancer.gov/>
- Human Microbiome Project: <https://commonfund.nih.gov/hmp>
- iHMP (Integrative Human Microbiome Project): <https://www.hmpdacc.org/ihmp/>

**Models and Tools**

- AlphaFold: <https://github.com/google-deepmind/alphafold>
- Puffin (promoter grammar): <https://www.science.org/doi/full/10.1126/science.adj0116>
- BRCA1 saturation mutagenesis (Findlay et al.): <https://doi.org/10.1038/s41586-018-0461-z>
