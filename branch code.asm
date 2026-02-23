.model small
.stack 100h
.data
    ; File handling
    filename db 'MyDATA.TXT', 0
    filehandle dw 0
    
    ; Main Menu
    title_msg db 0Dh, 0Ah, '========================================', 0Dh, 0Ah
              db '   WOOD MANAGEMENT SYSTEM', 0Dh, 0Ah
              db '========================================', 0Dh, 0Ah, '$'
    main_menu db 0Dh, 0Ah, '1. Inventory Management', 0Dh, 0Ah
              db '2. Sales & Marketing', 0Dh, 0Ah
              db '3. Truck Loading', 0Dh, 0Ah
              db '4. Financial Reports', 0Dh, 0Ah
              db '5. Forest History', 0Dh, 0Ah
              db '6. Save Data to File', 0Dh, 0Ah
              db '7. Load Data from File', 0Dh, 0Ah
              db '8. View File Contents', 0Dh, 0Ah
              db '9. Exit', 0Dh, 0Ah
              db 'Choose: $'
    
    ; Inventory Menu
    inv_menu db 0Dh, 0Ah, '--- INVENTORY ---', 0Dh, 0Ah
             db '1. Add Stock', 0Dh, 0Ah
             db '2. Remove Stock', 0Dh, 0Ah
             db '3. View Inventory', 0Dh, 0Ah
             db '4. Update Price', 0Dh, 0Ah
             db '5. Stock Status Report', 0Dh, 0Ah
             db '6. Back', 0Dh, 0Ah
             db 'Choose: $'
    
    ; Sales Menu
    sales_menu db 0Dh, 0Ah, '--- SALES & MARKETING ---', 0Dh, 0Ah
               db '1. New Sale', 0Dh, 0Ah
               db '2. View Sales Summary', 0Dh, 0Ah
               db '3. Detailed Sales Report', 0Dh, 0Ah
               db '4. Back', 0Dh, 0Ah
               db 'Choose: $'
    
    ; Truck Menu
    truck_menu db 0Dh, 0Ah, '--- TRUCK LOADING ---', 0Dh, 0Ah
               db '1. Load New Truck', 0Dh, 0Ah
               db '2. View All Trucks', 0Dh, 0Ah
               db '3. Back', 0Dh, 0Ah
               db 'Choose: $'
    
    ; Financial Menu
    finance_menu db 0Dh, 0Ah, '--- FINANCIAL REPORTS ---', 0Dh, 0Ah
                 db '1. Total Profit', 0Dh, 0Ah
                 db '2. Total Sales Revenue', 0Dh, 0Ah
                 db '3. Total Discounts Given', 0Dh, 0Ah
                 db '4. Complete Financial Summary', 0Dh, 0Ah
                 db '5. Back', 0Dh, 0Ah
                 db 'Choose: $'
    
    ; Forest Menu
    forest_menu db 0Dh, 0Ah, '--- FOREST HISTORY ---', 0Dh, 0Ah
                db '1. Add Forest Supply', 0Dh, 0Ah
                db '2. View All Sources', 0Dh, 0Ah
                db '3. Back', 0Dh, 0Ah
                db 'Choose: $'
    
    ; Prompts
    prompt_type db 0Dh, 0Ah, 'Select Wood Type:', 0Dh, 0Ah
                db '1=Oak  2=Pine  3=Maple', 0Dh, 0Ah
                db '4=Cedar 5=Teak 6=Walnut', 0Dh, 0Ah
                db 'Enter: $'
    prompt_qty db 0Dh, 0Ah, 'Quantity (1-999): $'
    prompt_price db 0Dh, 0Ah, 'Price per unit (PKR): $'
    prompt_discount db 0Dh, 0Ah, 'Discount (0-99%): $'
    prompt_truck_num db 0Dh, 0Ah, 'Truck Number (1-5): $'
    prompt_forest_loc db 0Dh, 0Ah, 'Forest Location (1-5): $'
    
    ; Messages
    msg_success db 0Dh, 0Ah, 'SUCCESS: Operation completed!', 0Dh, 0Ah, '$'
    msg_failed db 0Dh, 0Ah, 'ERROR: Operation failed!', 0Dh, 0Ah, '$'
    msg_insufficient db 0Dh, 0Ah, 'ERROR: Insufficient stock!', 0Dh, 0Ah, '$'
    msg_saved db 0Dh, 0Ah, 'File saved successfully!', 0Dh, 0Ah, '$'
    msg_loaded db 0Dh, 0Ah, 'File loaded successfully!', 0Dh, 0Ah, '$'
    msg_invalid db 0Dh, 0Ah, 'Invalid choice!', 0Dh, 0Ah, '$'
    msg_goodbye db 0Dh, 0Ah, 'Thank you for using the system!', 0Dh, 0Ah, '$'
    msg_no_file db 0Dh, 0Ah, 'No saved file found!', 0Dh, 0Ah, '$'
    
    ; Sale detail messages
    sale_detail1 db 0Dh, 0Ah, '--- SALE DETAILS ---', 0Dh, 0Ah, '$'
    sale_detail2 db 'Quantity Sold: $'
    sale_detail3 db 0Dh, 0Ah, 'Price per Unit: PKR $'
    sale_detail4 db 0Dh, 0Ah, 'Subtotal: PKR $'
    sale_detail5 db 0Dh, 0Ah, 'Discount %: $'
    sale_detail6 db 0Dh, 0Ah, 'Discount Amount: PKR $'
    sale_detail7 db 0Dh, 0Ah, 'Final Amount: PKR $'
    sale_detail8 db 0Dh, 0Ah, 'Stock Remaining: $'
    
    ; Stock status messages
    stock_status1 db 0Dh, 0Ah, '=== STOCK STATUS REPORT ===', 0Dh, 0Ah, '$'
    stock_avail db 'Available: $'
    stock_sold db ', Sold: $'
    stock_value db ', Total Value: PKR $'
    
    ; Display labels
    inv_header db 0Dh, 0Ah, '=== CURRENT INVENTORY ===', 0Dh, 0Ah, '$'
    
    name_oak db 'Oak:    $'
    name_pine db 'Pine:   $'
    name_maple db 'Maple:  $'
    name_cedar db 'Cedar:  $'
    name_teak db 'Teak:   $'
    name_walnut db 'Walnut: $'
    
    lbl_stock db ' Stock: $'
    lbl_price db ' PKR, Price: $'
    lbl_per_unit db '/unit', 0Dh, 0Ah, '$'
    
    sales_header db 0Dh, 0Ah, '=== SALES SUMMARY ===', 0Dh, 0Ah, '$'
    lbl_total_sales db 'Total Sales Revenue: PKR $'
    lbl_total_profit db 'Total Profit: PKR $'
    lbl_sales_count db 'Number of Sales: $'
    lbl_avg_discount db 'Total Discounts Given: PKR $'
    
    truck_header db 0Dh, 0Ah, '=== TRUCK LOADING STATUS ===', 0Dh, 0Ah, '$'
    lbl_truck db 'Truck #$'
    lbl_loaded db ': Loaded $'
    lbl_cubic db ' cubic meters', 0Dh, 0Ah, '$'
    lbl_empty db ': EMPTY', 0Dh, 0Ah, '$'
    
    forest_header db 0Dh, 0Ah, '=== FOREST SOURCES ===', 0Dh, 0Ah, '$'
    lbl_location db 'Location #$'
    lbl_supply db ': Supply $'
    
    file_header db 0Dh, 0Ah, '=== FILE CONTENTS ===', 0Dh, 0Ah, '$'
    file_line db '------------------------', 0Dh, 0Ah, '$'
    
    newline db 0Dh, 0Ah, '$'
    space db ' $'
    
    ; Data Storage (6 wood types)
    oak_stock dw 0
    pine_stock dw 0
    maple_stock dw 0
    cedar_stock dw 0
    teak_stock dw 0
    walnut_stock dw 0
    
    ; Track sold quantities
    oak_sold dw 0
    pine_sold dw 0
    maple_sold dw 0
    cedar_sold dw 0
    teak_sold dw 0
    walnut_sold dw 0
    
    ; Prices per cubic meter (PKR)
    oak_price dw 5000
    pine_price dw 3000
    maple_price dw 4500
    cedar_price dw 4000
    teak_price dw 8000
    walnut_price dw 7000
    
    ; Sales tracking
    total_sales dw 0
    total_profit dw 0
    sales_count dw 0
    total_discount dw 0
    
    ; Truck loading (5 trucks)
    truck1_load dw 0
    truck2_load dw 0
    truck3_load dw 0
    truck4_load dw 0
    truck5_load dw 0
    
    ; Forest sources (5 locations)
    forest1_supply dw 0
    forest2_supply dw 0
    forest3_supply dw 0
    forest4_supply dw 0
    forest5_supply dw 0
    
    ; Temporary variables
    wood_type db 0
    quantity dw 0
    input_price dw 0
    discount_pct dw 0
    truck_num db 0
    forest_loc db 0
    temp_price dw 0
    temp_subtotal dw 0
    temp_discount dw 0
    temp_final dw 0

