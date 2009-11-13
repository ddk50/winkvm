int dyngen_code(uint8_t *gen_code_buf,
                uint16_t *label_offsets, uint16_t *jmp_offsets,
                const uint16_t *opc_buf, const uint32_t *opparam_buf, const long *gen_labels)
{
    uint8_t *gen_code_ptr;
    const uint16_t *opc_ptr;
    const uint32_t *opparam_ptr;

    gen_code_ptr = gen_code_buf;
    opc_ptr = opc_buf;
    opparam_ptr = opparam_buf;
    for(;;) {
        switch(*opc_ptr++) {
case INDEX_op_movl_A0_EAX: {
    extern void op_movl_A0_EAX();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_A0_EAX+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_addl_A0_EAX: {
    extern void op_addl_A0_EAX();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_EAX+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_addl_A0_EAX_s1: {
    extern void op_addl_A0_EAX_s1();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_EAX_s1+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_addl_A0_EAX_s2: {
    extern void op_addl_A0_EAX_s2();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_EAX_s2+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_addl_A0_EAX_s3: {
    extern void op_addl_A0_EAX_s3();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_EAX_s3+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_movl_T0_EAX: {
    extern void op_movl_T0_EAX();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T0_EAX+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_T1_EAX: {
    extern void op_movl_T1_EAX();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T1_EAX+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movh_T0_EAX: {
    extern void op_movh_T0_EAX();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_T0_EAX+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_movh_T1_EAX: {
    extern void op_movh_T1_EAX();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_T1_EAX+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_movl_EAX_T0: {
    extern void op_movl_EAX_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_EAX_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_EAX_T1: {
    extern void op_movl_EAX_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_EAX_T1+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_EAX_A0: {
    extern void op_movl_EAX_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_EAX_A0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_cmovw_EAX_T1_T0: {
    extern void op_cmovw_EAX_T1_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmovw_EAX_T1_T0+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_cmovl_EAX_T1_T0: {
    extern void op_cmovl_EAX_T1_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmovl_EAX_T1_T0+0), 7);
    gen_code_ptr += 7;
}
break;

case INDEX_op_movw_EAX_T0: {
    extern void op_movw_EAX_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_EAX_T0+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_movw_EAX_T1: {
    extern void op_movw_EAX_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_EAX_T1+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_movw_EAX_A0: {
    extern void op_movw_EAX_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_EAX_A0+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_movb_EAX_T0: {
    extern void op_movb_EAX_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movb_EAX_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movh_EAX_T0: {
    extern void op_movh_EAX_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_EAX_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movb_EAX_T1: {
    extern void op_movb_EAX_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movb_EAX_T1+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_movh_EAX_T1: {
    extern void op_movh_EAX_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_EAX_T1+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_movl_A0_ECX: {
    extern void op_movl_A0_ECX();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_A0_ECX+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_addl_A0_ECX: {
    extern void op_addl_A0_ECX();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_ECX+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_addl_A0_ECX_s1: {
    extern void op_addl_A0_ECX_s1();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_ECX_s1+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_addl_A0_ECX_s2: {
    extern void op_addl_A0_ECX_s2();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_ECX_s2+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_addl_A0_ECX_s3: {
    extern void op_addl_A0_ECX_s3();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_ECX_s3+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_movl_T0_ECX: {
    extern void op_movl_T0_ECX();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T0_ECX+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_T1_ECX: {
    extern void op_movl_T1_ECX();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T1_ECX+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movh_T0_ECX: {
    extern void op_movh_T0_ECX();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_T0_ECX+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_movh_T1_ECX: {
    extern void op_movh_T1_ECX();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_T1_ECX+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_movl_ECX_T0: {
    extern void op_movl_ECX_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_ECX_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_ECX_T1: {
    extern void op_movl_ECX_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_ECX_T1+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_ECX_A0: {
    extern void op_movl_ECX_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_ECX_A0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_cmovw_ECX_T1_T0: {
    extern void op_cmovw_ECX_T1_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmovw_ECX_T1_T0+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_cmovl_ECX_T1_T0: {
    extern void op_cmovl_ECX_T1_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmovl_ECX_T1_T0+0), 7);
    gen_code_ptr += 7;
}
break;

case INDEX_op_movw_ECX_T0: {
    extern void op_movw_ECX_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_ECX_T0+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_movw_ECX_T1: {
    extern void op_movw_ECX_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_ECX_T1+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_movw_ECX_A0: {
    extern void op_movw_ECX_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_ECX_A0+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_movb_ECX_T0: {
    extern void op_movb_ECX_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movb_ECX_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movh_ECX_T0: {
    extern void op_movh_ECX_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_ECX_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movb_ECX_T1: {
    extern void op_movb_ECX_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movb_ECX_T1+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_movh_ECX_T1: {
    extern void op_movh_ECX_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_ECX_T1+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_movl_A0_EDX: {
    extern void op_movl_A0_EDX();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_A0_EDX+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_addl_A0_EDX: {
    extern void op_addl_A0_EDX();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_EDX+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_addl_A0_EDX_s1: {
    extern void op_addl_A0_EDX_s1();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_EDX_s1+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_addl_A0_EDX_s2: {
    extern void op_addl_A0_EDX_s2();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_EDX_s2+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_addl_A0_EDX_s3: {
    extern void op_addl_A0_EDX_s3();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_EDX_s3+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_movl_T0_EDX: {
    extern void op_movl_T0_EDX();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T0_EDX+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_T1_EDX: {
    extern void op_movl_T1_EDX();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T1_EDX+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movh_T0_EDX: {
    extern void op_movh_T0_EDX();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_T0_EDX+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_movh_T1_EDX: {
    extern void op_movh_T1_EDX();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_T1_EDX+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_movl_EDX_T0: {
    extern void op_movl_EDX_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_EDX_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_EDX_T1: {
    extern void op_movl_EDX_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_EDX_T1+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_EDX_A0: {
    extern void op_movl_EDX_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_EDX_A0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_cmovw_EDX_T1_T0: {
    extern void op_cmovw_EDX_T1_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmovw_EDX_T1_T0+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_cmovl_EDX_T1_T0: {
    extern void op_cmovl_EDX_T1_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmovl_EDX_T1_T0+0), 7);
    gen_code_ptr += 7;
}
break;

case INDEX_op_movw_EDX_T0: {
    extern void op_movw_EDX_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_EDX_T0+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_movw_EDX_T1: {
    extern void op_movw_EDX_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_EDX_T1+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_movw_EDX_A0: {
    extern void op_movw_EDX_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_EDX_A0+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_movb_EDX_T0: {
    extern void op_movb_EDX_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movb_EDX_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movh_EDX_T0: {
    extern void op_movh_EDX_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_EDX_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movb_EDX_T1: {
    extern void op_movb_EDX_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movb_EDX_T1+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_movh_EDX_T1: {
    extern void op_movh_EDX_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_EDX_T1+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_movl_A0_EBX: {
    extern void op_movl_A0_EBX();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_A0_EBX+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_addl_A0_EBX: {
    extern void op_addl_A0_EBX();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_EBX+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_addl_A0_EBX_s1: {
    extern void op_addl_A0_EBX_s1();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_EBX_s1+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_addl_A0_EBX_s2: {
    extern void op_addl_A0_EBX_s2();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_EBX_s2+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_addl_A0_EBX_s3: {
    extern void op_addl_A0_EBX_s3();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_EBX_s3+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_movl_T0_EBX: {
    extern void op_movl_T0_EBX();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T0_EBX+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_T1_EBX: {
    extern void op_movl_T1_EBX();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T1_EBX+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movh_T0_EBX: {
    extern void op_movh_T0_EBX();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_T0_EBX+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_movh_T1_EBX: {
    extern void op_movh_T1_EBX();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_T1_EBX+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_movl_EBX_T0: {
    extern void op_movl_EBX_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_EBX_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_EBX_T1: {
    extern void op_movl_EBX_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_EBX_T1+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_EBX_A0: {
    extern void op_movl_EBX_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_EBX_A0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_cmovw_EBX_T1_T0: {
    extern void op_cmovw_EBX_T1_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmovw_EBX_T1_T0+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_cmovl_EBX_T1_T0: {
    extern void op_cmovl_EBX_T1_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmovl_EBX_T1_T0+0), 7);
    gen_code_ptr += 7;
}
break;

case INDEX_op_movw_EBX_T0: {
    extern void op_movw_EBX_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_EBX_T0+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_movw_EBX_T1: {
    extern void op_movw_EBX_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_EBX_T1+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_movw_EBX_A0: {
    extern void op_movw_EBX_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_EBX_A0+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_movb_EBX_T0: {
    extern void op_movb_EBX_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movb_EBX_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movh_EBX_T0: {
    extern void op_movh_EBX_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_EBX_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movb_EBX_T1: {
    extern void op_movb_EBX_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movb_EBX_T1+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_movh_EBX_T1: {
    extern void op_movh_EBX_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_EBX_T1+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_movl_A0_ESP: {
    extern void op_movl_A0_ESP();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_A0_ESP+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_addl_A0_ESP: {
    extern void op_addl_A0_ESP();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_ESP+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_addl_A0_ESP_s1: {
    extern void op_addl_A0_ESP_s1();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_ESP_s1+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_addl_A0_ESP_s2: {
    extern void op_addl_A0_ESP_s2();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_ESP_s2+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_addl_A0_ESP_s3: {
    extern void op_addl_A0_ESP_s3();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_ESP_s3+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_movl_T0_ESP: {
    extern void op_movl_T0_ESP();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T0_ESP+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_T1_ESP: {
    extern void op_movl_T1_ESP();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T1_ESP+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movh_T0_ESP: {
    extern void op_movh_T0_ESP();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_T0_ESP+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_movh_T1_ESP: {
    extern void op_movh_T1_ESP();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_T1_ESP+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_movl_ESP_T0: {
    extern void op_movl_ESP_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_ESP_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_ESP_T1: {
    extern void op_movl_ESP_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_ESP_T1+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_ESP_A0: {
    extern void op_movl_ESP_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_ESP_A0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_cmovw_ESP_T1_T0: {
    extern void op_cmovw_ESP_T1_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmovw_ESP_T1_T0+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_cmovl_ESP_T1_T0: {
    extern void op_cmovl_ESP_T1_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmovl_ESP_T1_T0+0), 7);
    gen_code_ptr += 7;
}
break;

case INDEX_op_movw_ESP_T0: {
    extern void op_movw_ESP_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_ESP_T0+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_movw_ESP_T1: {
    extern void op_movw_ESP_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_ESP_T1+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_movw_ESP_A0: {
    extern void op_movw_ESP_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_ESP_A0+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_movb_ESP_T0: {
    extern void op_movb_ESP_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movb_ESP_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movh_ESP_T0: {
    extern void op_movh_ESP_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_ESP_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movb_ESP_T1: {
    extern void op_movb_ESP_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movb_ESP_T1+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_movh_ESP_T1: {
    extern void op_movh_ESP_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_ESP_T1+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_movl_A0_EBP: {
    extern void op_movl_A0_EBP();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_A0_EBP+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_addl_A0_EBP: {
    extern void op_addl_A0_EBP();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_EBP+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_addl_A0_EBP_s1: {
    extern void op_addl_A0_EBP_s1();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_EBP_s1+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_addl_A0_EBP_s2: {
    extern void op_addl_A0_EBP_s2();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_EBP_s2+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_addl_A0_EBP_s3: {
    extern void op_addl_A0_EBP_s3();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_EBP_s3+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_movl_T0_EBP: {
    extern void op_movl_T0_EBP();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T0_EBP+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_T1_EBP: {
    extern void op_movl_T1_EBP();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T1_EBP+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movh_T0_EBP: {
    extern void op_movh_T0_EBP();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_T0_EBP+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_movh_T1_EBP: {
    extern void op_movh_T1_EBP();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_T1_EBP+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_movl_EBP_T0: {
    extern void op_movl_EBP_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_EBP_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_EBP_T1: {
    extern void op_movl_EBP_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_EBP_T1+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_EBP_A0: {
    extern void op_movl_EBP_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_EBP_A0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_cmovw_EBP_T1_T0: {
    extern void op_cmovw_EBP_T1_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmovw_EBP_T1_T0+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_cmovl_EBP_T1_T0: {
    extern void op_cmovl_EBP_T1_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmovl_EBP_T1_T0+0), 7);
    gen_code_ptr += 7;
}
break;

case INDEX_op_movw_EBP_T0: {
    extern void op_movw_EBP_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_EBP_T0+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_movw_EBP_T1: {
    extern void op_movw_EBP_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_EBP_T1+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_movw_EBP_A0: {
    extern void op_movw_EBP_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_EBP_A0+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_movb_EBP_T0: {
    extern void op_movb_EBP_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movb_EBP_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movh_EBP_T0: {
    extern void op_movh_EBP_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_EBP_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movb_EBP_T1: {
    extern void op_movb_EBP_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movb_EBP_T1+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_movh_EBP_T1: {
    extern void op_movh_EBP_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_EBP_T1+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_movl_A0_ESI: {
    extern void op_movl_A0_ESI();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_A0_ESI+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_addl_A0_ESI: {
    extern void op_addl_A0_ESI();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_ESI+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_addl_A0_ESI_s1: {
    extern void op_addl_A0_ESI_s1();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_ESI_s1+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_addl_A0_ESI_s2: {
    extern void op_addl_A0_ESI_s2();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_ESI_s2+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_addl_A0_ESI_s3: {
    extern void op_addl_A0_ESI_s3();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_ESI_s3+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_movl_T0_ESI: {
    extern void op_movl_T0_ESI();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T0_ESI+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_T1_ESI: {
    extern void op_movl_T1_ESI();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T1_ESI+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movh_T0_ESI: {
    extern void op_movh_T0_ESI();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_T0_ESI+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_movh_T1_ESI: {
    extern void op_movh_T1_ESI();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_T1_ESI+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_movl_ESI_T0: {
    extern void op_movl_ESI_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_ESI_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_ESI_T1: {
    extern void op_movl_ESI_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_ESI_T1+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_ESI_A0: {
    extern void op_movl_ESI_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_ESI_A0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_cmovw_ESI_T1_T0: {
    extern void op_cmovw_ESI_T1_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmovw_ESI_T1_T0+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_cmovl_ESI_T1_T0: {
    extern void op_cmovl_ESI_T1_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmovl_ESI_T1_T0+0), 7);
    gen_code_ptr += 7;
}
break;

case INDEX_op_movw_ESI_T0: {
    extern void op_movw_ESI_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_ESI_T0+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_movw_ESI_T1: {
    extern void op_movw_ESI_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_ESI_T1+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_movw_ESI_A0: {
    extern void op_movw_ESI_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_ESI_A0+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_movb_ESI_T0: {
    extern void op_movb_ESI_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movb_ESI_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movh_ESI_T0: {
    extern void op_movh_ESI_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_ESI_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movb_ESI_T1: {
    extern void op_movb_ESI_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movb_ESI_T1+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_movh_ESI_T1: {
    extern void op_movh_ESI_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_ESI_T1+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_movl_A0_EDI: {
    extern void op_movl_A0_EDI();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_A0_EDI+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_addl_A0_EDI: {
    extern void op_addl_A0_EDI();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_EDI+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_addl_A0_EDI_s1: {
    extern void op_addl_A0_EDI_s1();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_EDI_s1+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_addl_A0_EDI_s2: {
    extern void op_addl_A0_EDI_s2();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_EDI_s2+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_addl_A0_EDI_s3: {
    extern void op_addl_A0_EDI_s3();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_EDI_s3+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_movl_T0_EDI: {
    extern void op_movl_T0_EDI();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T0_EDI+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_T1_EDI: {
    extern void op_movl_T1_EDI();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T1_EDI+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movh_T0_EDI: {
    extern void op_movh_T0_EDI();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_T0_EDI+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_movh_T1_EDI: {
    extern void op_movh_T1_EDI();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_T1_EDI+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_movl_EDI_T0: {
    extern void op_movl_EDI_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_EDI_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_EDI_T1: {
    extern void op_movl_EDI_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_EDI_T1+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_EDI_A0: {
    extern void op_movl_EDI_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_EDI_A0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_cmovw_EDI_T1_T0: {
    extern void op_cmovw_EDI_T1_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmovw_EDI_T1_T0+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_cmovl_EDI_T1_T0: {
    extern void op_cmovl_EDI_T1_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmovl_EDI_T1_T0+0), 7);
    gen_code_ptr += 7;
}
break;

case INDEX_op_movw_EDI_T0: {
    extern void op_movw_EDI_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_EDI_T0+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_movw_EDI_T1: {
    extern void op_movw_EDI_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_EDI_T1+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_movw_EDI_A0: {
    extern void op_movw_EDI_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_EDI_A0+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_movb_EDI_T0: {
    extern void op_movb_EDI_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movb_EDI_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movh_EDI_T0: {
    extern void op_movh_EDI_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_EDI_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movb_EDI_T1: {
    extern void op_movb_EDI_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movb_EDI_T1+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_movh_EDI_T1: {
    extern void op_movh_EDI_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movh_EDI_T1+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_update2_cc: {
    extern void op_update2_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_update2_cc+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_update1_cc: {
    extern void op_update1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_update1_cc+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_update_neg_cc: {
    extern void op_update_neg_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_update_neg_cc+0), 10);
    gen_code_ptr += 10;
}
break;

case INDEX_op_cmpl_T0_T1_cc: {
    extern void op_cmpl_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpl_T0_T1_cc+0), 10);
    gen_code_ptr += 10;
}
break;

case INDEX_op_update_inc_cc: {
    extern void op_update_inc_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_update_inc_cc+0), 16);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 4;
    gen_code_ptr += 16;
}
break;

case INDEX_op_testl_T0_T1_cc: {
    extern void op_testl_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_testl_T0_T1_cc+0), 7);
    gen_code_ptr += 7;
}
break;

case INDEX_op_addl_T0_T1: {
    extern void op_addl_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_T0_T1+0), 2);
    gen_code_ptr += 2;
}
break;

case INDEX_op_orl_T0_T1: {
    extern void op_orl_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_orl_T0_T1+0), 2);
    gen_code_ptr += 2;
}
break;

case INDEX_op_andl_T0_T1: {
    extern void op_andl_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_andl_T0_T1+0), 2);
    gen_code_ptr += 2;
}
break;

case INDEX_op_subl_T0_T1: {
    extern void op_subl_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_subl_T0_T1+0), 2);
    gen_code_ptr += 2;
}
break;

case INDEX_op_xorl_T0_T1: {
    extern void op_xorl_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_xorl_T0_T1+0), 2);
    gen_code_ptr += 2;
}
break;

case INDEX_op_negl_T0: {
    extern void op_negl_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_negl_T0+0), 2);
    gen_code_ptr += 2;
}
break;

case INDEX_op_incl_T0: {
    extern void op_incl_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_incl_T0+0), 1);
    gen_code_ptr += 1;
}
break;

case INDEX_op_decl_T0: {
    extern void op_decl_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_decl_T0+0), 1);
    gen_code_ptr += 1;
}
break;

case INDEX_op_notl_T0: {
    extern void op_notl_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_notl_T0+0), 2);
    gen_code_ptr += 2;
}
break;

case INDEX_op_bswapl_T0: {
    extern void op_bswapl_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_bswapl_T0+0), 38);
    gen_code_ptr += 38;
}
break;

case INDEX_op_mulb_AL_T0: {
    extern void op_mulb_AL_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_mulb_AL_T0+0), 25);
    gen_code_ptr += 25;
}
break;

case INDEX_op_imulb_AL_T0: {
    extern void op_imulb_AL_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_imulb_AL_T0+0), 31);
    gen_code_ptr += 31;
}
break;

case INDEX_op_mulw_AX_T0: {
    extern void op_mulw_AX_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_mulw_AX_T0+0), 29);
    gen_code_ptr += 29;
}
break;

case INDEX_op_imulw_AX_T0: {
    extern void op_imulw_AX_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_imulw_AX_T0+0), 40);
    gen_code_ptr += 40;
}
break;

case INDEX_op_mull_EAX_T0: {
    extern void op_mull_EAX_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_mull_EAX_T0+0), 49);
    gen_code_ptr += 49;
}
break;

case INDEX_op_imull_EAX_T0: {
    extern void op_imull_EAX_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_imull_EAX_T0+0), 55);
    gen_code_ptr += 55;
}
break;

case INDEX_op_imulw_T0_T1: {
    extern void op_imulw_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_imulw_T0_T1+0), 28);
    gen_code_ptr += 28;
}
break;

case INDEX_op_imull_T0_T1: {
    extern void op_imull_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_imull_T0_T1+0), 50);
    gen_code_ptr += 50;
}
break;

case INDEX_op_divb_AL_T0: {
    extern void op_divb_AL_T0();
extern char raise_exception;
extern char raise_exception;
    memcpy(gen_code_ptr, (void *)((char *)&op_divb_AL_T0+0), 131);
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&raise_exception) - (long)(gen_code_ptr + 33) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 84) = (long)(&raise_exception) - (long)(gen_code_ptr + 84) + 0 -4;
    gen_code_ptr += 131;
}
break;

case INDEX_op_idivb_AL_T0: {
    extern void op_idivb_AL_T0();
extern char raise_exception;
extern char raise_exception;
    memcpy(gen_code_ptr, (void *)((char *)&op_idivb_AL_T0+0), 118);
    *(uint32_t *)(gen_code_ptr + 30) = (long)(&raise_exception) - (long)(gen_code_ptr + 30) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 83) = (long)(&raise_exception) - (long)(gen_code_ptr + 83) + 0 -4;
    gen_code_ptr += 118;
}
break;

case INDEX_op_divw_AX_T0: {
    extern void op_divw_AX_T0();
extern char raise_exception;
extern char raise_exception;
    memcpy(gen_code_ptr, (void *)((char *)&op_divw_AX_T0+0), 123);
    *(uint32_t *)(gen_code_ptr + 44) = (long)(&raise_exception) - (long)(gen_code_ptr + 44) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 89) = (long)(&raise_exception) - (long)(gen_code_ptr + 89) + 0 -4;
    gen_code_ptr += 123;
}
break;

case INDEX_op_idivw_AX_T0: {
    extern void op_idivw_AX_T0();
extern char raise_exception;
extern char raise_exception;
    memcpy(gen_code_ptr, (void *)((char *)&op_idivw_AX_T0+0), 119);
    *(uint32_t *)(gen_code_ptr + 41) = (long)(&raise_exception) - (long)(gen_code_ptr + 41) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 96) = (long)(&raise_exception) - (long)(gen_code_ptr + 96) + 0 -4;
    gen_code_ptr += 119;
}
break;

case INDEX_op_divl_EAX_T0: {
    extern void op_divl_EAX_T0();
extern char helper_divl_EAX_T0;
    memcpy(gen_code_ptr, (void *)((char *)&op_divl_EAX_T0+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_divl_EAX_T0) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_idivl_EAX_T0: {
    extern void op_idivl_EAX_T0();
extern char helper_idivl_EAX_T0;
    memcpy(gen_code_ptr, (void *)((char *)&op_idivl_EAX_T0+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_idivl_EAX_T0) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_movl_T0_imu: {
    long param1;
    extern void op_movl_T0_imu();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T0_imu+0), 5);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 1) = param1 + 0;
    gen_code_ptr += 5;
}
break;

case INDEX_op_movl_T0_im: {
    long param1;
    extern void op_movl_T0_im();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T0_im+0), 5);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 1) = param1 + 0;
    gen_code_ptr += 5;
}
break;

case INDEX_op_addl_T0_im: {
    long param1;
    extern void op_addl_T0_im();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_T0_im+0), 6);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    gen_code_ptr += 6;
}
break;

case INDEX_op_andl_T0_ffff: {
    extern void op_andl_T0_ffff();
    memcpy(gen_code_ptr, (void *)((char *)&op_andl_T0_ffff+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_andl_T0_im: {
    long param1;
    extern void op_andl_T0_im();
    memcpy(gen_code_ptr, (void *)((char *)&op_andl_T0_im+0), 6);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    gen_code_ptr += 6;
}
break;

case INDEX_op_movl_T0_T1: {
    extern void op_movl_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T0_T1+0), 2);
    gen_code_ptr += 2;
}
break;

case INDEX_op_movl_T1_imu: {
    long param1;
    extern void op_movl_T1_imu();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T1_imu+0), 5);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 1) = param1 + 0;
    gen_code_ptr += 5;
}
break;

case INDEX_op_movl_T1_im: {
    long param1;
    extern void op_movl_T1_im();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T1_im+0), 5);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 1) = param1 + 0;
    gen_code_ptr += 5;
}
break;

case INDEX_op_addl_T1_im: {
    long param1;
    extern void op_addl_T1_im();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_T1_im+0), 6);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    gen_code_ptr += 6;
}
break;

case INDEX_op_movl_T1_A0: {
    extern void op_movl_T1_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T1_A0+0), 2);
    gen_code_ptr += 2;
}
break;

case INDEX_op_movl_A0_im: {
    long param1;
    extern void op_movl_A0_im();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_A0_im+0), 5);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 1) = param1 + 0;
    gen_code_ptr += 5;
}
break;

case INDEX_op_addl_A0_im: {
    long param1;
    extern void op_addl_A0_im();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_im+0), 6);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    gen_code_ptr += 6;
}
break;

case INDEX_op_movl_A0_seg: {
    long param1;
    extern void op_movl_A0_seg();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_A0_seg+0), 6);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    gen_code_ptr += 6;
}
break;

case INDEX_op_addl_A0_seg: {
    long param1;
    extern void op_addl_A0_seg();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_seg+0), 8);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    gen_code_ptr += 8;
}
break;

case INDEX_op_addl_A0_AL: {
    extern void op_addl_A0_AL();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_AL+0), 7);
    gen_code_ptr += 7;
}
break;

case INDEX_op_andl_A0_ffff: {
    extern void op_andl_A0_ffff();
    memcpy(gen_code_ptr, (void *)((char *)&op_andl_A0_ffff+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_ldub_raw_T0_A0: {
    extern void op_ldub_raw_T0_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_ldub_raw_T0_A0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_ldsb_raw_T0_A0: {
    extern void op_ldsb_raw_T0_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_ldsb_raw_T0_A0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_lduw_raw_T0_A0: {
    extern void op_lduw_raw_T0_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_lduw_raw_T0_A0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_ldsw_raw_T0_A0: {
    extern void op_ldsw_raw_T0_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_ldsw_raw_T0_A0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_ldl_raw_T0_A0: {
    extern void op_ldl_raw_T0_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_ldl_raw_T0_A0+0), 2);
    gen_code_ptr += 2;
}
break;

case INDEX_op_ldub_raw_T1_A0: {
    extern void op_ldub_raw_T1_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_ldub_raw_T1_A0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_ldsb_raw_T1_A0: {
    extern void op_ldsb_raw_T1_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_ldsb_raw_T1_A0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_lduw_raw_T1_A0: {
    extern void op_lduw_raw_T1_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_lduw_raw_T1_A0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_ldsw_raw_T1_A0: {
    extern void op_ldsw_raw_T1_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_ldsw_raw_T1_A0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_ldl_raw_T1_A0: {
    extern void op_ldl_raw_T1_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_ldl_raw_T1_A0+0), 2);
    gen_code_ptr += 2;
}
break;

case INDEX_op_stb_raw_T0_A0: {
    extern void op_stb_raw_T0_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_stb_raw_T0_A0+0), 2);
    gen_code_ptr += 2;
}
break;

case INDEX_op_stw_raw_T0_A0: {
    extern void op_stw_raw_T0_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_stw_raw_T0_A0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_stl_raw_T0_A0: {
    extern void op_stl_raw_T0_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_stl_raw_T0_A0+0), 2);
    gen_code_ptr += 2;
}
break;

case INDEX_op_stw_raw_T1_A0: {
    extern void op_stw_raw_T1_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_stw_raw_T1_A0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_stl_raw_T1_A0: {
    extern void op_stl_raw_T1_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_stl_raw_T1_A0+0), 2);
    gen_code_ptr += 2;
}
break;

case INDEX_op_ldq_raw_env_A0: {
    long param1;
    extern void op_ldq_raw_env_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_ldq_raw_env_A0+0), 17);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 7) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 13) = param1 + 4;
    gen_code_ptr += 17;
}
break;

case INDEX_op_stq_raw_env_A0: {
    long param1;
    extern void op_stq_raw_env_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_stq_raw_env_A0+0), 17);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 4;
    gen_code_ptr += 17;
}
break;

case INDEX_op_ldo_raw_env_A0: {
    long param1;
    extern void op_ldo_raw_env_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_ldo_raw_env_A0+0), 28);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 4) = param1 + 0;
    gen_code_ptr += 28;
}
break;

case INDEX_op_sto_raw_env_A0: {
    long param1;
    extern void op_sto_raw_env_A0();
    memcpy(gen_code_ptr, (void *)((char *)&op_sto_raw_env_A0+0), 28);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    gen_code_ptr += 28;
}
break;

case INDEX_op_ldub_kernel_T0_A0: {
    extern void op_ldub_kernel_T0_A0();
extern char __ldb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_ldub_kernel_T0_A0+0), 49);
    *(uint32_t *)(gen_code_ptr + 34) = (long)(&__ldb_mmu) - (long)(gen_code_ptr + 34) + 0 -4;
    gen_code_ptr += 49;
}
break;

case INDEX_op_ldsb_kernel_T0_A0: {
    extern void op_ldsb_kernel_T0_A0();
extern char __ldb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_ldsb_kernel_T0_A0+0), 50);
    *(uint32_t *)(gen_code_ptr + 34) = (long)(&__ldb_mmu) - (long)(gen_code_ptr + 34) + 0 -4;
    gen_code_ptr += 50;
}
break;

case INDEX_op_lduw_kernel_T0_A0: {
    extern void op_lduw_kernel_T0_A0();
extern char __ldw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_lduw_kernel_T0_A0+0), 49);
    *(uint32_t *)(gen_code_ptr + 34) = (long)(&__ldw_mmu) - (long)(gen_code_ptr + 34) + 0 -4;
    gen_code_ptr += 49;
}
break;

case INDEX_op_ldsw_kernel_T0_A0: {
    extern void op_ldsw_kernel_T0_A0();
extern char __ldw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_ldsw_kernel_T0_A0+0), 50);
    *(uint32_t *)(gen_code_ptr + 34) = (long)(&__ldw_mmu) - (long)(gen_code_ptr + 34) + 0 -4;
    gen_code_ptr += 50;
}
break;

case INDEX_op_ldl_kernel_T0_A0: {
    extern void op_ldl_kernel_T0_A0();
extern char __ldl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_ldl_kernel_T0_A0+0), 48);
    *(uint32_t *)(gen_code_ptr + 34) = (long)(&__ldl_mmu) - (long)(gen_code_ptr + 34) + 0 -4;
    gen_code_ptr += 48;
}
break;

case INDEX_op_ldub_kernel_T1_A0: {
    extern void op_ldub_kernel_T1_A0();
extern char __ldb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_ldub_kernel_T1_A0+0), 49);
    *(uint32_t *)(gen_code_ptr + 34) = (long)(&__ldb_mmu) - (long)(gen_code_ptr + 34) + 0 -4;
    gen_code_ptr += 49;
}
break;

case INDEX_op_ldsb_kernel_T1_A0: {
    extern void op_ldsb_kernel_T1_A0();
extern char __ldb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_ldsb_kernel_T1_A0+0), 50);
    *(uint32_t *)(gen_code_ptr + 34) = (long)(&__ldb_mmu) - (long)(gen_code_ptr + 34) + 0 -4;
    gen_code_ptr += 50;
}
break;

case INDEX_op_lduw_kernel_T1_A0: {
    extern void op_lduw_kernel_T1_A0();
extern char __ldw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_lduw_kernel_T1_A0+0), 49);
    *(uint32_t *)(gen_code_ptr + 34) = (long)(&__ldw_mmu) - (long)(gen_code_ptr + 34) + 0 -4;
    gen_code_ptr += 49;
}
break;

case INDEX_op_ldsw_kernel_T1_A0: {
    extern void op_ldsw_kernel_T1_A0();
extern char __ldw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_ldsw_kernel_T1_A0+0), 50);
    *(uint32_t *)(gen_code_ptr + 34) = (long)(&__ldw_mmu) - (long)(gen_code_ptr + 34) + 0 -4;
    gen_code_ptr += 50;
}
break;

case INDEX_op_ldl_kernel_T1_A0: {
    extern void op_ldl_kernel_T1_A0();
extern char __ldl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_ldl_kernel_T1_A0+0), 48);
    *(uint32_t *)(gen_code_ptr + 34) = (long)(&__ldl_mmu) - (long)(gen_code_ptr + 34) + 0 -4;
    gen_code_ptr += 48;
}
break;

case INDEX_op_stb_kernel_T0_A0: {
    extern void op_stb_kernel_T0_A0();
extern char __stb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_stb_kernel_T0_A0+0), 49);
    *(uint32_t *)(gen_code_ptr + 37) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 37) + 0 -4;
    gen_code_ptr += 49;
}
break;

case INDEX_op_stw_kernel_T0_A0: {
    extern void op_stw_kernel_T0_A0();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_stw_kernel_T0_A0+0), 50);
    *(uint32_t *)(gen_code_ptr + 37) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 37) + 0 -4;
    gen_code_ptr += 50;
}
break;

case INDEX_op_stl_kernel_T0_A0: {
    extern void op_stl_kernel_T0_A0();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_stl_kernel_T0_A0+0), 48);
    *(uint32_t *)(gen_code_ptr + 36) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 36) + 0 -4;
    gen_code_ptr += 48;
}
break;

case INDEX_op_stw_kernel_T1_A0: {
    extern void op_stw_kernel_T1_A0();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_stw_kernel_T1_A0+0), 50);
    *(uint32_t *)(gen_code_ptr + 37) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 37) + 0 -4;
    gen_code_ptr += 50;
}
break;

case INDEX_op_stl_kernel_T1_A0: {
    extern void op_stl_kernel_T1_A0();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_stl_kernel_T1_A0+0), 48);
    *(uint32_t *)(gen_code_ptr + 36) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 36) + 0 -4;
    gen_code_ptr += 48;
}
break;

case INDEX_op_ldq_kernel_env_A0: {
    long param1;
    extern void op_ldq_kernel_env_A0();
extern char __ldq_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_ldq_kernel_env_A0+0), 92);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 54) = (long)(&__ldq_mmu) - (long)(gen_code_ptr + 54) + 0 -4;
    gen_code_ptr += 92;
}
break;

case INDEX_op_stq_kernel_env_A0: {
    long param1;
    extern void op_stq_kernel_env_A0();
extern char __stq_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_stq_kernel_env_A0+0), 107);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 7) = param1 + 4;
    *(uint32_t *)(gen_code_ptr + 13) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 76) = (long)(&__stq_mmu) - (long)(gen_code_ptr + 76) + 0 -4;
    gen_code_ptr += 107;
}
break;

case INDEX_op_ldo_kernel_env_A0: {
    long param1;
    extern void op_ldo_kernel_env_A0();
extern char __ldq_mmu;
extern char __ldq_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_ldo_kernel_env_A0+0), 162);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 54) = (long)(&__ldq_mmu) - (long)(gen_code_ptr + 54) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 129) = (long)(&__ldq_mmu) - (long)(gen_code_ptr + 129) + 0 -4;
    gen_code_ptr += 162;
}
break;

case INDEX_op_sto_kernel_env_A0: {
    long param1;
    extern void op_sto_kernel_env_A0();
extern char __stq_mmu;
extern char __stq_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_sto_kernel_env_A0+0), 212);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 81) = (long)(&__stq_mmu) - (long)(gen_code_ptr + 81) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 181) = (long)(&__stq_mmu) - (long)(gen_code_ptr + 181) + 0 -4;
    gen_code_ptr += 212;
}
break;

case INDEX_op_ldub_user_T0_A0: {
    extern void op_ldub_user_T0_A0();
extern char __ldb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_ldub_user_T0_A0+0), 49);
    *(uint32_t *)(gen_code_ptr + 34) = (long)(&__ldb_mmu) - (long)(gen_code_ptr + 34) + 0 -4;
    gen_code_ptr += 49;
}
break;

case INDEX_op_ldsb_user_T0_A0: {
    extern void op_ldsb_user_T0_A0();
extern char __ldb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_ldsb_user_T0_A0+0), 50);
    *(uint32_t *)(gen_code_ptr + 34) = (long)(&__ldb_mmu) - (long)(gen_code_ptr + 34) + 0 -4;
    gen_code_ptr += 50;
}
break;

case INDEX_op_lduw_user_T0_A0: {
    extern void op_lduw_user_T0_A0();
extern char __ldw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_lduw_user_T0_A0+0), 49);
    *(uint32_t *)(gen_code_ptr + 34) = (long)(&__ldw_mmu) - (long)(gen_code_ptr + 34) + 0 -4;
    gen_code_ptr += 49;
}
break;

case INDEX_op_ldsw_user_T0_A0: {
    extern void op_ldsw_user_T0_A0();
extern char __ldw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_ldsw_user_T0_A0+0), 50);
    *(uint32_t *)(gen_code_ptr + 34) = (long)(&__ldw_mmu) - (long)(gen_code_ptr + 34) + 0 -4;
    gen_code_ptr += 50;
}
break;

case INDEX_op_ldl_user_T0_A0: {
    extern void op_ldl_user_T0_A0();
extern char __ldl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_ldl_user_T0_A0+0), 48);
    *(uint32_t *)(gen_code_ptr + 34) = (long)(&__ldl_mmu) - (long)(gen_code_ptr + 34) + 0 -4;
    gen_code_ptr += 48;
}
break;

case INDEX_op_ldub_user_T1_A0: {
    extern void op_ldub_user_T1_A0();
extern char __ldb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_ldub_user_T1_A0+0), 49);
    *(uint32_t *)(gen_code_ptr + 34) = (long)(&__ldb_mmu) - (long)(gen_code_ptr + 34) + 0 -4;
    gen_code_ptr += 49;
}
break;

case INDEX_op_ldsb_user_T1_A0: {
    extern void op_ldsb_user_T1_A0();
extern char __ldb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_ldsb_user_T1_A0+0), 50);
    *(uint32_t *)(gen_code_ptr + 34) = (long)(&__ldb_mmu) - (long)(gen_code_ptr + 34) + 0 -4;
    gen_code_ptr += 50;
}
break;

case INDEX_op_lduw_user_T1_A0: {
    extern void op_lduw_user_T1_A0();
extern char __ldw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_lduw_user_T1_A0+0), 49);
    *(uint32_t *)(gen_code_ptr + 34) = (long)(&__ldw_mmu) - (long)(gen_code_ptr + 34) + 0 -4;
    gen_code_ptr += 49;
}
break;

case INDEX_op_ldsw_user_T1_A0: {
    extern void op_ldsw_user_T1_A0();
extern char __ldw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_ldsw_user_T1_A0+0), 50);
    *(uint32_t *)(gen_code_ptr + 34) = (long)(&__ldw_mmu) - (long)(gen_code_ptr + 34) + 0 -4;
    gen_code_ptr += 50;
}
break;

case INDEX_op_ldl_user_T1_A0: {
    extern void op_ldl_user_T1_A0();
extern char __ldl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_ldl_user_T1_A0+0), 48);
    *(uint32_t *)(gen_code_ptr + 34) = (long)(&__ldl_mmu) - (long)(gen_code_ptr + 34) + 0 -4;
    gen_code_ptr += 48;
}
break;

