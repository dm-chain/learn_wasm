## WASM
Là một assembly chạy được trong web browser, nodejs
- Giúp tăng performance.
- Giúp run Unity, các code C/C++, Rust, ...

Từ cuối 2019, WASM trở thành chuẩn của web, đứng ngang hàng với HTML, CSS, JS.

## Browser nào support WASM
https://caniuse.com/wasm

## IDE trên web
https://webassembly.studio/

## Thử viết một hàm bằng native WASM

Hàm có dạng `function sum(a:i32, b:i32) => a + b`

1. create a file `math.wat`

```wat
(module    
    (func $sum (param i32 i32) (result i32)
        local.get 0
        local.get 1
        i32.add
    )

    (export "sum" (func $sum))
)
```

2. Compile the file `math.wat` to `math.wasm`

`npx wat2wasm math.wat -o math.wasm`

3. Call the wasm function `math.sum` from nodejs

```js
import fs from 'fs';
const mathwasm = fs.readFileSync('./math.wasm');
const math = await WebAssembly.instantiate(new Uint8Array(mathwasm)).then(({instance}) => instance.exports);

console.log(math.sum(1, 2));
```

## Questions & Notes
- `javascript` and `wasm` run in the same thread?
- Tốc độ gọi qua lại giữa javascript và wasm?
- 64-bit integer, được interop với javascript ntn?
- Không có kiểu string, bool.
- Không GC, cũng không động vào GC của V8-engine.
- Có vẻ số nguyên không phân biệt signed/unsigned, operator sẽ quyết định sign.
- `WebAssembly vscode extension` báo lỗi vì chưa có `language server` chưa support windows.