.code
main proc
    mov ax, @data
    mov ds, ax
    
main_loop:
    call clear_screen
    
    lea dx, title_msg
    mov ah, 09h
    int 21h
    
    lea dx, main_menu
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    sub al, '0'
    
    cmp al, 1
    je inventory_mgmt
    cmp al, 2
    je sales_mgmt
    cmp al, 3
    je truck_mgmt
    cmp al, 4
    je financial_reports
    cmp al, 5
    je forest_mgmt
    cmp al, 6
    je save_data
    cmp al, 7
    je load_data
    cmp al, 8
    je view_file
    cmp al, 9
    je exit_program
    
    lea dx, msg_invalid
    mov ah, 09h
    int 21h
    call pause
    jmp main_loop

inventory_mgmt:
    call clear_screen
    lea dx, inv_menu
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    sub al, '0'
    
    cmp al, 1
    je add_stock
    cmp al, 2
    je remove_stock
    cmp al, 3
    je view_inventory
    cmp al, 4
    je update_price
    cmp al, 5
    je stock_status
    cmp al, 6
    je main_loop
    jmp inventory_mgmt

add_stock:
    call get_wood_type
    cmp wood_type, 0
    je inventory_mgmt
    call get_quantity
    cmp quantity, 0
    je inventory_mgmt
    call add_to_inventory
    lea dx, msg_success
    mov ah, 09h
    int 21h
    call pause
    jmp inventory_mgmt

remove_stock:
    call get_wood_type
    cmp wood_type, 0
    je inventory_mgmt
    call get_quantity
    cmp quantity, 0
    je inventory_mgmt
    call remove_from_inventory
    call pause
    jmp inventory_mgmt

view_inventory:
    call display_inventory
    call pause
    jmp inventory_mgmt

update_price:
    call get_wood_type
    cmp wood_type, 0
    je inventory_mgmt
    call get_price
    call update_wood_price
    lea dx, msg_success
    mov ah, 09h
    int 21h
    call pause
    jmp inventory_mgmt

stock_status:
    call display_stock_status
    call pause
    jmp inventory_mgmt

sales_mgmt:
    call clear_screen
    lea dx, sales_menu
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    sub al, '0'
    
    cmp al, 1
    je new_sale
    cmp al, 2
    je view_sales
    cmp al, 3
    je detailed_sales
    cmp al, 4
    je main_loop
    jmp sales_mgmt

new_sale:
    call process_sale
    call pause
    jmp sales_mgmt

view_sales:
    call display_sales_summary
    call pause
    jmp sales_mgmt

detailed_sales:
    call display_detailed_sales
    call pause
    jmp sales_mgmt

truck_mgmt:
    call clear_screen
    lea dx, truck_menu
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    sub al, '0'
    
    cmp al, 1
    je load_truck
    cmp al, 2
    je view_trucks
    cmp al, 3
    je main_loop
    jmp truck_mgmt