case INDEX_op_stb_user_T0_A0: {
    extern void op_stb_user_T0_A0();
extern char __stb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_stb_user_T0_A0+0), 49);
    *(uint32_t *)(gen_code_ptr + 37) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 37) + 0 -4;
    gen_code_ptr += 49;
}
break;

case INDEX_op_stw_user_T0_A0: {
    extern void op_stw_user_T0_A0();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_stw_user_T0_A0+0), 50);
    *(uint32_t *)(gen_code_ptr + 37) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 37) + 0 -4;
    gen_code_ptr += 50;
}
break;

case INDEX_op_stl_user_T0_A0: {
    extern void op_stl_user_T0_A0();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_stl_user_T0_A0+0), 48);
    *(uint32_t *)(gen_code_ptr + 36) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 36) + 0 -4;
    gen_code_ptr += 48;
}
break;

case INDEX_op_stw_user_T1_A0: {
    extern void op_stw_user_T1_A0();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_stw_user_T1_A0+0), 50);
    *(uint32_t *)(gen_code_ptr + 37) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 37) + 0 -4;
    gen_code_ptr += 50;
}
break;

case INDEX_op_stl_user_T1_A0: {
    extern void op_stl_user_T1_A0();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_stl_user_T1_A0+0), 48);
    *(uint32_t *)(gen_code_ptr + 36) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 36) + 0 -4;
    gen_code_ptr += 48;
}
break;

case INDEX_op_ldq_user_env_A0: {
    long param1;
    extern void op_ldq_user_env_A0();
extern char __ldq_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_ldq_user_env_A0+0), 100);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 62) = (long)(&__ldq_mmu) - (long)(gen_code_ptr + 62) + 0 -4;
    gen_code_ptr += 100;
}
break;

case INDEX_op_stq_user_env_A0: {
    long param1;
    extern void op_stq_user_env_A0();
extern char __stq_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_stq_user_env_A0+0), 118);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 7) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 13) = param1 + 4;
    *(uint32_t *)(gen_code_ptr + 87) = (long)(&__stq_mmu) - (long)(gen_code_ptr + 87) + 0 -4;
    gen_code_ptr += 118;
}
break;

case INDEX_op_ldo_user_env_A0: {
    long param1;
    extern void op_ldo_user_env_A0();
extern char __ldq_mmu;
extern char __ldq_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_ldo_user_env_A0+0), 178);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 62) = (long)(&__ldq_mmu) - (long)(gen_code_ptr + 62) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 145) = (long)(&__ldq_mmu) - (long)(gen_code_ptr + 145) + 0 -4;
    gen_code_ptr += 178;
}
break;

case INDEX_op_sto_user_env_A0: {
    long param1;
    extern void op_sto_user_env_A0();
extern char __stq_mmu;
extern char __stq_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_sto_user_env_A0+0), 234);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 92) = (long)(&__stq_mmu) - (long)(gen_code_ptr + 92) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 203) = (long)(&__stq_mmu) - (long)(gen_code_ptr + 203) + 0 -4;
    gen_code_ptr += 234;
}
break;

case INDEX_op_jmp_T0: {
    extern void op_jmp_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_jmp_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_eip_im: {
    long param1;
    extern void op_movl_eip_im();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_eip_im+0), 7);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 3) = param1 + 0;
    gen_code_ptr += 7;
}
break;

case INDEX_op_hlt: {
    extern void op_hlt();
extern char helper_hlt;
    memcpy(gen_code_ptr, (void *)((char *)&op_hlt+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_hlt) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_monitor: {
    extern void op_monitor();
extern char helper_monitor;
    memcpy(gen_code_ptr, (void *)((char *)&op_monitor+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_monitor) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_mwait: {
    extern void op_mwait();
extern char helper_mwait;
    memcpy(gen_code_ptr, (void *)((char *)&op_mwait+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_mwait) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_debug: {
    extern void op_debug();
extern char cpu_loop_exit;
    memcpy(gen_code_ptr, (void *)((char *)&op_debug+0), 16);
    *(uint32_t *)(gen_code_ptr + 12) = (long)(&cpu_loop_exit) - (long)(gen_code_ptr + 12) + 0 -4;
    gen_code_ptr += 16;
}
break;

case INDEX_op_raise_interrupt: {
    long param1, param2;
    extern void op_raise_interrupt();
extern char raise_interrupt;
    memcpy(gen_code_ptr, (void *)((char *)&op_raise_interrupt+0), 42);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 4) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 30) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 35) = (long)(&raise_interrupt) - (long)(gen_code_ptr + 35) + 0 -4;
    gen_code_ptr += 42;
}
break;

case INDEX_op_raise_exception: {
    long param1;
    extern void op_raise_exception();
extern char raise_exception;
    memcpy(gen_code_ptr, (void *)((char *)&op_raise_exception+0), 16);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 6) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = (long)(&raise_exception) - (long)(gen_code_ptr + 11) + 0 -4;
    gen_code_ptr += 16;
}
break;

case INDEX_op_into: {
    long param1;
    extern void op_into();
extern char cc_table;
extern char raise_interrupt;
    memcpy(gen_code_ptr, (void *)((char *)&op_into+0), 58);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 9) = (long)(&cc_table) + 0;
    *(uint32_t *)(gen_code_ptr + 26) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 50) = (long)(&raise_interrupt) - (long)(gen_code_ptr + 50) + 0 -4;
    gen_code_ptr += 58;
}
break;

case INDEX_op_cli: {
    extern void op_cli();
    memcpy(gen_code_ptr, (void *)((char *)&op_cli+0), 7);
    gen_code_ptr += 7;
}
break;

case INDEX_op_sti: {
    extern void op_sti();
    memcpy(gen_code_ptr, (void *)((char *)&op_sti+0), 7);
    gen_code_ptr += 7;
}
break;

case INDEX_op_set_inhibit_irq: {
    extern void op_set_inhibit_irq();
    memcpy(gen_code_ptr, (void *)((char *)&op_set_inhibit_irq+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_reset_inhibit_irq: {
    extern void op_reset_inhibit_irq();
    memcpy(gen_code_ptr, (void *)((char *)&op_reset_inhibit_irq+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_rsm: {
    extern void op_rsm();
extern char helper_rsm;
    memcpy(gen_code_ptr, (void *)((char *)&op_rsm+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_rsm) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_boundw: {
    extern void op_boundw();
extern char __ldw_mmu;
extern char __ldw_mmu;
extern char raise_exception;
    memcpy(gen_code_ptr, (void *)((char *)&op_boundw+0), 239);
    *(uint32_t *)(gen_code_ptr + 72) = (long)(&__ldw_mmu) - (long)(gen_code_ptr + 72) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 169) = (long)(&__ldw_mmu) - (long)(gen_code_ptr + 169) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 219) = (long)(&raise_exception) - (long)(gen_code_ptr + 219) + 0 -4;
    gen_code_ptr += 239;
}
break;

case INDEX_op_boundl: {
    extern void op_boundl();
extern char __ldl_mmu;
extern char __ldl_mmu;
extern char raise_exception;
    memcpy(gen_code_ptr, (void *)((char *)&op_boundl+0), 223);
    *(uint32_t *)(gen_code_ptr + 72) = (long)(&__ldl_mmu) - (long)(gen_code_ptr + 72) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 167) = (long)(&__ldl_mmu) - (long)(gen_code_ptr + 167) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 212) = (long)(&raise_exception) - (long)(gen_code_ptr + 212) + 0 -4;
    gen_code_ptr += 223;
}
break;

case INDEX_op_cmpxchg8b: {
    extern void op_cmpxchg8b();
extern char helper_cmpxchg8b;
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpxchg8b+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_cmpxchg8b) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_single_step: {
    extern void op_single_step();
extern char helper_single_step;
    memcpy(gen_code_ptr, (void *)((char *)&op_single_step+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_single_step) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_movl_T0_0: {
    extern void op_movl_T0_0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T0_0+0), 2);
    gen_code_ptr += 2;
}
break;

case INDEX_op_exit_tb: {
    extern void op_exit_tb();
    memcpy(gen_code_ptr, (void *)((char *)&op_exit_tb+0), 1);
    gen_code_ptr += 1;
}
break;

case INDEX_op_jb_subb: {
    long param1;
    extern void op_jb_subb();
    memcpy(gen_code_ptr, (void *)((char *)&op_jb_subb+0), 18);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 14) = gen_labels[param1] - (long)(gen_code_ptr + 14) + 0 -4;
    gen_code_ptr += 18;
}
break;

case INDEX_op_jz_subb: {
    long param1;
    extern void op_jz_subb();
    memcpy(gen_code_ptr, (void *)((char *)&op_jz_subb+0), 11);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 7) = gen_labels[param1] - (long)(gen_code_ptr + 7) + 0 -4;
    gen_code_ptr += 11;
}
break;

case INDEX_op_jnz_subb: {
    long param1;
    extern void op_jnz_subb();
    memcpy(gen_code_ptr, (void *)((char *)&op_jnz_subb+0), 11);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 7) = gen_labels[param1] - (long)(gen_code_ptr + 7) + 0 -4;
    gen_code_ptr += 11;
}
break;

case INDEX_op_jbe_subb: {
    long param1;
    extern void op_jbe_subb();
    memcpy(gen_code_ptr, (void *)((char *)&op_jbe_subb+0), 18);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 14) = gen_labels[param1] - (long)(gen_code_ptr + 14) + 0 -4;
    gen_code_ptr += 18;
}
break;

case INDEX_op_js_subb: {
    long param1;
    extern void op_js_subb();
    memcpy(gen_code_ptr, (void *)((char *)&op_js_subb+0), 11);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 7) = gen_labels[param1] - (long)(gen_code_ptr + 7) + 0 -4;
    gen_code_ptr += 11;
}
break;

case INDEX_op_jl_subb: {
    long param1;
    extern void op_jl_subb();
    memcpy(gen_code_ptr, (void *)((char *)&op_jl_subb+0), 18);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 14) = gen_labels[param1] - (long)(gen_code_ptr + 14) + 0 -4;
    gen_code_ptr += 18;
}
break;

case INDEX_op_jle_subb: {
    long param1;
    extern void op_jle_subb();
    memcpy(gen_code_ptr, (void *)((char *)&op_jle_subb+0), 18);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 14) = gen_labels[param1] - (long)(gen_code_ptr + 14) + 0 -4;
    gen_code_ptr += 18;
}
break;

case INDEX_op_setb_T0_subb: {
    extern void op_setb_T0_subb();
    memcpy(gen_code_ptr, (void *)((char *)&op_setb_T0_subb+0), 16);
    gen_code_ptr += 16;
}
break;

case INDEX_op_setz_T0_subb: {
    extern void op_setz_T0_subb();
    memcpy(gen_code_ptr, (void *)((char *)&op_setz_T0_subb+0), 9);
    gen_code_ptr += 9;
}
break;

case INDEX_op_setbe_T0_subb: {
    extern void op_setbe_T0_subb();
    memcpy(gen_code_ptr, (void *)((char *)&op_setbe_T0_subb+0), 16);
    gen_code_ptr += 16;
}
break;

case INDEX_op_sets_T0_subb: {
    extern void op_sets_T0_subb();
    memcpy(gen_code_ptr, (void *)((char *)&op_sets_T0_subb+0), 11);
    gen_code_ptr += 11;
}
break;

case INDEX_op_setl_T0_subb: {
    extern void op_setl_T0_subb();
    memcpy(gen_code_ptr, (void *)((char *)&op_setl_T0_subb+0), 16);
    gen_code_ptr += 16;
}
break;

case INDEX_op_setle_T0_subb: {
    extern void op_setle_T0_subb();
    memcpy(gen_code_ptr, (void *)((char *)&op_setle_T0_subb+0), 16);
    gen_code_ptr += 16;
}
break;

case INDEX_op_shlb_T0_T1: {
    extern void op_shlb_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_shlb_T0_T1+0), 7);
    gen_code_ptr += 7;
}
break;

case INDEX_op_shrb_T0_T1: {
    extern void op_shrb_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_shrb_T0_T1+0), 13);
    gen_code_ptr += 13;
}
break;

case INDEX_op_sarb_T0_T1: {
    extern void op_sarb_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_sarb_T0_T1+0), 12);
    gen_code_ptr += 12;
}
break;

case INDEX_op_rolb_T0_T1_cc: {
    extern void op_rolb_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rolb_T0_T1_cc+0), 114);
    *(uint32_t *)(gen_code_ptr + 52) = (long)(&cc_table) + 0;
    gen_code_ptr += 114;
}
break;

case INDEX_op_rorb_T0_T1_cc: {
    extern void op_rorb_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rorb_T0_T1_cc+0), 111);
    *(uint32_t *)(gen_code_ptr + 52) = (long)(&cc_table) + 0;
    gen_code_ptr += 111;
}
break;

case INDEX_op_rolb_T0_T1: {
    extern void op_rolb_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_rolb_T0_T1+0), 43);
    gen_code_ptr += 43;
}
break;

case INDEX_op_rorb_T0_T1: {
    extern void op_rorb_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_rorb_T0_T1+0), 43);
    gen_code_ptr += 43;
}
break;

case INDEX_op_rclb_T0_T1_cc: {
    extern void op_rclb_T0_T1_cc();
extern char rclb_table;
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rclb_T0_T1_cc+0), 169);
    *(uint32_t *)(gen_code_ptr + 11) = (long)(&rclb_table) + 0;
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&cc_table) + 0;
    gen_code_ptr += 169;
}
break;

case INDEX_op_rcrb_T0_T1_cc: {
    extern void op_rcrb_T0_T1_cc();
extern char rclb_table;
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rcrb_T0_T1_cc+0), 175);
    *(uint32_t *)(gen_code_ptr + 11) = (long)(&rclb_table) + 0;
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&cc_table) + 0;
    gen_code_ptr += 175;
}
break;

case INDEX_op_shlb_T0_T1_cc: {
    extern void op_shlb_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shlb_T0_T1_cc+0), 32);
    gen_code_ptr += 32;
}
break;

case INDEX_op_shrb_T0_T1_cc: {
    extern void op_shrb_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shrb_T0_T1_cc+0), 37);
    gen_code_ptr += 37;
}
break;

case INDEX_op_sarb_T0_T1_cc: {
    extern void op_sarb_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_sarb_T0_T1_cc+0), 30);
    gen_code_ptr += 30;
}
break;

case INDEX_op_adcb_T0_T1_cc: {
    extern void op_adcb_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_adcb_T0_T1_cc+0), 32);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 4;
    gen_code_ptr += 32;
}
break;

case INDEX_op_sbbb_T0_T1_cc: {
    extern void op_sbbb_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_sbbb_T0_T1_cc+0), 34);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 4;
    gen_code_ptr += 34;
}
break;

case INDEX_op_cmpxchgb_T0_T1_EAX_cc: {
    extern void op_cmpxchgb_T0_T1_EAX_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpxchgb_T0_T1_EAX_cc+0), 24);
    gen_code_ptr += 24;
}
break;

case INDEX_op_rolb_raw_T0_T1_cc: {
    extern void op_rolb_raw_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rolb_raw_T0_T1_cc+0), 106);
    *(uint32_t *)(gen_code_ptr + 54) = (long)(&cc_table) + 0;
    gen_code_ptr += 106;
}
break;

case INDEX_op_rorb_raw_T0_T1_cc: {
    extern void op_rorb_raw_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rorb_raw_T0_T1_cc+0), 111);
    *(uint32_t *)(gen_code_ptr + 54) = (long)(&cc_table) + 0;
    gen_code_ptr += 111;
}
break;

case INDEX_op_rolb_raw_T0_T1: {
    extern void op_rolb_raw_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_rolb_raw_T0_T1+0), 45);
    gen_code_ptr += 45;
}
break;

case INDEX_op_rorb_raw_T0_T1: {
    extern void op_rorb_raw_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_rorb_raw_T0_T1+0), 45);
    gen_code_ptr += 45;
}
break;

case INDEX_op_rclb_raw_T0_T1_cc: {
    extern void op_rclb_raw_T0_T1_cc();
extern char rclb_table;
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rclb_raw_T0_T1_cc+0), 181);
    *(uint32_t *)(gen_code_ptr + 11) = (long)(&rclb_table) + 0;
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&cc_table) + 0;
    gen_code_ptr += 181;
}
break;

case INDEX_op_rcrb_raw_T0_T1_cc: {
    extern void op_rcrb_raw_T0_T1_cc();
extern char rclb_table;
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rcrb_raw_T0_T1_cc+0), 175);
    *(uint32_t *)(gen_code_ptr + 11) = (long)(&rclb_table) + 0;
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&cc_table) + 0;
    gen_code_ptr += 175;
}
break;

case INDEX_op_shlb_raw_T0_T1_cc: {
    extern void op_shlb_raw_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shlb_raw_T0_T1_cc+0), 34);
    gen_code_ptr += 34;
}
break;

case INDEX_op_shrb_raw_T0_T1_cc: {
    extern void op_shrb_raw_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shrb_raw_T0_T1_cc+0), 39);
    gen_code_ptr += 39;
}
break;

case INDEX_op_sarb_raw_T0_T1_cc: {
    extern void op_sarb_raw_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_sarb_raw_T0_T1_cc+0), 32);
    gen_code_ptr += 32;
}
break;

case INDEX_op_adcb_raw_T0_T1_cc: {
    extern void op_adcb_raw_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_adcb_raw_T0_T1_cc+0), 34);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 4;
    gen_code_ptr += 34;
}
break;

case INDEX_op_sbbb_raw_T0_T1_cc: {
    extern void op_sbbb_raw_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_sbbb_raw_T0_T1_cc+0), 36);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 4;
    gen_code_ptr += 36;
}
break;

case INDEX_op_cmpxchgb_raw_T0_T1_EAX_cc: {
    extern void op_cmpxchgb_raw_T0_T1_EAX_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpxchgb_raw_T0_T1_EAX_cc+0), 26);
    gen_code_ptr += 26;
}
break;

case INDEX_op_rolb_kernel_T0_T1_cc: {
    extern void op_rolb_kernel_T0_T1_cc();
extern char __stb_mmu;
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rolb_kernel_T0_T1_cc+0), 158);
    *(uint32_t *)(gen_code_ptr + 87) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 87) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 105) = (long)(&cc_table) + 0;
    gen_code_ptr += 158;
}
break;

case INDEX_op_rorb_kernel_T0_T1_cc: {
    extern void op_rorb_kernel_T0_T1_cc();
extern char __stb_mmu;
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rorb_kernel_T0_T1_cc+0), 159);
    *(uint32_t *)(gen_code_ptr + 87) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 87) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 105) = (long)(&cc_table) + 0;
    gen_code_ptr += 159;
}
break;

