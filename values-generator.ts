import { recoverAddress, hexToBytes, keccak256, recoverPublicKey, stringToBytes, toBytes, toHex } from 'viem';
import { privateKeyToAccount } from 'viem/accounts';

// Private Key only for testing purpose, shouldn't be used for anything else
const sender = privateKeyToAccount('0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80');

const signature = await sender.signMessage({ message: "hello world" });

const hash = keccak256(toHex('{value: 42}'));

const pubKey_uncompressed = await recoverPublicKey({ hash, signature });
let pubKey = hexToBytes(pubKey_uncompressed).slice(1);

let pub_key_x = pubKey.slice(0, 32);
let pub_key_y = pubKey.slice(32);

const address = await recoverAddress({ hash, signature })

console.log("Here's your message signed:");
console.log('pub_key_x: ', pub_key_x);
console.log('pub_key_y: ', pub_key_y);
console.log('signature: ', hexToBytes(signature).slice(0, 64));
console.log('hash: ', toBytes(hash));
console.log('address: ', address);