load_truck:
    call process_truck_loading
    call pause
    jmp truck_mgmt

view_trucks:
    call display_trucks
    call pause
    jmp truck_mgmt

financial_reports:
    call clear_screen
    lea dx, finance_menu
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    sub al, '0'
    
    cmp al, 1
    je show_profit
    cmp al, 2
    je show_revenue
    cmp al, 3
    je show_discounts
    cmp al, 4
    je show_complete_finance
    cmp al, 5
    je main_loop
    jmp financial_reports

show_profit:
    lea dx, lbl_total_profit
    mov ah, 09h
    int 21h
    mov ax, total_profit
    call print_number
    call pause
    jmp financial_reports

show_revenue:
    lea dx, lbl_total_sales
    mov ah, 09h
    int 21h
    mov ax, total_sales
    call print_number
    call pause
    jmp financial_reports

show_discounts:
    lea dx, lbl_avg_discount
    mov ah, 09h
    int 21h
    mov ax, total_discount
    call print_number
    call pause
    jmp financial_reports

show_complete_finance:
    call display_complete_financial
    call pause
    jmp financial_reports

forest_mgmt:
    call clear_screen
    lea dx, forest_menu
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    sub al, '0'
    
    cmp al, 1
    je add_forest
    cmp al, 2
    je view_forests
    cmp al, 3
    je main_loop
    jmp forest_mgmt

add_forest:
    call add_forest_source
    call pause
    jmp forest_mgmt

view_forests:
    call display_forests
    call pause
    jmp forest_mgmt

save_data:
    call save_to_file
    call pause
    jmp main_loop

load_data:
    call load_from_file
    call pause
    jmp main_loop

view_file:
    call display_file_contents
    call pause
    jmp main_loop

exit_program:
    lea dx, msg_goodbye
    mov ah, 09h
    int 21h
    mov ah, 4Ch
    int 21h
main endp

; ===== UTILITY PROCEDURES =====

clear_screen proc
    mov ah, 00h
    mov al, 03h
    int 10h
    ret
clear_screen endp

pause proc
    lea dx, newline
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    ret
pause endp

get_wood_type proc
    lea dx, prompt_type
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    cmp al, 1
    jl invalid_type
    cmp al, 6
    jg invalid_type
    mov wood_type, al
    ret
invalid_type:
    mov wood_type, 0
    lea dx, msg_invalid
    mov ah, 09h
    int 21h
    ret
get_wood_type endp

get_quantity proc
    lea dx, prompt_qty
    mov ah, 09h
    int 21h
    call read_number
    mov quantity, bx
    ret
get_quantity endp

get_price proc
    lea dx, prompt_price
    mov ah, 09h
    int 21h
    call read_number
    mov input_price, bx
    ret
get_price endp

read_number proc
    xor bx, bx
read_digit:
    mov ah, 01h
    int 21h
    cmp al, 0Dh
    je read_done
    cmp al, '0'
    jb read_done
    cmp al, '9'
    ja read_done
    sub al, '0'
    push ax
    mov ax, bx
    mov cx, 10
    mul cx
    mov bx, ax
    pop ax
    xor ah, ah
    add bx, ax
    jmp read_digit
read_done:
    ret
read_number endp

add_to_inventory proc
    mov al, wood_type
    mov bx, quantity
    
    cmp al, 1
    je add_oak
    cmp al, 2
    je add_pine
    cmp al, 3
    je add_maple
    cmp al, 4
    je add_cedar
    cmp al, 5
    je add_teak
    cmp al, 6
    je add_walnut
    ret
    
add_oak:
    add oak_stock, bx
    ret
add_pine:
    add pine_stock, bx
    ret
add_maple:
    add maple_stock, bx
    ret
add_cedar:
    add cedar_stock, bx
    ret
add_teak:
    add teak_stock, bx
    ret
add_walnut:
    add walnut_stock, bx
    ret
add_to_inventory endp

remove_from_inventory proc
    mov al, wood_type
    mov bx, quantity
    
    cmp al, 1
    je rem_oak
    cmp al, 2
    je rem_pine
    cmp al, 3
    je rem_maple
    cmp al, 4
    je rem_cedar
    cmp al, 5
    je rem_teak
    cmp al, 6
    je rem_walnut
    ret
    
rem_oak:
    mov ax, oak_stock
    cmp ax, bx
    jl insufficient
    sub oak_stock, bx
    jmp rem_success
rem_pine:
    mov ax, pine_stock
    cmp ax, bx
    jl insufficient
    sub pine_stock, bx
    jmp rem_success
rem_maple:
    mov ax, maple_stock
    cmp ax, bx
    jl insufficient
    sub maple_stock, bx
    jmp rem_success
rem_cedar:
    mov ax, cedar_stock
    cmp ax, bx
    jl insufficient
    sub cedar_stock, bx
    jmp rem_success
rem_teak:
    mov ax, teak_stock
    cmp ax, bx
    jl insufficient
    sub teak_stock, bx
    jmp rem_success
rem_walnut:
    mov ax, walnut_stock
    cmp ax, bx
    jl insufficient
    sub walnut_stock, bx
    jmp rem_success
    
insufficient:
    lea dx, msg_insufficient
    mov ah, 09h
    int 21h
    ret
    
rem_success:
    lea dx, msg_success
    mov ah, 09h
    int 21h
    ret
remove_from_inventory endp

update_wood_price proc
    mov al, wood_type
    mov bx, input_price
    
    cmp al, 1
    je upd_oak
    cmp al, 2
    je upd_pine
    cmp al, 3
    je upd_maple
    cmp al, 4
    je upd_cedar
    cmp al, 5
    je upd_teak
    cmp al, 6
    je upd_walnut
    ret
    
upd_oak:
    mov oak_price, bx
    ret
upd_pine:
    mov pine_price, bx
    ret
upd_maple:
    mov maple_price, bx
    ret
upd_cedar:
    mov cedar_price, bx
    ret
upd_teak:
    mov teak_price, bx
    ret
