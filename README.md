# 🕵️ Noir Zero-Knowledge Voting Circuit

## Overview 📄

This project implements a zero-knowledge proof circuit using the Noir programming language, designed for secure and anonymous voting on a blockchain 🌐. The circuit ensures that votes are counted without revealing the identity of the voters, leveraging cryptographic techniques to maintain privacy and integrity 🔒.

## Features 🌟

- **Anonymity** 🎭: Ensures voter anonymity using zero-knowledge proofs.
- **Security** 🔐: Utilizes the `ecrecover` library for secure ECDSA signature recovery.
- **Efficiency** ⚡: Supports up to 64 votes in a single transaction, optimized for gas efficiency.
- **Verifiability** ✅: Each vote is verifiable without compromising voter privacy.

## Requirements 📋

- Rust programming language 🦀
- Noir Compiler 🖥️

## Structure 🏗️

- `main`: The main function that executes the zero-knowledge proof, verifying votes 🗳️.
- `test_main`: A test function that demonstrates how to call the main function with sample data 🧪.

### Parameters 📐

- `chain_id`: Blockchain identifier 🆔
- `proposal_id`: On-chain proposal ID 🔖
- `num_votes`: Number of votes 📊
- `vote`: Array indicating votes (1 for yes, 0 for no) 👍👎
- `pub_key_x`, `pub_key_y`: Public key coordinates for ECDSA 🔑
- `signature`: Signatures corresponding to each vote 🖋️
- `hashed_message`: Hashed messages that correspond to each vote 📝
- `index`, `hashpath`: Merkle proof components 🌲
- `root`: Merkle root for validation 🏁

## Usage 🚀

1. **Compilation**: Compile the circuit using the Noir compiler 🛠️.
2. **Deployment**: Deploy the compiled circuit to your preferred blockchain platform 📤.
3. **Execution**: Execute the circuit by passing the required parameters (as demonstrated in `test_main`) 🏃‍♂️.

## Relevant commands 🛠️

`nargo test`: Run the test suite to ensure the circuit is functioning as expected.

`nargo check`: Build circuit constraints system and check for errors and warnings.

`nargo prove`: Generate a proof for the circuit using the specified parameters.

`nargo verify`: Verify a proof for the circuit using the specified parameters.

## Contributing 🤝

Contributions are welcome! Please fork the repository and submit a pull request with your improvements 👨‍💻👩‍💻.