case INDEX_op_rolb_kernel_T0_T1: {
    extern void op_rolb_kernel_T0_T1();
extern char __stb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_rolb_kernel_T0_T1+0), 83);
    *(uint32_t *)(gen_code_ptr + 71) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 71) + 0 -4;
    gen_code_ptr += 83;
}
break;

case INDEX_op_rorb_kernel_T0_T1: {
    extern void op_rorb_kernel_T0_T1();
extern char __stb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_rorb_kernel_T0_T1+0), 83);
    *(uint32_t *)(gen_code_ptr + 71) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 71) + 0 -4;
    gen_code_ptr += 83;
}
break;

case INDEX_op_rclb_kernel_T0_T1_cc: {
    extern void op_rclb_kernel_T0_T1_cc();
extern char rclb_table;
extern char cc_table;
extern char __stb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_rclb_kernel_T0_T1_cc+0), 217);
    *(uint32_t *)(gen_code_ptr + 11) = (long)(&rclb_table) + 0;
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&cc_table) + 0;
    *(uint32_t *)(gen_code_ptr + 134) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 134) + 0 -4;
    gen_code_ptr += 217;
}
break;

case INDEX_op_rcrb_kernel_T0_T1_cc: {
    extern void op_rcrb_kernel_T0_T1_cc();
extern char rclb_table;
extern char cc_table;
extern char __stb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_rcrb_kernel_T0_T1_cc+0), 223);
    *(uint32_t *)(gen_code_ptr + 11) = (long)(&rclb_table) + 0;
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&cc_table) + 0;
    *(uint32_t *)(gen_code_ptr + 138) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 138) + 0 -4;
    gen_code_ptr += 223;
}
break;

case INDEX_op_shlb_kernel_T0_T1_cc: {
    extern void op_shlb_kernel_T0_T1_cc();
extern char __stb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shlb_kernel_T0_T1_cc+0), 91);
    *(uint32_t *)(gen_code_ptr + 62) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 62) + 0 -4;
    gen_code_ptr += 91;
}
break;

case INDEX_op_shrb_kernel_T0_T1_cc: {
    extern void op_shrb_kernel_T0_T1_cc();
extern char __stb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shrb_kernel_T0_T1_cc+0), 96);
    *(uint32_t *)(gen_code_ptr + 67) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 67) + 0 -4;
    gen_code_ptr += 96;
}
break;

case INDEX_op_sarb_kernel_T0_T1_cc: {
    extern void op_sarb_kernel_T0_T1_cc();
extern char __stb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_sarb_kernel_T0_T1_cc+0), 89);
    *(uint32_t *)(gen_code_ptr + 60) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 60) + 0 -4;
    gen_code_ptr += 89;
}
break;

case INDEX_op_adcb_kernel_T0_T1_cc: {
    extern void op_adcb_kernel_T0_T1_cc();
extern char cc_table;
extern char __stb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_adcb_kernel_T0_T1_cc+0), 94);
    *(uint32_t *)(gen_code_ptr + 9) = (long)(&cc_table) + 4;
    *(uint32_t *)(gen_code_ptr + 62) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 62) + 0 -4;
    gen_code_ptr += 94;
}
break;

case INDEX_op_sbbb_kernel_T0_T1_cc: {
    extern void op_sbbb_kernel_T0_T1_cc();
extern char cc_table;
extern char __stb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_sbbb_kernel_T0_T1_cc+0), 96);
    *(uint32_t *)(gen_code_ptr + 9) = (long)(&cc_table) + 4;
    *(uint32_t *)(gen_code_ptr + 64) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 64) + 0 -4;
    gen_code_ptr += 96;
}
break;

case INDEX_op_cmpxchgb_kernel_T0_T1_EAX_cc: {
    extern void op_cmpxchgb_kernel_T0_T1_EAX_cc();
extern char __stb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpxchgb_kernel_T0_T1_EAX_cc+0), 95);
    *(uint32_t *)(gen_code_ptr + 62) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 62) + 0 -4;
    gen_code_ptr += 95;
}
break;

case INDEX_op_rolb_user_T0_T1_cc: {
    extern void op_rolb_user_T0_T1_cc();
extern char __stb_mmu;
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rolb_user_T0_T1_cc+0), 166);
    *(uint32_t *)(gen_code_ptr + 87) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 87) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 105) = (long)(&cc_table) + 0;
    gen_code_ptr += 166;
}
break;

case INDEX_op_rorb_user_T0_T1_cc: {
    extern void op_rorb_user_T0_T1_cc();
extern char __stb_mmu;
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rorb_user_T0_T1_cc+0), 159);
    *(uint32_t *)(gen_code_ptr + 87) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 87) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 105) = (long)(&cc_table) + 0;
    gen_code_ptr += 159;
}
break;

case INDEX_op_rolb_user_T0_T1: {
    extern void op_rolb_user_T0_T1();
extern char __stb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_rolb_user_T0_T1+0), 83);
    *(uint32_t *)(gen_code_ptr + 71) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 71) + 0 -4;
    gen_code_ptr += 83;
}
break;

case INDEX_op_rorb_user_T0_T1: {
    extern void op_rorb_user_T0_T1();
extern char __stb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_rorb_user_T0_T1+0), 83);
    *(uint32_t *)(gen_code_ptr + 71) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 71) + 0 -4;
    gen_code_ptr += 83;
}
break;

case INDEX_op_rclb_user_T0_T1_cc: {
    extern void op_rclb_user_T0_T1_cc();
extern char rclb_table;
extern char cc_table;
extern char __stb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_rclb_user_T0_T1_cc+0), 217);
    *(uint32_t *)(gen_code_ptr + 11) = (long)(&rclb_table) + 0;
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&cc_table) + 0;
    *(uint32_t *)(gen_code_ptr + 134) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 134) + 0 -4;
    gen_code_ptr += 217;
}
break;

case INDEX_op_rcrb_user_T0_T1_cc: {
    extern void op_rcrb_user_T0_T1_cc();
extern char rclb_table;
extern char cc_table;
extern char __stb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_rcrb_user_T0_T1_cc+0), 223);
    *(uint32_t *)(gen_code_ptr + 11) = (long)(&rclb_table) + 0;
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&cc_table) + 0;
    *(uint32_t *)(gen_code_ptr + 138) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 138) + 0 -4;
    gen_code_ptr += 223;
}
break;

case INDEX_op_shlb_user_T0_T1_cc: {
    extern void op_shlb_user_T0_T1_cc();
extern char __stb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shlb_user_T0_T1_cc+0), 91);
    *(uint32_t *)(gen_code_ptr + 62) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 62) + 0 -4;
    gen_code_ptr += 91;
}
break;

case INDEX_op_shrb_user_T0_T1_cc: {
    extern void op_shrb_user_T0_T1_cc();
extern char __stb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shrb_user_T0_T1_cc+0), 96);
    *(uint32_t *)(gen_code_ptr + 67) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 67) + 0 -4;
    gen_code_ptr += 96;
}
break;

case INDEX_op_sarb_user_T0_T1_cc: {
    extern void op_sarb_user_T0_T1_cc();
extern char __stb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_sarb_user_T0_T1_cc+0), 89);
    *(uint32_t *)(gen_code_ptr + 60) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 60) + 0 -4;
    gen_code_ptr += 89;
}
break;

case INDEX_op_adcb_user_T0_T1_cc: {
    extern void op_adcb_user_T0_T1_cc();
extern char cc_table;
extern char __stb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_adcb_user_T0_T1_cc+0), 94);
    *(uint32_t *)(gen_code_ptr + 9) = (long)(&cc_table) + 4;
    *(uint32_t *)(gen_code_ptr + 62) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 62) + 0 -4;
    gen_code_ptr += 94;
}
break;

case INDEX_op_sbbb_user_T0_T1_cc: {
    extern void op_sbbb_user_T0_T1_cc();
extern char cc_table;
extern char __stb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_sbbb_user_T0_T1_cc+0), 96);
    *(uint32_t *)(gen_code_ptr + 9) = (long)(&cc_table) + 4;
    *(uint32_t *)(gen_code_ptr + 64) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 64) + 0 -4;
    gen_code_ptr += 96;
}
break;

case INDEX_op_cmpxchgb_user_T0_T1_EAX_cc: {
    extern void op_cmpxchgb_user_T0_T1_EAX_cc();
extern char __stb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpxchgb_user_T0_T1_EAX_cc+0), 95);
    *(uint32_t *)(gen_code_ptr + 62) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 62) + 0 -4;
    gen_code_ptr += 95;
}
break;

case INDEX_op_movl_T0_Dshiftb: {
    extern void op_movl_T0_Dshiftb();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T0_Dshiftb+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_outb_T0_T1: {
    extern void op_outb_T0_T1();
extern char cpu_outb;
    memcpy(gen_code_ptr, (void *)((char *)&op_outb_T0_T1+0), 29);
    *(uint32_t *)(gen_code_ptr + 22) = (long)(&cpu_outb) - (long)(gen_code_ptr + 22) + 0 -4;
    gen_code_ptr += 29;
}
break;

case INDEX_op_inb_T0_T1: {
    extern void op_inb_T0_T1();
extern char cpu_inb;
    memcpy(gen_code_ptr, (void *)((char *)&op_inb_T0_T1+0), 20);
    *(uint32_t *)(gen_code_ptr + 11) = (long)(&cpu_inb) - (long)(gen_code_ptr + 11) + 0 -4;
    gen_code_ptr += 20;
}
break;

case INDEX_op_inb_DX_T0: {
    extern void op_inb_DX_T0();
extern char cpu_inb;
    memcpy(gen_code_ptr, (void *)((char *)&op_inb_DX_T0+0), 24);
    *(uint32_t *)(gen_code_ptr + 15) = (long)(&cpu_inb) - (long)(gen_code_ptr + 15) + 0 -4;
    gen_code_ptr += 24;
}
break;

case INDEX_op_outb_DX_T0: {
    extern void op_outb_DX_T0();
extern char cpu_outb;
    memcpy(gen_code_ptr, (void *)((char *)&op_outb_DX_T0+0), 26);
    *(uint32_t *)(gen_code_ptr + 19) = (long)(&cpu_outb) - (long)(gen_code_ptr + 19) + 0 -4;
    gen_code_ptr += 26;
}
break;

case INDEX_op_check_iob_T0: {
    extern void op_check_iob_T0();
extern char check_iob_T0;
    memcpy(gen_code_ptr, (void *)((char *)&op_check_iob_T0+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&check_iob_T0) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_check_iob_DX: {
    extern void op_check_iob_DX();
extern char check_iob_DX;
    memcpy(gen_code_ptr, (void *)((char *)&op_check_iob_DX+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&check_iob_DX) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_jb_subw: {
    long param1;
    extern void op_jb_subw();
    memcpy(gen_code_ptr, (void *)((char *)&op_jb_subw+0), 19);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 15) = gen_labels[param1] - (long)(gen_code_ptr + 15) + 0 -4;
    gen_code_ptr += 19;
}
break;

case INDEX_op_jz_subw: {
    long param1;
    extern void op_jz_subw();
    memcpy(gen_code_ptr, (void *)((char *)&op_jz_subw+0), 12);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 8) = gen_labels[param1] - (long)(gen_code_ptr + 8) + 0 -4;
    gen_code_ptr += 12;
}
break;

case INDEX_op_jnz_subw: {
    long param1;
    extern void op_jnz_subw();
    memcpy(gen_code_ptr, (void *)((char *)&op_jnz_subw+0), 12);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 8) = gen_labels[param1] - (long)(gen_code_ptr + 8) + 0 -4;
    gen_code_ptr += 12;
}
break;

case INDEX_op_jbe_subw: {
    long param1;
    extern void op_jbe_subw();
    memcpy(gen_code_ptr, (void *)((char *)&op_jbe_subw+0), 19);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 15) = gen_labels[param1] - (long)(gen_code_ptr + 15) + 0 -4;
    gen_code_ptr += 19;
}
break;

case INDEX_op_js_subw: {
    long param1;
    extern void op_js_subw();
    memcpy(gen_code_ptr, (void *)((char *)&op_js_subw+0), 18);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 14) = gen_labels[param1] - (long)(gen_code_ptr + 14) + 0 -4;
    gen_code_ptr += 18;
}
break;

case INDEX_op_jl_subw: {
    long param1;
    extern void op_jl_subw();
    memcpy(gen_code_ptr, (void *)((char *)&op_jl_subw+0), 19);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 15) = gen_labels[param1] - (long)(gen_code_ptr + 15) + 0 -4;
    gen_code_ptr += 19;
}
break;

case INDEX_op_jle_subw: {
    long param1;
    extern void op_jle_subw();
    memcpy(gen_code_ptr, (void *)((char *)&op_jle_subw+0), 19);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 15) = gen_labels[param1] - (long)(gen_code_ptr + 15) + 0 -4;
    gen_code_ptr += 19;
}
break;

case INDEX_op_loopnzw: {
    long param1;
    extern void op_loopnzw();
    memcpy(gen_code_ptr, (void *)((char *)&op_loopnzw+0), 28);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 13) = gen_labels[param1] - (long)(gen_code_ptr + 13) + 0 -4;
    gen_code_ptr += 28;
}
break;

case INDEX_op_loopzw: {
    long param1;
    extern void op_loopzw();
    memcpy(gen_code_ptr, (void *)((char *)&op_loopzw+0), 31);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 13) = gen_labels[param1] - (long)(gen_code_ptr + 13) + 0 -4;
    gen_code_ptr += 31;
}
break;

case INDEX_op_jz_ecxw: {
    long param1;
    extern void op_jz_ecxw();
    memcpy(gen_code_ptr, (void *)((char *)&op_jz_ecxw+0), 12);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 8) = gen_labels[param1] - (long)(gen_code_ptr + 8) + 0 -4;
    gen_code_ptr += 12;
}
break;

case INDEX_op_jnz_ecxw: {
    long param1;
    extern void op_jnz_ecxw();
    memcpy(gen_code_ptr, (void *)((char *)&op_jnz_ecxw+0), 12);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 8) = gen_labels[param1] - (long)(gen_code_ptr + 8) + 0 -4;
    gen_code_ptr += 12;
}
break;

case INDEX_op_setb_T0_subw: {
    extern void op_setb_T0_subw();
    memcpy(gen_code_ptr, (void *)((char *)&op_setb_T0_subw+0), 17);
    gen_code_ptr += 17;
}
break;

case INDEX_op_setz_T0_subw: {
    extern void op_setz_T0_subw();
    memcpy(gen_code_ptr, (void *)((char *)&op_setz_T0_subw+0), 10);
    gen_code_ptr += 10;
}
break;

case INDEX_op_setbe_T0_subw: {
    extern void op_setbe_T0_subw();
    memcpy(gen_code_ptr, (void *)((char *)&op_setbe_T0_subw+0), 17);
    gen_code_ptr += 17;
}
break;

case INDEX_op_sets_T0_subw: {
    extern void op_sets_T0_subw();
    memcpy(gen_code_ptr, (void *)((char *)&op_sets_T0_subw+0), 11);
    gen_code_ptr += 11;
}
break;

case INDEX_op_setl_T0_subw: {
    extern void op_setl_T0_subw();
    memcpy(gen_code_ptr, (void *)((char *)&op_setl_T0_subw+0), 17);
    gen_code_ptr += 17;
}
break;

case INDEX_op_setle_T0_subw: {
    extern void op_setle_T0_subw();
    memcpy(gen_code_ptr, (void *)((char *)&op_setle_T0_subw+0), 17);
    gen_code_ptr += 17;
}
break;

case INDEX_op_shlw_T0_T1: {
    extern void op_shlw_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_shlw_T0_T1+0), 7);
    gen_code_ptr += 7;
}
break;

case INDEX_op_shrw_T0_T1: {
    extern void op_shrw_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_shrw_T0_T1+0), 13);
    gen_code_ptr += 13;
}
break;

case INDEX_op_sarw_T0_T1: {
    extern void op_sarw_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_sarw_T0_T1+0), 12);
    gen_code_ptr += 12;
}
break;

case INDEX_op_rolw_T0_T1_cc: {
    extern void op_rolw_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rolw_T0_T1_cc+0), 100);
    *(uint32_t *)(gen_code_ptr + 52) = (long)(&cc_table) + 0;
    gen_code_ptr += 100;
}
break;

case INDEX_op_rorw_T0_T1_cc: {
    extern void op_rorw_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rorw_T0_T1_cc+0), 111);
    *(uint32_t *)(gen_code_ptr + 52) = (long)(&cc_table) + 0;
    gen_code_ptr += 111;
}
break;

case INDEX_op_rolw_T0_T1: {
    extern void op_rolw_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_rolw_T0_T1+0), 43);
    gen_code_ptr += 43;
}
break;

case INDEX_op_rorw_T0_T1: {
    extern void op_rorw_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_rorw_T0_T1+0), 43);
    gen_code_ptr += 43;
}
break;

case INDEX_op_rclw_T0_T1_cc: {
    extern void op_rclw_T0_T1_cc();
extern char rclw_table;
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rclw_T0_T1_cc+0), 169);
    *(uint32_t *)(gen_code_ptr + 11) = (long)(&rclw_table) + 0;
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&cc_table) + 0;
    gen_code_ptr += 169;
}
break;

case INDEX_op_rcrw_T0_T1_cc: {
    extern void op_rcrw_T0_T1_cc();
extern char rclw_table;
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rcrw_T0_T1_cc+0), 175);
    *(uint32_t *)(gen_code_ptr + 11) = (long)(&rclw_table) + 0;
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&cc_table) + 0;
    gen_code_ptr += 175;
}
break;

case INDEX_op_shlw_T0_T1_cc: {
    extern void op_shlw_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shlw_T0_T1_cc+0), 32);
    gen_code_ptr += 32;
}
break;

case INDEX_op_shrw_T0_T1_cc: {
    extern void op_shrw_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shrw_T0_T1_cc+0), 37);
    gen_code_ptr += 37;
}
break;

case INDEX_op_sarw_T0_T1_cc: {
    extern void op_sarw_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_sarw_T0_T1_cc+0), 30);
    gen_code_ptr += 30;
}
break;

case INDEX_op_shldw_T0_T1_im_cc: {
    long param1;
    extern void op_shldw_T0_T1_im_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shldw_T0_T1_im_cc+0), 74);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 20) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 35) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 49) = param1 + -16;
    gen_code_ptr += 74;
}
break;

case INDEX_op_shldw_T0_T1_ECX_cc: {
    extern void op_shldw_T0_T1_ECX_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shldw_T0_T1_ECX_cc+0), 102);
    gen_code_ptr += 102;
}
break;

case INDEX_op_shrdw_T0_T1_im_cc: {
    long param1;
    extern void op_shrdw_T0_T1_im_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shrdw_T0_T1_im_cc+0), 66);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + -1;
    *(uint32_t *)(gen_code_ptr + 20) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 46) = param1 + 0;
    gen_code_ptr += 66;
}
break;

case INDEX_op_shrdw_T0_T1_ECX_cc: {
    extern void op_shrdw_T0_T1_ECX_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shrdw_T0_T1_ECX_cc+0), 98);
    gen_code_ptr += 98;
}
break;

case INDEX_op_adcw_T0_T1_cc: {
    extern void op_adcw_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_adcw_T0_T1_cc+0), 32);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 4;
    gen_code_ptr += 32;
}
break;

case INDEX_op_sbbw_T0_T1_cc: {
    extern void op_sbbw_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_sbbw_T0_T1_cc+0), 34);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 4;
    gen_code_ptr += 34;
}
break;

case INDEX_op_cmpxchgw_T0_T1_EAX_cc: {
    extern void op_cmpxchgw_T0_T1_EAX_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpxchgw_T0_T1_EAX_cc+0), 26);
    gen_code_ptr += 26;
}
break;

case INDEX_op_rolw_raw_T0_T1_cc: {
    extern void op_rolw_raw_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rolw_raw_T0_T1_cc+0), 112);
    *(uint32_t *)(gen_code_ptr + 55) = (long)(&cc_table) + 0;
    gen_code_ptr += 112;
}
break;

case INDEX_op_rorw_raw_T0_T1_cc: {
    extern void op_rorw_raw_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rorw_raw_T0_T1_cc+0), 111);
    *(uint32_t *)(gen_code_ptr + 55) = (long)(&cc_table) + 0;
    gen_code_ptr += 111;
}
break;

case INDEX_op_rolw_raw_T0_T1: {
    extern void op_rolw_raw_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_rolw_raw_T0_T1+0), 46);
    gen_code_ptr += 46;
}
break;

case INDEX_op_rorw_raw_T0_T1: {
    extern void op_rorw_raw_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_rorw_raw_T0_T1+0), 46);
    gen_code_ptr += 46;
}
break;

case INDEX_op_rclw_raw_T0_T1_cc: {
    extern void op_rclw_raw_T0_T1_cc();
extern char rclw_table;
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rclw_raw_T0_T1_cc+0), 179);
    *(uint32_t *)(gen_code_ptr + 11) = (long)(&rclw_table) + 0;
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&cc_table) + 0;
    gen_code_ptr += 179;
}
break;

case INDEX_op_rcrw_raw_T0_T1_cc: {
    extern void op_rcrw_raw_T0_T1_cc();
extern char rclw_table;
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rcrw_raw_T0_T1_cc+0), 175);
    *(uint32_t *)(gen_code_ptr + 11) = (long)(&rclw_table) + 0;
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&cc_table) + 0;
    gen_code_ptr += 175;
}
break;

case INDEX_op_shlw_raw_T0_T1_cc: {
    extern void op_shlw_raw_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shlw_raw_T0_T1_cc+0), 35);
    gen_code_ptr += 35;
}
break;

case INDEX_op_shrw_raw_T0_T1_cc: {
    extern void op_shrw_raw_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shrw_raw_T0_T1_cc+0), 40);
    gen_code_ptr += 40;
}
break;

case INDEX_op_sarw_raw_T0_T1_cc: {
    extern void op_sarw_raw_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_sarw_raw_T0_T1_cc+0), 33);
    gen_code_ptr += 33;
}
break;

case INDEX_op_shldw_raw_T0_T1_im_cc: {
    long param1;
    extern void op_shldw_raw_T0_T1_im_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shldw_raw_T0_T1_im_cc+0), 75);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 20) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 35) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 47) = param1 + -16;
    gen_code_ptr += 75;
}
break;

case INDEX_op_shldw_raw_T0_T1_ECX_cc: {
    extern void op_shldw_raw_T0_T1_ECX_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shldw_raw_T0_T1_ECX_cc+0), 105);
    gen_code_ptr += 105;
}
break;

case INDEX_op_shrdw_raw_T0_T1_im_cc: {
    long param1;
    extern void op_shrdw_raw_T0_T1_im_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shrdw_raw_T0_T1_im_cc+0), 69);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + -1;
    *(uint32_t *)(gen_code_ptr + 20) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 46) = param1 + 0;
    gen_code_ptr += 69;
}
break;

case INDEX_op_shrdw_raw_T0_T1_ECX_cc: {
    extern void op_shrdw_raw_T0_T1_ECX_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shrdw_raw_T0_T1_ECX_cc+0), 101);
    gen_code_ptr += 101;
}
break;

case INDEX_op_adcw_raw_T0_T1_cc: {
    extern void op_adcw_raw_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_adcw_raw_T0_T1_cc+0), 35);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 4;
    gen_code_ptr += 35;
}
break;

case INDEX_op_sbbw_raw_T0_T1_cc: {
    extern void op_sbbw_raw_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_sbbw_raw_T0_T1_cc+0), 37);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 4;
    gen_code_ptr += 37;
}
break;

case INDEX_op_cmpxchgw_raw_T0_T1_EAX_cc: {
    extern void op_cmpxchgw_raw_T0_T1_EAX_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpxchgw_raw_T0_T1_EAX_cc+0), 29);
    gen_code_ptr += 29;
}
break;

case INDEX_op_rolw_kernel_T0_T1_cc: {
    extern void op_rolw_kernel_T0_T1_cc();
extern char __stw_mmu;
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rolw_kernel_T0_T1_cc+0), 164);
    *(uint32_t *)(gen_code_ptr + 87) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 87) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 106) = (long)(&cc_table) + 0;
    gen_code_ptr += 164;
}
break;

case INDEX_op_rorw_kernel_T0_T1_cc: {
    extern void op_rorw_kernel_T0_T1_cc();
extern char __stw_mmu;
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rorw_kernel_T0_T1_cc+0), 159);
    *(uint32_t *)(gen_code_ptr + 87) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 87) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 106) = (long)(&cc_table) + 0;
    gen_code_ptr += 159;
}
break;

case INDEX_op_rolw_kernel_T0_T1: {
    extern void op_rolw_kernel_T0_T1();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_rolw_kernel_T0_T1+0), 84);
    *(uint32_t *)(gen_code_ptr + 71) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 71) + 0 -4;
    gen_code_ptr += 84;
}
break;

case INDEX_op_rorw_kernel_T0_T1: {
    extern void op_rorw_kernel_T0_T1();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_rorw_kernel_T0_T1+0), 84);
    *(uint32_t *)(gen_code_ptr + 71) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 71) + 0 -4;
    gen_code_ptr += 84;
}
break;

case INDEX_op_rclw_kernel_T0_T1_cc: {
    extern void op_rclw_kernel_T0_T1_cc();
extern char rclw_table;
extern char cc_table;
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_rclw_kernel_T0_T1_cc+0), 215);
    *(uint32_t *)(gen_code_ptr + 11) = (long)(&rclw_table) + 0;
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&cc_table) + 0;
    *(uint32_t *)(gen_code_ptr + 134) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 134) + 0 -4;
    gen_code_ptr += 215;
}
break;

case INDEX_op_rcrw_kernel_T0_T1_cc: {
    extern void op_rcrw_kernel_T0_T1_cc();
extern char rclw_table;
extern char cc_table;
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_rcrw_kernel_T0_T1_cc+0), 223);
    *(uint32_t *)(gen_code_ptr + 11) = (long)(&rclw_table) + 0;
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&cc_table) + 0;
    *(uint32_t *)(gen_code_ptr + 138) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 138) + 0 -4;
    gen_code_ptr += 223;
}
break;

case INDEX_op_shlw_kernel_T0_T1_cc: {
    extern void op_shlw_kernel_T0_T1_cc();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shlw_kernel_T0_T1_cc+0), 92);
    *(uint32_t *)(gen_code_ptr + 62) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 62) + 0 -4;
    gen_code_ptr += 92;
}
break;

case INDEX_op_shrw_kernel_T0_T1_cc: {
    extern void op_shrw_kernel_T0_T1_cc();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shrw_kernel_T0_T1_cc+0), 97);
    *(uint32_t *)(gen_code_ptr + 67) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 67) + 0 -4;
    gen_code_ptr += 97;
}
break;

case INDEX_op_sarw_kernel_T0_T1_cc: {
    extern void op_sarw_kernel_T0_T1_cc();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_sarw_kernel_T0_T1_cc+0), 90);
    *(uint32_t *)(gen_code_ptr + 60) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 60) + 0 -4;
    gen_code_ptr += 90;
}
break;

case INDEX_op_shldw_kernel_T0_T1_im_cc: {
    long param1;
    extern void op_shldw_kernel_T0_T1_im_cc();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shldw_kernel_T0_T1_im_cc+0), 122);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 20) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 35) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 47) = param1 + -16;
    *(uint32_t *)(gen_code_ptr + 99) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 99) + 0 -4;
    gen_code_ptr += 122;
}
break;

case INDEX_op_shldw_kernel_T0_T1_ECX_cc: {
    extern void op_shldw_kernel_T0_T1_ECX_cc();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shldw_kernel_T0_T1_ECX_cc+0), 156);
    *(uint32_t *)(gen_code_ptr + 123) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 123) + 0 -4;
    gen_code_ptr += 156;
}
break;

case INDEX_op_shrdw_kernel_T0_T1_im_cc: {
    long param1;
    extern void op_shrdw_kernel_T0_T1_im_cc();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shrdw_kernel_T0_T1_im_cc+0), 116);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + -1;
    *(uint32_t *)(gen_code_ptr + 20) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 46) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 93) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 93) + 0 -4;
    gen_code_ptr += 116;
}
break;

case INDEX_op_shrdw_kernel_T0_T1_ECX_cc: {
    extern void op_shrdw_kernel_T0_T1_ECX_cc();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shrdw_kernel_T0_T1_ECX_cc+0), 139);
    *(uint32_t *)(gen_code_ptr + 107) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 107) + 0 -4;
    gen_code_ptr += 139;
}
break;

case INDEX_op_adcw_kernel_T0_T1_cc: {
    extern void op_adcw_kernel_T0_T1_cc();
extern char cc_table;
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_adcw_kernel_T0_T1_cc+0), 95);
    *(uint32_t *)(gen_code_ptr + 9) = (long)(&cc_table) + 4;
    *(uint32_t *)(gen_code_ptr + 62) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 62) + 0 -4;
    gen_code_ptr += 95;
}
break;

case INDEX_op_sbbw_kernel_T0_T1_cc: {
    extern void op_sbbw_kernel_T0_T1_cc();
extern char cc_table;
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_sbbw_kernel_T0_T1_cc+0), 97);
    *(uint32_t *)(gen_code_ptr + 9) = (long)(&cc_table) + 4;
    *(uint32_t *)(gen_code_ptr + 64) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 64) + 0 -4;
    gen_code_ptr += 97;
}
break;