upd_walnut:
    mov walnut_price, bx
    ret
update_wood_price endp

display_inventory proc
    lea dx, inv_header
    mov ah, 09h
    int 21h
    
    lea dx, name_oak
    mov ah, 09h
    int 21h
    lea dx, lbl_stock
    mov ah, 09h
    int 21h
    mov ax, oak_stock
    call print_number_inline
    lea dx, lbl_price
    mov ah, 09h
    int 21h
    mov ax, oak_price
    call print_number_inline
    lea dx, lbl_per_unit
    mov ah, 09h
    int 21h
    
    lea dx, name_pine
    mov ah, 09h
    int 21h
    lea dx, lbl_stock
    mov ah, 09h
    int 21h
    mov ax, pine_stock
    call print_number_inline
    lea dx, lbl_price
    mov ah, 09h
    int 21h
    mov ax, pine_price
    call print_number_inline
    lea dx, lbl_per_unit
    mov ah, 09h
    int 21h
    
    lea dx, name_maple
    mov ah, 09h
    int 21h
    lea dx, lbl_stock
    mov ah, 09h
    int 21h
    mov ax, maple_stock
    call print_number_inline
    lea dx, lbl_price
    mov ah, 09h
    int 21h
    mov ax, maple_price
    call print_number_inline
    lea dx, lbl_per_unit
    mov ah, 09h
    int 21h
    
    lea dx, name_cedar
    mov ah, 09h
    int 21h
    lea dx, lbl_stock
    mov ah, 09h
    int 21h
    mov ax, cedar_stock
    call print_number_inline
    lea dx, lbl_price
    mov ah, 09h
    int 21h
    mov ax, cedar_price
    call print_number_inline
    lea dx, lbl_per_unit
    mov ah, 09h
    int 21h
    
    lea dx, name_teak
    mov ah, 09h
    int 21h
    lea dx, lbl_stock
    mov ah, 09h
    int 21h
    mov ax, teak_stock
    call print_number_inline
    lea dx, lbl_price
    mov ah, 09h
    int 21h
    mov ax, teak_price
    call print_number_inline
    lea dx, lbl_per_unit
    mov ah, 09h
    int 21h
    
    lea dx, name_walnut
    mov ah, 09h
    int 21h
    lea dx, lbl_stock
    mov ah, 09h
    int 21h
    mov ax, walnut_stock
    call print_number_inline
    lea dx, lbl_price
    mov ah, 09h
    int 21h
    mov ax, walnut_price
    call print_number_inline
    lea dx, lbl_per_unit
    mov ah, 09h
    int 21h
    
    ret
display_inventory endp

display_stock_status proc
    lea dx, stock_status1
    mov ah, 09h
    int 21h
    
    lea dx, name_oak
    mov ah, 09h
    int 21h
    lea dx, stock_avail
    mov ah, 09h
    int 21h
    mov ax, oak_stock
    call print_number_inline
    lea dx, stock_sold
    mov ah, 09h
    int 21h
    mov ax, oak_sold
    call print_number_inline
    lea dx, stock_value
    mov ah, 09h
    int 21h
    mov ax, oak_stock
    mov bx, oak_price
    mul bx
    call print_number
    
    lea dx, name_pine
    mov ah, 09h
    int 21h
    lea dx, stock_avail
    mov ah, 09h
    int 21h
    mov ax, pine_stock
    call print_number_inline
    lea dx, stock_sold
    mov ah, 09h
    int 21h
    mov ax, pine_sold
    call print_number_inline
    lea dx, stock_value
    mov ah, 09h
    int 21h
    mov ax, pine_stock
    mov bx, pine_price
    mul bx
    call print_number
    
    lea dx, name_maple
    mov ah, 09h
    int 21h
    lea dx, stock_avail
    mov ah, 09h
    int 21h
    mov ax, maple_stock
    call print_number_inline
    lea dx, stock_sold
    mov ah, 09h
    int 21h
    mov ax, maple_sold
    call print_number_inline
    lea dx, stock_value
    mov ah, 09h
    int 21h
    mov ax, maple_stock
    mov bx, maple_price
    mul bx
    call print_number
    
    lea dx, name_cedar
    mov ah, 09h
    int 21h
    lea dx, stock_avail
    mov ah, 09h
    int 21h
    mov ax, cedar_stock
    call print_number_inline
    lea dx, stock_sold
    mov ah, 09h
    int 21h
    mov ax, cedar_sold
    call print_number_inline
    lea dx, stock_value
    mov ah, 09h
    int 21h
    mov ax, cedar_stock
    mov bx, cedar_price
    mul bx
    call print_number
    
    lea dx, name_teak
    mov ah, 09h
    int 21h
    lea dx, stock_avail
    mov ah, 09h
    int 21h
    mov ax, teak_stock
    call print_number_inline
    lea dx, stock_sold
    mov ah, 09h
    int 21h
    mov ax, teak_sold
    call print_number_inline
    lea dx, stock_value
    mov ah, 09h
    int 21h
    mov ax, teak_stock
    mov bx, teak_price
    mul bx
    call print_number
    
    lea dx, name_walnut
    mov ah, 09h
    int 21h
    lea dx, stock_avail
    mov ah, 09h
    int 21h
    mov ax, walnut_stock
    call print_number_inline
    lea dx, stock_sold
    mov ah, 09h
    int 21h
    mov ax, walnut_sold
    call print_number_inline
    lea dx, stock_value
    mov ah, 09h
    int 21h
    mov ax, walnut_stock
    mov bx, walnut_price
    mul bx
    call print_number
    
    ret
display_stock_status endp

process_sale proc
    call get_wood_type
    cmp wood_type, 0
    je sale_failed
    
    call get_quantity
    cmp quantity, 0
    je sale_failed
    
    lea dx, prompt_discount
    mov ah, 09h
    int 21h
    call read_number
    mov discount_pct, bx
    
    mov al, wood_type
    xor dx, dx
    
    cmp al, 1
    jne check_pine_sale
    mov dx, oak_price
    jmp calc_sale
