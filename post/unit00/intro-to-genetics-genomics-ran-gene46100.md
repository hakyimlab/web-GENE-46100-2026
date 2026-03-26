---
title: Introduction to Genetics and Genomics
author: Ran Blehkman
date: 2026-03-24
draft: true
---


DNA - the code of life

• DNA: Deoxyribonucleic acid - double helix structure

• Composed of four nucleotides: Adenine (A), Cytosine (C),

Guanine (G), Thymine (T)

• Base pairing: A-T and C-G

• Human genome: ~3 billion base pairs, in 23 chromosomes

• Computational representation: Sequences of A, C, G, T

(string data)

Introduction to genomics
Genomics

Oxford dictionaries
“The branch of molecular biology concerned with the
structure, function, evolution, and mapping of genomes.”

where are the genes and other interesting bits?

how do sequences change over evolutionary time?

what does all the DNA do?

what are the physical shapes of the genome and its products?

Collins English Dictionary
“The branch of molecular genetics concerned with the study of
genomes, specifically the identification and sequencing of their
constituent genes and the application of this knowledge in
medicine, pharmacy, agriculture, etc.”

Genomics: contrast with biology & genetics*

Genetics
Biology &
Genetics

* Everything on this slide is a
   gross generalization

Genomics
Genomics

Targeted studies of one
or a few genes

scope

Studies considering all
genes in a genome

Targeted,
low-throughput
experiments

Clever experimental
design, painstaking
experimentation

technology

hard part

Global,
high-throughput
experiments

Tons of data,
uncertainty,
computation

Genomics in medical research
Genomics: tool for medicine

“The branch of molecular genetics concerned with the study of genomes,
specifically the identification and sequencing of their constituent genes and
the application of this knowledge in medicine, pharmacy, agriculture, etc.”
Collins English Dictionary

How is genotype related to health phenotypes?

What’s the difference between DNA in a tumor vs DNA in healthy tissue?

Can genomic data help predict what drugs might be appropriate for:

• a particular cancer patient?
• a particular genetic disorder?

Can genomic data reveal weaknesses in the defenses of pathogens?

Can genomic data help us predict what flu strains will prevail next year?

Deep Learning in Genomics: our course

• Can we detect regulatory motifs in DNA? → CNNs (Weeks

1–3)

• Can we learn the "language" of DNA? → GPT / Transformers

(Weeks 4–5)

• Can we predict gene regulation from sequence? →

Enformer (Weeks 6–7)

• Can we model microbial communities? → microbiome-

based  prediction (Weeks 8–9)

In each unit: understand the biological problem → learn
the architecture → train a model → apply to real data →
present results

Genes and gene expression

• Gene: Basic unit of heredity; DNA segment that codes for protein

or RNA

• Human genome: ~20,000-25,000 genes (~1-2% of genome)

• Central Dogma: DNA → RNA → Protein

• Gene expression: Process by which information from a gene is

used to synthesize a functional product

• Machine learning opportunity: Predicting expression levels,

regulatory effects

Genome organization and structure

• Chromosomes: Organized

structures of DNA (humans have 23
pairs)

• Regulatory elements: Promoters,

enhancers, silencers

• Non-coding regions: Once called

"junk DNA," now known to be
important for regulation

• 3D genome structure: DNA folds in
complex ways that affect function

• Computational

challenge: Understanding the
signiﬁcance of sequence and
structure

Genetic variation

• Single Nucleotide Polymorphisms (SNPs): Single base

differences between individuals

• Structural variations: Insertions, deletions, duplications,

inversions

• Copy Number Variations (CNVs): Repeated sections of the

genome

• Importance: Associated with disease risk, drug response,

phenotypic traits

• AI application: Variant interpretation and disease risk

prediction

Types of genetic variation

SNP/SNV -

Indel -

