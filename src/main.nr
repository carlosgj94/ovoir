use dep::std;
use dep::ecrecover;
// use dep::noir_merkleroot;

global MAX_VOTES = 64;

fn main(
    chain_id: pub Field, // The chain it will execute on
    proposal_id: pub Field, // Onchain proposal ID
    vote: pub u8, // yes: 1 / no: 0

    pub_key_x: [u8; 32],
    pub_key_y: [u8; 32],
    signature: [u8; 64],
    hashed_message: pub [u8; 32],
    index : Field, 
    hashpath : [Field; 2], 
    root : pub Field
) -> pub Field {
    let address = ecrecover::ecrecover(pub_key_x, pub_key_y, signature, hashed_message);
    std::println(address);

    let merkle_root = std::merkle::compute_merkle_root(address, index, hashpath);

    assert(merkle_root == root); // User is in the merkle tree
    assert(vote <= 1); // Ensure the vote is either 0 or 1

    // publicly return a hash making sure the same address won't vote multiple times for the same proposal
    let nullifier = std::hash::pedersen_hash([address, proposal_id, chain_id]);
    std::println(nullifier);
    nullifier
}

#[test]
fn test_main() {
    let pub_key_x = [ 135, 36, 62, 103, 5, 21, 147, 183, 152, 180, 85, 41, 119, 237, 12, 29, 85, 34, 86, 227, 176, 189, 166, 124, 89, 69, 145, 192, 91, 176, 136, 16];
    let pub_key_y = [ 198, 146, 214, 249, 129, 145, 255, 223, 14, 30, 252, 32, 125, 132, 64, 23, 246, 102, 100, 202, 22, 84, 93, 4, 83, 65, 10, 189, 32, 143, 13, 208];  
    let signature = [ 243, 207, 141, 211, 114, 90, 55, 72, 27, 234, 247, 28, 171, 56, 109, 74, 145, 207, 98, 109, 202, 168, 150, 213, 108, 59, 177, 244, 115, 55, 33, 8, 67, 162, 59, 214, 233, 171, 52, 168, 79, 201, 54, 63, 218, 148, 160, 145, 10, 43, 23, 32, 44, 204, 161, 139, 244, 142, 150, 84, 185, 28, 125, 240];
    let hashed_message = [ 242, 126, 237, 85, 225, 160, 52, 43, 52, 63, 75, 69, 69, 113, 179, 140, 210, 39, 9, 2, 55, 255, 79, 152, 206, 140, 141, 238, 108, 47, 57, 34];

    let address1 = 0xed04D2FdC5a633350FC6Aa7C69eFaD9544051220;
    let address2 = 0x388C818CA8B9251b393131C08a736A67ccB19297;
    let address3 = 0x8DC06221e6CbaDEd0c8344D48045D5be4D3D01E5;
    let address4 = 0x9FC3da866e7DF3a1c57adE1a97c9f00a70f010c8;

    let left_branch = std::hash::pedersen_hash([address1, address2]);
    let right_branch = std::hash::pedersen_hash([address3, address4]);

    let root = std::hash::pedersen_hash([left_branch, right_branch]);

    assert(
        main(1, 0, 0, pub_key_x, pub_key_y, signature, hashed_message, 0, [address2, right_branch], root) == 0x2f67426f38c10c5ef5c97e92a011dbad425f21bb9212101126e61c7dae47cf38
    );
}
