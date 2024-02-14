use dep::std;
use dep::ecrecover;
// use dep::noir_merkleroot;

global MAX_VOTES = 64;

fn main(
    chainId: u32, // The chain it will execute on
    proposalId: Field, // Onchain proposal ID
    censusRoot: Field, // Merkle tree of the census

    // Votes
    // TODO: Make these arrays
    pub_key_x: [u8; 32],
    pub_key_y: [u8; 32],
    signature: [u8; 64],
    hashed_message: pub [u8; 32]
) -> pub Field {
    let address = ecrecover::ecrecover(pub_key_x, pub_key_y, signature, hashed_message);
    std::println(address);

    // TODO: Verify the address is in the census root
    // TODO: Verify the hashed_message == votingPower (some way to know the direction -> yes or no)
    address
}

#[test]
fn test_main() {
    // let pub_key_x = [131, 24, 83, 91, 84, 16, 93, 74, 122, 174, 96, 192, 143, 196, 95, 150, 135, 24, 27, 79, 223, 198, 37, 189, 26, 117, 63, 167, 57, 127, 237, 117];
    // let pub_key_y = [53, 71, 241, 28, 168, 105, 102, 70, 242, 243, 172, 176, 142, 49, 1, 106, 250, 194, 62, 99, 12, 93, 17, 245, 159, 97, 254, 245, 123, 13, 42, 165];
    // let signature = [57, 17, 112, 239, 241, 30, 64, 157, 170, 50, 85, 145, 156, 69, 226, 85, 147, 164, 10, 82, 71, 93, 42, 132, 200, 220, 161, 255, 95, 241, 211, 141, 81, 7, 150, 25, 25, 27, 162, 213, 80, 61, 12, 170, 50, 4, 154, 203, 252, 229, 119, 29, 202, 153, 50, 25, 126, 145, 245, 23, 136, 75, 29, 177];
    // let hashed_message = [13, 82, 120, 60, 76, 186, 215, 235, 175, 126, 185, 67, 252, 100, 143, 82, 130, 165, 32, 112, 68, 47, 193, 141, 141, 209, 109, 219, 47, 203, 175, 102];

    let pub_key_x = [ 135, 36, 62, 103, 5, 21, 147, 183, 152, 180, 85, 41, 119, 237, 12, 29, 85, 34, 86, 227, 176, 189, 166, 124, 89, 69, 145, 192, 91, 176, 136, 16];
    let pub_key_y = [ 198, 146, 214, 249, 129, 145, 255, 223, 14, 30, 252, 32, 125, 132, 64, 23, 246, 102, 100, 202, 22, 84, 93, 4, 83, 65, 10, 189, 32, 143, 13, 208];  
    let signature = [ 243, 207, 141, 211, 114, 90, 55, 72, 27, 234, 247, 28, 171, 56, 109, 74, 145, 207, 98, 109, 202, 168, 150, 213, 108, 59, 177, 244, 115, 55, 33, 8, 67, 162, 59, 214, 233, 171, 52, 168, 79, 201, 54, 63, 218, 148, 160, 145, 10, 43, 23, 32, 44, 204, 161, 139, 244, 142, 150, 84, 185, 28, 125, 240];
    let hashed_message = [ 242, 126, 237, 85, 225, 160, 52, 43, 52, 63, 75, 69, 69, 113, 179, 140, 210, 39, 9, 2, 55, 255, 79, 152, 206, 140, 141, 238, 108, 47, 57, 34];

    assert(main(1, 0, 0, pub_key_x, pub_key_y, signature, hashed_message) == 0xed04D2FdC5a633350FC6Aa7C69eFaD9544051220);
}