case INDEX_op_cmpxchgw_kernel_T0_T1_EAX_cc: {
    extern void op_cmpxchgw_kernel_T0_T1_EAX_cc();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpxchgw_kernel_T0_T1_EAX_cc+0), 94);
    *(uint32_t *)(gen_code_ptr + 59) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 59) + 0 -4;
    gen_code_ptr += 94;
}
break;

case INDEX_op_rolw_user_T0_T1_cc: {
    extern void op_rolw_user_T0_T1_cc();
extern char __stw_mmu;
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rolw_user_T0_T1_cc+0), 153);
    *(uint32_t *)(gen_code_ptr + 87) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 87) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 106) = (long)(&cc_table) + 0;
    gen_code_ptr += 153;
}
break;

case INDEX_op_rorw_user_T0_T1_cc: {
    extern void op_rorw_user_T0_T1_cc();
extern char __stw_mmu;
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rorw_user_T0_T1_cc+0), 159);
    *(uint32_t *)(gen_code_ptr + 87) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 87) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 106) = (long)(&cc_table) + 0;
    gen_code_ptr += 159;
}
break;

case INDEX_op_rolw_user_T0_T1: {
    extern void op_rolw_user_T0_T1();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_rolw_user_T0_T1+0), 84);
    *(uint32_t *)(gen_code_ptr + 71) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 71) + 0 -4;
    gen_code_ptr += 84;
}
break;

case INDEX_op_rorw_user_T0_T1: {
    extern void op_rorw_user_T0_T1();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_rorw_user_T0_T1+0), 84);
    *(uint32_t *)(gen_code_ptr + 71) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 71) + 0 -4;
    gen_code_ptr += 84;
}
break;

case INDEX_op_rclw_user_T0_T1_cc: {
    extern void op_rclw_user_T0_T1_cc();
extern char rclw_table;
extern char cc_table;
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_rclw_user_T0_T1_cc+0), 215);
    *(uint32_t *)(gen_code_ptr + 11) = (long)(&rclw_table) + 0;
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&cc_table) + 0;
    *(uint32_t *)(gen_code_ptr + 134) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 134) + 0 -4;
    gen_code_ptr += 215;
}
break;

case INDEX_op_rcrw_user_T0_T1_cc: {
    extern void op_rcrw_user_T0_T1_cc();
extern char rclw_table;
extern char cc_table;
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_rcrw_user_T0_T1_cc+0), 223);
    *(uint32_t *)(gen_code_ptr + 11) = (long)(&rclw_table) + 0;
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&cc_table) + 0;
    *(uint32_t *)(gen_code_ptr + 138) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 138) + 0 -4;
    gen_code_ptr += 223;
}
break;

case INDEX_op_shlw_user_T0_T1_cc: {
    extern void op_shlw_user_T0_T1_cc();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shlw_user_T0_T1_cc+0), 92);
    *(uint32_t *)(gen_code_ptr + 62) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 62) + 0 -4;
    gen_code_ptr += 92;
}
break;

case INDEX_op_shrw_user_T0_T1_cc: {
    extern void op_shrw_user_T0_T1_cc();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shrw_user_T0_T1_cc+0), 97);
    *(uint32_t *)(gen_code_ptr + 67) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 67) + 0 -4;
    gen_code_ptr += 97;
}
break;

case INDEX_op_sarw_user_T0_T1_cc: {
    extern void op_sarw_user_T0_T1_cc();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_sarw_user_T0_T1_cc+0), 90);
    *(uint32_t *)(gen_code_ptr + 60) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 60) + 0 -4;
    gen_code_ptr += 90;
}
break;

case INDEX_op_shldw_user_T0_T1_im_cc: {
    long param1;
    extern void op_shldw_user_T0_T1_im_cc();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shldw_user_T0_T1_im_cc+0), 122);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 20) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 35) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 47) = param1 + -16;
    *(uint32_t *)(gen_code_ptr + 99) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 99) + 0 -4;
    gen_code_ptr += 122;
}
break;

case INDEX_op_shldw_user_T0_T1_ECX_cc: {
    extern void op_shldw_user_T0_T1_ECX_cc();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shldw_user_T0_T1_ECX_cc+0), 156);
    *(uint32_t *)(gen_code_ptr + 123) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 123) + 0 -4;
    gen_code_ptr += 156;
}
break;

case INDEX_op_shrdw_user_T0_T1_im_cc: {
    long param1;
    extern void op_shrdw_user_T0_T1_im_cc();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shrdw_user_T0_T1_im_cc+0), 116);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + -1;
    *(uint32_t *)(gen_code_ptr + 20) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 46) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 93) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 93) + 0 -4;
    gen_code_ptr += 116;
}
break;

case INDEX_op_shrdw_user_T0_T1_ECX_cc: {
    extern void op_shrdw_user_T0_T1_ECX_cc();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shrdw_user_T0_T1_ECX_cc+0), 139);
    *(uint32_t *)(gen_code_ptr + 107) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 107) + 0 -4;
    gen_code_ptr += 139;
}
break;

case INDEX_op_adcw_user_T0_T1_cc: {
    extern void op_adcw_user_T0_T1_cc();
extern char cc_table;
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_adcw_user_T0_T1_cc+0), 95);
    *(uint32_t *)(gen_code_ptr + 9) = (long)(&cc_table) + 4;
    *(uint32_t *)(gen_code_ptr + 62) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 62) + 0 -4;
    gen_code_ptr += 95;
}
break;

case INDEX_op_sbbw_user_T0_T1_cc: {
    extern void op_sbbw_user_T0_T1_cc();
extern char cc_table;
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_sbbw_user_T0_T1_cc+0), 97);
    *(uint32_t *)(gen_code_ptr + 9) = (long)(&cc_table) + 4;
    *(uint32_t *)(gen_code_ptr + 64) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 64) + 0 -4;
    gen_code_ptr += 97;
}
break;

case INDEX_op_cmpxchgw_user_T0_T1_EAX_cc: {
    extern void op_cmpxchgw_user_T0_T1_EAX_cc();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpxchgw_user_T0_T1_EAX_cc+0), 94);
    *(uint32_t *)(gen_code_ptr + 59) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 59) + 0 -4;
    gen_code_ptr += 94;
}
break;

case INDEX_op_btw_T0_T1_cc: {
    extern void op_btw_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_btw_T0_T1_cc+0), 12);
    gen_code_ptr += 12;
}
break;

case INDEX_op_btsw_T0_T1_cc: {
    extern void op_btsw_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_btsw_T0_T1_cc+0), 18);
    gen_code_ptr += 18;
}
break;

case INDEX_op_btrw_T0_T1_cc: {
    extern void op_btrw_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_btrw_T0_T1_cc+0), 18);
    gen_code_ptr += 18;
}
break;

case INDEX_op_btcw_T0_T1_cc: {
    extern void op_btcw_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_btcw_T0_T1_cc+0), 18);
    gen_code_ptr += 18;
}
break;

case INDEX_op_add_bitw_A0_T1: {
    extern void op_add_bitw_A0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_add_bitw_A0_T1+0), 9);
    gen_code_ptr += 9;
}
break;

case INDEX_op_bsfw_T0_cc: {
    extern void op_bsfw_T0_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_bsfw_T0_cc+0), 49);
    gen_code_ptr += 49;
}
break;

case INDEX_op_bsrw_T0_cc: {
    extern void op_bsrw_T0_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_bsrw_T0_cc+0), 71);
    gen_code_ptr += 71;
}
break;

case INDEX_op_movl_T0_Dshiftw: {
    extern void op_movl_T0_Dshiftw();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T0_Dshiftw+0), 6);
    gen_code_ptr += 6;
}
break;

case INDEX_op_outw_T0_T1: {
    extern void op_outw_T0_T1();
extern char cpu_outw;
    memcpy(gen_code_ptr, (void *)((char *)&op_outw_T0_T1+0), 29);
    *(uint32_t *)(gen_code_ptr + 22) = (long)(&cpu_outw) - (long)(gen_code_ptr + 22) + 0 -4;
    gen_code_ptr += 29;
}
break;

case INDEX_op_inw_T0_T1: {
    extern void op_inw_T0_T1();
extern char cpu_inw;
    memcpy(gen_code_ptr, (void *)((char *)&op_inw_T0_T1+0), 20);
    *(uint32_t *)(gen_code_ptr + 11) = (long)(&cpu_inw) - (long)(gen_code_ptr + 11) + 0 -4;
    gen_code_ptr += 20;
}
break;

case INDEX_op_inw_DX_T0: {
    extern void op_inw_DX_T0();
extern char cpu_inw;
    memcpy(gen_code_ptr, (void *)((char *)&op_inw_DX_T0+0), 24);
    *(uint32_t *)(gen_code_ptr + 15) = (long)(&cpu_inw) - (long)(gen_code_ptr + 15) + 0 -4;
    gen_code_ptr += 24;
}
break;

case INDEX_op_outw_DX_T0: {
    extern void op_outw_DX_T0();
extern char cpu_outw;
    memcpy(gen_code_ptr, (void *)((char *)&op_outw_DX_T0+0), 26);
    *(uint32_t *)(gen_code_ptr + 19) = (long)(&cpu_outw) - (long)(gen_code_ptr + 19) + 0 -4;
    gen_code_ptr += 26;
}
break;

case INDEX_op_check_iow_T0: {
    extern void op_check_iow_T0();
extern char check_iow_T0;
    memcpy(gen_code_ptr, (void *)((char *)&op_check_iow_T0+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&check_iow_T0) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_check_iow_DX: {
    extern void op_check_iow_DX();
extern char check_iow_DX;
    memcpy(gen_code_ptr, (void *)((char *)&op_check_iow_DX+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&check_iow_DX) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_jb_subl: {
    long param1;
    extern void op_jb_subl();
    memcpy(gen_code_ptr, (void *)((char *)&op_jb_subl+0), 18);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 14) = gen_labels[param1] - (long)(gen_code_ptr + 14) + 0 -4;
    gen_code_ptr += 18;
}
break;

case INDEX_op_jz_subl: {
    long param1;
    extern void op_jz_subl();
    memcpy(gen_code_ptr, (void *)((char *)&op_jz_subl+0), 12);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 8) = gen_labels[param1] - (long)(gen_code_ptr + 8) + 0 -4;
    gen_code_ptr += 12;
}
break;

case INDEX_op_jnz_subl: {
    long param1;
    extern void op_jnz_subl();
    memcpy(gen_code_ptr, (void *)((char *)&op_jnz_subl+0), 12);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 8) = gen_labels[param1] - (long)(gen_code_ptr + 8) + 0 -4;
    gen_code_ptr += 12;
}
break;

case INDEX_op_jbe_subl: {
    long param1;
    extern void op_jbe_subl();
    memcpy(gen_code_ptr, (void *)((char *)&op_jbe_subl+0), 18);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 14) = gen_labels[param1] - (long)(gen_code_ptr + 14) + 0 -4;
    gen_code_ptr += 18;
}
break;

case INDEX_op_js_subl: {
    long param1;
    extern void op_js_subl();
    memcpy(gen_code_ptr, (void *)((char *)&op_js_subl+0), 18);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 8) = gen_labels[param1] - (long)(gen_code_ptr + 8) + 0 -4;
    gen_code_ptr += 18;
}
break;

case INDEX_op_jl_subl: {
    long param1;
    extern void op_jl_subl();
    memcpy(gen_code_ptr, (void *)((char *)&op_jl_subl+0), 18);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 14) = gen_labels[param1] - (long)(gen_code_ptr + 14) + 0 -4;
    gen_code_ptr += 18;
}
break;

case INDEX_op_jle_subl: {
    long param1;
    extern void op_jle_subl();
    memcpy(gen_code_ptr, (void *)((char *)&op_jle_subl+0), 18);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 14) = gen_labels[param1] - (long)(gen_code_ptr + 14) + 0 -4;
    gen_code_ptr += 18;
}
break;

case INDEX_op_loopnzl: {
    long param1;
    extern void op_loopnzl();
    memcpy(gen_code_ptr, (void *)((char *)&op_loopnzl+0), 25);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 13) = gen_labels[param1] - (long)(gen_code_ptr + 13) + 0 -4;
    gen_code_ptr += 25;
}
break;

case INDEX_op_loopzl: {
    long param1;
    extern void op_loopzl();
    memcpy(gen_code_ptr, (void *)((char *)&op_loopzl+0), 31);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 13) = gen_labels[param1] - (long)(gen_code_ptr + 13) + 0 -4;
    gen_code_ptr += 31;
}
break;

case INDEX_op_jz_ecxl: {
    long param1;
    extern void op_jz_ecxl();
    memcpy(gen_code_ptr, (void *)((char *)&op_jz_ecxl+0), 12);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 8) = gen_labels[param1] - (long)(gen_code_ptr + 8) + 0 -4;
    gen_code_ptr += 12;
}
break;

case INDEX_op_jnz_ecxl: {
    long param1;
    extern void op_jnz_ecxl();
    memcpy(gen_code_ptr, (void *)((char *)&op_jnz_ecxl+0), 12);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 8) = gen_labels[param1] - (long)(gen_code_ptr + 8) + 0 -4;
    gen_code_ptr += 12;
}
break;

case INDEX_op_setb_T0_subl: {
    extern void op_setb_T0_subl();
    memcpy(gen_code_ptr, (void *)((char *)&op_setb_T0_subl+0), 16);
    gen_code_ptr += 16;
}
break;

case INDEX_op_setz_T0_subl: {
    extern void op_setz_T0_subl();
    memcpy(gen_code_ptr, (void *)((char *)&op_setz_T0_subl+0), 9);
    gen_code_ptr += 9;
}
break;

case INDEX_op_setbe_T0_subl: {
    extern void op_setbe_T0_subl();
    memcpy(gen_code_ptr, (void *)((char *)&op_setbe_T0_subl+0), 16);
    gen_code_ptr += 16;
}
break;

case INDEX_op_sets_T0_subl: {
    extern void op_sets_T0_subl();
    memcpy(gen_code_ptr, (void *)((char *)&op_sets_T0_subl+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_setl_T0_subl: {
    extern void op_setl_T0_subl();
    memcpy(gen_code_ptr, (void *)((char *)&op_setl_T0_subl+0), 16);
    gen_code_ptr += 16;
}
break;

case INDEX_op_setle_T0_subl: {
    extern void op_setle_T0_subl();
    memcpy(gen_code_ptr, (void *)((char *)&op_setle_T0_subl+0), 16);
    gen_code_ptr += 16;
}
break;

case INDEX_op_shll_T0_T1: {
    extern void op_shll_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_shll_T0_T1+0), 7);
    gen_code_ptr += 7;
}
break;

case INDEX_op_shrl_T0_T1: {
    extern void op_shrl_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_shrl_T0_T1+0), 7);
    gen_code_ptr += 7;
}
break;

case INDEX_op_sarl_T0_T1: {
    extern void op_sarl_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_sarl_T0_T1+0), 7);
    gen_code_ptr += 7;
}
break;

case INDEX_op_roll_T0_T1_cc: {
    extern void op_roll_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_roll_T0_T1_cc+0), 87);
    *(uint32_t *)(gen_code_ptr + 27) = (long)(&cc_table) + 0;
    gen_code_ptr += 87;
}
break;

case INDEX_op_rorl_T0_T1_cc: {
    extern void op_rorl_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rorl_T0_T1_cc+0), 79);
    *(uint32_t *)(gen_code_ptr + 27) = (long)(&cc_table) + 0;
    gen_code_ptr += 79;
}
break;

case INDEX_op_roll_T0_T1: {
    extern void op_roll_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_roll_T0_T1+0), 9);
    gen_code_ptr += 9;
}
break;

case INDEX_op_rorl_T0_T1: {
    extern void op_rorl_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_rorl_T0_T1+0), 9);
    gen_code_ptr += 9;
}
break;

case INDEX_op_rcll_T0_T1_cc: {
    extern void op_rcll_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rcll_T0_T1_cc+0), 157);
    *(uint32_t *)(gen_code_ptr + 24) = (long)(&cc_table) + 0;
    gen_code_ptr += 157;
}
break;

case INDEX_op_rcrl_T0_T1_cc: {
    extern void op_rcrl_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rcrl_T0_T1_cc+0), 159);
    *(uint32_t *)(gen_code_ptr + 24) = (long)(&cc_table) + 0;
    gen_code_ptr += 159;
}
break;

case INDEX_op_shll_T0_T1_cc: {
    extern void op_shll_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shll_T0_T1_cc+0), 31);
    gen_code_ptr += 31;
}
break;

case INDEX_op_shrl_T0_T1_cc: {
    extern void op_shrl_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shrl_T0_T1_cc+0), 31);
    gen_code_ptr += 31;
}
break;

case INDEX_op_sarl_T0_T1_cc: {
    extern void op_sarl_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_sarl_T0_T1_cc+0), 27);
    gen_code_ptr += 27;
}
break;

case INDEX_op_shldl_T0_T1_im_cc: {
    long param1;
    extern void op_shldl_T0_T1_im_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shldl_T0_T1_im_cc+0), 43);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 1) = param1 + -1;
    *(uint32_t *)(gen_code_ptr + 13) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 28) = param1 + 0;
    gen_code_ptr += 43;
}
break;

case INDEX_op_shldl_T0_T1_ECX_cc: {
    extern void op_shldl_T0_T1_ECX_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shldl_T0_T1_ECX_cc+0), 72);
    gen_code_ptr += 72;
}
break;

case INDEX_op_shrdl_T0_T1_im_cc: {
    long param1;
    extern void op_shrdl_T0_T1_im_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shrdl_T0_T1_im_cc+0), 43);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 1) = param1 + -1;
    *(uint32_t *)(gen_code_ptr + 13) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 28) = param1 + 0;
    gen_code_ptr += 43;
}
break;

case INDEX_op_shrdl_T0_T1_ECX_cc: {
    extern void op_shrdl_T0_T1_ECX_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shrdl_T0_T1_ECX_cc+0), 72);
    gen_code_ptr += 72;
}
break;

case INDEX_op_adcl_T0_T1_cc: {
    extern void op_adcl_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_adcl_T0_T1_cc+0), 32);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 4;
    gen_code_ptr += 32;
}
break;

case INDEX_op_sbbl_T0_T1_cc: {
    extern void op_sbbl_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_sbbl_T0_T1_cc+0), 34);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 4;
    gen_code_ptr += 34;
}
break;

case INDEX_op_cmpxchgl_T0_T1_EAX_cc: {
    extern void op_cmpxchgl_T0_T1_EAX_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpxchgl_T0_T1_EAX_cc+0), 22);
    gen_code_ptr += 22;
}
break;

case INDEX_op_roll_raw_T0_T1_cc: {
    extern void op_roll_raw_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_roll_raw_T0_T1_cc+0), 76);
    *(uint32_t *)(gen_code_ptr + 29) = (long)(&cc_table) + 0;
    gen_code_ptr += 76;
}
break;

case INDEX_op_rorl_raw_T0_T1_cc: {
    extern void op_rorl_raw_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rorl_raw_T0_T1_cc+0), 79);
    *(uint32_t *)(gen_code_ptr + 29) = (long)(&cc_table) + 0;
    gen_code_ptr += 79;
}
break;

case INDEX_op_roll_raw_T0_T1: {
    extern void op_roll_raw_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_roll_raw_T0_T1+0), 11);
    gen_code_ptr += 11;
}
break;

case INDEX_op_rorl_raw_T0_T1: {
    extern void op_rorl_raw_T0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_rorl_raw_T0_T1+0), 11);
    gen_code_ptr += 11;
}
break;

case INDEX_op_rcll_raw_T0_T1_cc: {
    extern void op_rcll_raw_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rcll_raw_T0_T1_cc+0), 153);
    *(uint32_t *)(gen_code_ptr + 24) = (long)(&cc_table) + 0;
    gen_code_ptr += 153;
}
break;

case INDEX_op_rcrl_raw_T0_T1_cc: {
    extern void op_rcrl_raw_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rcrl_raw_T0_T1_cc+0), 159);
    *(uint32_t *)(gen_code_ptr + 24) = (long)(&cc_table) + 0;
    gen_code_ptr += 159;
}
break;

case INDEX_op_shll_raw_T0_T1_cc: {
    extern void op_shll_raw_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shll_raw_T0_T1_cc+0), 33);
    gen_code_ptr += 33;
}
break;

case INDEX_op_shrl_raw_T0_T1_cc: {
    extern void op_shrl_raw_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shrl_raw_T0_T1_cc+0), 33);
    gen_code_ptr += 33;
}
break;

case INDEX_op_sarl_raw_T0_T1_cc: {
    extern void op_sarl_raw_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_sarl_raw_T0_T1_cc+0), 29);
    gen_code_ptr += 29;
}
break;

case INDEX_op_shldl_raw_T0_T1_im_cc: {
    long param1;
    extern void op_shldl_raw_T0_T1_im_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shldl_raw_T0_T1_im_cc+0), 55);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 1) = param1 + -1;
    *(uint32_t *)(gen_code_ptr + 12) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 31) = param1 + 0;
    gen_code_ptr += 55;
}
break;

case INDEX_op_shldl_raw_T0_T1_ECX_cc: {
    extern void op_shldl_raw_T0_T1_ECX_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shldl_raw_T0_T1_ECX_cc+0), 82);
    gen_code_ptr += 82;
}
break;

case INDEX_op_shrdl_raw_T0_T1_im_cc: {
    long param1;
    extern void op_shrdl_raw_T0_T1_im_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shrdl_raw_T0_T1_im_cc+0), 55);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 1) = param1 + -1;
    *(uint32_t *)(gen_code_ptr + 12) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 31) = param1 + 0;
    gen_code_ptr += 55;
}
break;

case INDEX_op_shrdl_raw_T0_T1_ECX_cc: {
    extern void op_shrdl_raw_T0_T1_ECX_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_shrdl_raw_T0_T1_ECX_cc+0), 82);
    gen_code_ptr += 82;
}
break;

case INDEX_op_adcl_raw_T0_T1_cc: {
    extern void op_adcl_raw_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_adcl_raw_T0_T1_cc+0), 34);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 4;
    gen_code_ptr += 34;
}
break;

case INDEX_op_sbbl_raw_T0_T1_cc: {
    extern void op_sbbl_raw_T0_T1_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_sbbl_raw_T0_T1_cc+0), 36);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 4;
    gen_code_ptr += 36;
}
break;

case INDEX_op_cmpxchgl_raw_T0_T1_EAX_cc: {
    extern void op_cmpxchgl_raw_T0_T1_EAX_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpxchgl_raw_T0_T1_EAX_cc+0), 24);
    gen_code_ptr += 24;
}
break;

case INDEX_op_roll_kernel_T0_T1_cc: {
    extern void op_roll_kernel_T0_T1_cc();
extern char __stl_mmu;
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_roll_kernel_T0_T1_cc+0), 132);
    *(uint32_t *)(gen_code_ptr + 57) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 57) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 75) = (long)(&cc_table) + 0;
    gen_code_ptr += 132;
}
break;

case INDEX_op_rorl_kernel_T0_T1_cc: {
    extern void op_rorl_kernel_T0_T1_cc();
extern char __stl_mmu;
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rorl_kernel_T0_T1_cc+0), 127);
    *(uint32_t *)(gen_code_ptr + 57) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 57) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 75) = (long)(&cc_table) + 0;
    gen_code_ptr += 127;
}
break;

case INDEX_op_roll_kernel_T0_T1: {
    extern void op_roll_kernel_T0_T1();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_roll_kernel_T0_T1+0), 57);
    *(uint32_t *)(gen_code_ptr + 45) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 45) + 0 -4;
    gen_code_ptr += 57;
}
break;

case INDEX_op_rorl_kernel_T0_T1: {
    extern void op_rorl_kernel_T0_T1();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_rorl_kernel_T0_T1+0), 57);
    *(uint32_t *)(gen_code_ptr + 45) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 45) + 0 -4;
    gen_code_ptr += 57;
}
break;

case INDEX_op_rcll_kernel_T0_T1_cc: {
    extern void op_rcll_kernel_T0_T1_cc();
extern char cc_table;
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_rcll_kernel_T0_T1_cc+0), 205);
    *(uint32_t *)(gen_code_ptr + 24) = (long)(&cc_table) + 0;
    *(uint32_t *)(gen_code_ptr + 118) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 118) + 0 -4;
    gen_code_ptr += 205;
}
break;

case INDEX_op_rcrl_kernel_T0_T1_cc: {
    extern void op_rcrl_kernel_T0_T1_cc();
extern char cc_table;
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_rcrl_kernel_T0_T1_cc+0), 207);
    *(uint32_t *)(gen_code_ptr + 24) = (long)(&cc_table) + 0;
    *(uint32_t *)(gen_code_ptr + 122) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 122) + 0 -4;
    gen_code_ptr += 207;
}
break;

case INDEX_op_shll_kernel_T0_T1_cc: {
    extern void op_shll_kernel_T0_T1_cc();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shll_kernel_T0_T1_cc+0), 89);
    *(uint32_t *)(gen_code_ptr + 60) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 60) + 0 -4;
    gen_code_ptr += 89;
}
break;

case INDEX_op_shrl_kernel_T0_T1_cc: {
    extern void op_shrl_kernel_T0_T1_cc();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shrl_kernel_T0_T1_cc+0), 89);
    *(uint32_t *)(gen_code_ptr + 60) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 60) + 0 -4;
    gen_code_ptr += 89;
}
break;

case INDEX_op_sarl_kernel_T0_T1_cc: {
    extern void op_sarl_kernel_T0_T1_cc();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_sarl_kernel_T0_T1_cc+0), 84);
    *(uint32_t *)(gen_code_ptr + 55) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 55) + 0 -4;
    gen_code_ptr += 84;
}
break;

case INDEX_op_shldl_kernel_T0_T1_im_cc: {
    long param1;
    extern void op_shldl_kernel_T0_T1_im_cc();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shldl_kernel_T0_T1_im_cc+0), 101);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 1) = param1 + -1;
    *(uint32_t *)(gen_code_ptr + 12) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 28) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 79) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 79) + 0 -4;
    gen_code_ptr += 101;
}
break;

case INDEX_op_shldl_kernel_T0_T1_ECX_cc: {
    extern void op_shldl_kernel_T0_T1_ECX_cc();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shldl_kernel_T0_T1_ECX_cc+0), 107);
    *(uint32_t *)(gen_code_ptr + 78) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 78) + 0 -4;
    gen_code_ptr += 107;
}
break;

case INDEX_op_shrdl_kernel_T0_T1_im_cc: {
    long param1;
    extern void op_shrdl_kernel_T0_T1_im_cc();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shrdl_kernel_T0_T1_im_cc+0), 101);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 1) = param1 + -1;
    *(uint32_t *)(gen_code_ptr + 12) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 28) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 79) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 79) + 0 -4;
    gen_code_ptr += 101;
}
break;

case INDEX_op_shrdl_kernel_T0_T1_ECX_cc: {
    extern void op_shrdl_kernel_T0_T1_ECX_cc();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shrdl_kernel_T0_T1_ECX_cc+0), 107);
    *(uint32_t *)(gen_code_ptr + 78) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 78) + 0 -4;
    gen_code_ptr += 107;
}
break;

case INDEX_op_adcl_kernel_T0_T1_cc: {
    extern void op_adcl_kernel_T0_T1_cc();
extern char cc_table;
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_adcl_kernel_T0_T1_cc+0), 93);
    *(uint32_t *)(gen_code_ptr + 9) = (long)(&cc_table) + 4;
    *(uint32_t *)(gen_code_ptr + 61) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 61) + 0 -4;
    gen_code_ptr += 93;
}
break;

case INDEX_op_sbbl_kernel_T0_T1_cc: {
    extern void op_sbbl_kernel_T0_T1_cc();
extern char cc_table;
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_sbbl_kernel_T0_T1_cc+0), 95);
    *(uint32_t *)(gen_code_ptr + 9) = (long)(&cc_table) + 4;
    *(uint32_t *)(gen_code_ptr + 63) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 63) + 0 -4;
    gen_code_ptr += 95;
}
break;

case INDEX_op_cmpxchgl_kernel_T0_T1_EAX_cc: {
    extern void op_cmpxchgl_kernel_T0_T1_EAX_cc();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpxchgl_kernel_T0_T1_EAX_cc+0), 88);
    *(uint32_t *)(gen_code_ptr + 55) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 55) + 0 -4;
    gen_code_ptr += 88;
}
break;

case INDEX_op_roll_user_T0_T1_cc: {
    extern void op_roll_user_T0_T1_cc();
extern char __stl_mmu;
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_roll_user_T0_T1_cc+0), 137);
    *(uint32_t *)(gen_code_ptr + 57) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 57) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 75) = (long)(&cc_table) + 0;
    gen_code_ptr += 137;
}
break;

