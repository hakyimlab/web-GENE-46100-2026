# Unit 01 Slides — Narrative Arc

## Sources

| Deck | Author field | Image folder | Source |
|------|-------------|--------------|--------|
| **slides-00** | "based on 3Blue1Brown material" | `images/mini-llm/` | 3B1B — *Large Language Models Explained Briefly* |
| **slides-01** | "based on 3Blue1Brown's What is a GPT" | `images/gpt/` | 3B1B — *What is a GPT? Visual intro to transformers* |
| **slides-02** | (no attribution) | no images | Karpathy's nanoGPT walk-through |
| **slides-03** | (no attribution) | no images | Karpathy's nanoGPT walk-through |

slides-02 and slides-03 have no source credit in the YAML, but the content makes it clear — they reproduce Karpathy's code verbatim (`BigramLanguageModel`, `stoi`/`itos`, `estimate_loss`, the `generate` function, etc.). slides-02 ends explicitly: *"following Karpathy's nanoGPT step by step."*

---

## Narrative Arc

The four decks form a clean progression: **outside → inside → build it → train it**

**slides-00 — LLMs from the outside** *(3B1B mini-llm)*
Chatbot loop, parameters, training data, pre-training + RLHF, Transformer in one sentence. Purely conceptual. Closes by zooming out to DNA as a language.

**slides-01 — Mathematical foundations** *(3B1B gpt)*
Tokens, embedding matrix W_E, semantic geometry (king/queen/gender directions), dot products, context windows, softmax + temperature, unembedding W_U. Bridges from concept to math, ends with a preview of attention.

**slides-02 — Architecture in code** *(Karpathy nanoGPT)*
Starts from the bigram baseline, builds up to full self-attention (Q/K/V), causal masking, multi-head attention, transformer block (residuals + LayerNorm + FFN), positional encoding. Shows the full GPT forward pass in PyTorch.

**slides-03 — Training mechanics** *(Karpathy nanoGPT)*
Tokenization details (Shakespeare vs DNA alphabets), cross-entropy loss + the random-baseline calculation, the training loop, validation monitoring, generation (autoregressive sampling), then pivots to genomics: pretrain on human genome → fine-tune for TF binding / promoter activity.

---

## Pivot Point

Between slides-01 and slides-02: the first two decks are visual/conceptual (3B1B), the last two are code-first (Karpathy). The genomics framing bookends the whole arc — introduced at the end of slides-00 and resolved in slides-03's fine-tuning section.
