# Decentralized AI Marketplace (SingularityNET-style)

The final cornerstone of the 100-repo series. This repository provides a global, open-market layer for Artificial Intelligence. It solves the "AI Silo" problem by allowing independent developers to monetize their models directly. Through this protocol, AI agents can not only serve humans but also discover and pay each other for sub-tasks, forming a "Global Brain" of interconnected services.

## Core Features
* **AI Service Registry:** A decentralized directory of model endpoints, metadata, and pricing.
* **Multi-Party Escrow (MPE):** Unidirectional payment channels for high-frequency, low-latency AI service calls.
* **Inter-Agent Communication:** Standardized interfaces for AI models to call other AI models as dependencies.
* **Flat Architecture:** Single-directory layout for the Registry, Escrow Logic, and Service Provider manager.

## Logic Flow
1. **Register:** An AI Developer deploys a computer vision model and lists it for 1 token per 100 images.
2. **Open Channel:** A User (or another AI) opens a payment channel with the Provider and locks tokens.
3. **Inference:** The User sends an image to the Provider; the Provider returns the classification result and a signed claim.
4. **Claim:** The Provider periodically submits the signed claims to the contract to pull their earned tokens from the channel.

## Setup
1. `npm install`
2. Deploy `Registry.sol` and `MultiPartyEscrow.sol`.