Structural variant (SV) -[

Frazer et al, Nat Rev Genet 2009
Coriell

Types of genetic variation

SNP/SNV -

Indel -

Structural variant (SV) -[

SNP: Single Nucleotide Polymorphism

Frazer et al, Nat Rev Genet 2009
Coriell

Genetic variation

A typical human genome
"We find that a typical [human] genome differs from the reference human
genome at 4.1 million to 5.0 million sites. Although >99.9% of variants
consist of SNPs and short indels, structural variants affect more bases: the
typical genome contains an estimated 2,100 to 2,500 structural variants
(~1,000 large deletions, ~160 copy-number variants, ~915 Alu insertions, ~128
L1 insertions, ~51 SVA insertions, ~4 NUMTs, and ~10 inversions), affecting
~20 million bases of sequence.

Nucleotide diversity ((cid:7502)):
• Importance: Associated with disease risk, drug response,
1/756 bp to 1/620 bp
phenotypic traits

• AI applications: Variant calling, interpretation, and disease risk

prediction

the DNA sequences that direct transcription. Crucially, how do DNA se-

quences position the pre-initiation complex? This determines where tran-

scription will start. And how do DNA sequences control the rate of Pol II

assembly and transcription 17?

These decisions are guided in large part by proteins called transcription

factors (TFs). Most TFs have a DNA binding domain that attaches to

the genome at speciﬁc sequences (transcription factor binding sites) 18.

Meanwhile, other parts of the same TF can interact with other proteins to

help increase, or sometimes to repress, transcription. As an example, the

image below shows the molecular structure of a TF called AP-1, where

the purple region of the protein is bound to DNA:

Figure 1.11: Transcription factor binding to

DNA. Most TFs have a DNA-binding domain

(shown here in purple); other parts of the protein

structure can interact with other proteins to

control transcription. Credit: Houq [Link] CC-BY-SA-3.0

TF binding usually takes place both within the promoter region itself, as

well as at more distant locations called enhancers. Enhancers are regions

of TF binding that are situated outside the promoter. When TF binding

Gene regulation and transcription factors

occurs at the enhancers, the DNA can form a loop to bring the enhancer
into close physical contact with the promoter. These enhancer-promoter
interactions can be essential for assembling the Pre-Initiation Complex
which includes Pol II, prior to transcription:

Figure 1.12: Enhancer-Promoter interactions
help drive gene expression. Pol II assembles
in the core promoter prior to initiating transcrip-
tion. It is stabilized by protein-protein interac-
tions with TFs bound both within the promoter
and at distant enhancers. Promoter-enhancer
proteins may attach through protein bridges such
as the Mediator Complex.

• Promoters: Regions near genes where transcription begins. RNA

polymerase binds here to start reading the gene

Enhancers are often located quite far in DNA distance from the promot-
ers they regulate – usually at distances of tens of thousands up to a mil-
lion base pairs away, but loop around to create physical proximity.

• Enhancers: Distant DNA elements that boost gene expression. Can act
18
from thousands of base pairs away

• Transcription factors: Proteins that bind to speciﬁc short DNA

sequences (motifs) to activate or repress genes

• Motifs: Short DNA patterns (6–12 bp) recognized by TFs. The same

motif can appear in many genes' regulatory regions

The microbiome

What is the microbiome?

• Trillions of microorganisms (bacteria, viruses, fungi) living in and on

the human body

• The gut microbiome alone contains ~1,000 species

• Linked to digestion, immunity, mental health, and disease

• Varies enormously between individuals

Metagenomic data

• Shotgun sequencing: sequence all DNA in a sample (not just one

organism)

• 16S rRNA: targeted sequencing for species identiﬁcation

• Produces species abundance tables + functional annotations

• Challenge: high dimensionality, compositionality, sparsity

Genomic technologies

Bases per day

700 bp/day

5000 bp/day

19,000 bp/day

400,000 bp/day

Genomic technologies

Bases per day

700 bp/day

Years to
complete a
human genome
118,000 years

5000 bp/day

16,000 years

19,000 bp/day

4,400 years

400,000 bp/day

205 years

Next generation sequencing

Illumina NovaSeq X

• 16 Tb per run (17 – 48 hrs)

• 128 human genomes (at 30×

coverage)

Modern genomic technologies

• DNA Sequencing: Reading the order of nucleotides

• Next-Generation Sequencing (NGS): Massively parallel

sequencing

• Single-cell technologies: Analysis at individual cell level

• Multi-omics: Integrating genomics with proteomics,

transcriptomics, etc.

• Big data challenge: genomics sequencing approaches can

generate a huge amount of raw data

Types of genomic data

• Whole Genome Sequencing (WGS): Complete DNA sequence

• RNA-Seq: Gene expression measurement via RNA

• ChIP-Seq: Protein-DNA interactions

• ATAC-Seq: Chromatin accessibility

• Hi-C: 3D chromosome conformation

• Metagenomics: microbiome characterization

• Deep learning applications: Each data type enables speciﬁc

predictive tasks - from variant calling (WGS) to regulatory

networks (RNA-Seq) to 3D structure modeling (Hi-C), as well

as integration of different data types

Genomic data challenges for deep
learning

• Dimensionality: Millions to billions of features

• Sparsity: Important signals can be rare

• Noise: Biological and technical variability

• Interpretability: Connecting predictions to biological

mechanisms

• Data integration: Combining heterogeneous data types

Common genomic problems
addressed by deep learning

• Variant calling: Identifying genetic variations

• Gene expression prediction: From DNA sequence to

expression levels

• Functional element identiﬁcation: Finding regions with

speciﬁc roles

• Protein structure prediction: From sequence to 3D structure

• Disease risk assessment: Connecting genomic patterns to

health outcomes