case INDEX_op_rorl_user_T0_T1_cc: {
    extern void op_rorl_user_T0_T1_cc();
extern char __stl_mmu;
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_rorl_user_T0_T1_cc+0), 127);
    *(uint32_t *)(gen_code_ptr + 57) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 57) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 75) = (long)(&cc_table) + 0;
    gen_code_ptr += 127;
}
break;

case INDEX_op_roll_user_T0_T1: {
    extern void op_roll_user_T0_T1();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_roll_user_T0_T1+0), 57);
    *(uint32_t *)(gen_code_ptr + 45) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 45) + 0 -4;
    gen_code_ptr += 57;
}
break;

case INDEX_op_rorl_user_T0_T1: {
    extern void op_rorl_user_T0_T1();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_rorl_user_T0_T1+0), 57);
    *(uint32_t *)(gen_code_ptr + 45) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 45) + 0 -4;
    gen_code_ptr += 57;
}
break;

case INDEX_op_rcll_user_T0_T1_cc: {
    extern void op_rcll_user_T0_T1_cc();
extern char cc_table;
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_rcll_user_T0_T1_cc+0), 205);
    *(uint32_t *)(gen_code_ptr + 24) = (long)(&cc_table) + 0;
    *(uint32_t *)(gen_code_ptr + 118) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 118) + 0 -4;
    gen_code_ptr += 205;
}
break;

case INDEX_op_rcrl_user_T0_T1_cc: {
    extern void op_rcrl_user_T0_T1_cc();
extern char cc_table;
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_rcrl_user_T0_T1_cc+0), 207);
    *(uint32_t *)(gen_code_ptr + 24) = (long)(&cc_table) + 0;
    *(uint32_t *)(gen_code_ptr + 122) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 122) + 0 -4;
    gen_code_ptr += 207;
}
break;

case INDEX_op_shll_user_T0_T1_cc: {
    extern void op_shll_user_T0_T1_cc();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shll_user_T0_T1_cc+0), 89);
    *(uint32_t *)(gen_code_ptr + 60) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 60) + 0 -4;
    gen_code_ptr += 89;
}
break;

case INDEX_op_shrl_user_T0_T1_cc: {
    extern void op_shrl_user_T0_T1_cc();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shrl_user_T0_T1_cc+0), 89);
    *(uint32_t *)(gen_code_ptr + 60) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 60) + 0 -4;
    gen_code_ptr += 89;
}
break;

case INDEX_op_sarl_user_T0_T1_cc: {
    extern void op_sarl_user_T0_T1_cc();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_sarl_user_T0_T1_cc+0), 84);
    *(uint32_t *)(gen_code_ptr + 55) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 55) + 0 -4;
    gen_code_ptr += 84;
}
break;

case INDEX_op_shldl_user_T0_T1_im_cc: {
    long param1;
    extern void op_shldl_user_T0_T1_im_cc();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shldl_user_T0_T1_im_cc+0), 101);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 1) = param1 + -1;
    *(uint32_t *)(gen_code_ptr + 12) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 28) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 79) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 79) + 0 -4;
    gen_code_ptr += 101;
}
break;

case INDEX_op_shldl_user_T0_T1_ECX_cc: {
    extern void op_shldl_user_T0_T1_ECX_cc();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shldl_user_T0_T1_ECX_cc+0), 107);
    *(uint32_t *)(gen_code_ptr + 78) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 78) + 0 -4;
    gen_code_ptr += 107;
}
break;

case INDEX_op_shrdl_user_T0_T1_im_cc: {
    long param1;
    extern void op_shrdl_user_T0_T1_im_cc();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shrdl_user_T0_T1_im_cc+0), 101);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 1) = param1 + -1;
    *(uint32_t *)(gen_code_ptr + 12) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 28) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 79) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 79) + 0 -4;
    gen_code_ptr += 101;
}
break;

case INDEX_op_shrdl_user_T0_T1_ECX_cc: {
    extern void op_shrdl_user_T0_T1_ECX_cc();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_shrdl_user_T0_T1_ECX_cc+0), 107);
    *(uint32_t *)(gen_code_ptr + 78) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 78) + 0 -4;
    gen_code_ptr += 107;
}
break;

case INDEX_op_adcl_user_T0_T1_cc: {
    extern void op_adcl_user_T0_T1_cc();
extern char cc_table;
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_adcl_user_T0_T1_cc+0), 93);
    *(uint32_t *)(gen_code_ptr + 9) = (long)(&cc_table) + 4;
    *(uint32_t *)(gen_code_ptr + 61) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 61) + 0 -4;
    gen_code_ptr += 93;
}
break;

case INDEX_op_sbbl_user_T0_T1_cc: {
    extern void op_sbbl_user_T0_T1_cc();
extern char cc_table;
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_sbbl_user_T0_T1_cc+0), 95);
    *(uint32_t *)(gen_code_ptr + 9) = (long)(&cc_table) + 4;
    *(uint32_t *)(gen_code_ptr + 63) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 63) + 0 -4;
    gen_code_ptr += 95;
}
break;

case INDEX_op_cmpxchgl_user_T0_T1_EAX_cc: {
    extern void op_cmpxchgl_user_T0_T1_EAX_cc();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpxchgl_user_T0_T1_EAX_cc+0), 88);
    *(uint32_t *)(gen_code_ptr + 55) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 55) + 0 -4;
    gen_code_ptr += 88;
}
break;

case INDEX_op_btl_T0_T1_cc: {
    extern void op_btl_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_btl_T0_T1_cc+0), 12);
    gen_code_ptr += 12;
}
break;

case INDEX_op_btsl_T0_T1_cc: {
    extern void op_btsl_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_btsl_T0_T1_cc+0), 18);
    gen_code_ptr += 18;
}
break;

case INDEX_op_btrl_T0_T1_cc: {
    extern void op_btrl_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_btrl_T0_T1_cc+0), 18);
    gen_code_ptr += 18;
}
break;

case INDEX_op_btcl_T0_T1_cc: {
    extern void op_btcl_T0_T1_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_btcl_T0_T1_cc+0), 18);
    gen_code_ptr += 18;
}
break;

case INDEX_op_add_bitl_A0_T1: {
    extern void op_add_bitl_A0_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_add_bitl_A0_T1+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_bsfl_T0_cc: {
    extern void op_bsfl_T0_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_bsfl_T0_cc+0), 50);
    gen_code_ptr += 50;
}
break;

case INDEX_op_bsrl_T0_cc: {
    extern void op_bsrl_T0_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_bsrl_T0_cc+0), 45);
    gen_code_ptr += 45;
}
break;

case INDEX_op_update_bt_cc: {
    extern void op_update_bt_cc();
    memcpy(gen_code_ptr, (void *)((char *)&op_update_bt_cc+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movl_T0_Dshiftl: {
    extern void op_movl_T0_Dshiftl();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T0_Dshiftl+0), 10);
    gen_code_ptr += 10;
}
break;

case INDEX_op_outl_T0_T1: {
    extern void op_outl_T0_T1();
extern char cpu_outl;
    memcpy(gen_code_ptr, (void *)((char *)&op_outl_T0_T1+0), 22);
    *(uint32_t *)(gen_code_ptr + 15) = (long)(&cpu_outl) - (long)(gen_code_ptr + 15) + 0 -4;
    gen_code_ptr += 22;
}
break;

case INDEX_op_inl_T0_T1: {
    extern void op_inl_T0_T1();
extern char cpu_inl;
    memcpy(gen_code_ptr, (void *)((char *)&op_inl_T0_T1+0), 20);
    *(uint32_t *)(gen_code_ptr + 11) = (long)(&cpu_inl) - (long)(gen_code_ptr + 11) + 0 -4;
    gen_code_ptr += 20;
}
break;

case INDEX_op_inl_DX_T0: {
    extern void op_inl_DX_T0();
extern char cpu_inl;
    memcpy(gen_code_ptr, (void *)((char *)&op_inl_DX_T0+0), 24);
    *(uint32_t *)(gen_code_ptr + 15) = (long)(&cpu_inl) - (long)(gen_code_ptr + 15) + 0 -4;
    gen_code_ptr += 24;
}
break;

case INDEX_op_outl_DX_T0: {
    extern void op_outl_DX_T0();
extern char cpu_outl;
    memcpy(gen_code_ptr, (void *)((char *)&op_outl_DX_T0+0), 26);
    *(uint32_t *)(gen_code_ptr + 19) = (long)(&cpu_outl) - (long)(gen_code_ptr + 19) + 0 -4;
    gen_code_ptr += 26;
}
break;

case INDEX_op_check_iol_T0: {
    extern void op_check_iol_T0();
extern char check_iol_T0;
    memcpy(gen_code_ptr, (void *)((char *)&op_check_iol_T0+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&check_iol_T0) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_check_iol_DX: {
    extern void op_check_iol_DX();
extern char check_iol_DX;
    memcpy(gen_code_ptr, (void *)((char *)&op_check_iol_DX+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&check_iol_DX) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_movsbl_T0_T0: {
    extern void op_movsbl_T0_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movsbl_T0_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movzbl_T0_T0: {
    extern void op_movzbl_T0_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movzbl_T0_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movswl_T0_T0: {
    extern void op_movswl_T0_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movswl_T0_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movzwl_T0_T0: {
    extern void op_movzwl_T0_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movzwl_T0_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_movswl_EAX_AX: {
    extern void op_movswl_EAX_AX();
    memcpy(gen_code_ptr, (void *)((char *)&op_movswl_EAX_AX+0), 7);
    gen_code_ptr += 7;
}
break;

case INDEX_op_movsbw_AX_AL: {
    extern void op_movsbw_AX_AL();
    memcpy(gen_code_ptr, (void *)((char *)&op_movsbw_AX_AL+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_movslq_EDX_EAX: {
    extern void op_movslq_EDX_EAX();
    memcpy(gen_code_ptr, (void *)((char *)&op_movslq_EDX_EAX+0), 9);
    gen_code_ptr += 9;
}
break;

case INDEX_op_movswl_DX_AX: {
    extern void op_movswl_DX_AX();
    memcpy(gen_code_ptr, (void *)((char *)&op_movswl_DX_AX+0), 11);
    gen_code_ptr += 11;
}
break;

case INDEX_op_addl_ESI_T0: {
    extern void op_addl_ESI_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_ESI_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_addw_ESI_T0: {
    extern void op_addw_ESI_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_addw_ESI_T0+0), 9);
    gen_code_ptr += 9;
}
break;

case INDEX_op_addl_EDI_T0: {
    extern void op_addl_EDI_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_EDI_T0+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_addw_EDI_T0: {
    extern void op_addw_EDI_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_addw_EDI_T0+0), 9);
    gen_code_ptr += 9;
}
break;

case INDEX_op_decl_ECX: {
    extern void op_decl_ECX();
    memcpy(gen_code_ptr, (void *)((char *)&op_decl_ECX+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_decw_ECX: {
    extern void op_decw_ECX();
    memcpy(gen_code_ptr, (void *)((char *)&op_decw_ECX+0), 8);
    gen_code_ptr += 8;
}
break;

case INDEX_op_addl_A0_SS: {
    extern void op_addl_A0_SS();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_A0_SS+0), 5);
    gen_code_ptr += 5;
}
break;

case INDEX_op_subl_A0_2: {
    extern void op_subl_A0_2();
    memcpy(gen_code_ptr, (void *)((char *)&op_subl_A0_2+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_subl_A0_4: {
    extern void op_subl_A0_4();
    memcpy(gen_code_ptr, (void *)((char *)&op_subl_A0_4+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_addl_ESP_4: {
    extern void op_addl_ESP_4();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_ESP_4+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_addl_ESP_2: {
    extern void op_addl_ESP_2();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_ESP_2+0), 4);
    gen_code_ptr += 4;
}
break;

case INDEX_op_addw_ESP_4: {
    extern void op_addw_ESP_4();
    memcpy(gen_code_ptr, (void *)((char *)&op_addw_ESP_4+0), 10);
    gen_code_ptr += 10;
}
break;

case INDEX_op_addw_ESP_2: {
    extern void op_addw_ESP_2();
    memcpy(gen_code_ptr, (void *)((char *)&op_addw_ESP_2+0), 10);
    gen_code_ptr += 10;
}
break;

case INDEX_op_addl_ESP_im: {
    long param1;
    extern void op_addl_ESP_im();
    memcpy(gen_code_ptr, (void *)((char *)&op_addl_ESP_im+0), 7);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 3) = param1 + 0;
    gen_code_ptr += 7;
}
break;

case INDEX_op_addw_ESP_im: {
    long param1;
    extern void op_addw_ESP_im();
    memcpy(gen_code_ptr, (void *)((char *)&op_addw_ESP_im+0), 12);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 4) = param1 + 0;
    gen_code_ptr += 12;
}
break;

case INDEX_op_rdtsc: {
    extern void op_rdtsc();
extern char helper_rdtsc;
    memcpy(gen_code_ptr, (void *)((char *)&op_rdtsc+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_rdtsc) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_rdpmc: {
    extern void op_rdpmc();
extern char helper_rdpmc;
    memcpy(gen_code_ptr, (void *)((char *)&op_rdpmc+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_rdpmc) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_cpuid: {
    extern void op_cpuid();
extern char helper_cpuid;
    memcpy(gen_code_ptr, (void *)((char *)&op_cpuid+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_cpuid) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_enter_level: {
    long param1, param2;
    extern void op_enter_level();
extern char helper_enter_level;
    memcpy(gen_code_ptr, (void *)((char *)&op_enter_level+0), 27);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 4) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 15) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 20) = (long)(&helper_enter_level) - (long)(gen_code_ptr + 20) + 0 -4;
    gen_code_ptr += 27;
}
break;

case INDEX_op_sysenter: {
    extern void op_sysenter();
extern char helper_sysenter;
    memcpy(gen_code_ptr, (void *)((char *)&op_sysenter+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_sysenter) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_sysexit: {
    extern void op_sysexit();
extern char helper_sysexit;
    memcpy(gen_code_ptr, (void *)((char *)&op_sysexit+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_sysexit) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_rdmsr: {
    extern void op_rdmsr();
extern char helper_rdmsr;
    memcpy(gen_code_ptr, (void *)((char *)&op_rdmsr+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_rdmsr) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_wrmsr: {
    extern void op_wrmsr();
extern char helper_wrmsr;
    memcpy(gen_code_ptr, (void *)((char *)&op_wrmsr+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_wrmsr) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_aam: {
    long param1;
    extern void op_aam();
    memcpy(gen_code_ptr, (void *)((char *)&op_aam+0), 46);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 4) = param1 + 0;
    gen_code_ptr += 46;
}
break;

case INDEX_op_aad: {
    long param1;
    extern void op_aad();
    memcpy(gen_code_ptr, (void *)((char *)&op_aad+0), 23);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 6) = param1 + 0;
    gen_code_ptr += 23;
}
break;

case INDEX_op_aaa: {
    extern void op_aaa();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_aaa+0), 148);
    *(uint32_t *)(gen_code_ptr + 9) = (long)(&cc_table) + 0;
    gen_code_ptr += 148;
}
break;

case INDEX_op_aas: {
    extern void op_aas();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_aas+0), 143);
    *(uint32_t *)(gen_code_ptr + 9) = (long)(&cc_table) + 0;
    gen_code_ptr += 143;
}
break;

case INDEX_op_daa: {
    extern void op_daa();
extern char cc_table;
extern char parity_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_daa+0), 154);
    *(uint32_t *)(gen_code_ptr + 9) = (long)(&cc_table) + 0;
    *(uint32_t *)(gen_code_ptr + 131) = (long)(&parity_table) + 0;
    gen_code_ptr += 154;
}
break;

case INDEX_op_das: {
    extern void op_das();
extern char cc_table;
extern char parity_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_das+0), 188);
    *(uint32_t *)(gen_code_ptr + 9) = (long)(&cc_table) + 0;
    *(uint32_t *)(gen_code_ptr + 165) = (long)(&parity_table) + 0;
    gen_code_ptr += 188;
}
break;

case INDEX_op_movl_seg_T0: {
    long param1;
    extern void op_movl_seg_T0();
extern char load_seg;
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_seg_T0+0), 22);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 10) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 15) = (long)(&load_seg) - (long)(gen_code_ptr + 15) + 0 -4;
    gen_code_ptr += 22;
}
break;

case INDEX_op_movl_seg_T0_vm: {
    long param1;
    extern void op_movl_seg_T0_vm();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_seg_T0_vm+0), 17);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    gen_code_ptr += 17;
}
break;

case INDEX_op_movl_T0_seg: {
    long param1;
    extern void op_movl_T0_seg();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T0_seg+0), 12);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 1) = param1 + 0;
    gen_code_ptr += 12;
}
break;

case INDEX_op_lsl: {
    extern void op_lsl();
extern char helper_lsl;
    memcpy(gen_code_ptr, (void *)((char *)&op_lsl+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_lsl) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_lar: {
    extern void op_lar();
extern char helper_lar;
    memcpy(gen_code_ptr, (void *)((char *)&op_lar+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_lar) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_verr: {
    extern void op_verr();
extern char helper_verr;
    memcpy(gen_code_ptr, (void *)((char *)&op_verr+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_verr) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_verw: {
    extern void op_verw();
extern char helper_verw;
    memcpy(gen_code_ptr, (void *)((char *)&op_verw+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_verw) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_arpl: {
    extern void op_arpl();
    memcpy(gen_code_ptr, (void *)((char *)&op_arpl+0), 37);
    gen_code_ptr += 37;
}
break;

case INDEX_op_arpl_update: {
    extern void op_arpl_update();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_arpl_update+0), 18);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 0;
    gen_code_ptr += 18;
}
break;

case INDEX_op_ljmp_protected_T0_T1: {
    long param1;
    extern void op_ljmp_protected_T0_T1();
extern char helper_ljmp_protected_T0_T1;
    memcpy(gen_code_ptr, (void *)((char *)&op_ljmp_protected_T0_T1+0), 16);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 6) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = (long)(&helper_ljmp_protected_T0_T1) - (long)(gen_code_ptr + 11) + 0 -4;
    gen_code_ptr += 16;
}
break;

case INDEX_op_lcall_real_T0_T1: {
    long param1, param2;
    extern void op_lcall_real_T0_T1();
extern char helper_lcall_real_T0_T1;
    memcpy(gen_code_ptr, (void *)((char *)&op_lcall_real_T0_T1+0), 27);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 4) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 15) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 20) = (long)(&helper_lcall_real_T0_T1) - (long)(gen_code_ptr + 20) + 0 -4;
    gen_code_ptr += 27;
}
break;

case INDEX_op_lcall_protected_T0_T1: {
    long param1, param2;
    extern void op_lcall_protected_T0_T1();
extern char helper_lcall_protected_T0_T1;
    memcpy(gen_code_ptr, (void *)((char *)&op_lcall_protected_T0_T1+0), 27);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 4) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 15) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 20) = (long)(&helper_lcall_protected_T0_T1) - (long)(gen_code_ptr + 20) + 0 -4;
    gen_code_ptr += 27;
}
break;

case INDEX_op_iret_real: {
    long param1;
    extern void op_iret_real();
extern char helper_iret_real;
    memcpy(gen_code_ptr, (void *)((char *)&op_iret_real+0), 16);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 6) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = (long)(&helper_iret_real) - (long)(gen_code_ptr + 11) + 0 -4;
    gen_code_ptr += 16;
}
break;

case INDEX_op_iret_protected: {
    long param1, param2;
    extern void op_iret_protected();
extern char helper_iret_protected;
    memcpy(gen_code_ptr, (void *)((char *)&op_iret_protected+0), 27);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 4) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 15) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 20) = (long)(&helper_iret_protected) - (long)(gen_code_ptr + 20) + 0 -4;
    gen_code_ptr += 27;
}
break;

case INDEX_op_lret_protected: {
    long param1, param2;
    extern void op_lret_protected();
extern char helper_lret_protected;
    memcpy(gen_code_ptr, (void *)((char *)&op_lret_protected+0), 27);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 4) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 15) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 20) = (long)(&helper_lret_protected) - (long)(gen_code_ptr + 20) + 0 -4;
    gen_code_ptr += 27;
}
break;

case INDEX_op_lldt_T0: {
    extern void op_lldt_T0();
extern char helper_lldt_T0;
    memcpy(gen_code_ptr, (void *)((char *)&op_lldt_T0+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_lldt_T0) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_ltr_T0: {
    extern void op_ltr_T0();
extern char helper_ltr_T0;
    memcpy(gen_code_ptr, (void *)((char *)&op_ltr_T0+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_ltr_T0) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_movl_crN_T0: {
    long param1;
    extern void op_movl_crN_T0();
extern char helper_movl_crN_T0;
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_crN_T0+0), 16);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 6) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = (long)(&helper_movl_crN_T0) - (long)(gen_code_ptr + 11) + 0 -4;
    gen_code_ptr += 16;
}
break;

case INDEX_op_svm_check_intercept: {
    long param1, param2;
    extern void op_svm_check_intercept();
extern char svm_check_intercept_param;
    memcpy(gen_code_ptr, (void *)((char *)&op_svm_check_intercept+0), 43);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 1) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 13) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 21) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 36) = (long)(&svm_check_intercept_param) - (long)(gen_code_ptr + 36) + 0 -4;
    gen_code_ptr += 43;
}
break;

case INDEX_op_svm_check_intercept_param: {
    long param1, param2;
    extern void op_svm_check_intercept_param();
extern char svm_check_intercept_param;
    memcpy(gen_code_ptr, (void *)((char *)&op_svm_check_intercept_param+0), 41);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 1) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 18) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 29) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 34) = (long)(&svm_check_intercept_param) - (long)(gen_code_ptr + 34) + 0 -4;
    gen_code_ptr += 41;
}
break;

case INDEX_op_svm_vmexit: {
    long param1, param2;
    extern void op_svm_vmexit();
extern char vmexit;
    memcpy(gen_code_ptr, (void *)((char *)&op_svm_vmexit+0), 48);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 1) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 17) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 28) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 41) = (long)(&vmexit) - (long)(gen_code_ptr + 41) + 0 -4;
    gen_code_ptr += 48;
}
break;

case INDEX_op_geneflags: {
    extern void op_geneflags();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_geneflags+0), 13);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 0;
    gen_code_ptr += 13;
}
break;

case INDEX_op_svm_check_intercept_io: {
    long param1, param2;
    extern void op_svm_check_intercept_io();
extern char stq_phys;
extern char svm_check_intercept_param;
    memcpy(gen_code_ptr, (void *)((char *)&op_svm_check_intercept_io+0), 155);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 16) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 30) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 51) = (long)(&stq_phys) - (long)(gen_code_ptr + 51) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 63) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 68) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 77) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 86) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 121) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 148) = (long)(&svm_check_intercept_param) - (long)(gen_code_ptr + 148) + 0 -4;
    gen_code_ptr += 155;
}
break;

case INDEX_op_movtl_T0_cr8: {
    extern void op_movtl_T0_cr8();
extern char cpu_get_apic_tpr;
    memcpy(gen_code_ptr, (void *)((char *)&op_movtl_T0_cr8+0), 15);
    *(uint32_t *)(gen_code_ptr + 7) = (long)(&cpu_get_apic_tpr) - (long)(gen_code_ptr + 7) + 0 -4;
    gen_code_ptr += 15;
}
break;

case INDEX_op_movl_drN_T0: {
    long param1;
    extern void op_movl_drN_T0();
extern char helper_movl_drN_T0;
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_drN_T0+0), 16);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 6) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = (long)(&helper_movl_drN_T0) - (long)(gen_code_ptr + 11) + 0 -4;
    gen_code_ptr += 16;
}
break;

case INDEX_op_lmsw_T0: {
    extern void op_lmsw_T0();
extern char helper_movl_crN_T0;
    memcpy(gen_code_ptr, (void *)((char *)&op_lmsw_T0+0), 34);
    *(uint32_t *)(gen_code_ptr + 29) = (long)(&helper_movl_crN_T0) - (long)(gen_code_ptr + 29) + 0 -4;
    gen_code_ptr += 34;
}
break;

case INDEX_op_invlpg_A0: {
    extern void op_invlpg_A0();
extern char helper_invlpg;
    memcpy(gen_code_ptr, (void *)((char *)&op_invlpg_A0+0), 12);
    *(uint32_t *)(gen_code_ptr + 7) = (long)(&helper_invlpg) - (long)(gen_code_ptr + 7) + 0 -4;
    gen_code_ptr += 12;
}
break;

case INDEX_op_movl_T0_env: {
    long param1;
    extern void op_movl_T0_env();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T0_env+0), 6);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    gen_code_ptr += 6;
}
break;

case INDEX_op_movl_env_T0: {
    long param1;
    extern void op_movl_env_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_env_T0+0), 6);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    gen_code_ptr += 6;
}
break;

case INDEX_op_movl_env_T1: {
    long param1;
    extern void op_movl_env_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_env_T1+0), 6);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    gen_code_ptr += 6;
}
break;

case INDEX_op_movtl_T0_env: {
    long param1;
    extern void op_movtl_T0_env();
    memcpy(gen_code_ptr, (void *)((char *)&op_movtl_T0_env+0), 6);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    gen_code_ptr += 6;
}
break;

case INDEX_op_movtl_env_T0: {
    long param1;
    extern void op_movtl_env_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movtl_env_T0+0), 6);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    gen_code_ptr += 6;
}
break;

case INDEX_op_movtl_T1_env: {
    long param1;
    extern void op_movtl_T1_env();
    memcpy(gen_code_ptr, (void *)((char *)&op_movtl_T1_env+0), 6);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    gen_code_ptr += 6;
}
break;

case INDEX_op_movtl_env_T1: {
    long param1;
    extern void op_movtl_env_T1();
    memcpy(gen_code_ptr, (void *)((char *)&op_movtl_env_T1+0), 6);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    gen_code_ptr += 6;
}
break;

case INDEX_op_clts: {
    extern void op_clts();
    memcpy(gen_code_ptr, (void *)((char *)&op_clts+0), 14);
    gen_code_ptr += 14;
}
break;

case INDEX_op_goto_tb0: {
    long param1;
    extern void op_goto_tb0();
    memcpy(gen_code_ptr, (void *)((char *)&op_goto_tb0+0), 6);
    label_offsets[0] = 6 + (gen_code_ptr - gen_code_buf);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 48;
    gen_code_ptr += 6;
}
break;

case INDEX_op_goto_tb1: {
    long param1;
    extern void op_goto_tb1();
    memcpy(gen_code_ptr, (void *)((char *)&op_goto_tb1+0), 6);
    label_offsets[1] = 6 + (gen_code_ptr - gen_code_buf);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 52;
    gen_code_ptr += 6;
}
break;

case INDEX_op_jmp_label: {
    long param1;
    extern void op_jmp_label();
    memcpy(gen_code_ptr, (void *)((char *)&op_jmp_label+0), 5);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 1) = gen_labels[param1] - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_jnz_T0_label: {
    long param1;
    extern void op_jnz_T0_label();
    memcpy(gen_code_ptr, (void *)((char *)&op_jnz_T0_label+0), 9);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = gen_labels[param1] - (long)(gen_code_ptr + 5) + 0 -4;
    gen_code_ptr += 9;
}
break;

case INDEX_op_jz_T0_label: {
    long param1;
    extern void op_jz_T0_label();
    memcpy(gen_code_ptr, (void *)((char *)&op_jz_T0_label+0), 9);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = gen_labels[param1] - (long)(gen_code_ptr + 5) + 0 -4;
    gen_code_ptr += 9;
}
break;

case INDEX_op_seto_T0_cc: {
    extern void op_seto_T0_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_seto_T0_cc+0), 18);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 0;
    gen_code_ptr += 18;
}
break;

case INDEX_op_setb_T0_cc: {
    extern void op_setb_T0_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_setb_T0_cc+0), 12);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 4;
    gen_code_ptr += 12;
}
break;

case INDEX_op_setz_T0_cc: {
    extern void op_setz_T0_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_setz_T0_cc+0), 18);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 0;
    gen_code_ptr += 18;
}
break;

case INDEX_op_setbe_T0_cc: {
    extern void op_setbe_T0_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_setbe_T0_cc+0), 17);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 0;
    gen_code_ptr += 17;
}
break;

case INDEX_op_sets_T0_cc: {
    extern void op_sets_T0_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_sets_T0_cc+0), 18);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 0;
    gen_code_ptr += 18;
}
break;

case INDEX_op_setp_T0_cc: {
    extern void op_setp_T0_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_setp_T0_cc+0), 18);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 0;
    gen_code_ptr += 18;
}
break;

case INDEX_op_setl_T0_cc: {
    extern void op_setl_T0_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_setl_T0_cc+0), 25);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 0;
    gen_code_ptr += 25;
}
break;

case INDEX_op_setle_T0_cc: {
    extern void op_setle_T0_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_setle_T0_cc+0), 38);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 0;
    gen_code_ptr += 38;
}
break;

case INDEX_op_xor_T0_1: {
    extern void op_xor_T0_1();
    memcpy(gen_code_ptr, (void *)((char *)&op_xor_T0_1+0), 3);
    gen_code_ptr += 3;
}
break;

