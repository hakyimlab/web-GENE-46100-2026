# Narrative Arcs: Units 00–02

## Unit 00: From Linear Models to DNA Scanning with CNNs
**Question: "What is deep learning? Can we detect regulatory motifs in DNA?"**

### The Story

Unit 00 takes students on a foundational journey from the most basic building blocks of deep learning to a real genomics application. It is structured as a "build-up" narrative that starts with intuition and ends with biological insight.

#### Part 1 — Linear Models (Slides 01)

The arc begins with a linear regression model — something students likely know from statistics. The closed-form normal equation is presented as the "easy" case. This establishes the three-component ML framework: **model → loss → optimizer**. The linear model succeeds on linear data (using the interactive playground), creating a sense of mastery.

#### Part 2 — The Failure of Linearity (Slides 01)

The turning point: show cubic data (y = x³) and demonstrate that no amount of training can help a linear model bend. This is the **"architecture matters"** moment — the optimizer is fine, but the model class is wrong. The solution: add nonlinearity → neural networks.

#### Part 3 — Neural Networks as Function Approximators (Slides 01)

The MLP is introduced through the intuitive "bends" metaphor — each ReLU neuron adds a kink, and stacking neurons and layers composes simple bends into complex curves. The Universal Approximation Theorem is stated but carefully caveated. Students see the training loop in PyTorch, mapping every concept back to the playground they have been using.

#### Part 4 — Convolutional Neural Networks (Slides 02)

A new problem emerges: linear models cannot detect **local, position-independent patterns**. CNNs are introduced as the solution, with three key concepts: (1) local receptive fields, (2) shared weights (translation invariance), and (3) activation + pooling. The translation invariance property is explicitly connected to genomics: a CNN that learns a TF binding motif will find it anywhere in the sequence.

#### Part 5 — CNNs for DNA (Slides 03)

The payoff. DNA is one-hot encoded into a (length, 4) matrix that "looks like an image." A CNN with sliding filters over one-hot DNA is shown to be mathematically equivalent to scoring with a Position Weight Matrix (PWM) — but the filters are **learned from data**, not hand-designed. The task is synthetic (known scoring rules with TAT/GCG motifs), so students can verify the model actually found the right patterns. The unit closes by connecting to foundational papers (DeepBind, DeepSEA, Basset) that scaled this exact architecture to real biology.

### The Arc in One Sentence

> Start with what you know (linear regression), break it (cubic data), build up (MLPs), specialize (CNNs), and apply to DNA (motif discovery) — showing that the architecture you train today is the core of all major CNN-on-genome papers.

---

## Unit 01: DNA as a Language — Transformers, nanoGPT, and Evo2
**Question: "Can we learn the 'language' of DNA?"**

### The Story

Unit 01 tells the story of **scaling up** the next-token prediction idea from toy text to the full tree of life. It is structured as a progression from intuition → mechanics → implementation → frontier research.

#### Part 1 — What Is an LLM? (Slides 00)

The arc opens with the big picture from 3Blue1Brown: an LLM as a probability distribution over next words, the autoregressive chatbot loop, the two-phase training (pre-training + RLHF), and the Transformer's parallel processing advantage. The key insight: **the same framework applies to DNA** — nucleotides are tokens, the genome is the training corpus.

#### Part 2 — Inside the Transformer (Slides 01)

Now we go inside. Text → tokens → embeddings → semantic geometry (king - man + woman = queen) → dot products as similarity → context-dependent vector updates → unembedding → softmax → sampling. The geometric intuition is central: meaning lives in vector space, and attention lets vectors update based on context. By the end, students understand the full pipeline from text to probability distribution.

#### Part 3 — From nanoGPT to Evo2 (Slides 02)

The capstone. Students have built nanoGPT from scratch and trained a tiny DNA language model. Now we ask: **what happens when you scale?** Evo2 takes the same next-token prediction objective but at 9.3 trillion nucleotides across all domains of life. The narrative shows three things Evo2 can do that nanoGPT could not: (1) zero-shot variant effect prediction, (2) genome generation at scale, and (3) *de novo* design of regulatory elements. The architecture shift from pure Transformer to StripedHyena 2 (mixing convolutions with sparse attention) is motivated by the O(n²) bottleneck. Interpretability results (sparse autoencoders finding splice sites, TF motifs, protein structures) demonstrate that the model learned real biology from sequence alone.

### The Arc in One Sentence