check_pine_sale:
    cmp al, 2
    jne check_maple_sale
    mov dx, pine_price
    jmp calc_sale
check_maple_sale:
    cmp al, 3
    jne check_cedar_sale
    mov dx, maple_price
    jmp calc_sale
check_cedar_sale:
    cmp al, 4
    jne check_teak_sale
    mov dx, cedar_price
    jmp calc_sale
check_teak_sale:
    cmp al, 5
    jne check_walnut_sale
    mov dx, teak_price
    jmp calc_sale
check_walnut_sale:
    mov dx, walnut_price
    
calc_sale:
    mov temp_price, dx
    
    mov ax, quantity
    mul dx
    mov temp_subtotal, ax
    mov bx, ax
    
    mov ax, bx
    mov cx, discount_pct
    mul cx
    mov cx, 100
    div cx
    
    mov temp_discount, ax
    add total_discount, ax
    
    sub bx, ax
    mov temp_final, bx
    
    add total_sales, bx
    add total_profit, bx
    inc sales_count
    
    call update_sold_qty
    
    lea dx, sale_detail1
    mov ah, 09h
    int 21h
    
    lea dx, sale_detail2
    mov ah, 09h
    int 21h
    mov ax, quantity
    call print_number_inline
    
    lea dx, sale_detail3
    mov ah, 09h
    int 21h
    mov ax, temp_price
    call print_number_inline
    
    lea dx, sale_detail4
    mov ah, 09h
    int 21h
    mov ax, temp_subtotal
    call print_number_inline
    
    lea dx, sale_detail5
    mov ah, 09h
    int 21h
    mov ax, discount_pct
    call print_number_inline
    mov dl, '%'
    mov ah, 02h
    int 21h
    
    lea dx, sale_detail6
    mov ah, 09h
    int 21h
    mov ax, temp_discount
    call print_number_inline
    
    lea dx, sale_detail7
    mov ah, 09h
    int 21h
    mov ax, temp_final
    call print_number_inline
    
    call remove_from_inventory
    
    lea dx, sale_detail8
    mov ah, 09h
    int 21h
    call get_current_stock
    call print_number
    
    ret
    
sale_failed:
    lea dx, msg_failed
    mov ah, 09h
    int 21h
    ret
process_sale endp

update_sold_qty proc
    mov al, wood_type
    mov bx, quantity
    
    cmp al, 1
    je sold_oak
    cmp al, 2
    je sold_pine
    cmp al, 3
    je sold_maple
    cmp al, 4
    je sold_cedar
    cmp al, 5
    je sold_teak
    cmp al, 6
    je sold_walnut
    ret
    
sold_oak:
    add oak_sold, bx
    ret
sold_pine:
    add pine_sold, bx
    ret
sold_maple:
    add maple_sold, bx
    ret
sold_cedar:
    add cedar_sold, bx
    ret
sold_teak:
    add teak_sold, bx
    ret
sold_walnut:
    add walnut_sold, bx
    ret
update_sold_qty endp

get_current_stock proc
    mov al, wood_type
    
    cmp al, 1
    jne chk_pine_stock
    mov ax, oak_stock
    ret
chk_pine_stock:
    cmp al, 2
    jne chk_maple_stock
    mov ax, pine_stock
    ret
chk_maple_stock:
    cmp al, 3
    jne chk_cedar_stock
    mov ax, maple_stock
    ret
chk_cedar_stock:
    cmp al, 4
    jne chk_teak_stock
    mov ax, cedar_stock
    ret
chk_teak_stock:
    cmp al, 5
    jne chk_walnut_stock
    mov ax, teak_stock
    ret
chk_walnut_stock:
    mov ax, walnut_stock
    ret
get_current_stock endp

display_sales_summary proc
    lea dx, sales_header
    mov ah, 09h
    int 21h
    
    lea dx, lbl_total_sales
    mov ah, 09h
    int 21h
    mov ax, total_sales
    call print_number
    
    lea dx, lbl_total_profit
    mov ah, 09h
    int 21h
    mov ax, total_profit
    call print_number
    
    lea dx, lbl_sales_count
    mov ah, 09h
    int 21h
    mov ax, sales_count
    call print_number
    
    lea dx, lbl_avg_discount
    mov ah, 09h
    int 21h
    mov ax, total_discount
    call print_number
    
    ret
display_sales_summary endp

display_detailed_sales proc
    lea dx, sales_header
    mov ah, 09h
    int 21h
    
    lea dx, name_oak
    mov ah, 09h
    int 21h
    lea dx, stock_sold
    mov ah, 09h
    int 21h
    mov ax, oak_sold
    call print_number_inline
    lea dx, stock_value
    mov ah, 09h
    int 21h
    mov ax, oak_sold
    mov bx, oak_price
    mul bx
    call print_number
    
    lea dx, name_pine
    mov ah, 09h
    int 21h
    lea dx, stock_sold
    mov ah, 09h
    int 21h
    mov ax, pine_sold
    call print_number_inline
    lea dx, stock_value
    mov ah, 09h
    int 21h
    mov ax, pine_sold
    mov bx, pine_price
    mul bx
    call print_number
    
    lea dx, name_maple
    mov ah, 09h
    int 21h
    lea dx, stock_sold
    mov ah, 09h
    int 21h
    mov ax, maple_sold
    call print_number_inline
    lea dx, stock_value
    mov ah, 09h
    int 21h
    mov ax, maple_sold
    mov bx, maple_price
    mul bx
    call print_number
    
    lea dx, name_cedar
    mov ah, 09h
    int 21h
    lea dx, stock_sold
    mov ah, 09h
    int 21h
    mov ax, cedar_sold
    call print_number_inline
    lea dx, stock_value
    mov ah, 09h
    int 21h
    mov ax, cedar_sold
    mov bx, cedar_price
    mul bx
    call print_number
    
    lea dx, name_teak
    mov ah, 09h
    int 21h
    lea dx, stock_sold
    mov ah, 09h
    int 21h
    mov ax, teak_sold
    call print_number_inline
    lea dx, stock_value
    mov ah, 09h
    int 21h
    mov ax, teak_sold
    mov bx, teak_price
    mul bx
    call print_number
    
    lea dx, name_walnut
    mov ah, 09h
    int 21h
    lea dx, stock_sold
    mov ah, 09h
    int 21h
    mov ax, walnut_sold
    call print_number_inline
    lea dx, stock_value
    mov ah, 09h
    int 21h
    mov ax, walnut_sold
    mov bx, walnut_price
    mul bx
    call print_number
    
    lea dx, newline
    mov ah, 09h
    int 21h
    
    call display_sales_summary
    ret