case INDEX_op_set_cc_op: {
    long param1;
    extern void op_set_cc_op();
    memcpy(gen_code_ptr, (void *)((char *)&op_set_cc_op+0), 7);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 3) = param1 + 0;
    gen_code_ptr += 7;
}
break;

case INDEX_op_mov_T0_cc: {
    extern void op_mov_T0_cc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_mov_T0_cc+0), 12);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 0;
    gen_code_ptr += 12;
}
break;

case INDEX_op_movl_eflags_T0: {
    extern void op_movl_eflags_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_eflags_T0+0), 49);
    gen_code_ptr += 49;
}
break;

case INDEX_op_movw_eflags_T0: {
    extern void op_movw_eflags_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_eflags_T0+0), 49);
    gen_code_ptr += 49;
}
break;

case INDEX_op_movl_eflags_T0_io: {
    extern void op_movl_eflags_T0_io();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_eflags_T0_io+0), 49);
    gen_code_ptr += 49;
}
break;

case INDEX_op_movw_eflags_T0_io: {
    extern void op_movw_eflags_T0_io();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_eflags_T0_io+0), 49);
    gen_code_ptr += 49;
}
break;

case INDEX_op_movl_eflags_T0_cpl0: {
    extern void op_movl_eflags_T0_cpl0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_eflags_T0_cpl0+0), 49);
    gen_code_ptr += 49;
}
break;

case INDEX_op_movw_eflags_T0_cpl0: {
    extern void op_movw_eflags_T0_cpl0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movw_eflags_T0_cpl0+0), 49);
    gen_code_ptr += 49;
}
break;

case INDEX_op_movb_eflags_T0: {
    extern void op_movb_eflags_T0();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_movb_eflags_T0+0), 28);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 0;
    gen_code_ptr += 28;
}
break;

case INDEX_op_movl_T0_eflags: {
    extern void op_movl_T0_eflags();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T0_eflags+0), 33);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 0;
    gen_code_ptr += 33;
}
break;

case INDEX_op_cld: {
    extern void op_cld();
    memcpy(gen_code_ptr, (void *)((char *)&op_cld+0), 7);
    gen_code_ptr += 7;
}
break;

case INDEX_op_std: {
    extern void op_std();
    memcpy(gen_code_ptr, (void *)((char *)&op_std+0), 7);
    gen_code_ptr += 7;
}
break;

case INDEX_op_clc: {
    extern void op_clc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_clc+0), 16);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 0;
    gen_code_ptr += 16;
}
break;

case INDEX_op_stc: {
    extern void op_stc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_stc+0), 16);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 0;
    gen_code_ptr += 16;
}
break;

case INDEX_op_cmc: {
    extern void op_cmc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_cmc+0), 16);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 0;
    gen_code_ptr += 16;
}
break;

case INDEX_op_salc: {
    extern void op_salc();
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_salc+0), 15);
    *(uint32_t *)(gen_code_ptr + 6) = (long)(&cc_table) + 4;
    gen_code_ptr += 15;
}
break;

case INDEX_op_flds_FT0_A0: {
    extern void op_flds_FT0_A0();
extern char __ldl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_flds_FT0_A0+0), 104);
    *(uint32_t *)(gen_code_ptr + 70) = (long)(&__ldl_mmu) - (long)(gen_code_ptr + 70) + 0 -4;
    gen_code_ptr += 104;
}
break;

case INDEX_op_fldl_FT0_A0: {
    extern void op_fldl_FT0_A0();
extern char __ldq_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_fldl_FT0_A0+0), 111);
    *(uint32_t *)(gen_code_ptr + 70) = (long)(&__ldq_mmu) - (long)(gen_code_ptr + 70) + 0 -4;
    gen_code_ptr += 111;
}
break;

case INDEX_op_fild_FT0_A0: {
    extern void op_fild_FT0_A0();
extern char __ldw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_fild_FT0_A0+0), 110);
    *(uint32_t *)(gen_code_ptr + 72) = (long)(&__ldw_mmu) - (long)(gen_code_ptr + 72) + 0 -4;
    gen_code_ptr += 110;
}
break;

case INDEX_op_fildl_FT0_A0: {
    extern void op_fildl_FT0_A0();
extern char __ldl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_fildl_FT0_A0+0), 108);
    *(uint32_t *)(gen_code_ptr + 72) = (long)(&__ldl_mmu) - (long)(gen_code_ptr + 72) + 0 -4;
    gen_code_ptr += 108;
}
break;

case INDEX_op_fildll_FT0_A0: {
    extern void op_fildll_FT0_A0();
extern char __ldq_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_fildll_FT0_A0+0), 112);
    *(uint32_t *)(gen_code_ptr + 72) = (long)(&__ldq_mmu) - (long)(gen_code_ptr + 72) + 0 -4;
    gen_code_ptr += 112;
}
break;

case INDEX_op_flds_ST0_A0: {
    extern void op_flds_ST0_A0();
extern char __ldl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_flds_ST0_A0+0), 151);
    *(uint32_t *)(gen_code_ptr + 98) = (long)(&__ldl_mmu) - (long)(gen_code_ptr + 98) + 0 -4;
    gen_code_ptr += 151;
}
break;

case INDEX_op_fldl_ST0_A0: {
    extern void op_fldl_ST0_A0();
extern char __ldq_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_fldl_ST0_A0+0), 158);
    *(uint32_t *)(gen_code_ptr + 98) = (long)(&__ldq_mmu) - (long)(gen_code_ptr + 98) + 0 -4;
    gen_code_ptr += 158;
}
break;

case INDEX_op_fldt_ST0_A0: {
    extern void op_fldt_ST0_A0();
extern char helper_fldt_ST0_A0;
    memcpy(gen_code_ptr, (void *)((char *)&op_fldt_ST0_A0+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_fldt_ST0_A0) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_fild_ST0_A0: {
    extern void op_fild_ST0_A0();
extern char __ldw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_fild_ST0_A0+0), 157);
    *(uint32_t *)(gen_code_ptr + 100) = (long)(&__ldw_mmu) - (long)(gen_code_ptr + 100) + 0 -4;
    gen_code_ptr += 157;
}
break;

case INDEX_op_fildl_ST0_A0: {
    extern void op_fildl_ST0_A0();
extern char __ldl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_fildl_ST0_A0+0), 155);
    *(uint32_t *)(gen_code_ptr + 100) = (long)(&__ldl_mmu) - (long)(gen_code_ptr + 100) + 0 -4;
    gen_code_ptr += 155;
}
break;

case INDEX_op_fildll_ST0_A0: {
    extern void op_fildll_ST0_A0();
extern char __ldq_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_fildll_ST0_A0+0), 159);
    *(uint32_t *)(gen_code_ptr + 100) = (long)(&__ldq_mmu) - (long)(gen_code_ptr + 100) + 0 -4;
    gen_code_ptr += 159;
}
break;

case INDEX_op_fsts_ST0_A0: {
    extern void op_fsts_ST0_A0();
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_fsts_ST0_A0+0), 118);
    *(uint32_t *)(gen_code_ptr + 94) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 94) + 0 -4;
    gen_code_ptr += 118;
}
break;

case INDEX_op_fstl_ST0_A0: {
    extern void op_fstl_ST0_A0();
extern char __stq_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_fstl_ST0_A0+0), 137);
    *(uint32_t *)(gen_code_ptr + 106) = (long)(&__stq_mmu) - (long)(gen_code_ptr + 106) + 0 -4;
    gen_code_ptr += 137;
}
break;

case INDEX_op_fstt_ST0_A0: {
    extern void op_fstt_ST0_A0();
extern char helper_fstt_ST0_A0;
    memcpy(gen_code_ptr, (void *)((char *)&op_fstt_ST0_A0+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_fstt_ST0_A0) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_fist_ST0_A0: {
    extern void op_fist_ST0_A0();
extern char floatx80_to_int32;
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_fist_ST0_A0+0), 158);
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&floatx80_to_int32) - (long)(gen_code_ptr + 33) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 133) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 133) + 0 -4;
    gen_code_ptr += 158;
}
break;

case INDEX_op_fistl_ST0_A0: {
    extern void op_fistl_ST0_A0();
extern char floatx80_to_int32;
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_fistl_ST0_A0+0), 136);
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&floatx80_to_int32) - (long)(gen_code_ptr + 33) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 112) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 112) + 0 -4;
    gen_code_ptr += 136;
}
break;

case INDEX_op_fistll_ST0_A0: {
    extern void op_fistll_ST0_A0();
extern char floatx80_to_int64;
extern char __stq_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_fistll_ST0_A0+0), 159);
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&floatx80_to_int64) - (long)(gen_code_ptr + 33) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 128) = (long)(&__stq_mmu) - (long)(gen_code_ptr + 128) + 0 -4;
    gen_code_ptr += 159;
}
break;

case INDEX_op_fistt_ST0_A0: {
    extern void op_fistt_ST0_A0();
extern char floatx80_to_int32_round_to_zero;
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_fistt_ST0_A0+0), 158);
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&floatx80_to_int32_round_to_zero) - (long)(gen_code_ptr + 33) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 133) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 133) + 0 -4;
    gen_code_ptr += 158;
}
break;

case INDEX_op_fisttl_ST0_A0: {
    extern void op_fisttl_ST0_A0();
extern char floatx80_to_int32_round_to_zero;
extern char __stl_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_fisttl_ST0_A0+0), 136);
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&floatx80_to_int32_round_to_zero) - (long)(gen_code_ptr + 33) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 112) = (long)(&__stl_mmu) - (long)(gen_code_ptr + 112) + 0 -4;
    gen_code_ptr += 136;
}
break;

case INDEX_op_fisttll_ST0_A0: {
    extern void op_fisttll_ST0_A0();
extern char floatx80_to_int64_round_to_zero;
extern char __stq_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_fisttll_ST0_A0+0), 159);
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&floatx80_to_int64_round_to_zero) - (long)(gen_code_ptr + 33) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 128) = (long)(&__stq_mmu) - (long)(gen_code_ptr + 128) + 0 -4;
    gen_code_ptr += 159;
}
break;

case INDEX_op_fbld_ST0_A0: {
    extern void op_fbld_ST0_A0();
extern char helper_fbld_ST0_A0;
    memcpy(gen_code_ptr, (void *)((char *)&op_fbld_ST0_A0+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_fbld_ST0_A0) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_fbst_ST0_A0: {
    extern void op_fbst_ST0_A0();
extern char helper_fbst_ST0_A0;
    memcpy(gen_code_ptr, (void *)((char *)&op_fbst_ST0_A0+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_fbst_ST0_A0) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_fpush: {
    extern void op_fpush();
    memcpy(gen_code_ptr, (void *)((char *)&op_fpush+0), 25);
    gen_code_ptr += 25;
}
break;

case INDEX_op_fpop: {
    extern void op_fpop();
    memcpy(gen_code_ptr, (void *)((char *)&op_fpop+0), 25);
    gen_code_ptr += 25;
}
break;

case INDEX_op_fdecstp: {
    extern void op_fdecstp();
    memcpy(gen_code_ptr, (void *)((char *)&op_fdecstp+0), 26);
    gen_code_ptr += 26;
}
break;

case INDEX_op_fincstp: {
    extern void op_fincstp();
    memcpy(gen_code_ptr, (void *)((char *)&op_fincstp+0), 26);
    gen_code_ptr += 26;
}
break;

case INDEX_op_ffree_STN: {
    long param1;
    extern void op_ffree_STN();
    memcpy(gen_code_ptr, (void *)((char *)&op_ffree_STN+0), 23);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 9) = param1 + 0;
    gen_code_ptr += 23;
}
break;

case INDEX_op_fmov_ST0_FT0: {
    extern void op_fmov_ST0_FT0();
    memcpy(gen_code_ptr, (void *)((char *)&op_fmov_ST0_FT0+0), 22);
    gen_code_ptr += 22;
}
break;

case INDEX_op_fmov_FT0_STN: {
    long param1;
    extern void op_fmov_FT0_STN();
    memcpy(gen_code_ptr, (void *)((char *)&op_fmov_FT0_STN+0), 56);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 7) = param1 + 0;
    gen_code_ptr += 56;
}
break;

case INDEX_op_fmov_ST0_STN: {
    long param1;
    extern void op_fmov_ST0_STN();
    memcpy(gen_code_ptr, (void *)((char *)&op_fmov_ST0_STN+0), 50);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 22) = param1 + 0;
    gen_code_ptr += 50;
}
break;

case INDEX_op_fmov_STN_ST0: {
    long param1;
    extern void op_fmov_STN_ST0();
    memcpy(gen_code_ptr, (void *)((char *)&op_fmov_STN_ST0+0), 50);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 10) = param1 + 0;
    gen_code_ptr += 50;
}
break;

case INDEX_op_fxchg_ST0_STN: {
    long param1;
    extern void op_fxchg_ST0_STN();
    memcpy(gen_code_ptr, (void *)((char *)&op_fxchg_ST0_STN+0), 90);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 10) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 34) = param1 + 0;
    gen_code_ptr += 90;
}
break;

case INDEX_op_fcom_ST0_FT0: {
    extern void op_fcom_ST0_FT0();
extern char floatx80_compare;
    memcpy(gen_code_ptr, (void *)((char *)&op_fcom_ST0_FT0+0), 119);
    *(uint32_t *)(gen_code_ptr + 85) = (long)(&floatx80_compare) - (long)(gen_code_ptr + 85) + 0 -4;
    gen_code_ptr += 119;
}
break;

case INDEX_op_fucom_ST0_FT0: {
    extern void op_fucom_ST0_FT0();
extern char floatx80_compare_quiet;
    memcpy(gen_code_ptr, (void *)((char *)&op_fucom_ST0_FT0+0), 119);
    *(uint32_t *)(gen_code_ptr + 85) = (long)(&floatx80_compare_quiet) - (long)(gen_code_ptr + 85) + 0 -4;
    gen_code_ptr += 119;
}
break;

case INDEX_op_fcomi_ST0_FT0: {
    extern void op_fcomi_ST0_FT0();
extern char floatx80_compare;
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_fcomi_ST0_FT0+0), 125);
    *(uint32_t *)(gen_code_ptr + 85) = (long)(&floatx80_compare) - (long)(gen_code_ptr + 85) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 99) = (long)(&cc_table) + 0;
    gen_code_ptr += 125;
}
break;

case INDEX_op_fucomi_ST0_FT0: {
    extern void op_fucomi_ST0_FT0();
extern char floatx80_compare_quiet;
extern char cc_table;
    memcpy(gen_code_ptr, (void *)((char *)&op_fucomi_ST0_FT0+0), 125);
    *(uint32_t *)(gen_code_ptr + 85) = (long)(&floatx80_compare_quiet) - (long)(gen_code_ptr + 85) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 99) = (long)(&cc_table) + 0;
    gen_code_ptr += 125;
}
break;

case INDEX_op_fcmov_ST0_STN_T0: {
    long param1;
    extern void op_fcmov_ST0_STN_T0();
    memcpy(gen_code_ptr, (void *)((char *)&op_fcmov_ST0_STN_T0+0), 54);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 26) = param1 + 0;
    gen_code_ptr += 54;
}
break;

case INDEX_op_fadd_ST0_FT0: {
    extern void op_fadd_ST0_FT0();
    memcpy(gen_code_ptr, (void *)((char *)&op_fadd_ST0_FT0+0), 31);
    gen_code_ptr += 31;
}
break;

case INDEX_op_fmul_ST0_FT0: {
    extern void op_fmul_ST0_FT0();
    memcpy(gen_code_ptr, (void *)((char *)&op_fmul_ST0_FT0+0), 31);
    gen_code_ptr += 31;
}
break;

case INDEX_op_fsub_ST0_FT0: {
    extern void op_fsub_ST0_FT0();
    memcpy(gen_code_ptr, (void *)((char *)&op_fsub_ST0_FT0+0), 31);
    gen_code_ptr += 31;
}
break;

case INDEX_op_fsubr_ST0_FT0: {
    extern void op_fsubr_ST0_FT0();
    memcpy(gen_code_ptr, (void *)((char *)&op_fsubr_ST0_FT0+0), 31);
    gen_code_ptr += 31;
}
break;

case INDEX_op_fdiv_ST0_FT0: {
    extern void op_fdiv_ST0_FT0();
extern char helper_fdiv;
    memcpy(gen_code_ptr, (void *)((char *)&op_fdiv_ST0_FT0+0), 107);
    *(uint32_t *)(gen_code_ptr + 90) = (long)(&helper_fdiv) - (long)(gen_code_ptr + 90) + 0 -4;
    gen_code_ptr += 107;
}
break;

case INDEX_op_fdivr_ST0_FT0: {
    extern void op_fdivr_ST0_FT0();
extern char helper_fdiv;
    memcpy(gen_code_ptr, (void *)((char *)&op_fdivr_ST0_FT0+0), 107);
    *(uint32_t *)(gen_code_ptr + 90) = (long)(&helper_fdiv) - (long)(gen_code_ptr + 90) + 0 -4;
    gen_code_ptr += 107;
}
break;

case INDEX_op_fadd_STN_ST0: {
    long param1;
    extern void op_fadd_STN_ST0();
    memcpy(gen_code_ptr, (void *)((char *)&op_fadd_STN_ST0+0), 50);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 14) = param1 + 0;
    gen_code_ptr += 50;
}
break;

case INDEX_op_fmul_STN_ST0: {
    long param1;
    extern void op_fmul_STN_ST0();
    memcpy(gen_code_ptr, (void *)((char *)&op_fmul_STN_ST0+0), 50);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 14) = param1 + 0;
    gen_code_ptr += 50;
}
break;

case INDEX_op_fsub_STN_ST0: {
    long param1;
    extern void op_fsub_STN_ST0();
    memcpy(gen_code_ptr, (void *)((char *)&op_fsub_STN_ST0+0), 50);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 14) = param1 + 0;
    gen_code_ptr += 50;
}
break;

case INDEX_op_fsubr_STN_ST0: {
    long param1;
    extern void op_fsubr_STN_ST0();
    memcpy(gen_code_ptr, (void *)((char *)&op_fsubr_STN_ST0+0), 50);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 14) = param1 + 0;
    gen_code_ptr += 50;
}
break;

case INDEX_op_fdiv_STN_ST0: {
    long param1;
    extern void op_fdiv_STN_ST0();
extern char helper_fdiv;
    memcpy(gen_code_ptr, (void *)((char *)&op_fdiv_STN_ST0+0), 99);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 10) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 82) = (long)(&helper_fdiv) - (long)(gen_code_ptr + 82) + 0 -4;
    gen_code_ptr += 99;
}
break;

case INDEX_op_fdivr_STN_ST0: {
    long param1;
    extern void op_fdivr_STN_ST0();
extern char helper_fdiv;
    memcpy(gen_code_ptr, (void *)((char *)&op_fdivr_STN_ST0+0), 95);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 10) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 78) = (long)(&helper_fdiv) - (long)(gen_code_ptr + 78) + 0 -4;
    gen_code_ptr += 95;
}
break;

case INDEX_op_fchs_ST0: {
    extern void op_fchs_ST0();
    memcpy(gen_code_ptr, (void *)((char *)&op_fchs_ST0+0), 41);
    gen_code_ptr += 41;
}
break;

case INDEX_op_fabs_ST0: {
    extern void op_fabs_ST0();
    memcpy(gen_code_ptr, (void *)((char *)&op_fabs_ST0+0), 41);
    gen_code_ptr += 41;
}
break;

case INDEX_op_fxam_ST0: {
    extern void op_fxam_ST0();
extern char helper_fxam_ST0;
    memcpy(gen_code_ptr, (void *)((char *)&op_fxam_ST0+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_fxam_ST0) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_fld1_ST0: {
    extern void op_fld1_ST0();
extern char f15rk;
    memcpy(gen_code_ptr, (void *)((char *)&op_fld1_ST0+0), 22);
    *(uint32_t *)(gen_code_ptr + 2) = (long)(&f15rk) + 12;
    gen_code_ptr += 22;
}
break;

case INDEX_op_fldl2t_ST0: {
    extern void op_fldl2t_ST0();
extern char f15rk;
    memcpy(gen_code_ptr, (void *)((char *)&op_fldl2t_ST0+0), 22);
    *(uint32_t *)(gen_code_ptr + 2) = (long)(&f15rk) + 72;
    gen_code_ptr += 22;
}
break;

case INDEX_op_fldl2e_ST0: {
    extern void op_fldl2e_ST0();
extern char f15rk;
    memcpy(gen_code_ptr, (void *)((char *)&op_fldl2e_ST0+0), 22);
    *(uint32_t *)(gen_code_ptr + 2) = (long)(&f15rk) + 60;
    gen_code_ptr += 22;
}
break;

case INDEX_op_fldpi_ST0: {
    extern void op_fldpi_ST0();
extern char f15rk;
    memcpy(gen_code_ptr, (void *)((char *)&op_fldpi_ST0+0), 22);
    *(uint32_t *)(gen_code_ptr + 2) = (long)(&f15rk) + 24;
    gen_code_ptr += 22;
}
break;

case INDEX_op_fldlg2_ST0: {
    extern void op_fldlg2_ST0();
extern char f15rk;
    memcpy(gen_code_ptr, (void *)((char *)&op_fldlg2_ST0+0), 22);
    *(uint32_t *)(gen_code_ptr + 2) = (long)(&f15rk) + 36;
    gen_code_ptr += 22;
}
break;

case INDEX_op_fldln2_ST0: {
    extern void op_fldln2_ST0();
extern char f15rk;
    memcpy(gen_code_ptr, (void *)((char *)&op_fldln2_ST0+0), 22);
    *(uint32_t *)(gen_code_ptr + 2) = (long)(&f15rk) + 48;
    gen_code_ptr += 22;
}
break;

case INDEX_op_fldz_ST0: {
    extern void op_fldz_ST0();
extern char f15rk;
    memcpy(gen_code_ptr, (void *)((char *)&op_fldz_ST0+0), 22);
    *(uint32_t *)(gen_code_ptr + 2) = (long)(&f15rk) + 0;
    gen_code_ptr += 22;
}
break;

case INDEX_op_fldz_FT0: {
    extern void op_fldz_FT0();
extern char f15rk;
extern char f15rk;
extern char f15rk;
    memcpy(gen_code_ptr, (void *)((char *)&op_fldz_FT0+0), 35);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&f15rk) + 0;
    *(uint32_t *)(gen_code_ptr + 7) = (long)(&f15rk) + 4;
    *(uint32_t *)(gen_code_ptr + 13) = (long)(&f15rk) + 8;
    gen_code_ptr += 35;
}
break;

case INDEX_op_f2xm1: {
    extern void op_f2xm1();
extern char helper_f2xm1;
    memcpy(gen_code_ptr, (void *)((char *)&op_f2xm1+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_f2xm1) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_fyl2x: {
    extern void op_fyl2x();
extern char helper_fyl2x;
    memcpy(gen_code_ptr, (void *)((char *)&op_fyl2x+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_fyl2x) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_fptan: {
    extern void op_fptan();
extern char helper_fptan;
    memcpy(gen_code_ptr, (void *)((char *)&op_fptan+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_fptan) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_fpatan: {
    extern void op_fpatan();
extern char helper_fpatan;
    memcpy(gen_code_ptr, (void *)((char *)&op_fpatan+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_fpatan) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_fxtract: {
    extern void op_fxtract();
extern char helper_fxtract;
    memcpy(gen_code_ptr, (void *)((char *)&op_fxtract+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_fxtract) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_fprem1: {
    extern void op_fprem1();
extern char helper_fprem1;
    memcpy(gen_code_ptr, (void *)((char *)&op_fprem1+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_fprem1) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_fprem: {
    extern void op_fprem();
extern char helper_fprem;
    memcpy(gen_code_ptr, (void *)((char *)&op_fprem+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_fprem) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_fyl2xp1: {
    extern void op_fyl2xp1();
extern char helper_fyl2xp1;
    memcpy(gen_code_ptr, (void *)((char *)&op_fyl2xp1+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_fyl2xp1) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_fsqrt: {
    extern void op_fsqrt();
extern char helper_fsqrt;
    memcpy(gen_code_ptr, (void *)((char *)&op_fsqrt+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_fsqrt) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_fsincos: {
    extern void op_fsincos();
extern char helper_fsincos;
    memcpy(gen_code_ptr, (void *)((char *)&op_fsincos+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_fsincos) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_frndint: {
    extern void op_frndint();
extern char helper_frndint;
    memcpy(gen_code_ptr, (void *)((char *)&op_frndint+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_frndint) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_fscale: {
    extern void op_fscale();
extern char helper_fscale;
    memcpy(gen_code_ptr, (void *)((char *)&op_fscale+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_fscale) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_fsin: {
    extern void op_fsin();
extern char helper_fsin;
    memcpy(gen_code_ptr, (void *)((char *)&op_fsin+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_fsin) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_fcos: {
    extern void op_fcos();
extern char helper_fcos;
    memcpy(gen_code_ptr, (void *)((char *)&op_fcos+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_fcos) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_fnstsw_A0: {
    extern void op_fnstsw_A0();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_fnstsw_A0+0), 131);
    *(uint32_t *)(gen_code_ptr + 106) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 106) + 0 -4;
    gen_code_ptr += 131;
}
break;

case INDEX_op_fnstsw_EAX: {
    extern void op_fnstsw_EAX();
    memcpy(gen_code_ptr, (void *)((char *)&op_fnstsw_EAX+0), 39);
    gen_code_ptr += 39;
}
break;

case INDEX_op_fnstcw_A0: {
    extern void op_fnstcw_A0();
extern char __stw_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_fnstcw_A0+0), 110);
    *(uint32_t *)(gen_code_ptr + 85) = (long)(&__stw_mmu) - (long)(gen_code_ptr + 85) + 0 -4;
    gen_code_ptr += 110;
}
break;

case INDEX_op_fldcw_A0: {
    extern void op_fldcw_A0();
extern char __ldw_mmu;
extern char update_fp_status;
    memcpy(gen_code_ptr, (void *)((char *)&op_fldcw_A0+0), 113);
    *(uint32_t *)(gen_code_ptr + 72) = (long)(&__ldw_mmu) - (long)(gen_code_ptr + 72) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 106) = (long)(&update_fp_status) - (long)(gen_code_ptr + 106) + 0 -4;
    gen_code_ptr += 113;
}
break;

case INDEX_op_fclex: {
    extern void op_fclex();
    memcpy(gen_code_ptr, (void *)((char *)&op_fclex+0), 10);
    gen_code_ptr += 10;
}
break;

case INDEX_op_fwait: {
    extern void op_fwait();
extern char fpu_raise_exception;
    memcpy(gen_code_ptr, (void *)((char *)&op_fwait+0), 25);
    *(uint32_t *)(gen_code_ptr + 10) = (long)(&fpu_raise_exception) - (long)(gen_code_ptr + 10) + 0 -4;
    gen_code_ptr += 25;
}
break;

case INDEX_op_fninit: {
    extern void op_fninit();
    memcpy(gen_code_ptr, (void *)((char *)&op_fninit+0), 83);
    gen_code_ptr += 83;
}
break;

case INDEX_op_fnstenv_A0: {
    long param1;
    extern void op_fnstenv_A0();
extern char helper_fstenv;
    memcpy(gen_code_ptr, (void *)((char *)&op_fnstenv_A0+0), 23);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 4) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 16) = (long)(&helper_fstenv) - (long)(gen_code_ptr + 16) + 0 -4;
    gen_code_ptr += 23;
}
break;

case INDEX_op_fldenv_A0: {
    long param1;
    extern void op_fldenv_A0();
extern char helper_fldenv;
    memcpy(gen_code_ptr, (void *)((char *)&op_fldenv_A0+0), 23);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 4) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 16) = (long)(&helper_fldenv) - (long)(gen_code_ptr + 16) + 0 -4;
    gen_code_ptr += 23;
}
break;

case INDEX_op_fnsave_A0: {
    long param1;
    extern void op_fnsave_A0();
extern char helper_fsave;
    memcpy(gen_code_ptr, (void *)((char *)&op_fnsave_A0+0), 23);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 4) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 16) = (long)(&helper_fsave) - (long)(gen_code_ptr + 16) + 0 -4;
    gen_code_ptr += 23;
}
break;

case INDEX_op_frstor_A0: {
    long param1;
    extern void op_frstor_A0();
extern char helper_frstor;
    memcpy(gen_code_ptr, (void *)((char *)&op_frstor_A0+0), 23);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 4) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 16) = (long)(&helper_frstor) - (long)(gen_code_ptr + 16) + 0 -4;
    gen_code_ptr += 23;
}
break;

case INDEX_op_lock: {
    extern void op_lock();
extern char cpu_lock;
    memcpy(gen_code_ptr, (void *)((char *)&op_lock+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&cpu_lock) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_unlock: {
    extern void op_unlock();
extern char cpu_unlock;
    memcpy(gen_code_ptr, (void *)((char *)&op_unlock+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&cpu_unlock) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_movo: {
    long param1, param2;
    extern void op_movo();
    memcpy(gen_code_ptr, (void *)((char *)&op_movo+0), 34);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 10) = param1 + 0;
    gen_code_ptr += 34;
}
break;

case INDEX_op_movq: {
    long param1, param2;
    extern void op_movq();
    memcpy(gen_code_ptr, (void *)((char *)&op_movq+0), 24);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param2 + 4;
    *(uint32_t *)(gen_code_ptr + 14) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 20) = param1 + 4;
    gen_code_ptr += 24;
}
break;

case INDEX_op_movl: {
    long param1, param2;
    extern void op_movl();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl+0), 12);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 12;
}
break;

case INDEX_op_movq_env_0: {
    long param1;
    extern void op_movq_env_0();
    memcpy(gen_code_ptr, (void *)((char *)&op_movq_env_0+0), 16);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 4) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 12) = param1 + 4;
    gen_code_ptr += 16;
}
break;

case INDEX_op_fxsave_A0: {
    long param1;
    extern void op_fxsave_A0();
extern char helper_fxsave;
    memcpy(gen_code_ptr, (void *)((char *)&op_fxsave_A0+0), 23);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 4) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 16) = (long)(&helper_fxsave) - (long)(gen_code_ptr + 16) + 0 -4;
    gen_code_ptr += 23;
}
break;

case INDEX_op_fxrstor_A0: {
    long param1;
    extern void op_fxrstor_A0();
extern char helper_fxrstor;
    memcpy(gen_code_ptr, (void *)((char *)&op_fxrstor_A0+0), 23);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 4) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 16) = (long)(&helper_fxrstor) - (long)(gen_code_ptr + 16) + 0 -4;
    gen_code_ptr += 23;
}
break;

case INDEX_op_enter_mmx: {
    extern void op_enter_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_enter_mmx+0), 24);
    gen_code_ptr += 24;
}
break;

case INDEX_op_emms: {
    extern void op_emms();
    memcpy(gen_code_ptr, (void *)((char *)&op_emms+0), 22);
    gen_code_ptr += 22;
}
break;

case INDEX_op_psrlw_mmx: {
    long param1, param2;
    extern void op_psrlw_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_psrlw_mmx+0), 152);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 152;
}
break;

case INDEX_op_psraw_mmx: {
    long param1, param2;
    extern void op_psraw_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_psraw_mmx+0), 129);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 129;
}
break;

case INDEX_op_psllw_mmx: {
    long param1, param2;
    extern void op_psllw_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_psllw_mmx+0), 141);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 141;
}
break;

case INDEX_op_psrld_mmx: {
    long param1, param2;
    extern void op_psrld_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_psrld_mmx+0), 77);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 77;
}
break;