> Understand what LLMs do and how they work geometrically, build one from scratch (nanoGPT), train it on DNA, then see what that same idea looks like at billion-parameter scale across all life (Evo2) — proving that next-token prediction on sequence learns real biology.

---

## Unit 02: From DNA Sequence to the Epigenome — Predicting Gene Regulation
**Question: "Can we predict gene regulation from sequence?"**

### The Story

Unit 02 tells the story of **bridging the gap between DNA sequence and biological function** — specifically, how deep learning models like Enformer can predict the epigenome from raw DNA sequence, and how those predictions can be used to understand complex traits and disease.

#### The Problem: The GWAS Interpretation Crisis (Slides 02)

The unit opens with a motivating problem: GWAS has identified millions of disease-associated variants, but most fall outside coding regions, and we do not know which genes they affect or what mechanism is disrupted. PrediXcan (TWAS) was an early attempt to bridge this gap by predicting gene expression from genotype, but it requires expensive, unavailable RNA-seq data and does not transfer well across ancestries or tissues.

#### The Solution: DNA Sequence → Epigenome Prediction (Slides 02 + Notebooks)

Enformer is introduced as the key enabling technology. It takes 200kb of DNA sequence and predicts thousands of epigenomic tracks (DNase, ATAC, histone modifications, TF ChIP-seq) simultaneously. The architecture combines a CNN tower (local feature extraction) with transformer blocks (long-range dependencies up to 100kb+). The notebook walks through the Enformer architecture in detail — stem, convolutional tower with exponentially increasing filter sizes, 11 transformer layers with attention-based pooling, and multi-task output heads.

#### Beyond the Average: Predicting Variation Across Individuals (Slides 02)

Enformer was trained to perform well *across the genome* (averaged over many individuals), but we care about *variation across people*. The slides show that while Enformer predicts average epigenome levels well, it struggles to capture individual-specific variation — some genes correlate well, others do not. This is where the lab's new methods come in.

#### Enpact: Enformer + IMPACT (Slides 02)

The first innovation: combine Enformer (which predicts epigenomic tracks from sequence) with IMPACT (which predicts TF binding from epigenetic features). Enpact requires only a single ChIP-seq experiment to learn the mapping, then can predict TF binding for any sequence. Validation against CWAS (chromatin-wide association studies) shows Enpact predictions are highly correlated with experimentally measured genetic effects on TF binding.

#### TFXcan: A TWAS for Transcription Factor Binding (Slides 02)

The second innovation: extend TWAS from gene expression to TF binding sites. By training SNP-based predictors of Enpact-predicted TF binding and running association with phenotype, the framework identifies TF programs disrupted by GWAS variants. Applied to prostate cancer, TFXcan reveals hormone receptor programs, CTCF-driven programs, and tissue-specific programs — all biologically meaningful.

#### scPrediXcan: Cell-Type-Specific TWAS (Slides 02)

The third innovation: use Enformer to predict cell-type-specific gene expression from pseudo-bulk epigenomic data, then train SNP predictors and run TWAS. This approach predicts 10× more genes than traditional methods and recovers more known disease genes (e.g., for diabetes and lupus).

#### dGTEx: Developmental Gene Expression (Slides 02)

The final application: the same deep learning approach enables TWAS in developmental contexts where sample sizes are too small for traditional methods. ctPred predicts gene expression during development, and the resulting SNP predictors enable TWAS across 72 tissue/age pairs.

### The Arc in One Sentence

> GWAS finds variants but cannot interpret them → Enformer predicts the epigenome from DNA sequence → Enpact adds TF binding → TFXcan runs TWAS on TF binding sites → scPrediXcan adds cell-type resolution → dGTEx adds developmental time — each step building on the previous to turn raw DNA sequence into actionable biological insight for complex trait genetics.

---

## The Overall Course Arc

The three units form a coherent progression:

| Unit | Core Architecture | Input | Output | Biological Question |
|------|------------------|-------|--------|---------------------|
| **00** | MLP → CNN | DNA (one-hot) | Motif scores | Can we detect regulatory motifs? |
| **01** | Transformer (GPT) | DNA (tokens) | Next nucleotide | Can we learn the language of DNA? |
| **02** | Transformer (Enformer) | DNA (200kb) | Epigenome / TF binding | Can we predict gene regulation from sequence? |

The meta-narrative: **start simple (local patterns) → go global (long-range dependencies) → apply to disease (interpret GWAS).**