display_detailed_sales endp

display_complete_financial proc
    lea dx, sales_header
    mov ah, 09h
    int 21h
    
    lea dx, lbl_total_sales
    mov ah, 09h
    int 21h
    mov ax, total_sales
    call print_number
    
    lea dx, lbl_total_profit
    mov ah, 09h
    int 21h
    mov ax, total_profit
    call print_number
    
    lea dx, lbl_avg_discount
    mov ah, 09h
    int 21h
    mov ax, total_discount
    call print_number
    
    lea dx, lbl_sales_count
    mov ah, 09h
    int 21h
    mov ax, sales_count
    call print_number
    
    ret
display_complete_financial endp

process_truck_loading proc
    lea dx, prompt_truck_num
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    cmp al, 1
    jl truck_invalid
    cmp al, 5
    jg truck_invalid
    mov truck_num, al
    
    call get_wood_type
    cmp wood_type, 0
    je truck_invalid
    
    call get_quantity
    cmp quantity, 0
    je truck_invalid
    
    mov al, truck_num
    mov bx, quantity
    
    cmp al, 1
    je load_truck1
    cmp al, 2
    je load_truck2
    cmp al, 3
    je load_truck3
    cmp al, 4
    je load_truck4
    cmp al, 5
    je load_truck5
    ret
    
load_truck1:
    add truck1_load, bx
    jmp truck_success
load_truck2:
    add truck2_load, bx
    jmp truck_success
load_truck3:
    add truck3_load, bx
    jmp truck_success
load_truck4:
    add truck4_load, bx
    jmp truck_success
load_truck5:
    add truck5_load, bx
    jmp truck_success
    
truck_success:
    call remove_from_inventory
    ret
    
truck_invalid:
    lea dx, msg_invalid
    mov ah, 09h
    int 21h
    ret
process_truck_loading endp

display_trucks proc
    lea dx, truck_header
    mov ah, 09h
    int 21h
    
    lea dx, lbl_truck
    mov ah, 09h
    int 21h
    mov dl, '1'
    mov ah, 02h
    int 21h
    
    cmp truck1_load, 0
    je truck1_empty
    lea dx, lbl_loaded
    mov ah, 09h
    int 21h
    mov ax, truck1_load
    call print_number_inline
    lea dx, lbl_cubic
    mov ah, 09h
    int 21h
    jmp truck2_check
truck1_empty:
    lea dx, lbl_empty
    mov ah, 09h
    int 21h
    
truck2_check:
    lea dx, lbl_truck
    mov ah, 09h
    int 21h
    mov dl, '2'
    mov ah, 02h
    int 21h
    
    cmp truck2_load, 0
    je truck2_empty
    lea dx, lbl_loaded
    mov ah, 09h
    int 21h
    mov ax, truck2_load
    call print_number_inline
    lea dx, lbl_cubic
    mov ah, 09h
    int 21h
    jmp truck3_check
truck2_empty:
    lea dx, lbl_empty
    mov ah, 09h
    int 21h
    
truck3_check:
    lea dx, lbl_truck
    mov ah, 09h
    int 21h
    mov dl, '3'
    mov ah, 02h
    int 21h
    
    cmp truck3_load, 0
    je truck3_empty
    lea dx, lbl_loaded
    mov ah, 09h
    int 21h
    mov ax, truck3_load
    call print_number_inline
    lea dx, lbl_cubic
    mov ah, 09h
    int 21h
    jmp truck4_check
truck3_empty:
    lea dx, lbl_empty
    mov ah, 09h
    int 21h
    
truck4_check:
    lea dx, lbl_truck
    mov ah, 09h
    int 21h
    mov dl, '4'
    mov ah, 02h
    int 21h
    
    cmp truck4_load, 0
    je truck4_empty
    lea dx, lbl_loaded
    mov ah, 09h
    int 21h
    mov ax, truck4_load
    call print_number_inline
    lea dx, lbl_cubic
    mov ah, 09h
    int 21h
    jmp truck5_check
truck4_empty:
    lea dx, lbl_empty
    mov ah, 09h
    int 21h
    
truck5_check:
    lea dx, lbl_truck
    mov ah, 09h
    int 21h
    mov dl, '5'
    mov ah, 02h
    int 21h
    
    cmp truck5_load, 0
    je truck5_empty
    lea dx, lbl_loaded
    mov ah, 09h
    int 21h
    mov ax, truck5_load
    call print_number_inline
    lea dx, lbl_cubic
    mov ah, 09h
    int 21h
    ret
truck5_empty:
    lea dx, lbl_empty
    mov ah, 09h
    int 21h
    ret
display_trucks endp

add_forest_source proc
    lea dx, prompt_forest_loc
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    cmp al, 1
    jl forest_invalid
    cmp al, 5
    jg forest_invalid
    mov forest_loc, al
    
    call get_quantity
    cmp quantity, 0
    je forest_invalid
    
    mov al, forest_loc
    mov bx, quantity
    
    cmp al, 1
    je add_forest1
    cmp al, 2
    je add_forest2
    cmp al, 3
    je add_forest3
    cmp al, 4
    je add_forest4
    cmp al, 5
    je add_forest5
    ret
    
add_forest1:
    add forest1_supply, bx
    jmp forest_success
add_forest2:
    add forest2_supply, bx
    jmp forest_success
add_forest3:
    add forest3_supply, bx
    jmp forest_success