case INDEX_op_psrad_mmx: {
    long param1, param2;
    extern void op_psrad_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_psrad_mmx+0), 76);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 76;
}
break;

case INDEX_op_pslld_mmx: {
    long param1, param2;
    extern void op_pslld_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pslld_mmx+0), 66);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 66;
}
break;

case INDEX_op_psrlq_mmx: {
    long param1, param2;
    extern void op_psrlq_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_psrlq_mmx+0), 113);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 113;
}
break;

case INDEX_op_psllq_mmx: {
    long param1, param2;
    extern void op_psllq_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_psllq_mmx+0), 111);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 111;
}
break;

case INDEX_op_paddb_mmx: {
    long param1, param2;
    extern void op_paddb_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_paddb_mmx+0), 66);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 66;
}
break;

case INDEX_op_paddw_mmx: {
    long param1, param2;
    extern void op_paddw_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_paddw_mmx+0), 81);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 81;
}
break;

case INDEX_op_paddl_mmx: {
    long param1, param2;
    extern void op_paddl_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_paddl_mmx+0), 22);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 10) = param1 + 0;
    gen_code_ptr += 22;
}
break;

case INDEX_op_paddq_mmx: {
    long param1, param2;
    extern void op_paddq_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_paddq_mmx+0), 24);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param2 + 4;
    *(uint32_t *)(gen_code_ptr + 14) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 20) = param1 + 4;
    gen_code_ptr += 24;
}
break;

case INDEX_op_psubb_mmx: {
    long param1, param2;
    extern void op_psubb_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_psubb_mmx+0), 89);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param2 + 0;
    gen_code_ptr += 89;
}
break;

case INDEX_op_psubw_mmx: {
    long param1, param2;
    extern void op_psubw_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_psubw_mmx+0), 81);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 81;
}
break;

case INDEX_op_psubl_mmx: {
    long param1, param2;
    extern void op_psubl_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_psubl_mmx+0), 27);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param2 + 0;
    gen_code_ptr += 27;
}
break;

case INDEX_op_psubq_mmx: {
    long param1, param2;
    extern void op_psubq_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_psubq_mmx+0), 28);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 13) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 19) = param2 + 4;
    gen_code_ptr += 28;
}
break;

case INDEX_op_paddusb_mmx: {
    long param1, param2;
    extern void op_paddusb_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_paddusb_mmx+0), 315);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 315;
}
break;

case INDEX_op_paddsb_mmx: {
    long param1, param2;
    extern void op_paddsb_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_paddsb_mmx+0), 508);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 508;
}
break;

case INDEX_op_psubusb_mmx: {
    long param1, param2;
    extern void op_psubusb_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_psubusb_mmx+0), 463);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 463;
}
break;

case INDEX_op_psubsb_mmx: {
    long param1, param2;
    extern void op_psubsb_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_psubsb_mmx+0), 399);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 399;
}
break;

case INDEX_op_paddusw_mmx: {
    long param1, param2;
    extern void op_paddusw_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_paddusw_mmx+0), 169);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 169;
}
break;

case INDEX_op_paddsw_mmx: {
    long param1, param2;
    extern void op_paddsw_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_paddsw_mmx+0), 262);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 262;
}
break;

case INDEX_op_psubusw_mmx: {
    long param1, param2;
    extern void op_psubusw_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_psubusw_mmx+0), 239);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 239;
}
break;

case INDEX_op_psubsw_mmx: {
    long param1, param2;
    extern void op_psubsw_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_psubsw_mmx+0), 207);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 207;
}
break;

case INDEX_op_pminub_mmx: {
    long param1, param2;
    extern void op_pminub_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pminub_mmx+0), 220);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 220;
}
break;

case INDEX_op_pmaxub_mmx: {
    long param1, param2;
    extern void op_pmaxub_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pmaxub_mmx+0), 220);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 220;
}
break;

case INDEX_op_pminsw_mmx: {
    long param1, param2;
    extern void op_pminsw_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pminsw_mmx+0), 147);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 147;
}
break;

case INDEX_op_pmaxsw_mmx: {
    long param1, param2;
    extern void op_pmaxsw_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pmaxsw_mmx+0), 147);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 147;
}
break;

case INDEX_op_pand_mmx: {
    long param1, param2;
    extern void op_pand_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pand_mmx+0), 30);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 21) = param2 + 4;
    gen_code_ptr += 30;
}
break;

case INDEX_op_pandn_mmx: {
    long param1, param2;
    extern void op_pandn_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pandn_mmx+0), 45);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 21) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 33) = param2 + 4;
    gen_code_ptr += 45;
}
break;

case INDEX_op_por_mmx: {
    long param1, param2;
    extern void op_por_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_por_mmx+0), 30);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 21) = param2 + 4;
    gen_code_ptr += 30;
}
break;

case INDEX_op_pxor_mmx: {
    long param1, param2;
    extern void op_pxor_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pxor_mmx+0), 30);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 21) = param2 + 4;
    gen_code_ptr += 30;
}
break;

case INDEX_op_pcmpgtb_mmx: {
    long param1, param2;
    extern void op_pcmpgtb_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pcmpgtb_mmx+0), 129);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 129;
}
break;

case INDEX_op_pcmpgtw_mmx: {
    long param1, param2;
    extern void op_pcmpgtw_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pcmpgtw_mmx+0), 89);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 89;
}
break;

case INDEX_op_pcmpgtl_mmx: {
    long param1, param2;
    extern void op_pcmpgtl_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pcmpgtl_mmx+0), 41);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 41;
}
break;

case INDEX_op_pcmpeqb_mmx: {
    long param1, param2;
    extern void op_pcmpeqb_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pcmpeqb_mmx+0), 129);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 129;
}
break;

case INDEX_op_pcmpeqw_mmx: {
    long param1, param2;
    extern void op_pcmpeqw_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pcmpeqw_mmx+0), 89);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 89;
}
break;

case INDEX_op_pcmpeql_mmx: {
    long param1, param2;
    extern void op_pcmpeql_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pcmpeql_mmx+0), 41);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 41;
}
break;

case INDEX_op_pmullw_mmx: {
    long param1, param2;
    extern void op_pmullw_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pmullw_mmx+0), 85);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 85;
}
break;

case INDEX_op_pmulhuw_mmx: {
    long param1, param2;
    extern void op_pmulhuw_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pmulhuw_mmx+0), 107);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 107;
}
break;

case INDEX_op_pmulhw_mmx: {
    long param1, param2;
    extern void op_pmulhw_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pmulhw_mmx+0), 107);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 107;
}
break;

case INDEX_op_pavgb_mmx: {
    long param1, param2;
    extern void op_pavgb_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pavgb_mmx+0), 215);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 215;
}
break;

case INDEX_op_pavgw_mmx: {
    long param1, param2;
    extern void op_pavgw_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pavgw_mmx+0), 119);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 119;
}
break;

case INDEX_op_pmuludq_mmx: {
    long param1, param2;
    extern void op_pmuludq_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pmuludq_mmx+0), 19);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 10) = param2 + 0;
    gen_code_ptr += 19;
}
break;

case INDEX_op_pmaddwd_mmx: {
    long param1, param2;
    extern void op_pmaddwd_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pmaddwd_mmx+0), 105);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 105;
}
break;

case INDEX_op_psadbw_mmx: {
    long param1, param2;
    extern void op_psadbw_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_psadbw_mmx+0), 229);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 229;
}
break;

case INDEX_op_maskmov_mmx: {
    long param1, param2;
    extern void op_maskmov_mmx();
extern char __stb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_maskmov_mmx+0), 175);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 128) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 128) + 0 -4;
    gen_code_ptr += 175;
}
break;

case INDEX_op_movl_mm_T0_mmx: {
    long param1;
    extern void op_movl_mm_T0_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_mm_T0_mmx+0), 15);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    gen_code_ptr += 15;
}
break;

case INDEX_op_movl_T0_mm_mmx: {
    long param1;
    extern void op_movl_T0_mm_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T0_mm_mmx+0), 6);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    gen_code_ptr += 6;
}
break;

case INDEX_op_pshufw_mmx: {
    long param1, param2, param3;
    extern void op_pshufw_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pshufw_mmx+0), 98);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    param3 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 1) = param3 + 0;
    *(uint32_t *)(gen_code_ptr + 12) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 85) = param1 + 4;
    *(uint32_t *)(gen_code_ptr + 91) = param1 + 0;
    gen_code_ptr += 98;
}
break;

case INDEX_op_pmovmskb_mmx: {
    long param1;
    extern void op_pmovmskb_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pmovmskb_mmx+0), 97);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    gen_code_ptr += 97;
}
break;

case INDEX_op_pinsrw_mmx: {
    long param1, param2;
    extern void op_pinsrw_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pinsrw_mmx+0), 13);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 1) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 9) = param1 + 0;
    gen_code_ptr += 13;
}
break;

case INDEX_op_pextrw_mmx: {
    long param1, param2;
    extern void op_pextrw_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_pextrw_mmx+0), 13);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 1) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 9) = param1 + 0;
    gen_code_ptr += 13;
}
break;

case INDEX_op_packsswb_mmx: {
    long param1, param2;
    extern void op_packsswb_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_packsswb_mmx+0), 455);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 7) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 28) = param2 + 0;
    gen_code_ptr += 455;
}
break;

case INDEX_op_packuswb_mmx: {
    long param1, param2;
    extern void op_packuswb_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_packuswb_mmx+0), 386);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 13) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 19) = param1 + 0;
    gen_code_ptr += 386;
}
break;

case INDEX_op_packssdw_mmx: {
    long param1, param2;
    extern void op_packssdw_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_packssdw_mmx+0), 226);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 226;
}
break;

case INDEX_op_punpcklbw_mmx: {
    long param1, param2;
    extern void op_punpcklbw_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_punpcklbw_mmx+0), 246);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 7) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 17) = param2 + 0;
    gen_code_ptr += 246;
}
break;

case INDEX_op_punpcklwd_mmx: {
    long param1, param2;
    extern void op_punpcklwd_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_punpcklwd_mmx+0), 63);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 63;
}
break;

case INDEX_op_punpckldq_mmx: {
    long param1, param2;
    extern void op_punpckldq_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_punpckldq_mmx+0), 39);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 16) = param2 + 0;
    gen_code_ptr += 39;
}
break;

case INDEX_op_punpckhbw_mmx: {
    long param1, param2;
    extern void op_punpckhbw_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_punpckhbw_mmx+0), 248);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 7) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 17) = param2 + 0;
    gen_code_ptr += 248;
}
break;

case INDEX_op_punpckhwd_mmx: {
    long param1, param2;
    extern void op_punpckhwd_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_punpckhwd_mmx+0), 65);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 65;
}
break;

case INDEX_op_punpckhdq_mmx: {
    long param1, param2;
    extern void op_punpckhdq_mmx();
    memcpy(gen_code_ptr, (void *)((char *)&op_punpckhdq_mmx+0), 40);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 17) = param2 + 4;
    gen_code_ptr += 40;
}
break;

case INDEX_op_psrlw_xmm: {
    long param1, param2;
    extern void op_psrlw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_psrlw_xmm+0), 231);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 231;
}
break;

case INDEX_op_psraw_xmm: {
    long param1, param2;
    extern void op_psraw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_psraw_xmm+0), 144);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 14) = param2 + 0;
    gen_code_ptr += 144;
}
break;

case INDEX_op_psllw_xmm: {
    long param1, param2;
    extern void op_psllw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_psllw_xmm+0), 222);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 222;
}
break;

case INDEX_op_psrld_xmm: {
    long param1, param2;
    extern void op_psrld_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_psrld_xmm+0), 111);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 111;
}
break;

case INDEX_op_psrad_xmm: {
    long param1, param2;
    extern void op_psrad_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_psrad_xmm+0), 74);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 17) = param1 + 0;
    gen_code_ptr += 74;
}
break;

case INDEX_op_pslld_xmm: {
    long param1, param2;
    extern void op_pslld_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pslld_xmm+0), 116);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 116;
}
break;

case INDEX_op_psrlq_xmm: {
    long param1, param2;
    extern void op_psrlq_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_psrlq_xmm+0), 175);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 175;
}
break;

case INDEX_op_psllq_xmm: {
    long param1, param2;
    extern void op_psllq_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_psllq_xmm+0), 175);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 175;
}
break;

case INDEX_op_psrldq_xmm: {
    long param1, param2;
    extern void op_psrldq_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_psrldq_xmm+0), 125);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 15) = param2 + 0;
    gen_code_ptr += 125;
}
break;

case INDEX_op_pslldq_xmm: {
    long param1, param2;
    extern void op_pslldq_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pslldq_xmm+0), 144);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 144;
}
break;

case INDEX_op_paddb_xmm: {
    long param1, param2;
    extern void op_paddb_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_paddb_xmm+0), 122);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 122;
}
break;

case INDEX_op_paddw_xmm: {
    long param1, param2;
    extern void op_paddw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_paddw_xmm+0), 149);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 149;
}
break;

case INDEX_op_paddl_xmm: {
    long param1, param2;
    extern void op_paddl_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_paddl_xmm+0), 34);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 10) = param1 + 0;
    gen_code_ptr += 34;
}
break;

case INDEX_op_paddq_xmm: {
    long param1, param2;
    extern void op_paddq_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_paddq_xmm+0), 50);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 50;
}
break;

case INDEX_op_psubb_xmm: {
    long param1, param2;
    extern void op_psubb_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_psubb_xmm+0), 169);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param2 + 0;
    gen_code_ptr += 169;
}
break;

case INDEX_op_psubw_xmm: {
    long param1, param2;
    extern void op_psubw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_psubw_xmm+0), 149);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 149;
}
break;

case INDEX_op_psubl_xmm: {
    long param1, param2;
    extern void op_psubl_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_psubl_xmm+0), 45);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param2 + 0;
    gen_code_ptr += 45;
}
break;

case INDEX_op_psubq_xmm: {
    long param1, param2;
    extern void op_psubq_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_psubq_xmm+0), 105);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 105;
}
break;

case INDEX_op_paddusb_xmm: {
    long param1, param2;
    extern void op_paddusb_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_paddusb_xmm+0), 615);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 615;
}
break;

case INDEX_op_paddsb_xmm: {
    long param1, param2;
    extern void op_paddsb_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_paddsb_xmm+0), 1020);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 1020;
}
break;

case INDEX_op_psubusb_xmm: {
    long param1, param2;
    extern void op_psubusb_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_psubusb_xmm+0), 911);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 911;
}
break;

case INDEX_op_psubsb_xmm: {
    long param1, param2;
    extern void op_psubsb_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_psubsb_xmm+0), 783);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 783;
}
break;

case INDEX_op_paddusw_xmm: {
    long param1, param2;
    extern void op_paddusw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_paddusw_xmm+0), 323);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 323;
}
break;

case INDEX_op_paddsw_xmm: {
    long param1, param2;
    extern void op_paddsw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_paddsw_xmm+0), 524);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 524;
}
break;

case INDEX_op_psubusw_xmm: {
    long param1, param2;
    extern void op_psubusw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_psubusw_xmm+0), 463);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 463;
}
break;

case INDEX_op_psubsw_xmm: {
    long param1, param2;
    extern void op_psubsw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_psubsw_xmm+0), 399);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 399;
}
break;

case INDEX_op_pminub_xmm: {
    long param1, param2;
    extern void op_pminub_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pminub_xmm+0), 428);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 428;
}
break;

case INDEX_op_pmaxub_xmm: {
    long param1, param2;
    extern void op_pmaxub_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pmaxub_xmm+0), 428);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 428;
}
break;

case INDEX_op_pminsw_xmm: {
    long param1, param2;
    extern void op_pminsw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pminsw_xmm+0), 240);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 240;
}
break;

case INDEX_op_pmaxsw_xmm: {
    long param1, param2;
    extern void op_pmaxsw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pmaxsw_xmm+0), 240);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 240;
}
break;

case INDEX_op_pand_xmm: {
    long param1, param2;
    extern void op_pand_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pand_xmm+0), 95);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 17) = param1 + 0;
    gen_code_ptr += 95;
}
break;

case INDEX_op_pandn_xmm: {
    long param1, param2;
    extern void op_pandn_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pandn_xmm+0), 135);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 135;
}
break;

case INDEX_op_por_xmm: {
    long param1, param2;
    extern void op_por_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_por_xmm+0), 95);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 17) = param1 + 0;
    gen_code_ptr += 95;
}
break;

case INDEX_op_pxor_xmm: {
    long param1, param2;
    extern void op_pxor_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pxor_xmm+0), 95);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 17) = param1 + 0;
    gen_code_ptr += 95;
}
break;

case INDEX_op_pcmpgtb_xmm: {
    long param1, param2;
    extern void op_pcmpgtb_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pcmpgtb_xmm+0), 249);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 249;
}
break;

case INDEX_op_pcmpgtw_xmm: {
    long param1, param2;
    extern void op_pcmpgtw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pcmpgtw_xmm+0), 169);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 169;
}
break;

case INDEX_op_pcmpgtl_xmm: {
    long param1, param2;
    extern void op_pcmpgtl_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pcmpgtl_xmm+0), 73);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 73;
}
break;

case INDEX_op_pcmpeqb_xmm: {
    long param1, param2;
    extern void op_pcmpeqb_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pcmpeqb_xmm+0), 249);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 249;
}
break;

case INDEX_op_pcmpeqw_xmm: {
    long param1, param2;
    extern void op_pcmpeqw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pcmpeqw_xmm+0), 169);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 169;
}
break;

case INDEX_op_pcmpeql_xmm: {
    long param1, param2;
    extern void op_pcmpeql_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pcmpeql_xmm+0), 73);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 73;
}
break;

case INDEX_op_pmullw_xmm: {
    long param1, param2;
    extern void op_pmullw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pmullw_xmm+0), 157);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 157;
}
break;

case INDEX_op_pmulhuw_xmm: {
    long param1, param2;
    extern void op_pmulhuw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pmulhuw_xmm+0), 195);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 195;
}
break;

case INDEX_op_pmulhw_xmm: {
    long param1, param2;
    extern void op_pmulhw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pmulhw_xmm+0), 195);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 195;
}
break;

case INDEX_op_pavgb_xmm: {
    long param1, param2;
    extern void op_pavgb_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pavgb_xmm+0), 415);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 415;
}
break;

case INDEX_op_pavgw_xmm: {
    long param1, param2;
    extern void op_pavgw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pavgw_xmm+0), 223);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 223;
}
break;

case INDEX_op_pmuludq_xmm: {
    long param1, param2;
    extern void op_pmuludq_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pmuludq_xmm+0), 59);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 59;
}
break;

case INDEX_op_pmaddwd_xmm: {
    long param1, param2;
    extern void op_pmaddwd_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pmaddwd_xmm+0), 116);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 116;
}
break;

case INDEX_op_psadbw_xmm: {
    long param1, param2;
    extern void op_psadbw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_psadbw_xmm+0), 443);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 443;
}
break;

case INDEX_op_maskmov_xmm: {
    long param1, param2;
    extern void op_maskmov_xmm();
extern char __stb_mmu;
    memcpy(gen_code_ptr, (void *)((char *)&op_maskmov_xmm+0), 183);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 136) = (long)(&__stb_mmu) - (long)(gen_code_ptr + 136) + 0 -4;
    gen_code_ptr += 183;
}
break;

case INDEX_op_movl_mm_T0_xmm: {
    long param1;
    extern void op_movl_mm_T0_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_mm_T0_xmm+0), 29);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    gen_code_ptr += 29;
}
break;

case INDEX_op_movl_T0_mm_xmm: {
    long param1;
    extern void op_movl_T0_mm_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_movl_T0_mm_xmm+0), 6);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    gen_code_ptr += 6;
}
break;

case INDEX_op_shufps: {
    long param1, param2, param3;
    extern void op_shufps();
    memcpy(gen_code_ptr, (void *)((char *)&op_shufps+0), 122);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    param3 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 19) = param3 + 0;
    gen_code_ptr += 122;
}
break;

case INDEX_op_shufpd: {
    long param1, param2, param3;
    extern void op_shufpd();
    memcpy(gen_code_ptr, (void *)((char *)&op_shufpd+0), 100);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    param3 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 1) = param3 + 0;
    *(uint32_t *)(gen_code_ptr + 12) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 43) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 54) = param2 + 4;
    gen_code_ptr += 100;
}
break;

case INDEX_op_pshufd_xmm: {
    long param1, param2, param3;
    extern void op_pshufd_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pshufd_xmm+0), 103);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    param3 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 4) = param3 + 0;
    *(uint32_t *)(gen_code_ptr + 10) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 22) = param2 + 0;
    gen_code_ptr += 103;
}
break;

case INDEX_op_pshuflw_xmm: {
    long param1, param2, param3;
    extern void op_pshuflw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pshuflw_xmm+0), 133);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    param3 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 4) = param3 + 0;
    *(uint32_t *)(gen_code_ptr + 10) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 21) = param2 + 0;
    gen_code_ptr += 133;
}
break;

case INDEX_op_pshufhw_xmm: {
    long param1, param2, param3;
    extern void op_pshufhw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pshufhw_xmm+0), 153);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    param3 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 18) = param3 + 0;
    *(uint32_t *)(gen_code_ptr + 36) = param3 + 0;
    *(uint32_t *)(gen_code_ptr + 58) = param3 + 0;
    gen_code_ptr += 153;
}
break;

case INDEX_op_addps: {
    long param1, param2;
    extern void op_addps();
    memcpy(gen_code_ptr, (void *)((char *)&op_addps+0), 45);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 45;
}
break;

case INDEX_op_addss: {
    long param1, param2;
    extern void op_addss();
    memcpy(gen_code_ptr, (void *)((char *)&op_addss+0), 16);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 16;
}
break;

case INDEX_op_addpd: {
    long param1, param2;
    extern void op_addpd();
    memcpy(gen_code_ptr, (void *)((char *)&op_addpd+0), 27);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 27;
}
break;

case INDEX_op_addsd: {
    long param1, param2;
    extern void op_addsd();
    memcpy(gen_code_ptr, (void *)((char *)&op_addsd+0), 16);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 16;
}
break;

case INDEX_op_subps: {
    long param1, param2;
    extern void op_subps();
    memcpy(gen_code_ptr, (void *)((char *)&op_subps+0), 45);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 45;
}
break;

case INDEX_op_subss: {
    long param1, param2;
    extern void op_subss();
    memcpy(gen_code_ptr, (void *)((char *)&op_subss+0), 16);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 16;
}
break;

case INDEX_op_subpd: {
    long param1, param2;
    extern void op_subpd();
    memcpy(gen_code_ptr, (void *)((char *)&op_subpd+0), 27);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 27;
}
break;

case INDEX_op_subsd: {
    long param1, param2;
    extern void op_subsd();
    memcpy(gen_code_ptr, (void *)((char *)&op_subsd+0), 16);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 16;
}
break;

case INDEX_op_mulps: {
    long param1, param2;
    extern void op_mulps();
    memcpy(gen_code_ptr, (void *)((char *)&op_mulps+0), 45);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 45;
}
break;

case INDEX_op_mulss: {
    long param1, param2;
    extern void op_mulss();
    memcpy(gen_code_ptr, (void *)((char *)&op_mulss+0), 16);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 16;
}
break;

case INDEX_op_mulpd: {
    long param1, param2;
    extern void op_mulpd();
    memcpy(gen_code_ptr, (void *)((char *)&op_mulpd+0), 27);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 27;
}
break;

case INDEX_op_mulsd: {
    long param1, param2;
    extern void op_mulsd();
    memcpy(gen_code_ptr, (void *)((char *)&op_mulsd+0), 16);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 16;
}
break;

case INDEX_op_divps: {
    long param1, param2;
    extern void op_divps();
    memcpy(gen_code_ptr, (void *)((char *)&op_divps+0), 45);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 45;
}
break;

case INDEX_op_divss: {
    long param1, param2;
    extern void op_divss();
    memcpy(gen_code_ptr, (void *)((char *)&op_divss+0), 16);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 16;
}
break;

case INDEX_op_divpd: {
    long param1, param2;
    extern void op_divpd();
    memcpy(gen_code_ptr, (void *)((char *)&op_divpd+0), 27);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 27;
}
break;

case INDEX_op_divsd: {
    long param1, param2;
    extern void op_divsd();
    memcpy(gen_code_ptr, (void *)((char *)&op_divsd+0), 16);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 16;
}
break;

case INDEX_op_minps: {
    long param1, param2;
    extern void op_minps();
    memcpy(gen_code_ptr, (void *)((char *)&op_minps+0), 153);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 153;
}
break;

case INDEX_op_minss: {
    long param1, param2;
    extern void op_minss();
    memcpy(gen_code_ptr, (void *)((char *)&op_minss+0), 41);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 41;
}
break;

case INDEX_op_minpd: {
    long param1, param2;
    extern void op_minpd();
    memcpy(gen_code_ptr, (void *)((char *)&op_minpd+0), 50);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param2 + 0;
    gen_code_ptr += 50;
}
break;

case INDEX_op_minsd: {
    long param1, param2;
    extern void op_minsd();
    memcpy(gen_code_ptr, (void *)((char *)&op_minsd+0), 29);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param2 + 0;
    gen_code_ptr += 29;
}
break;

case INDEX_op_maxps: {
    long param1, param2;
    extern void op_maxps();
    memcpy(gen_code_ptr, (void *)((char *)&op_maxps+0), 169);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 169;
}
break;

case INDEX_op_maxss: {
    long param1, param2;
    extern void op_maxss();
    memcpy(gen_code_ptr, (void *)((char *)&op_maxss+0), 45);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 45;
}
break;

case INDEX_op_maxpd: {
    long param1, param2;
    extern void op_maxpd();
    memcpy(gen_code_ptr, (void *)((char *)&op_maxpd+0), 58);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param2 + 0;
    gen_code_ptr += 58;
}
break;

case INDEX_op_maxsd: {
    long param1, param2;
    extern void op_maxsd();
    memcpy(gen_code_ptr, (void *)((char *)&op_maxsd+0), 33);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param2 + 0;
    gen_code_ptr += 33;
}
break;

case INDEX_op_sqrtps: {
    long param1, param2;
    extern void op_sqrtps();
extern char float32_sqrt;
extern char float32_sqrt;
extern char float32_sqrt;
extern char float32_sqrt;
    memcpy(gen_code_ptr, (void *)((char *)&op_sqrtps+0), 148);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 39) = (long)(&float32_sqrt) - (long)(gen_code_ptr + 39) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 70) = (long)(&float32_sqrt) - (long)(gen_code_ptr + 70) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 102) = (long)(&float32_sqrt) - (long)(gen_code_ptr + 102) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 134) = (long)(&float32_sqrt) - (long)(gen_code_ptr + 134) + 0 -4;
    gen_code_ptr += 148;
}
break;

