import fs from 'fs';

const mathwasm = fs.readFileSync('./math.wasm');

const math = await WebAssembly.instantiate(new Uint8Array(mathwasm), {
    main: {
        sayHello: (n) => {
            console.log(`Hello ${n} from javascript`);
        }
    }
}).then(({instance}) => instance.exports);

console.log(math.sum(1, 2));

