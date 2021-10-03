(module
    (type $t0 (func (param i32)))

    ;; hàm 0 được import vào từ javascript
    (import "main" "sayHello" (func $main.sayHello (type $t0)))

    ;; hàm 1 
    (func $sum (param i32 i32) (result f32)
        local.get 0 ;; push param 0 vào stack?
        local.get 1
        i32.add     ;; return ((i32)stack[0] + (i32)stack[1])
    )
    
    (export "sum" (func $sum))

    ;; hàm 2 gọi hàm 0
    (func $f2 (param) (result)
        i32.const 9999
        call $main.sayHello
    )
    
    ;; gọi hàm 2
    (start 2)
)