case INDEX_op_sqrtss: {
    long param1, param2;
    extern void op_sqrtss();
extern char float32_sqrt;
    memcpy(gen_code_ptr, (void *)((char *)&op_sqrtss+0), 46);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 25) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&float32_sqrt) - (long)(gen_code_ptr + 33) + 0 -4;
    gen_code_ptr += 46;
}
break;

case INDEX_op_sqrtpd: {
    long param1, param2;
    extern void op_sqrtpd();
extern char float64_sqrt;
extern char float64_sqrt;
    memcpy(gen_code_ptr, (void *)((char *)&op_sqrtpd+0), 88);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 15) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 43) = (long)(&float64_sqrt) - (long)(gen_code_ptr + 43) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 74) = (long)(&float64_sqrt) - (long)(gen_code_ptr + 74) + 0 -4;
    gen_code_ptr += 88;
}
break;

case INDEX_op_sqrtsd: {
    long param1, param2;
    extern void op_sqrtsd();
extern char float64_sqrt;
    memcpy(gen_code_ptr, (void *)((char *)&op_sqrtsd+0), 46);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&float64_sqrt) - (long)(gen_code_ptr + 33) + 0 -4;
    gen_code_ptr += 46;
}
break;

case INDEX_op_cvtps2pd: {
    long param1, param2;
    extern void op_cvtps2pd();
extern char float32_to_float64;
extern char float32_to_float64;
    memcpy(gen_code_ptr, (void *)((char *)&op_cvtps2pd+0), 84);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 15) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 42) = (long)(&float32_to_float64) - (long)(gen_code_ptr + 42) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 70) = (long)(&float32_to_float64) - (long)(gen_code_ptr + 70) + 0 -4;
    gen_code_ptr += 84;
}
break;

case INDEX_op_cvtpd2ps: {
    long param1, param2;
    extern void op_cvtpd2ps();
extern char float64_to_float32;
extern char float64_to_float32;
    memcpy(gen_code_ptr, (void *)((char *)&op_cvtpd2ps+0), 102);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 15) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 43) = (long)(&float64_to_float32) - (long)(gen_code_ptr + 43) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 74) = (long)(&float64_to_float32) - (long)(gen_code_ptr + 74) + 0 -4;
    gen_code_ptr += 102;
}
break;

case INDEX_op_cvtss2sd: {
    long param1, param2;
    extern void op_cvtss2sd();
extern char float32_to_float64;
    memcpy(gen_code_ptr, (void *)((char *)&op_cvtss2sd+0), 46);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 25) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&float32_to_float64) - (long)(gen_code_ptr + 33) + 0 -4;
    gen_code_ptr += 46;
}
break;

case INDEX_op_cvtsd2ss: {
    long param1, param2;
    extern void op_cvtsd2ss();
extern char float64_to_float32;
    memcpy(gen_code_ptr, (void *)((char *)&op_cvtsd2ss+0), 46);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&float64_to_float32) - (long)(gen_code_ptr + 33) + 0 -4;
    gen_code_ptr += 46;
}
break;

case INDEX_op_cvtdq2ps: {
    long param1, param2;
    extern void op_cvtdq2ps();
extern char int32_to_float32;
extern char int32_to_float32;
extern char int32_to_float32;
extern char int32_to_float32;
    memcpy(gen_code_ptr, (void *)((char *)&op_cvtdq2ps+0), 148);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 39) = (long)(&int32_to_float32) - (long)(gen_code_ptr + 39) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 70) = (long)(&int32_to_float32) - (long)(gen_code_ptr + 70) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 102) = (long)(&int32_to_float32) - (long)(gen_code_ptr + 102) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 134) = (long)(&int32_to_float32) - (long)(gen_code_ptr + 134) + 0 -4;
    gen_code_ptr += 148;
}
break;

case INDEX_op_cvtdq2pd: {
    long param1, param2;
    extern void op_cvtdq2pd();
extern char int32_to_float64;
extern char int32_to_float64;
    memcpy(gen_code_ptr, (void *)((char *)&op_cvtdq2pd+0), 84);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 15) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 42) = (long)(&int32_to_float64) - (long)(gen_code_ptr + 42) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 70) = (long)(&int32_to_float64) - (long)(gen_code_ptr + 70) + 0 -4;
    gen_code_ptr += 84;
}
break;

case INDEX_op_cvtpi2ps: {
    long param1, param2;
    extern void op_cvtpi2ps();
extern char int32_to_float32;
extern char int32_to_float32;
    memcpy(gen_code_ptr, (void *)((char *)&op_cvtpi2ps+0), 84);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 39) = (long)(&int32_to_float32) - (long)(gen_code_ptr + 39) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 70) = (long)(&int32_to_float32) - (long)(gen_code_ptr + 70) + 0 -4;
    gen_code_ptr += 84;
}
break;

case INDEX_op_cvtpi2pd: {
    long param1, param2;
    extern void op_cvtpi2pd();
extern char int32_to_float64;
extern char int32_to_float64;
    memcpy(gen_code_ptr, (void *)((char *)&op_cvtpi2pd+0), 84);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 39) = (long)(&int32_to_float64) - (long)(gen_code_ptr + 39) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 70) = (long)(&int32_to_float64) - (long)(gen_code_ptr + 70) + 0 -4;
    gen_code_ptr += 84;
}
break;

case INDEX_op_cvtsi2ss: {
    long param1;
    extern void op_cvtsi2ss();
extern char int32_to_float32;
    memcpy(gen_code_ptr, (void *)((char *)&op_cvtsi2ss+0), 40);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 27) = (long)(&int32_to_float32) - (long)(gen_code_ptr + 27) + 0 -4;
    gen_code_ptr += 40;
}
break;

case INDEX_op_cvtsi2sd: {
    long param1;
    extern void op_cvtsi2sd();
extern char int32_to_float64;
    memcpy(gen_code_ptr, (void *)((char *)&op_cvtsi2sd+0), 40);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 27) = (long)(&int32_to_float64) - (long)(gen_code_ptr + 27) + 0 -4;
    gen_code_ptr += 40;
}
break;

case INDEX_op_cvtps2dq: {
    long param1, param2;
    extern void op_cvtps2dq();
extern char float32_to_int32;
extern char float32_to_int32;
extern char float32_to_int32;
extern char float32_to_int32;
    memcpy(gen_code_ptr, (void *)((char *)&op_cvtps2dq+0), 148);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 39) = (long)(&float32_to_int32) - (long)(gen_code_ptr + 39) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 70) = (long)(&float32_to_int32) - (long)(gen_code_ptr + 70) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 102) = (long)(&float32_to_int32) - (long)(gen_code_ptr + 102) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 134) = (long)(&float32_to_int32) - (long)(gen_code_ptr + 134) + 0 -4;
    gen_code_ptr += 148;
}
break;

case INDEX_op_cvtpd2dq: {
    long param1, param2;
    extern void op_cvtpd2dq();
extern char float64_to_int32;
extern char float64_to_int32;
    memcpy(gen_code_ptr, (void *)((char *)&op_cvtpd2dq+0), 98);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 39) = (long)(&float64_to_int32) - (long)(gen_code_ptr + 39) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 70) = (long)(&float64_to_int32) - (long)(gen_code_ptr + 70) + 0 -4;
    gen_code_ptr += 98;
}
break;

case INDEX_op_cvtps2pi: {
    long param1, param2;
    extern void op_cvtps2pi();
extern char float32_to_int32;
extern char float32_to_int32;
    memcpy(gen_code_ptr, (void *)((char *)&op_cvtps2pi+0), 84);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 39) = (long)(&float32_to_int32) - (long)(gen_code_ptr + 39) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 70) = (long)(&float32_to_int32) - (long)(gen_code_ptr + 70) + 0 -4;
    gen_code_ptr += 84;
}
break;

case INDEX_op_cvtpd2pi: {
    long param1, param2;
    extern void op_cvtpd2pi();
extern char float64_to_int32;
extern char float64_to_int32;
    memcpy(gen_code_ptr, (void *)((char *)&op_cvtpd2pi+0), 84);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 39) = (long)(&float64_to_int32) - (long)(gen_code_ptr + 39) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 70) = (long)(&float64_to_int32) - (long)(gen_code_ptr + 70) + 0 -4;
    gen_code_ptr += 84;
}
break;

case INDEX_op_cvtss2si: {
    long param1;
    extern void op_cvtss2si();
extern char float32_to_int32;
    memcpy(gen_code_ptr, (void *)((char *)&op_cvtss2si+0), 32);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 15) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 23) = (long)(&float32_to_int32) - (long)(gen_code_ptr + 23) + 0 -4;
    gen_code_ptr += 32;
}
break;

case INDEX_op_cvtsd2si: {
    long param1;
    extern void op_cvtsd2si();
extern char float64_to_int32;
    memcpy(gen_code_ptr, (void *)((char *)&op_cvtsd2si+0), 32);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 23) = (long)(&float64_to_int32) - (long)(gen_code_ptr + 23) + 0 -4;
    gen_code_ptr += 32;
}
break;

case INDEX_op_cvttps2dq: {
    long param1, param2;
    extern void op_cvttps2dq();
extern char float32_to_int32_round_to_zero;
extern char float32_to_int32_round_to_zero;
extern char float32_to_int32_round_to_zero;
extern char float32_to_int32_round_to_zero;
    memcpy(gen_code_ptr, (void *)((char *)&op_cvttps2dq+0), 148);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 39) = (long)(&float32_to_int32_round_to_zero) - (long)(gen_code_ptr + 39) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 70) = (long)(&float32_to_int32_round_to_zero) - (long)(gen_code_ptr + 70) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 102) = (long)(&float32_to_int32_round_to_zero) - (long)(gen_code_ptr + 102) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 134) = (long)(&float32_to_int32_round_to_zero) - (long)(gen_code_ptr + 134) + 0 -4;
    gen_code_ptr += 148;
}
break;

case INDEX_op_cvttpd2dq: {
    long param1, param2;
    extern void op_cvttpd2dq();
extern char float64_to_int32_round_to_zero;
extern char float64_to_int32_round_to_zero;
    memcpy(gen_code_ptr, (void *)((char *)&op_cvttpd2dq+0), 98);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 39) = (long)(&float64_to_int32_round_to_zero) - (long)(gen_code_ptr + 39) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 70) = (long)(&float64_to_int32_round_to_zero) - (long)(gen_code_ptr + 70) + 0 -4;
    gen_code_ptr += 98;
}
break;

case INDEX_op_cvttps2pi: {
    long param1, param2;
    extern void op_cvttps2pi();
extern char float32_to_int32_round_to_zero;
extern char float32_to_int32_round_to_zero;
    memcpy(gen_code_ptr, (void *)((char *)&op_cvttps2pi+0), 84);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 39) = (long)(&float32_to_int32_round_to_zero) - (long)(gen_code_ptr + 39) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 70) = (long)(&float32_to_int32_round_to_zero) - (long)(gen_code_ptr + 70) + 0 -4;
    gen_code_ptr += 84;
}
break;

case INDEX_op_cvttpd2pi: {
    long param1, param2;
    extern void op_cvttpd2pi();
extern char float64_to_int32_round_to_zero;
extern char float64_to_int32_round_to_zero;
    memcpy(gen_code_ptr, (void *)((char *)&op_cvttpd2pi+0), 84);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 39) = (long)(&float64_to_int32_round_to_zero) - (long)(gen_code_ptr + 39) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 70) = (long)(&float64_to_int32_round_to_zero) - (long)(gen_code_ptr + 70) + 0 -4;
    gen_code_ptr += 84;
}
break;

case INDEX_op_cvttss2si: {
    long param1;
    extern void op_cvttss2si();
extern char float32_to_int32_round_to_zero;
    memcpy(gen_code_ptr, (void *)((char *)&op_cvttss2si+0), 32);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 15) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 23) = (long)(&float32_to_int32_round_to_zero) - (long)(gen_code_ptr + 23) + 0 -4;
    gen_code_ptr += 32;
}
break;

case INDEX_op_cvttsd2si: {
    long param1;
    extern void op_cvttsd2si();
extern char float64_to_int32_round_to_zero;
    memcpy(gen_code_ptr, (void *)((char *)&op_cvttsd2si+0), 32);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 23) = (long)(&float64_to_int32_round_to_zero) - (long)(gen_code_ptr + 23) + 0 -4;
    gen_code_ptr += 32;
}
break;

case INDEX_op_rsqrtps: {
    long param1, param2;
    extern void op_rsqrtps();
extern char approx_rsqrt;
extern char approx_rsqrt;
extern char approx_rsqrt;
extern char approx_rsqrt;
    memcpy(gen_code_ptr, (void *)((char *)&op_rsqrtps+0), 108);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 29) = (long)(&approx_rsqrt) - (long)(gen_code_ptr + 29) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 50) = (long)(&approx_rsqrt) - (long)(gen_code_ptr + 50) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 72) = (long)(&approx_rsqrt) - (long)(gen_code_ptr + 72) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 94) = (long)(&approx_rsqrt) - (long)(gen_code_ptr + 94) + 0 -4;
    gen_code_ptr += 108;
}
break;

case INDEX_op_rsqrtss: {
    long param1, param2;
    extern void op_rsqrtss();
extern char approx_rsqrt;
    memcpy(gen_code_ptr, (void *)((char *)&op_rsqrtss+0), 36);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 15) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 23) = (long)(&approx_rsqrt) - (long)(gen_code_ptr + 23) + 0 -4;
    gen_code_ptr += 36;
}
break;

case INDEX_op_rcpps: {
    long param1, param2;
    extern void op_rcpps();
extern char approx_rcp;
extern char approx_rcp;
extern char approx_rcp;
extern char approx_rcp;
    memcpy(gen_code_ptr, (void *)((char *)&op_rcpps+0), 108);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 29) = (long)(&approx_rcp) - (long)(gen_code_ptr + 29) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 50) = (long)(&approx_rcp) - (long)(gen_code_ptr + 50) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 72) = (long)(&approx_rcp) - (long)(gen_code_ptr + 72) + 0 -4;
    *(uint32_t *)(gen_code_ptr + 94) = (long)(&approx_rcp) - (long)(gen_code_ptr + 94) + 0 -4;
    gen_code_ptr += 108;
}
break;

case INDEX_op_rcpss: {
    long param1, param2;
    extern void op_rcpss();
extern char approx_rcp;
    memcpy(gen_code_ptr, (void *)((char *)&op_rcpss+0), 36);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 15) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 23) = (long)(&approx_rcp) - (long)(gen_code_ptr + 23) + 0 -4;
    gen_code_ptr += 36;
}
break;

case INDEX_op_haddps: {
    long param1, param2;
    extern void op_haddps();
    memcpy(gen_code_ptr, (void *)((char *)&op_haddps+0), 81);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 81;
}
break;

case INDEX_op_haddpd: {
    long param1, param2;
    extern void op_haddpd();
    memcpy(gen_code_ptr, (void *)((char *)&op_haddpd+0), 62);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 22) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 28) = param2 + 8;
    gen_code_ptr += 62;
}
break;

case INDEX_op_hsubps: {
    long param1, param2;
    extern void op_hsubps();
    memcpy(gen_code_ptr, (void *)((char *)&op_hsubps+0), 81);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 81;
}
break;

case INDEX_op_hsubpd: {
    long param1, param2;
    extern void op_hsubpd();
    memcpy(gen_code_ptr, (void *)((char *)&op_hsubpd+0), 62);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 22) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 28) = param2 + 8;
    gen_code_ptr += 62;
}
break;

case INDEX_op_addsubps: {
    long param1, param2;
    extern void op_addsubps();
    memcpy(gen_code_ptr, (void *)((char *)&op_addsubps+0), 45);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 45;
}
break;

case INDEX_op_addsubpd: {
    long param1, param2;
    extern void op_addsubpd();
    memcpy(gen_code_ptr, (void *)((char *)&op_addsubpd+0), 27);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 27;
}
break;

case INDEX_op_cmpeqps: {
    long param1, param2;
    extern void op_cmpeqps();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpeqps+0), 153);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 153;
}
break;

case INDEX_op_cmpeqss: {
    long param1, param2;
    extern void op_cmpeqss();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpeqss+0), 39);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 39;
}
break;

case INDEX_op_cmpeqpd: {
    long param1, param2;
    extern void op_cmpeqpd();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpeqpd+0), 115);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 115;
}
break;

case INDEX_op_cmpeqsd: {
    long param1, param2;
    extern void op_cmpeqsd();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpeqsd+0), 58);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 16) = param2 + 0;
    gen_code_ptr += 58;
}
break;

case INDEX_op_cmpltps: {
    long param1, param2;
    extern void op_cmpltps();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpltps+0), 127);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param2 + 0;
    gen_code_ptr += 127;
}
break;

case INDEX_op_cmpltss: {
    long param1, param2;
    extern void op_cmpltss();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpltss+0), 38);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 38;
}
break;

case INDEX_op_cmpltpd: {
    long param1, param2;
    extern void op_cmpltpd();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpltpd+0), 99);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 99;
}
break;

case INDEX_op_cmpltsd: {
    long param1, param2;
    extern void op_cmpltsd();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpltsd+0), 50);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 16) = param2 + 0;
    gen_code_ptr += 50;
}
break;

case INDEX_op_cmpleps: {
    long param1, param2;
    extern void op_cmpleps();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpleps+0), 127);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param2 + 0;
    gen_code_ptr += 127;
}
break;

case INDEX_op_cmpless: {
    long param1, param2;
    extern void op_cmpless();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpless+0), 38);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 38;
}
break;

case INDEX_op_cmplepd: {
    long param1, param2;
    extern void op_cmplepd();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmplepd+0), 99);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 99;
}
break;

case INDEX_op_cmplesd: {
    long param1, param2;
    extern void op_cmplesd();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmplesd+0), 50);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 16) = param2 + 0;
    gen_code_ptr += 50;
}
break;

case INDEX_op_cmpunordps: {
    long param1, param2;
    extern void op_cmpunordps();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpunordps+0), 117);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param2 + 0;
    gen_code_ptr += 117;
}
break;

case INDEX_op_cmpunordss: {
    long param1, param2;
    extern void op_cmpunordss();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpunordss+0), 34);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 34;
}
break;

case INDEX_op_cmpunordpd: {
    long param1, param2;
    extern void op_cmpunordpd();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpunordpd+0), 95);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 95;
}
break;

case INDEX_op_cmpunordsd: {
    long param1, param2;
    extern void op_cmpunordsd();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpunordsd+0), 48);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 16) = param2 + 0;
    gen_code_ptr += 48;
}
break;

case INDEX_op_cmpneqps: {
    long param1, param2;
    extern void op_cmpneqps();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpneqps+0), 145);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 145;
}
break;

case INDEX_op_cmpneqss: {
    long param1, param2;
    extern void op_cmpneqss();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpneqss+0), 37);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 37;
}
break;

case INDEX_op_cmpneqpd: {
    long param1, param2;
    extern void op_cmpneqpd();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpneqpd+0), 150);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 150;
}
break;

case INDEX_op_cmpneqsd: {
    long param1, param2;
    extern void op_cmpneqsd();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpneqsd+0), 59);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 16) = param2 + 0;
    gen_code_ptr += 59;
}
break;

case INDEX_op_cmpnltps: {
    long param1, param2;
    extern void op_cmpnltps();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpnltps+0), 119);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param2 + 0;
    gen_code_ptr += 119;
}
break;

case INDEX_op_cmpnltss: {
    long param1, param2;
    extern void op_cmpnltss();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpnltss+0), 36);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 36;
}
break;

case INDEX_op_cmpnltpd: {
    long param1, param2;
    extern void op_cmpnltpd();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpnltpd+0), 136);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 136;
}
break;

case INDEX_op_cmpnltsd: {
    long param1, param2;
    extern void op_cmpnltsd();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpnltsd+0), 51);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 16) = param2 + 0;
    gen_code_ptr += 51;
}
break;

case INDEX_op_cmpnleps: {
    long param1, param2;
    extern void op_cmpnleps();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpnleps+0), 119);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param2 + 0;
    gen_code_ptr += 119;
}
break;

case INDEX_op_cmpnless: {
    long param1, param2;
    extern void op_cmpnless();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpnless+0), 36);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 36;
}
break;

case INDEX_op_cmpnlepd: {
    long param1, param2;
    extern void op_cmpnlepd();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpnlepd+0), 136);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 136;
}
break;

case INDEX_op_cmpnlesd: {
    long param1, param2;
    extern void op_cmpnlesd();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpnlesd+0), 51);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 16) = param2 + 0;
    gen_code_ptr += 51;
}
break;

case INDEX_op_cmpordps: {
    long param1, param2;
    extern void op_cmpordps();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpordps+0), 109);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param2 + 0;
    gen_code_ptr += 109;
}
break;

case INDEX_op_cmpordss: {
    long param1, param2;
    extern void op_cmpordss();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpordss+0), 32);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 8) = param1 + 0;
    gen_code_ptr += 32;
}
break;

case INDEX_op_cmpordpd: {
    long param1, param2;
    extern void op_cmpordpd();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpordpd+0), 130);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 130;
}
break;

case INDEX_op_cmpordsd: {
    long param1, param2;
    extern void op_cmpordsd();
    memcpy(gen_code_ptr, (void *)((char *)&op_cmpordsd+0), 49);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 16) = param2 + 0;
    gen_code_ptr += 49;
}
break;

case INDEX_op_ucomiss: {
    long param1, param2;
    extern void op_ucomiss();
extern char float32_compare_quiet;
    memcpy(gen_code_ptr, (void *)((char *)&op_ucomiss+0), 50);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 21) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&float32_compare_quiet) - (long)(gen_code_ptr + 33) + 0 -4;
    gen_code_ptr += 50;
}
break;

case INDEX_op_comiss: {
    long param1, param2;
    extern void op_comiss();
extern char float32_compare;
    memcpy(gen_code_ptr, (void *)((char *)&op_comiss+0), 50);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 21) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 33) = (long)(&float32_compare) - (long)(gen_code_ptr + 33) + 0 -4;
    gen_code_ptr += 50;
}
break;

case INDEX_op_ucomisd: {
    long param1, param2;
    extern void op_ucomisd();
extern char float64_compare_quiet;
    memcpy(gen_code_ptr, (void *)((char *)&op_ucomisd+0), 52);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 17) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 35) = (long)(&float64_compare_quiet) - (long)(gen_code_ptr + 35) + 0 -4;
    gen_code_ptr += 52;
}
break;

case INDEX_op_comisd: {
    long param1, param2;
    extern void op_comisd();
extern char float64_compare;
    memcpy(gen_code_ptr, (void *)((char *)&op_comisd+0), 52);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 17) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 35) = (long)(&float64_compare) - (long)(gen_code_ptr + 35) + 0 -4;
    gen_code_ptr += 52;
}
break;

case INDEX_op_movmskps: {
    long param1;
    extern void op_movmskps();
    memcpy(gen_code_ptr, (void *)((char *)&op_movmskps+0), 53);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    gen_code_ptr += 53;
}
break;

case INDEX_op_movmskpd: {
    long param1;
    extern void op_movmskpd();
    memcpy(gen_code_ptr, (void *)((char *)&op_movmskpd+0), 24);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    gen_code_ptr += 24;
}
break;

case INDEX_op_pmovmskb_xmm: {
    long param1;
    extern void op_pmovmskb_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pmovmskb_xmm+0), 208);
    param1 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 2) = param1 + 0;
    gen_code_ptr += 208;
}
break;

case INDEX_op_pinsrw_xmm: {
    long param1, param2;
    extern void op_pinsrw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pinsrw_xmm+0), 13);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 1) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 9) = param1 + 0;
    gen_code_ptr += 13;
}
break;

case INDEX_op_pextrw_xmm: {
    long param1, param2;
    extern void op_pextrw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_pextrw_xmm+0), 13);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 1) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 9) = param1 + 0;
    gen_code_ptr += 13;
}
break;

case INDEX_op_packsswb_xmm: {
    long param1, param2;
    extern void op_packsswb_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_packsswb_xmm+0), 670);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 670;
}
break;

case INDEX_op_packuswb_xmm: {
    long param1, param2;
    extern void op_packuswb_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_packuswb_xmm+0), 518);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 518;
}
break;

case INDEX_op_packssdw_xmm: {
    long param1, param2;
    extern void op_packssdw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_packssdw_xmm+0), 425);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param1 + 0;
    gen_code_ptr += 425;
}
break;

case INDEX_op_punpcklbw_xmm: {
    long param1, param2;
    extern void op_punpcklbw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_punpcklbw_xmm+0), 169);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 169;
}
break;

case INDEX_op_punpcklwd_xmm: {
    long param1, param2;
    extern void op_punpcklwd_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_punpcklwd_xmm+0), 113);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 113;
}
break;

case INDEX_op_punpckldq_xmm: {
    long param1, param2;
    extern void op_punpckldq_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_punpckldq_xmm+0), 49);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 13) = param1 + 0;
    gen_code_ptr += 49;
}
break;

case INDEX_op_punpcklqdq_xmm: {
    long param1, param2;
    extern void op_punpcklqdq_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_punpcklqdq_xmm+0), 70);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 19) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 29) = param2 + 4;
    gen_code_ptr += 70;
}
break;

case INDEX_op_punpckhbw_xmm: {
    long param1, param2;
    extern void op_punpckhbw_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_punpckhbw_xmm+0), 171);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 171;
}
break;

case INDEX_op_punpckhwd_xmm: {
    long param1, param2;
    extern void op_punpckhwd_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_punpckhwd_xmm+0), 115);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 11) = param2 + 0;
    gen_code_ptr += 115;
}
break;

case INDEX_op_punpckhdq_xmm: {
    long param1, param2;
    extern void op_punpckhdq_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_punpckhdq_xmm+0), 47);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param2 + 0;
    *(uint32_t *)(gen_code_ptr + 14) = param1 + 0;
    gen_code_ptr += 47;
}
break;

case INDEX_op_punpckhqdq_xmm: {
    long param1, param2;
    extern void op_punpckhqdq_xmm();
    memcpy(gen_code_ptr, (void *)((char *)&op_punpckhqdq_xmm+0), 71);
    param1 = *opparam_ptr++;
    param2 = *opparam_ptr++;
    *(uint32_t *)(gen_code_ptr + 5) = param1 + 0;
    *(uint32_t *)(gen_code_ptr + 20) = param2 + 8;
    *(uint32_t *)(gen_code_ptr + 30) = param2 + 12;
    gen_code_ptr += 71;
}
break;

case INDEX_op_vmrun: {
    extern void op_vmrun();
extern char helper_vmrun;
    memcpy(gen_code_ptr, (void *)((char *)&op_vmrun+0), 15);
    *(uint32_t *)(gen_code_ptr + 10) = (long)(&helper_vmrun) - (long)(gen_code_ptr + 10) + 0 -4;
    gen_code_ptr += 15;
}
break;

case INDEX_op_vmmcall: {
    extern void op_vmmcall();
extern char helper_vmmcall;
    memcpy(gen_code_ptr, (void *)((char *)&op_vmmcall+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_vmmcall) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_vmload: {
    extern void op_vmload();
extern char helper_vmload;
    memcpy(gen_code_ptr, (void *)((char *)&op_vmload+0), 15);
    *(uint32_t *)(gen_code_ptr + 10) = (long)(&helper_vmload) - (long)(gen_code_ptr + 10) + 0 -4;
    gen_code_ptr += 15;
}
break;

case INDEX_op_vmsave: {
    extern void op_vmsave();
extern char helper_vmsave;
    memcpy(gen_code_ptr, (void *)((char *)&op_vmsave+0), 15);
    *(uint32_t *)(gen_code_ptr + 10) = (long)(&helper_vmsave) - (long)(gen_code_ptr + 10) + 0 -4;
    gen_code_ptr += 15;
}
break;

case INDEX_op_stgi: {
    extern void op_stgi();
extern char helper_stgi;
    memcpy(gen_code_ptr, (void *)((char *)&op_stgi+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_stgi) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_clgi: {
    extern void op_clgi();
extern char helper_clgi;
    memcpy(gen_code_ptr, (void *)((char *)&op_clgi+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_clgi) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_skinit: {
    extern void op_skinit();
extern char helper_skinit;
    memcpy(gen_code_ptr, (void *)((char *)&op_skinit+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_skinit) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

case INDEX_op_invlpga: {
    extern void op_invlpga();
extern char helper_invlpga;
    memcpy(gen_code_ptr, (void *)((char *)&op_invlpga+0), 5);
    *(uint32_t *)(gen_code_ptr + 1) = (long)(&helper_invlpga) - (long)(gen_code_ptr + 1) + 0 -4;
    gen_code_ptr += 5;
}
break;

        case INDEX_op_nop:
            break;
        case INDEX_op_nop1:
            opparam_ptr++;
            break;
        case INDEX_op_nop2:
            opparam_ptr += 2;
            break;
        case INDEX_op_nop3:
            opparam_ptr += 3;
            break;
        default:
            goto the_end;
        }
    }
 the_end:
flush_icache_range((unsigned long)gen_code_buf, (unsigned long)gen_code_ptr);
return gen_code_ptr -  gen_code_buf;
}