add_forest4:
    add forest4_supply, bx
    jmp forest_success
add_forest5:
    add forest5_supply, bx
    jmp forest_success
    
forest_success:
    lea dx, msg_success
    mov ah, 09h
    int 21h
    ret
    
forest_invalid:
    lea dx, msg_invalid
    mov ah, 09h
    int 21h
    ret
add_forest_source endp

display_forests proc
    lea dx, forest_header
    mov ah, 09h
    int 21h
    
    lea dx, lbl_location
    mov ah, 09h
    int 21h
    mov dl, '1'
    mov ah, 02h
    int 21h
    lea dx, lbl_supply
    mov ah, 09h
    int 21h
    mov ax, forest1_supply
    call print_number_inline
    lea dx, lbl_cubic
    mov ah, 09h
    int 21h
    
    lea dx, lbl_location
    mov ah, 09h
    int 21h
    mov dl, '2'
    mov ah, 02h
    int 21h
    lea dx, lbl_supply
    mov ah, 09h
    int 21h
    mov ax, forest2_supply
    call print_number_inline
    lea dx, lbl_cubic
    mov ah, 09h
    int 21h
    
    lea dx, lbl_location
    mov ah, 09h
    int 21h
    mov dl, '3'
    mov ah, 02h
    int 21h
    lea dx, lbl_supply
    mov ah, 09h
    int 21h
    mov ax, forest3_supply
    call print_number_inline
    lea dx, lbl_cubic
    mov ah, 09h
    int 21h
    
    lea dx, lbl_location
    mov ah, 09h
    int 21h
    mov dl, '4'
    mov ah, 02h
    int 21h
    lea dx, lbl_supply
    mov ah, 09h
    int 21h
    mov ax, forest4_supply
    call print_number_inline
    lea dx, lbl_cubic
    mov ah, 09h
    int 21h
    
    lea dx, lbl_location
    mov ah, 09h
    int 21h
    mov dl, '5'
    mov ah, 02h
    int 21h
    lea dx, lbl_supply
    mov ah, 09h
    int 21h
    mov ax, forest5_supply
    call print_number_inline
    lea dx, lbl_cubic
    mov ah, 09h
    int 21h
    
    ret
display_forests endp

save_to_file proc
    mov ah, 3Ch
    mov cx, 0
    lea dx, filename
    int 21h
    jc save_error
    mov filehandle, ax
    
    mov bx, filehandle
    
    lea dx, oak_stock
    mov cx, 2
    mov ah, 40h
    int 21h
    
    lea dx, oak_price
    mov cx, 2
    mov ah, 40h
    int 21h
    
    lea dx, oak_sold
    mov cx, 2
    mov ah, 40h
    int 21h
    
    lea dx, pine_stock
    mov cx, 2
    mov ah, 40h
    int 21h
    lea dx, pine_price
    mov cx, 2
    mov ah, 40h
    int 21h
    lea dx, pine_sold
    mov cx, 2
    mov ah, 40h
    int 21h
    
    lea dx, maple_stock
    mov cx, 2
    mov ah, 40h
    int 21h
    lea dx, maple_price
    mov cx, 2
    mov ah, 40h
    int 21h
    lea dx, maple_sold
    mov cx, 2
    mov ah, 40h
    int 21h
    
    lea dx, cedar_stock
    mov cx, 2
    mov ah, 40h
    int 21h
    lea dx, cedar_price
    mov cx, 2
    mov ah, 40h
    int 21h
    lea dx, cedar_sold
    mov cx, 2
    mov ah, 40h
    int 21h
    
    lea dx, teak_stock
    mov cx, 2
    mov ah, 40h
    int 21h
    lea dx, teak_price
    mov cx, 2
    mov ah, 40h
    int 21h
    lea dx, teak_sold
    mov cx, 2
    mov ah, 40h
    int 21h
    
    lea dx, walnut_stock
    mov cx, 2
    mov ah, 40h
    int 21h
    lea dx, walnut_price
    mov cx, 2
    mov ah, 40h
    int 21h
    lea dx, walnut_sold
    mov cx, 2
    mov ah, 40h
    int 21h
    
    lea dx, total_sales
    mov cx, 2
    mov ah, 40h
    int 21h
    lea dx, total_profit
    mov cx, 2
    mov ah, 40h
    int 21h
    lea dx, sales_count
    mov cx, 2
    mov ah, 40h
    int 21h
    lea dx, total_discount
    mov cx, 2
    mov ah, 40h
    int 21h
    
    lea dx, truck1_load
    mov cx, 2
    mov ah, 40h
    int 21h
    lea dx, truck2_load
    mov cx, 2
    mov ah, 40h
    int 21h
    lea dx, truck3_load
    mov cx, 2
    mov ah, 40h
    int 21h
    lea dx, truck4_load
    mov cx, 2
    mov ah, 40h
    int 21h
    lea dx, truck5_load
    mov cx, 2
    mov ah, 40h
    int 21h
    
    lea dx, forest1_supply
    mov cx, 2
    mov ah, 40h
    int 21h
    lea dx, forest2_supply
    mov cx, 2
    mov ah, 40h
    int 21h
    lea dx, forest3_supply
    mov cx, 2
    mov ah, 40h
    int 21h
    lea dx, forest4_supply
    mov cx, 2
    mov ah, 40h
    int 21h
    lea dx, forest5_supply
    mov cx, 2
    mov ah, 40h
    int 21h
    
    mov ah, 3Eh
    mov bx, filehandle
    int 21h
    
    lea dx, msg_saved
    mov ah, 09h
    int 21h
    ret
    
save_error:
    lea dx, msg_failed
    mov ah, 09h
    int 21h
    ret
save_to_file endp

load_from_file proc
    mov ah, 3Dh
    mov al, 0
    lea dx, filename
    int 21h
    jc load_error
    mov filehandle, ax
    
    mov bx, filehandle
    
    lea dx, oak_stock
    mov cx, 2
    mov ah, 3Fh
    int 21h
    lea dx, oak_price
    mov cx, 2
    mov ah, 3Fh
    int 21h
    lea dx, oak_sold
    mov cx, 2
    mov ah, 3Fh
    int 21h
    
    lea dx, pine_stock
    mov cx, 2
    mov ah, 3Fh
    int 21h
    lea dx, pine_price
    mov cx, 2
    mov ah, 3Fh
    int 21h
    lea dx, pine_sold
    mov cx, 2
    mov ah, 3Fh
    int 21h
    
    lea dx, maple_stock
    mov cx, 2
    mov ah, 3Fh
    int 21h
    lea dx, maple_price
    mov cx, 2
    mov ah, 3Fh
    int 21h
    lea dx, maple_sold
    mov cx, 2
    mov ah, 3Fh
    int 21h
    
    lea dx, cedar_stock
    mov cx, 2
    mov ah, 3Fh
    int 21h
    lea dx, cedar_price
    mov cx, 2
    mov ah, 3Fh
    int 21h
    lea dx, cedar_sold
    mov cx, 2
    mov ah, 3Fh
    int 21h
    
    lea dx, teak_stock
    mov cx, 2
    mov ah, 3Fh
    int 21h
    lea dx, teak_price
    mov cx, 2
    mov ah, 3Fh
    int 21h
    lea dx, teak_sold
    mov cx, 2
    mov ah, 3Fh
    int 21h
    
    lea dx, walnut_stock
    mov cx, 2
    mov ah, 3Fh
    int 21h
    lea dx, walnut_price
    mov cx, 2
    mov ah, 3Fh
    int 21h
    lea dx, walnut_sold
    mov cx, 2
    mov ah, 3Fh
    int 21h
    
    lea dx, total_sales
    mov cx, 2
    mov ah, 3Fh
    int 21h
    lea dx, total_profit
    mov cx, 2
    mov ah, 3Fh
    int 21h
    lea dx, sales_count
    mov cx, 2
    mov ah, 3Fh
    int 21h
    lea dx, total_discount
    mov cx, 2
    mov ah, 3Fh
    int 21h
    
    lea dx, truck1_load
    mov cx, 2
    mov ah, 3Fh
    int 21h
    lea dx, truck2_load
    mov cx, 2
    mov ah, 3Fh
    int 21h
    lea dx, truck3_load
    mov cx, 2
    mov ah, 3Fh
    int 21h
    lea dx, truck4_load
    mov cx, 2
    mov ah, 3Fh
    int 21h
    lea dx, truck5_load
    mov cx, 2
    mov ah, 3Fh
    int 21h
    
    lea dx, forest1_supply
    mov cx, 2
    mov ah, 3Fh
    int 21h
    lea dx, forest2_supply
    mov cx, 2
    mov ah, 3Fh
    int 21h
    lea dx, forest3_supply
    mov cx, 2
    mov ah, 3Fh
    int 21h
    lea dx, forest4_supply
    mov cx, 2
    mov ah, 3Fh
    int 21h
    lea dx, forest5_supply
    mov cx, 2
    mov ah, 3Fh
    int 21h
    
    mov ah, 3Eh
    mov bx, filehandle
    int 21h
    
    lea dx, msg_loaded
    mov ah, 09h
    int 21h
    ret
    
load_error:
    lea dx, msg_no_file
    mov ah, 09h
    int 21h
    ret
load_from_file endp

display_file_contents proc
    lea dx, file_header
    mov ah, 09h
    int 21h
    
    lea dx, file_line
    mov ah, 09h
    int 21h
    
    lea dx, name_oak
    mov ah, 09h
    int 21h
    lea dx, lbl_stock
    mov ah, 09h
    int 21h
    mov ax, oak_stock
    call print_number_inline
    lea dx, stock_sold
    mov ah, 09h
    int 21h
    mov ax, oak_sold
    call print_number
    
    lea dx, name_pine
    mov ah, 09h
    int 21h
    lea dx, lbl_stock
    mov ah, 09h
    int 21h
    mov ax, pine_stock
    call print_number_inline
    lea dx, stock_sold
    mov ah, 09h
    int 21h
    mov ax, pine_sold
    call print_number
    
    lea dx, name_maple
    mov ah, 09h
    int 21h
    lea dx, lbl_stock
    mov ah, 09h
    int 21h
    mov ax, maple_stock
    call print_number_inline
    lea dx, stock_sold
    mov ah, 09h
    int 21h
    mov ax, maple_sold
    call print_number
    
    lea dx, file_line
    mov ah, 09h
    int 21h
    
    lea dx, lbl_total_sales
    mov ah, 09h
    int 21h
    mov ax, total_sales
    call print_number
    
    lea dx, lbl_total_profit
    mov ah, 09h
    int 21h
    mov ax, total_profit
    call print_number
    
    lea dx, lbl_avg_discount
    mov ah, 09h
    int 21h
    mov ax, total_discount
    call print_number
    
    lea dx, file_line
    mov ah, 09h
    int 21h
    
    ret
display_file_contents endp

print_number proc
    push ax
    push bx
    push cx
    push dx
    
    cmp ax, 0
    jne print_start
    mov dl, '0'
    mov ah, 02h
    int 21h
    lea dx, newline
    mov ah, 09h
    int 21h
    jmp print_done
    
print_start:
    mov cx, 0
    mov bx, 10
    
convert_loop:
    xor dx, dx
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne convert_loop
    
print_loop:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop print_loop
    
    lea dx, newline
    mov ah, 09h
    int 21h
    
print_done:
    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_number endp

print_number_inline proc
    push ax
    push bx
    push cx
    push dx
    
    cmp ax, 0
    jne print_inline_start
    mov dl, '0'
    mov ah, 02h
    int 21h
    jmp print_inline_done
    
print_inline_start:
    mov cx, 0
    mov bx, 10
    
convert_inline_loop:
    xor dx, dx
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne convert_inline_loop
    
print_inline_loop:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop print_inline_loop
    
print_inline_done:
    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_number_inline endp

end main
