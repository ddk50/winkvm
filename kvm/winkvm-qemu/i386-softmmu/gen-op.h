#include "dyngen-op.h"
static inline void gen_op_movl_A0_EAX(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_A0_EAX;
}

static inline void gen_op_addl_A0_EAX(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_EAX;
}

static inline void gen_op_addl_A0_EAX_s1(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_EAX_s1;
}

static inline void gen_op_addl_A0_EAX_s2(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_EAX_s2;
}

static inline void gen_op_addl_A0_EAX_s3(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_EAX_s3;
}

static inline void gen_op_movl_T0_EAX(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_T0_EAX;
}

static inline void gen_op_movl_T1_EAX(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_T1_EAX;
}

static inline void gen_op_movh_T0_EAX(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_T0_EAX;
}

static inline void gen_op_movh_T1_EAX(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_T1_EAX;
}

static inline void gen_op_movl_EAX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_EAX_T0;
}

static inline void gen_op_movl_EAX_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_EAX_T1;
}

static inline void gen_op_movl_EAX_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_EAX_A0;
}

static inline void gen_op_cmovw_EAX_T1_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_cmovw_EAX_T1_T0;
}

static inline void gen_op_cmovl_EAX_T1_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_cmovl_EAX_T1_T0;
}

static inline void gen_op_movw_EAX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_EAX_T0;
}

static inline void gen_op_movw_EAX_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_EAX_T1;
}

static inline void gen_op_movw_EAX_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_EAX_A0;
}

static inline void gen_op_movb_EAX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movb_EAX_T0;
}

static inline void gen_op_movh_EAX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_EAX_T0;
}

static inline void gen_op_movb_EAX_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movb_EAX_T1;
}

static inline void gen_op_movh_EAX_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_EAX_T1;
}

static inline void gen_op_movl_A0_ECX(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_A0_ECX;
}

static inline void gen_op_addl_A0_ECX(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_ECX;
}

static inline void gen_op_addl_A0_ECX_s1(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_ECX_s1;
}

static inline void gen_op_addl_A0_ECX_s2(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_ECX_s2;
}

static inline void gen_op_addl_A0_ECX_s3(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_ECX_s3;
}

static inline void gen_op_movl_T0_ECX(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_T0_ECX;
}

static inline void gen_op_movl_T1_ECX(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_T1_ECX;
}

static inline void gen_op_movh_T0_ECX(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_T0_ECX;
}

static inline void gen_op_movh_T1_ECX(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_T1_ECX;
}

static inline void gen_op_movl_ECX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_ECX_T0;
}

static inline void gen_op_movl_ECX_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_ECX_T1;
}

static inline void gen_op_movl_ECX_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_ECX_A0;
}

static inline void gen_op_cmovw_ECX_T1_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_cmovw_ECX_T1_T0;
}

static inline void gen_op_cmovl_ECX_T1_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_cmovl_ECX_T1_T0;
}

static inline void gen_op_movw_ECX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_ECX_T0;
}

static inline void gen_op_movw_ECX_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_ECX_T1;
}

static inline void gen_op_movw_ECX_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_ECX_A0;
}

static inline void gen_op_movb_ECX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movb_ECX_T0;
}

static inline void gen_op_movh_ECX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_ECX_T0;
}

static inline void gen_op_movb_ECX_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movb_ECX_T1;
}

static inline void gen_op_movh_ECX_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_ECX_T1;
}

static inline void gen_op_movl_A0_EDX(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_A0_EDX;
}

static inline void gen_op_addl_A0_EDX(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_EDX;
}

static inline void gen_op_addl_A0_EDX_s1(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_EDX_s1;
}

static inline void gen_op_addl_A0_EDX_s2(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_EDX_s2;
}

static inline void gen_op_addl_A0_EDX_s3(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_EDX_s3;
}

static inline void gen_op_movl_T0_EDX(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_T0_EDX;
}

static inline void gen_op_movl_T1_EDX(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_T1_EDX;
}

static inline void gen_op_movh_T0_EDX(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_T0_EDX;
}

static inline void gen_op_movh_T1_EDX(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_T1_EDX;
}

static inline void gen_op_movl_EDX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_EDX_T0;
}

static inline void gen_op_movl_EDX_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_EDX_T1;
}

static inline void gen_op_movl_EDX_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_EDX_A0;
}

static inline void gen_op_cmovw_EDX_T1_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_cmovw_EDX_T1_T0;
}

static inline void gen_op_cmovl_EDX_T1_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_cmovl_EDX_T1_T0;
}

static inline void gen_op_movw_EDX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_EDX_T0;
}

static inline void gen_op_movw_EDX_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_EDX_T1;
}

static inline void gen_op_movw_EDX_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_EDX_A0;
}

static inline void gen_op_movb_EDX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movb_EDX_T0;
}

static inline void gen_op_movh_EDX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_EDX_T0;
}

static inline void gen_op_movb_EDX_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movb_EDX_T1;
}

static inline void gen_op_movh_EDX_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_EDX_T1;
}

static inline void gen_op_movl_A0_EBX(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_A0_EBX;
}

static inline void gen_op_addl_A0_EBX(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_EBX;
}

static inline void gen_op_addl_A0_EBX_s1(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_EBX_s1;
}

static inline void gen_op_addl_A0_EBX_s2(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_EBX_s2;
}

static inline void gen_op_addl_A0_EBX_s3(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_EBX_s3;
}

static inline void gen_op_movl_T0_EBX(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_T0_EBX;
}

static inline void gen_op_movl_T1_EBX(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_T1_EBX;
}

static inline void gen_op_movh_T0_EBX(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_T0_EBX;
}

static inline void gen_op_movh_T1_EBX(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_T1_EBX;
}

static inline void gen_op_movl_EBX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_EBX_T0;
}

static inline void gen_op_movl_EBX_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_EBX_T1;
}

static inline void gen_op_movl_EBX_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_EBX_A0;
}

static inline void gen_op_cmovw_EBX_T1_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_cmovw_EBX_T1_T0;
}

static inline void gen_op_cmovl_EBX_T1_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_cmovl_EBX_T1_T0;
}

static inline void gen_op_movw_EBX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_EBX_T0;
}

static inline void gen_op_movw_EBX_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_EBX_T1;
}

static inline void gen_op_movw_EBX_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_EBX_A0;
}

static inline void gen_op_movb_EBX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movb_EBX_T0;
}

static inline void gen_op_movh_EBX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_EBX_T0;
}

static inline void gen_op_movb_EBX_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movb_EBX_T1;
}

static inline void gen_op_movh_EBX_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_EBX_T1;
}

static inline void gen_op_movl_A0_ESP(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_A0_ESP;
}

static inline void gen_op_addl_A0_ESP(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_ESP;
}

static inline void gen_op_addl_A0_ESP_s1(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_ESP_s1;
}

static inline void gen_op_addl_A0_ESP_s2(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_ESP_s2;
}

static inline void gen_op_addl_A0_ESP_s3(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_ESP_s3;
}

static inline void gen_op_movl_T0_ESP(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_T0_ESP;
}

static inline void gen_op_movl_T1_ESP(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_T1_ESP;
}

static inline void gen_op_movh_T0_ESP(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_T0_ESP;
}

static inline void gen_op_movh_T1_ESP(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_T1_ESP;
}

static inline void gen_op_movl_ESP_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_ESP_T0;
}

static inline void gen_op_movl_ESP_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_ESP_T1;
}

static inline void gen_op_movl_ESP_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_ESP_A0;
}

static inline void gen_op_cmovw_ESP_T1_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_cmovw_ESP_T1_T0;
}

static inline void gen_op_cmovl_ESP_T1_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_cmovl_ESP_T1_T0;
}

static inline void gen_op_movw_ESP_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_ESP_T0;
}

static inline void gen_op_movw_ESP_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_ESP_T1;
}

static inline void gen_op_movw_ESP_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_ESP_A0;
}

static inline void gen_op_movb_ESP_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movb_ESP_T0;
}

static inline void gen_op_movh_ESP_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_ESP_T0;
}

static inline void gen_op_movb_ESP_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movb_ESP_T1;
}

static inline void gen_op_movh_ESP_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_ESP_T1;
}

static inline void gen_op_movl_A0_EBP(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_A0_EBP;
}

static inline void gen_op_addl_A0_EBP(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_EBP;
}

static inline void gen_op_addl_A0_EBP_s1(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_EBP_s1;
}

static inline void gen_op_addl_A0_EBP_s2(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_EBP_s2;
}

static inline void gen_op_addl_A0_EBP_s3(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_EBP_s3;
}

static inline void gen_op_movl_T0_EBP(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_T0_EBP;
}

static inline void gen_op_movl_T1_EBP(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_T1_EBP;
}

static inline void gen_op_movh_T0_EBP(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_T0_EBP;
}

static inline void gen_op_movh_T1_EBP(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_T1_EBP;
}

static inline void gen_op_movl_EBP_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_EBP_T0;
}

static inline void gen_op_movl_EBP_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_EBP_T1;
}

static inline void gen_op_movl_EBP_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_EBP_A0;
}

static inline void gen_op_cmovw_EBP_T1_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_cmovw_EBP_T1_T0;
}

static inline void gen_op_cmovl_EBP_T1_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_cmovl_EBP_T1_T0;
}

static inline void gen_op_movw_EBP_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_EBP_T0;
}

static inline void gen_op_movw_EBP_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_EBP_T1;
}

static inline void gen_op_movw_EBP_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_EBP_A0;
}

static inline void gen_op_movb_EBP_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movb_EBP_T0;
}

static inline void gen_op_movh_EBP_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_EBP_T0;
}

static inline void gen_op_movb_EBP_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movb_EBP_T1;
}

static inline void gen_op_movh_EBP_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_EBP_T1;
}

static inline void gen_op_movl_A0_ESI(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_A0_ESI;
}

static inline void gen_op_addl_A0_ESI(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_ESI;
}

static inline void gen_op_addl_A0_ESI_s1(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_ESI_s1;
}

static inline void gen_op_addl_A0_ESI_s2(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_ESI_s2;
}

static inline void gen_op_addl_A0_ESI_s3(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_ESI_s3;
}

static inline void gen_op_movl_T0_ESI(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_T0_ESI;
}

static inline void gen_op_movl_T1_ESI(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_T1_ESI;
}

static inline void gen_op_movh_T0_ESI(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_T0_ESI;
}

static inline void gen_op_movh_T1_ESI(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_T1_ESI;
}

static inline void gen_op_movl_ESI_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_ESI_T0;
}

static inline void gen_op_movl_ESI_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_ESI_T1;
}

static inline void gen_op_movl_ESI_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_ESI_A0;
}

static inline void gen_op_cmovw_ESI_T1_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_cmovw_ESI_T1_T0;
}

static inline void gen_op_cmovl_ESI_T1_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_cmovl_ESI_T1_T0;
}

static inline void gen_op_movw_ESI_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_ESI_T0;
}

static inline void gen_op_movw_ESI_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_ESI_T1;
}

static inline void gen_op_movw_ESI_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_ESI_A0;
}

static inline void gen_op_movb_ESI_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movb_ESI_T0;
}

static inline void gen_op_movh_ESI_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_ESI_T0;
}

static inline void gen_op_movb_ESI_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movb_ESI_T1;
}

static inline void gen_op_movh_ESI_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_ESI_T1;
}

static inline void gen_op_movl_A0_EDI(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_A0_EDI;
}

static inline void gen_op_addl_A0_EDI(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_EDI;
}

static inline void gen_op_addl_A0_EDI_s1(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_EDI_s1;
}

static inline void gen_op_addl_A0_EDI_s2(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_EDI_s2;
}

static inline void gen_op_addl_A0_EDI_s3(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_EDI_s3;
}

static inline void gen_op_movl_T0_EDI(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_T0_EDI;
}

static inline void gen_op_movl_T1_EDI(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_T1_EDI;
}

static inline void gen_op_movh_T0_EDI(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_T0_EDI;
}

static inline void gen_op_movh_T1_EDI(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_T1_EDI;
}

static inline void gen_op_movl_EDI_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_EDI_T0;
}

static inline void gen_op_movl_EDI_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_EDI_T1;
}

static inline void gen_op_movl_EDI_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_EDI_A0;
}

static inline void gen_op_cmovw_EDI_T1_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_cmovw_EDI_T1_T0;
}

static inline void gen_op_cmovl_EDI_T1_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_cmovl_EDI_T1_T0;
}

static inline void gen_op_movw_EDI_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_EDI_T0;
}

static inline void gen_op_movw_EDI_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_EDI_T1;
}

static inline void gen_op_movw_EDI_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_EDI_A0;
}

static inline void gen_op_movb_EDI_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movb_EDI_T0;
}

static inline void gen_op_movh_EDI_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_EDI_T0;
}

static inline void gen_op_movb_EDI_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movb_EDI_T1;
}

static inline void gen_op_movh_EDI_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movh_EDI_T1;
}

static inline void gen_op_update2_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_update2_cc;
}

static inline void gen_op_update1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_update1_cc;
}

static inline void gen_op_update_neg_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_update_neg_cc;
}

static inline void gen_op_cmpl_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_cmpl_T0_T1_cc;
}

static inline void gen_op_update_inc_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_update_inc_cc;
}

static inline void gen_op_testl_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_testl_T0_T1_cc;
}

static inline void gen_op_addl_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_T0_T1;
}

static inline void gen_op_orl_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_orl_T0_T1;
}

static inline void gen_op_andl_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_andl_T0_T1;
}

static inline void gen_op_subl_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_subl_T0_T1;
}

static inline void gen_op_xorl_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_xorl_T0_T1;
}

static inline void gen_op_negl_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_negl_T0;
}

static inline void gen_op_incl_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_incl_T0;
}

static inline void gen_op_decl_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_decl_T0;
}

static inline void gen_op_notl_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_notl_T0;
}

static inline void gen_op_bswapl_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_bswapl_T0;
}

static inline void gen_op_mulb_AL_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_mulb_AL_T0;
}

static inline void gen_op_imulb_AL_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_imulb_AL_T0;
}

static inline void gen_op_mulw_AX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_mulw_AX_T0;
}

static inline void gen_op_imulw_AX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_imulw_AX_T0;
}

static inline void gen_op_mull_EAX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_mull_EAX_T0;
}

static inline void gen_op_imull_EAX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_imull_EAX_T0;
}

static inline void gen_op_imulw_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_imulw_T0_T1;
}

static inline void gen_op_imull_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_imull_T0_T1;
}

static inline void gen_op_divb_AL_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_divb_AL_T0;
}

static inline void gen_op_idivb_AL_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_idivb_AL_T0;
}

static inline void gen_op_divw_AX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_divw_AX_T0;
}

static inline void gen_op_idivw_AX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_idivw_AX_T0;
}

static inline void gen_op_divl_EAX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_divl_EAX_T0;
}

static inline void gen_op_idivl_EAX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_idivl_EAX_T0;
}

static inline void gen_op_movl_T0_imu(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movl_T0_imu;
}

static inline void gen_op_movl_T0_im(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movl_T0_im;
}

static inline void gen_op_addl_T0_im(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_addl_T0_im;
}

static inline void gen_op_andl_T0_ffff(void)
{
    *gen_opc_ptr++ = INDEX_op_andl_T0_ffff;
}

static inline void gen_op_andl_T0_im(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_andl_T0_im;
}

static inline void gen_op_movl_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_T0_T1;
}

static inline void gen_op_movl_T1_imu(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movl_T1_imu;
}

static inline void gen_op_movl_T1_im(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movl_T1_im;
}

static inline void gen_op_addl_T1_im(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_addl_T1_im;
}

static inline void gen_op_movl_T1_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_T1_A0;
}

static inline void gen_op_movl_A0_im(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movl_A0_im;
}

static inline void gen_op_addl_A0_im(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_addl_A0_im;
}

static inline void gen_op_movl_A0_seg(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movl_A0_seg;
}

static inline void gen_op_addl_A0_seg(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_addl_A0_seg;
}

static inline void gen_op_addl_A0_AL(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_AL;
}

static inline void gen_op_andl_A0_ffff(void)
{
    *gen_opc_ptr++ = INDEX_op_andl_A0_ffff;
}

static inline void gen_op_ldub_raw_T0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_ldub_raw_T0_A0;
}

static inline void gen_op_ldsb_raw_T0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_ldsb_raw_T0_A0;
}

static inline void gen_op_lduw_raw_T0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_lduw_raw_T0_A0;
}

static inline void gen_op_ldsw_raw_T0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_ldsw_raw_T0_A0;
}

static inline void gen_op_ldl_raw_T0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_ldl_raw_T0_A0;
}

static inline void gen_op_ldub_raw_T1_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_ldub_raw_T1_A0;
}

static inline void gen_op_ldsb_raw_T1_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_ldsb_raw_T1_A0;
}

static inline void gen_op_lduw_raw_T1_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_lduw_raw_T1_A0;
}

static inline void gen_op_ldsw_raw_T1_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_ldsw_raw_T1_A0;
}

static inline void gen_op_ldl_raw_T1_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_ldl_raw_T1_A0;
}

static inline void gen_op_stb_raw_T0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_stb_raw_T0_A0;
}

static inline void gen_op_stw_raw_T0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_stw_raw_T0_A0;
}

static inline void gen_op_stl_raw_T0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_stl_raw_T0_A0;
}

static inline void gen_op_stw_raw_T1_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_stw_raw_T1_A0;
}

static inline void gen_op_stl_raw_T1_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_stl_raw_T1_A0;
}

static inline void gen_op_ldq_raw_env_A0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_ldq_raw_env_A0;
}

static inline void gen_op_stq_raw_env_A0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_stq_raw_env_A0;
}

static inline void gen_op_ldo_raw_env_A0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_ldo_raw_env_A0;
}

static inline void gen_op_sto_raw_env_A0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_sto_raw_env_A0;
}

static inline void gen_op_ldub_kernel_T0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_ldub_kernel_T0_A0;
}

static inline void gen_op_ldsb_kernel_T0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_ldsb_kernel_T0_A0;
}

static inline void gen_op_lduw_kernel_T0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_lduw_kernel_T0_A0;
}

static inline void gen_op_ldsw_kernel_T0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_ldsw_kernel_T0_A0;
}

static inline void gen_op_ldl_kernel_T0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_ldl_kernel_T0_A0;
}

static inline void gen_op_ldub_kernel_T1_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_ldub_kernel_T1_A0;
}

static inline void gen_op_ldsb_kernel_T1_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_ldsb_kernel_T1_A0;
}

static inline void gen_op_lduw_kernel_T1_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_lduw_kernel_T1_A0;
}

static inline void gen_op_ldsw_kernel_T1_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_ldsw_kernel_T1_A0;
}

static inline void gen_op_ldl_kernel_T1_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_ldl_kernel_T1_A0;
}

static inline void gen_op_stb_kernel_T0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_stb_kernel_T0_A0;
}

static inline void gen_op_stw_kernel_T0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_stw_kernel_T0_A0;
}

static inline void gen_op_stl_kernel_T0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_stl_kernel_T0_A0;
}

static inline void gen_op_stw_kernel_T1_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_stw_kernel_T1_A0;
}

static inline void gen_op_stl_kernel_T1_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_stl_kernel_T1_A0;
}

static inline void gen_op_ldq_kernel_env_A0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_ldq_kernel_env_A0;
}

static inline void gen_op_stq_kernel_env_A0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_stq_kernel_env_A0;
}

static inline void gen_op_ldo_kernel_env_A0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_ldo_kernel_env_A0;
}

static inline void gen_op_sto_kernel_env_A0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_sto_kernel_env_A0;
}

static inline void gen_op_ldub_user_T0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_ldub_user_T0_A0;
}

static inline void gen_op_ldsb_user_T0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_ldsb_user_T0_A0;
}

static inline void gen_op_lduw_user_T0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_lduw_user_T0_A0;
}

static inline void gen_op_ldsw_user_T0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_ldsw_user_T0_A0;
}

static inline void gen_op_ldl_user_T0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_ldl_user_T0_A0;
}

static inline void gen_op_ldub_user_T1_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_ldub_user_T1_A0;
}

static inline void gen_op_ldsb_user_T1_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_ldsb_user_T1_A0;
}

static inline void gen_op_lduw_user_T1_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_lduw_user_T1_A0;
}

static inline void gen_op_ldsw_user_T1_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_ldsw_user_T1_A0;
}

static inline void gen_op_ldl_user_T1_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_ldl_user_T1_A0;
}

static inline void gen_op_stb_user_T0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_stb_user_T0_A0;
}

static inline void gen_op_stw_user_T0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_stw_user_T0_A0;
}

static inline void gen_op_stl_user_T0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_stl_user_T0_A0;
}

static inline void gen_op_stw_user_T1_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_stw_user_T1_A0;
}

static inline void gen_op_stl_user_T1_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_stl_user_T1_A0;
}

static inline void gen_op_ldq_user_env_A0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_ldq_user_env_A0;
}

static inline void gen_op_stq_user_env_A0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_stq_user_env_A0;
}

static inline void gen_op_ldo_user_env_A0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_ldo_user_env_A0;
}

static inline void gen_op_sto_user_env_A0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_sto_user_env_A0;
}

static inline void gen_op_jmp_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_jmp_T0;
}

static inline void gen_op_movl_eip_im(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movl_eip_im;
}

static inline void gen_op_hlt(void)
{
    *gen_opc_ptr++ = INDEX_op_hlt;
}

static inline void gen_op_monitor(void)
{
    *gen_opc_ptr++ = INDEX_op_monitor;
}

static inline void gen_op_mwait(void)
{
    *gen_opc_ptr++ = INDEX_op_mwait;
}

static inline void gen_op_debug(void)
{
    *gen_opc_ptr++ = INDEX_op_debug;
}

static inline void gen_op_raise_interrupt(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_raise_interrupt;
}

static inline void gen_op_raise_exception(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_raise_exception;
}

static inline void gen_op_into(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_into;
}

static inline void gen_op_cli(void)
{
    *gen_opc_ptr++ = INDEX_op_cli;
}

static inline void gen_op_sti(void)
{
    *gen_opc_ptr++ = INDEX_op_sti;
}

static inline void gen_op_set_inhibit_irq(void)
{
    *gen_opc_ptr++ = INDEX_op_set_inhibit_irq;
}

static inline void gen_op_reset_inhibit_irq(void)
{
    *gen_opc_ptr++ = INDEX_op_reset_inhibit_irq;
}

static inline void gen_op_rsm(void)
{
    *gen_opc_ptr++ = INDEX_op_rsm;
}

static inline void gen_op_boundw(void)
{
    *gen_opc_ptr++ = INDEX_op_boundw;
}

static inline void gen_op_boundl(void)
{
    *gen_opc_ptr++ = INDEX_op_boundl;
}

static inline void gen_op_cmpxchg8b(void)
{
    *gen_opc_ptr++ = INDEX_op_cmpxchg8b;
}

static inline void gen_op_single_step(void)
{
    *gen_opc_ptr++ = INDEX_op_single_step;
}

static inline void gen_op_movl_T0_0(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_T0_0;
}

static inline void gen_op_exit_tb(void)
{
    *gen_opc_ptr++ = INDEX_op_exit_tb;
}

static inline void gen_op_jb_subb(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jb_subb;
}

static inline void gen_op_jz_subb(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jz_subb;
}

static inline void gen_op_jnz_subb(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jnz_subb;
}

static inline void gen_op_jbe_subb(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jbe_subb;
}

static inline void gen_op_js_subb(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_js_subb;
}

static inline void gen_op_jl_subb(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jl_subb;
}

static inline void gen_op_jle_subb(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jle_subb;
}

static inline void gen_op_setb_T0_subb(void)
{
    *gen_opc_ptr++ = INDEX_op_setb_T0_subb;
}

static inline void gen_op_setz_T0_subb(void)
{
    *gen_opc_ptr++ = INDEX_op_setz_T0_subb;
}

static inline void gen_op_setbe_T0_subb(void)
{
    *gen_opc_ptr++ = INDEX_op_setbe_T0_subb;
}

static inline void gen_op_sets_T0_subb(void)
{
    *gen_opc_ptr++ = INDEX_op_sets_T0_subb;
}

static inline void gen_op_setl_T0_subb(void)
{
    *gen_opc_ptr++ = INDEX_op_setl_T0_subb;
}

static inline void gen_op_setle_T0_subb(void)
{
    *gen_opc_ptr++ = INDEX_op_setle_T0_subb;
}

static inline void gen_op_shlb_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_shlb_T0_T1;
}

static inline void gen_op_shrb_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_shrb_T0_T1;
}

static inline void gen_op_sarb_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_sarb_T0_T1;
}

static inline void gen_op_rolb_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rolb_T0_T1_cc;
}

static inline void gen_op_rorb_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rorb_T0_T1_cc;
}

static inline void gen_op_rolb_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_rolb_T0_T1;
}

static inline void gen_op_rorb_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_rorb_T0_T1;
}

static inline void gen_op_rclb_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rclb_T0_T1_cc;
}

static inline void gen_op_rcrb_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rcrb_T0_T1_cc;
}

static inline void gen_op_shlb_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shlb_T0_T1_cc;
}

static inline void gen_op_shrb_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shrb_T0_T1_cc;
}

static inline void gen_op_sarb_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sarb_T0_T1_cc;
}

static inline void gen_op_adcb_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_adcb_T0_T1_cc;
}

static inline void gen_op_sbbb_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sbbb_T0_T1_cc;
}

static inline void gen_op_cmpxchgb_T0_T1_EAX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_cmpxchgb_T0_T1_EAX_cc;
}

static inline void gen_op_rolb_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rolb_raw_T0_T1_cc;
}

static inline void gen_op_rorb_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rorb_raw_T0_T1_cc;
}

static inline void gen_op_rolb_raw_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_rolb_raw_T0_T1;
}

static inline void gen_op_rorb_raw_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_rorb_raw_T0_T1;
}

static inline void gen_op_rclb_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rclb_raw_T0_T1_cc;
}

static inline void gen_op_rcrb_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rcrb_raw_T0_T1_cc;
}

static inline void gen_op_shlb_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shlb_raw_T0_T1_cc;
}

static inline void gen_op_shrb_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shrb_raw_T0_T1_cc;
}

static inline void gen_op_sarb_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sarb_raw_T0_T1_cc;
}

static inline void gen_op_adcb_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_adcb_raw_T0_T1_cc;
}

static inline void gen_op_sbbb_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sbbb_raw_T0_T1_cc;
}

static inline void gen_op_cmpxchgb_raw_T0_T1_EAX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_cmpxchgb_raw_T0_T1_EAX_cc;
}

static inline void gen_op_rolb_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rolb_kernel_T0_T1_cc;
}

static inline void gen_op_rorb_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rorb_kernel_T0_T1_cc;
}

static inline void gen_op_rolb_kernel_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_rolb_kernel_T0_T1;
}

static inline void gen_op_rorb_kernel_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_rorb_kernel_T0_T1;
}

static inline void gen_op_rclb_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rclb_kernel_T0_T1_cc;
}

static inline void gen_op_rcrb_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rcrb_kernel_T0_T1_cc;
}

static inline void gen_op_shlb_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shlb_kernel_T0_T1_cc;
}

static inline void gen_op_shrb_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shrb_kernel_T0_T1_cc;
}

static inline void gen_op_sarb_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sarb_kernel_T0_T1_cc;
}

static inline void gen_op_adcb_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_adcb_kernel_T0_T1_cc;
}

static inline void gen_op_sbbb_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sbbb_kernel_T0_T1_cc;
}

static inline void gen_op_cmpxchgb_kernel_T0_T1_EAX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_cmpxchgb_kernel_T0_T1_EAX_cc;
}

static inline void gen_op_rolb_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rolb_user_T0_T1_cc;
}

static inline void gen_op_rorb_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rorb_user_T0_T1_cc;
}

static inline void gen_op_rolb_user_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_rolb_user_T0_T1;
}

static inline void gen_op_rorb_user_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_rorb_user_T0_T1;
}

static inline void gen_op_rclb_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rclb_user_T0_T1_cc;
}

static inline void gen_op_rcrb_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rcrb_user_T0_T1_cc;
}

static inline void gen_op_shlb_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shlb_user_T0_T1_cc;
}

static inline void gen_op_shrb_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shrb_user_T0_T1_cc;
}

static inline void gen_op_sarb_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sarb_user_T0_T1_cc;
}

static inline void gen_op_adcb_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_adcb_user_T0_T1_cc;
}

static inline void gen_op_sbbb_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sbbb_user_T0_T1_cc;
}

static inline void gen_op_cmpxchgb_user_T0_T1_EAX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_cmpxchgb_user_T0_T1_EAX_cc;
}

static inline void gen_op_movl_T0_Dshiftb(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_T0_Dshiftb;
}

static inline void gen_op_outb_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_outb_T0_T1;
}

static inline void gen_op_inb_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_inb_T0_T1;
}

static inline void gen_op_inb_DX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_inb_DX_T0;
}

static inline void gen_op_outb_DX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_outb_DX_T0;
}

static inline void gen_op_check_iob_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_check_iob_T0;
}

static inline void gen_op_check_iob_DX(void)
{
    *gen_opc_ptr++ = INDEX_op_check_iob_DX;
}

static inline void gen_op_jb_subw(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jb_subw;
}

static inline void gen_op_jz_subw(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jz_subw;
}

static inline void gen_op_jnz_subw(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jnz_subw;
}

static inline void gen_op_jbe_subw(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jbe_subw;
}

static inline void gen_op_js_subw(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_js_subw;
}

static inline void gen_op_jl_subw(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jl_subw;
}

static inline void gen_op_jle_subw(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jle_subw;
}

static inline void gen_op_loopnzw(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_loopnzw;
}

static inline void gen_op_loopzw(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_loopzw;
}

static inline void gen_op_jz_ecxw(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jz_ecxw;
}

static inline void gen_op_jnz_ecxw(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jnz_ecxw;
}

static inline void gen_op_setb_T0_subw(void)
{
    *gen_opc_ptr++ = INDEX_op_setb_T0_subw;
}

static inline void gen_op_setz_T0_subw(void)
{
    *gen_opc_ptr++ = INDEX_op_setz_T0_subw;
}

static inline void gen_op_setbe_T0_subw(void)
{
    *gen_opc_ptr++ = INDEX_op_setbe_T0_subw;
}

static inline void gen_op_sets_T0_subw(void)
{
    *gen_opc_ptr++ = INDEX_op_sets_T0_subw;
}

static inline void gen_op_setl_T0_subw(void)
{
    *gen_opc_ptr++ = INDEX_op_setl_T0_subw;
}

static inline void gen_op_setle_T0_subw(void)
{
    *gen_opc_ptr++ = INDEX_op_setle_T0_subw;
}

static inline void gen_op_shlw_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_shlw_T0_T1;
}

static inline void gen_op_shrw_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_shrw_T0_T1;
}

static inline void gen_op_sarw_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_sarw_T0_T1;
}

static inline void gen_op_rolw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rolw_T0_T1_cc;
}

static inline void gen_op_rorw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rorw_T0_T1_cc;
}

static inline void gen_op_rolw_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_rolw_T0_T1;
}

static inline void gen_op_rorw_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_rorw_T0_T1;
}

static inline void gen_op_rclw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rclw_T0_T1_cc;
}

static inline void gen_op_rcrw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rcrw_T0_T1_cc;
}

static inline void gen_op_shlw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shlw_T0_T1_cc;
}

static inline void gen_op_shrw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shrw_T0_T1_cc;
}

static inline void gen_op_sarw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sarw_T0_T1_cc;
}

static inline void gen_op_shldw_T0_T1_im_cc(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_shldw_T0_T1_im_cc;
}

static inline void gen_op_shldw_T0_T1_ECX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shldw_T0_T1_ECX_cc;
}

static inline void gen_op_shrdw_T0_T1_im_cc(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_shrdw_T0_T1_im_cc;
}

static inline void gen_op_shrdw_T0_T1_ECX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shrdw_T0_T1_ECX_cc;
}

static inline void gen_op_adcw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_adcw_T0_T1_cc;
}

static inline void gen_op_sbbw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sbbw_T0_T1_cc;
}

static inline void gen_op_cmpxchgw_T0_T1_EAX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_cmpxchgw_T0_T1_EAX_cc;
}

static inline void gen_op_rolw_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rolw_raw_T0_T1_cc;
}

static inline void gen_op_rorw_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rorw_raw_T0_T1_cc;
}

static inline void gen_op_rolw_raw_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_rolw_raw_T0_T1;
}

static inline void gen_op_rorw_raw_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_rorw_raw_T0_T1;
}

static inline void gen_op_rclw_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rclw_raw_T0_T1_cc;
}

static inline void gen_op_rcrw_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rcrw_raw_T0_T1_cc;
}

static inline void gen_op_shlw_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shlw_raw_T0_T1_cc;
}

static inline void gen_op_shrw_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shrw_raw_T0_T1_cc;
}

static inline void gen_op_sarw_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sarw_raw_T0_T1_cc;
}

static inline void gen_op_shldw_raw_T0_T1_im_cc(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_shldw_raw_T0_T1_im_cc;
}

static inline void gen_op_shldw_raw_T0_T1_ECX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shldw_raw_T0_T1_ECX_cc;
}

static inline void gen_op_shrdw_raw_T0_T1_im_cc(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_shrdw_raw_T0_T1_im_cc;
}

static inline void gen_op_shrdw_raw_T0_T1_ECX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shrdw_raw_T0_T1_ECX_cc;
}

static inline void gen_op_adcw_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_adcw_raw_T0_T1_cc;
}

static inline void gen_op_sbbw_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sbbw_raw_T0_T1_cc;
}

static inline void gen_op_cmpxchgw_raw_T0_T1_EAX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_cmpxchgw_raw_T0_T1_EAX_cc;
}

static inline void gen_op_rolw_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rolw_kernel_T0_T1_cc;
}

static inline void gen_op_rorw_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rorw_kernel_T0_T1_cc;
}

static inline void gen_op_rolw_kernel_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_rolw_kernel_T0_T1;
}

static inline void gen_op_rorw_kernel_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_rorw_kernel_T0_T1;
}

static inline void gen_op_rclw_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rclw_kernel_T0_T1_cc;
}

static inline void gen_op_rcrw_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rcrw_kernel_T0_T1_cc;
}

static inline void gen_op_shlw_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shlw_kernel_T0_T1_cc;
}

static inline void gen_op_shrw_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shrw_kernel_T0_T1_cc;
}

static inline void gen_op_sarw_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sarw_kernel_T0_T1_cc;
}

static inline void gen_op_shldw_kernel_T0_T1_im_cc(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_shldw_kernel_T0_T1_im_cc;
}

static inline void gen_op_shldw_kernel_T0_T1_ECX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shldw_kernel_T0_T1_ECX_cc;
}

static inline void gen_op_shrdw_kernel_T0_T1_im_cc(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_shrdw_kernel_T0_T1_im_cc;
}

static inline void gen_op_shrdw_kernel_T0_T1_ECX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shrdw_kernel_T0_T1_ECX_cc;
}

static inline void gen_op_adcw_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_adcw_kernel_T0_T1_cc;
}

static inline void gen_op_sbbw_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sbbw_kernel_T0_T1_cc;
}

static inline void gen_op_cmpxchgw_kernel_T0_T1_EAX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_cmpxchgw_kernel_T0_T1_EAX_cc;
}

static inline void gen_op_rolw_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rolw_user_T0_T1_cc;
}

static inline void gen_op_rorw_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rorw_user_T0_T1_cc;
}

static inline void gen_op_rolw_user_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_rolw_user_T0_T1;
}

static inline void gen_op_rorw_user_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_rorw_user_T0_T1;
}

static inline void gen_op_rclw_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rclw_user_T0_T1_cc;
}

static inline void gen_op_rcrw_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rcrw_user_T0_T1_cc;
}

static inline void gen_op_shlw_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shlw_user_T0_T1_cc;
}

static inline void gen_op_shrw_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shrw_user_T0_T1_cc;
}

static inline void gen_op_sarw_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sarw_user_T0_T1_cc;
}

static inline void gen_op_shldw_user_T0_T1_im_cc(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_shldw_user_T0_T1_im_cc;
}

static inline void gen_op_shldw_user_T0_T1_ECX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shldw_user_T0_T1_ECX_cc;
}

static inline void gen_op_shrdw_user_T0_T1_im_cc(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_shrdw_user_T0_T1_im_cc;
}

static inline void gen_op_shrdw_user_T0_T1_ECX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shrdw_user_T0_T1_ECX_cc;
}

static inline void gen_op_adcw_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_adcw_user_T0_T1_cc;
}

static inline void gen_op_sbbw_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sbbw_user_T0_T1_cc;
}

static inline void gen_op_cmpxchgw_user_T0_T1_EAX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_cmpxchgw_user_T0_T1_EAX_cc;
}

static inline void gen_op_btw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_btw_T0_T1_cc;
}

static inline void gen_op_btsw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_btsw_T0_T1_cc;
}

static inline void gen_op_btrw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_btrw_T0_T1_cc;
}

static inline void gen_op_btcw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_btcw_T0_T1_cc;
}

static inline void gen_op_add_bitw_A0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_add_bitw_A0_T1;
}

static inline void gen_op_bsfw_T0_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_bsfw_T0_cc;
}

static inline void gen_op_bsrw_T0_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_bsrw_T0_cc;
}

static inline void gen_op_movl_T0_Dshiftw(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_T0_Dshiftw;
}

static inline void gen_op_outw_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_outw_T0_T1;
}

static inline void gen_op_inw_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_inw_T0_T1;
}

static inline void gen_op_inw_DX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_inw_DX_T0;
}

static inline void gen_op_outw_DX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_outw_DX_T0;
}

static inline void gen_op_check_iow_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_check_iow_T0;
}

static inline void gen_op_check_iow_DX(void)
{
    *gen_opc_ptr++ = INDEX_op_check_iow_DX;
}

static inline void gen_op_jb_subl(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jb_subl;
}

static inline void gen_op_jz_subl(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jz_subl;
}

static inline void gen_op_jnz_subl(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jnz_subl;
}

static inline void gen_op_jbe_subl(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jbe_subl;
}

static inline void gen_op_js_subl(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_js_subl;
}

static inline void gen_op_jl_subl(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jl_subl;
}

static inline void gen_op_jle_subl(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jle_subl;
}

static inline void gen_op_loopnzl(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_loopnzl;
}

static inline void gen_op_loopzl(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_loopzl;
}

static inline void gen_op_jz_ecxl(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jz_ecxl;
}

static inline void gen_op_jnz_ecxl(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jnz_ecxl;
}

static inline void gen_op_setb_T0_subl(void)
{
    *gen_opc_ptr++ = INDEX_op_setb_T0_subl;
}

static inline void gen_op_setz_T0_subl(void)
{
    *gen_opc_ptr++ = INDEX_op_setz_T0_subl;
}

static inline void gen_op_setbe_T0_subl(void)
{
    *gen_opc_ptr++ = INDEX_op_setbe_T0_subl;
}

static inline void gen_op_sets_T0_subl(void)
{
    *gen_opc_ptr++ = INDEX_op_sets_T0_subl;
}

static inline void gen_op_setl_T0_subl(void)
{
    *gen_opc_ptr++ = INDEX_op_setl_T0_subl;
}

static inline void gen_op_setle_T0_subl(void)
{
    *gen_opc_ptr++ = INDEX_op_setle_T0_subl;
}

static inline void gen_op_shll_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_shll_T0_T1;
}

static inline void gen_op_shrl_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_shrl_T0_T1;
}

static inline void gen_op_sarl_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_sarl_T0_T1;
}

static inline void gen_op_roll_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_roll_T0_T1_cc;
}

static inline void gen_op_rorl_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rorl_T0_T1_cc;
}

static inline void gen_op_roll_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_roll_T0_T1;
}

static inline void gen_op_rorl_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_rorl_T0_T1;
}

static inline void gen_op_rcll_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rcll_T0_T1_cc;
}

static inline void gen_op_rcrl_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rcrl_T0_T1_cc;
}

static inline void gen_op_shll_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shll_T0_T1_cc;
}

static inline void gen_op_shrl_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shrl_T0_T1_cc;
}

static inline void gen_op_sarl_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sarl_T0_T1_cc;
}

static inline void gen_op_shldl_T0_T1_im_cc(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_shldl_T0_T1_im_cc;
}

static inline void gen_op_shldl_T0_T1_ECX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shldl_T0_T1_ECX_cc;
}

static inline void gen_op_shrdl_T0_T1_im_cc(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_shrdl_T0_T1_im_cc;
}

static inline void gen_op_shrdl_T0_T1_ECX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shrdl_T0_T1_ECX_cc;
}

static inline void gen_op_adcl_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_adcl_T0_T1_cc;
}

static inline void gen_op_sbbl_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sbbl_T0_T1_cc;
}

static inline void gen_op_cmpxchgl_T0_T1_EAX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_cmpxchgl_T0_T1_EAX_cc;
}

static inline void gen_op_roll_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_roll_raw_T0_T1_cc;
}

static inline void gen_op_rorl_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rorl_raw_T0_T1_cc;
}

static inline void gen_op_roll_raw_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_roll_raw_T0_T1;
}

static inline void gen_op_rorl_raw_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_rorl_raw_T0_T1;
}

static inline void gen_op_rcll_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rcll_raw_T0_T1_cc;
}

static inline void gen_op_rcrl_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rcrl_raw_T0_T1_cc;
}

static inline void gen_op_shll_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shll_raw_T0_T1_cc;
}

static inline void gen_op_shrl_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shrl_raw_T0_T1_cc;
}

static inline void gen_op_sarl_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sarl_raw_T0_T1_cc;
}

static inline void gen_op_shldl_raw_T0_T1_im_cc(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_shldl_raw_T0_T1_im_cc;
}

static inline void gen_op_shldl_raw_T0_T1_ECX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shldl_raw_T0_T1_ECX_cc;
}

static inline void gen_op_shrdl_raw_T0_T1_im_cc(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_shrdl_raw_T0_T1_im_cc;
}

static inline void gen_op_shrdl_raw_T0_T1_ECX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shrdl_raw_T0_T1_ECX_cc;
}

static inline void gen_op_adcl_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_adcl_raw_T0_T1_cc;
}

static inline void gen_op_sbbl_raw_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sbbl_raw_T0_T1_cc;
}

static inline void gen_op_cmpxchgl_raw_T0_T1_EAX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_cmpxchgl_raw_T0_T1_EAX_cc;
}

static inline void gen_op_roll_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_roll_kernel_T0_T1_cc;
}

static inline void gen_op_rorl_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rorl_kernel_T0_T1_cc;
}

static inline void gen_op_roll_kernel_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_roll_kernel_T0_T1;
}

static inline void gen_op_rorl_kernel_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_rorl_kernel_T0_T1;
}

static inline void gen_op_rcll_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rcll_kernel_T0_T1_cc;
}

static inline void gen_op_rcrl_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rcrl_kernel_T0_T1_cc;
}

static inline void gen_op_shll_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shll_kernel_T0_T1_cc;
}

static inline void gen_op_shrl_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shrl_kernel_T0_T1_cc;
}

static inline void gen_op_sarl_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sarl_kernel_T0_T1_cc;
}

static inline void gen_op_shldl_kernel_T0_T1_im_cc(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_shldl_kernel_T0_T1_im_cc;
}

static inline void gen_op_shldl_kernel_T0_T1_ECX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shldl_kernel_T0_T1_ECX_cc;
}

static inline void gen_op_shrdl_kernel_T0_T1_im_cc(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_shrdl_kernel_T0_T1_im_cc;
}

static inline void gen_op_shrdl_kernel_T0_T1_ECX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shrdl_kernel_T0_T1_ECX_cc;
}

static inline void gen_op_adcl_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_adcl_kernel_T0_T1_cc;
}

static inline void gen_op_sbbl_kernel_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sbbl_kernel_T0_T1_cc;
}

static inline void gen_op_cmpxchgl_kernel_T0_T1_EAX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_cmpxchgl_kernel_T0_T1_EAX_cc;
}

static inline void gen_op_roll_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_roll_user_T0_T1_cc;
}

static inline void gen_op_rorl_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rorl_user_T0_T1_cc;
}

static inline void gen_op_roll_user_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_roll_user_T0_T1;
}

static inline void gen_op_rorl_user_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_rorl_user_T0_T1;
}

static inline void gen_op_rcll_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rcll_user_T0_T1_cc;
}

static inline void gen_op_rcrl_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_rcrl_user_T0_T1_cc;
}

static inline void gen_op_shll_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shll_user_T0_T1_cc;
}

static inline void gen_op_shrl_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shrl_user_T0_T1_cc;
}

static inline void gen_op_sarl_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sarl_user_T0_T1_cc;
}

static inline void gen_op_shldl_user_T0_T1_im_cc(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_shldl_user_T0_T1_im_cc;
}

static inline void gen_op_shldl_user_T0_T1_ECX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shldl_user_T0_T1_ECX_cc;
}

static inline void gen_op_shrdl_user_T0_T1_im_cc(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_shrdl_user_T0_T1_im_cc;
}

static inline void gen_op_shrdl_user_T0_T1_ECX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_shrdl_user_T0_T1_ECX_cc;
}

static inline void gen_op_adcl_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_adcl_user_T0_T1_cc;
}

static inline void gen_op_sbbl_user_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sbbl_user_T0_T1_cc;
}

static inline void gen_op_cmpxchgl_user_T0_T1_EAX_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_cmpxchgl_user_T0_T1_EAX_cc;
}

static inline void gen_op_btl_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_btl_T0_T1_cc;
}

static inline void gen_op_btsl_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_btsl_T0_T1_cc;
}

static inline void gen_op_btrl_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_btrl_T0_T1_cc;
}

static inline void gen_op_btcl_T0_T1_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_btcl_T0_T1_cc;
}

static inline void gen_op_add_bitl_A0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_add_bitl_A0_T1;
}

static inline void gen_op_bsfl_T0_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_bsfl_T0_cc;
}

static inline void gen_op_bsrl_T0_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_bsrl_T0_cc;
}

static inline void gen_op_update_bt_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_update_bt_cc;
}

static inline void gen_op_movl_T0_Dshiftl(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_T0_Dshiftl;
}

static inline void gen_op_outl_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_outl_T0_T1;
}

static inline void gen_op_inl_T0_T1(void)
{
    *gen_opc_ptr++ = INDEX_op_inl_T0_T1;
}

static inline void gen_op_inl_DX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_inl_DX_T0;
}

static inline void gen_op_outl_DX_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_outl_DX_T0;
}

static inline void gen_op_check_iol_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_check_iol_T0;
}

static inline void gen_op_check_iol_DX(void)
{
    *gen_opc_ptr++ = INDEX_op_check_iol_DX;
}

static inline void gen_op_movsbl_T0_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movsbl_T0_T0;
}

static inline void gen_op_movzbl_T0_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movzbl_T0_T0;
}

static inline void gen_op_movswl_T0_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movswl_T0_T0;
}

static inline void gen_op_movzwl_T0_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movzwl_T0_T0;
}

static inline void gen_op_movswl_EAX_AX(void)
{
    *gen_opc_ptr++ = INDEX_op_movswl_EAX_AX;
}

static inline void gen_op_movsbw_AX_AL(void)
{
    *gen_opc_ptr++ = INDEX_op_movsbw_AX_AL;
}

static inline void gen_op_movslq_EDX_EAX(void)
{
    *gen_opc_ptr++ = INDEX_op_movslq_EDX_EAX;
}

static inline void gen_op_movswl_DX_AX(void)
{
    *gen_opc_ptr++ = INDEX_op_movswl_DX_AX;
}

static inline void gen_op_addl_ESI_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_ESI_T0;
}

static inline void gen_op_addw_ESI_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_addw_ESI_T0;
}

static inline void gen_op_addl_EDI_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_EDI_T0;
}

static inline void gen_op_addw_EDI_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_addw_EDI_T0;
}

static inline void gen_op_decl_ECX(void)
{
    *gen_opc_ptr++ = INDEX_op_decl_ECX;
}

static inline void gen_op_decw_ECX(void)
{
    *gen_opc_ptr++ = INDEX_op_decw_ECX;
}

static inline void gen_op_addl_A0_SS(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_A0_SS;
}

static inline void gen_op_subl_A0_2(void)
{
    *gen_opc_ptr++ = INDEX_op_subl_A0_2;
}

static inline void gen_op_subl_A0_4(void)
{
    *gen_opc_ptr++ = INDEX_op_subl_A0_4;
}

static inline void gen_op_addl_ESP_4(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_ESP_4;
}

static inline void gen_op_addl_ESP_2(void)
{
    *gen_opc_ptr++ = INDEX_op_addl_ESP_2;
}

static inline void gen_op_addw_ESP_4(void)
{
    *gen_opc_ptr++ = INDEX_op_addw_ESP_4;
}

static inline void gen_op_addw_ESP_2(void)
{
    *gen_opc_ptr++ = INDEX_op_addw_ESP_2;
}

static inline void gen_op_addl_ESP_im(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_addl_ESP_im;
}

static inline void gen_op_addw_ESP_im(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_addw_ESP_im;
}

static inline void gen_op_rdtsc(void)
{
    *gen_opc_ptr++ = INDEX_op_rdtsc;
}

static inline void gen_op_rdpmc(void)
{
    *gen_opc_ptr++ = INDEX_op_rdpmc;
}

static inline void gen_op_cpuid(void)
{
    *gen_opc_ptr++ = INDEX_op_cpuid;
}

static inline void gen_op_enter_level(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_enter_level;
}

static inline void gen_op_sysenter(void)
{
    *gen_opc_ptr++ = INDEX_op_sysenter;
}

static inline void gen_op_sysexit(void)
{
    *gen_opc_ptr++ = INDEX_op_sysexit;
}

static inline void gen_op_rdmsr(void)
{
    *gen_opc_ptr++ = INDEX_op_rdmsr;
}

static inline void gen_op_wrmsr(void)
{
    *gen_opc_ptr++ = INDEX_op_wrmsr;
}

static inline void gen_op_aam(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_aam;
}

static inline void gen_op_aad(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_aad;
}

static inline void gen_op_aaa(void)
{
    *gen_opc_ptr++ = INDEX_op_aaa;
}

static inline void gen_op_aas(void)
{
    *gen_opc_ptr++ = INDEX_op_aas;
}

static inline void gen_op_daa(void)
{
    *gen_opc_ptr++ = INDEX_op_daa;
}

static inline void gen_op_das(void)
{
    *gen_opc_ptr++ = INDEX_op_das;
}

static inline void gen_op_movl_seg_T0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movl_seg_T0;
}

static inline void gen_op_movl_seg_T0_vm(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movl_seg_T0_vm;
}

static inline void gen_op_movl_T0_seg(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movl_T0_seg;
}

static inline void gen_op_lsl(void)
{
    *gen_opc_ptr++ = INDEX_op_lsl;
}

static inline void gen_op_lar(void)
{
    *gen_opc_ptr++ = INDEX_op_lar;
}

static inline void gen_op_verr(void)
{
    *gen_opc_ptr++ = INDEX_op_verr;
}

static inline void gen_op_verw(void)
{
    *gen_opc_ptr++ = INDEX_op_verw;
}

static inline void gen_op_arpl(void)
{
    *gen_opc_ptr++ = INDEX_op_arpl;
}

static inline void gen_op_arpl_update(void)
{
    *gen_opc_ptr++ = INDEX_op_arpl_update;
}

static inline void gen_op_ljmp_protected_T0_T1(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_ljmp_protected_T0_T1;
}

static inline void gen_op_lcall_real_T0_T1(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_lcall_real_T0_T1;
}

static inline void gen_op_lcall_protected_T0_T1(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_lcall_protected_T0_T1;
}

static inline void gen_op_iret_real(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_iret_real;
}

static inline void gen_op_iret_protected(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_iret_protected;
}

static inline void gen_op_lret_protected(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_lret_protected;
}

static inline void gen_op_lldt_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_lldt_T0;
}

static inline void gen_op_ltr_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_ltr_T0;
}

static inline void gen_op_movl_crN_T0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movl_crN_T0;
}

static inline void gen_op_svm_check_intercept(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_svm_check_intercept;
}

static inline void gen_op_svm_check_intercept_param(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_svm_check_intercept_param;
}

static inline void gen_op_svm_vmexit(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_svm_vmexit;
}

static inline void gen_op_geneflags(void)
{
    *gen_opc_ptr++ = INDEX_op_geneflags;
}

static inline void gen_op_svm_check_intercept_io(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_svm_check_intercept_io;
}

static inline void gen_op_movtl_T0_cr8(void)
{
    *gen_opc_ptr++ = INDEX_op_movtl_T0_cr8;
}

static inline void gen_op_movl_drN_T0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movl_drN_T0;
}

static inline void gen_op_lmsw_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_lmsw_T0;
}

static inline void gen_op_invlpg_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_invlpg_A0;
}

static inline void gen_op_movl_T0_env(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movl_T0_env;
}

static inline void gen_op_movl_env_T0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movl_env_T0;
}

static inline void gen_op_movl_env_T1(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movl_env_T1;
}

static inline void gen_op_movtl_T0_env(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movtl_T0_env;
}

static inline void gen_op_movtl_env_T0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movtl_env_T0;
}

static inline void gen_op_movtl_T1_env(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movtl_T1_env;
}

static inline void gen_op_movtl_env_T1(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movtl_env_T1;
}

static inline void gen_op_clts(void)
{
    *gen_opc_ptr++ = INDEX_op_clts;
}

static inline void gen_op_goto_tb0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_goto_tb0;
}

static inline void gen_op_goto_tb1(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_goto_tb1;
}

static inline void gen_op_jmp_label(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jmp_label;
}

static inline void gen_op_jnz_T0_label(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jnz_T0_label;
}

static inline void gen_op_jz_T0_label(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_jz_T0_label;
}

static inline void gen_op_seto_T0_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_seto_T0_cc;
}

static inline void gen_op_setb_T0_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_setb_T0_cc;
}

static inline void gen_op_setz_T0_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_setz_T0_cc;
}

static inline void gen_op_setbe_T0_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_setbe_T0_cc;
}

static inline void gen_op_sets_T0_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_sets_T0_cc;
}

static inline void gen_op_setp_T0_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_setp_T0_cc;
}

static inline void gen_op_setl_T0_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_setl_T0_cc;
}

static inline void gen_op_setle_T0_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_setle_T0_cc;
}

static inline void gen_op_xor_T0_1(void)
{
    *gen_opc_ptr++ = INDEX_op_xor_T0_1;
}

static inline void gen_op_set_cc_op(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_set_cc_op;
}

static inline void gen_op_mov_T0_cc(void)
{
    *gen_opc_ptr++ = INDEX_op_mov_T0_cc;
}

static inline void gen_op_movl_eflags_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_eflags_T0;
}

static inline void gen_op_movw_eflags_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_eflags_T0;
}

static inline void gen_op_movl_eflags_T0_io(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_eflags_T0_io;
}

static inline void gen_op_movw_eflags_T0_io(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_eflags_T0_io;
}

static inline void gen_op_movl_eflags_T0_cpl0(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_eflags_T0_cpl0;
}

static inline void gen_op_movw_eflags_T0_cpl0(void)
{
    *gen_opc_ptr++ = INDEX_op_movw_eflags_T0_cpl0;
}

static inline void gen_op_movb_eflags_T0(void)
{
    *gen_opc_ptr++ = INDEX_op_movb_eflags_T0;
}

static inline void gen_op_movl_T0_eflags(void)
{
    *gen_opc_ptr++ = INDEX_op_movl_T0_eflags;
}

static inline void gen_op_cld(void)
{
    *gen_opc_ptr++ = INDEX_op_cld;
}

static inline void gen_op_std(void)
{
    *gen_opc_ptr++ = INDEX_op_std;
}

static inline void gen_op_clc(void)
{
    *gen_opc_ptr++ = INDEX_op_clc;
}

static inline void gen_op_stc(void)
{
    *gen_opc_ptr++ = INDEX_op_stc;
}

static inline void gen_op_cmc(void)
{
    *gen_opc_ptr++ = INDEX_op_cmc;
}

static inline void gen_op_salc(void)
{
    *gen_opc_ptr++ = INDEX_op_salc;
}

static inline void gen_op_flds_FT0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_flds_FT0_A0;
}

static inline void gen_op_fldl_FT0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_fldl_FT0_A0;
}

static inline void gen_op_fild_FT0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_fild_FT0_A0;
}

static inline void gen_op_fildl_FT0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_fildl_FT0_A0;
}

static inline void gen_op_fildll_FT0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_fildll_FT0_A0;
}

static inline void gen_op_flds_ST0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_flds_ST0_A0;
}

static inline void gen_op_fldl_ST0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_fldl_ST0_A0;
}

static inline void gen_op_fldt_ST0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_fldt_ST0_A0;
}

static inline void gen_op_fild_ST0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_fild_ST0_A0;
}

static inline void gen_op_fildl_ST0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_fildl_ST0_A0;
}

static inline void gen_op_fildll_ST0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_fildll_ST0_A0;
}

static inline void gen_op_fsts_ST0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_fsts_ST0_A0;
}

static inline void gen_op_fstl_ST0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_fstl_ST0_A0;
}

static inline void gen_op_fstt_ST0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_fstt_ST0_A0;
}

static inline void gen_op_fist_ST0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_fist_ST0_A0;
}

static inline void gen_op_fistl_ST0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_fistl_ST0_A0;
}

static inline void gen_op_fistll_ST0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_fistll_ST0_A0;
}

static inline void gen_op_fistt_ST0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_fistt_ST0_A0;
}

static inline void gen_op_fisttl_ST0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_fisttl_ST0_A0;
}

static inline void gen_op_fisttll_ST0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_fisttll_ST0_A0;
}

static inline void gen_op_fbld_ST0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_fbld_ST0_A0;
}

static inline void gen_op_fbst_ST0_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_fbst_ST0_A0;
}

static inline void gen_op_fpush(void)
{
    *gen_opc_ptr++ = INDEX_op_fpush;
}

static inline void gen_op_fpop(void)
{
    *gen_opc_ptr++ = INDEX_op_fpop;
}

static inline void gen_op_fdecstp(void)
{
    *gen_opc_ptr++ = INDEX_op_fdecstp;
}

static inline void gen_op_fincstp(void)
{
    *gen_opc_ptr++ = INDEX_op_fincstp;
}

static inline void gen_op_ffree_STN(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_ffree_STN;
}

static inline void gen_op_fmov_ST0_FT0(void)
{
    *gen_opc_ptr++ = INDEX_op_fmov_ST0_FT0;
}

static inline void gen_op_fmov_FT0_STN(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_fmov_FT0_STN;
}

static inline void gen_op_fmov_ST0_STN(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_fmov_ST0_STN;
}

static inline void gen_op_fmov_STN_ST0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_fmov_STN_ST0;
}

static inline void gen_op_fxchg_ST0_STN(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_fxchg_ST0_STN;
}

static inline void gen_op_fcom_ST0_FT0(void)
{
    *gen_opc_ptr++ = INDEX_op_fcom_ST0_FT0;
}

static inline void gen_op_fucom_ST0_FT0(void)
{
    *gen_opc_ptr++ = INDEX_op_fucom_ST0_FT0;
}

static inline void gen_op_fcomi_ST0_FT0(void)
{
    *gen_opc_ptr++ = INDEX_op_fcomi_ST0_FT0;
}

static inline void gen_op_fucomi_ST0_FT0(void)
{
    *gen_opc_ptr++ = INDEX_op_fucomi_ST0_FT0;
}

static inline void gen_op_fcmov_ST0_STN_T0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_fcmov_ST0_STN_T0;
}

static inline void gen_op_fadd_ST0_FT0(void)
{
    *gen_opc_ptr++ = INDEX_op_fadd_ST0_FT0;
}

static inline void gen_op_fmul_ST0_FT0(void)
{
    *gen_opc_ptr++ = INDEX_op_fmul_ST0_FT0;
}

static inline void gen_op_fsub_ST0_FT0(void)
{
    *gen_opc_ptr++ = INDEX_op_fsub_ST0_FT0;
}

static inline void gen_op_fsubr_ST0_FT0(void)
{
    *gen_opc_ptr++ = INDEX_op_fsubr_ST0_FT0;
}

static inline void gen_op_fdiv_ST0_FT0(void)
{
    *gen_opc_ptr++ = INDEX_op_fdiv_ST0_FT0;
}

static inline void gen_op_fdivr_ST0_FT0(void)
{
    *gen_opc_ptr++ = INDEX_op_fdivr_ST0_FT0;
}

static inline void gen_op_fadd_STN_ST0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_fadd_STN_ST0;
}

static inline void gen_op_fmul_STN_ST0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_fmul_STN_ST0;
}

static inline void gen_op_fsub_STN_ST0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_fsub_STN_ST0;
}

static inline void gen_op_fsubr_STN_ST0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_fsubr_STN_ST0;
}

static inline void gen_op_fdiv_STN_ST0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_fdiv_STN_ST0;
}

static inline void gen_op_fdivr_STN_ST0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_fdivr_STN_ST0;
}

static inline void gen_op_fchs_ST0(void)
{
    *gen_opc_ptr++ = INDEX_op_fchs_ST0;
}

static inline void gen_op_fabs_ST0(void)
{
    *gen_opc_ptr++ = INDEX_op_fabs_ST0;
}

static inline void gen_op_fxam_ST0(void)
{
    *gen_opc_ptr++ = INDEX_op_fxam_ST0;
}

static inline void gen_op_fld1_ST0(void)
{
    *gen_opc_ptr++ = INDEX_op_fld1_ST0;
}

static inline void gen_op_fldl2t_ST0(void)
{
    *gen_opc_ptr++ = INDEX_op_fldl2t_ST0;
}

static inline void gen_op_fldl2e_ST0(void)
{
    *gen_opc_ptr++ = INDEX_op_fldl2e_ST0;
}

static inline void gen_op_fldpi_ST0(void)
{
    *gen_opc_ptr++ = INDEX_op_fldpi_ST0;
}

static inline void gen_op_fldlg2_ST0(void)
{
    *gen_opc_ptr++ = INDEX_op_fldlg2_ST0;
}

static inline void gen_op_fldln2_ST0(void)
{
    *gen_opc_ptr++ = INDEX_op_fldln2_ST0;
}

static inline void gen_op_fldz_ST0(void)
{
    *gen_opc_ptr++ = INDEX_op_fldz_ST0;
}

static inline void gen_op_fldz_FT0(void)
{
    *gen_opc_ptr++ = INDEX_op_fldz_FT0;
}

static inline void gen_op_f2xm1(void)
{
    *gen_opc_ptr++ = INDEX_op_f2xm1;
}

static inline void gen_op_fyl2x(void)
{
    *gen_opc_ptr++ = INDEX_op_fyl2x;
}

static inline void gen_op_fptan(void)
{
    *gen_opc_ptr++ = INDEX_op_fptan;
}

static inline void gen_op_fpatan(void)
{
    *gen_opc_ptr++ = INDEX_op_fpatan;
}

static inline void gen_op_fxtract(void)
{
    *gen_opc_ptr++ = INDEX_op_fxtract;
}

static inline void gen_op_fprem1(void)
{
    *gen_opc_ptr++ = INDEX_op_fprem1;
}

static inline void gen_op_fprem(void)
{
    *gen_opc_ptr++ = INDEX_op_fprem;
}

static inline void gen_op_fyl2xp1(void)
{
    *gen_opc_ptr++ = INDEX_op_fyl2xp1;
}

static inline void gen_op_fsqrt(void)
{
    *gen_opc_ptr++ = INDEX_op_fsqrt;
}

static inline void gen_op_fsincos(void)
{
    *gen_opc_ptr++ = INDEX_op_fsincos;
}

static inline void gen_op_frndint(void)
{
    *gen_opc_ptr++ = INDEX_op_frndint;
}

static inline void gen_op_fscale(void)
{
    *gen_opc_ptr++ = INDEX_op_fscale;
}

static inline void gen_op_fsin(void)
{
    *gen_opc_ptr++ = INDEX_op_fsin;
}

static inline void gen_op_fcos(void)
{
    *gen_opc_ptr++ = INDEX_op_fcos;
}

static inline void gen_op_fnstsw_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_fnstsw_A0;
}

static inline void gen_op_fnstsw_EAX(void)
{
    *gen_opc_ptr++ = INDEX_op_fnstsw_EAX;
}

static inline void gen_op_fnstcw_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_fnstcw_A0;
}

static inline void gen_op_fldcw_A0(void)
{
    *gen_opc_ptr++ = INDEX_op_fldcw_A0;
}

static inline void gen_op_fclex(void)
{
    *gen_opc_ptr++ = INDEX_op_fclex;
}

static inline void gen_op_fwait(void)
{
    *gen_opc_ptr++ = INDEX_op_fwait;
}

static inline void gen_op_fninit(void)
{
    *gen_opc_ptr++ = INDEX_op_fninit;
}

static inline void gen_op_fnstenv_A0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_fnstenv_A0;
}

static inline void gen_op_fldenv_A0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_fldenv_A0;
}

static inline void gen_op_fnsave_A0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_fnsave_A0;
}

static inline void gen_op_frstor_A0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_frstor_A0;
}

static inline void gen_op_lock(void)
{
    *gen_opc_ptr++ = INDEX_op_lock;
}

static inline void gen_op_unlock(void)
{
    *gen_opc_ptr++ = INDEX_op_unlock;
}

static inline void gen_op_movo(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_movo;
}

static inline void gen_op_movq(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_movq;
}

static inline void gen_op_movl(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_movl;
}

static inline void gen_op_movq_env_0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movq_env_0;
}

static inline void gen_op_fxsave_A0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_fxsave_A0;
}

static inline void gen_op_fxrstor_A0(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_fxrstor_A0;
}

static inline void gen_op_enter_mmx(void)
{
    *gen_opc_ptr++ = INDEX_op_enter_mmx;
}

static inline void gen_op_emms(void)
{
    *gen_opc_ptr++ = INDEX_op_emms;
}

static inline void gen_op_psrlw_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psrlw_mmx;
}

static inline void gen_op_psraw_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psraw_mmx;
}

static inline void gen_op_psllw_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psllw_mmx;
}

static inline void gen_op_psrld_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psrld_mmx;
}

static inline void gen_op_psrad_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psrad_mmx;
}

static inline void gen_op_pslld_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pslld_mmx;
}

static inline void gen_op_psrlq_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psrlq_mmx;
}

static inline void gen_op_psllq_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psllq_mmx;
}

static inline void gen_op_paddb_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_paddb_mmx;
}

static inline void gen_op_paddw_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_paddw_mmx;
}

static inline void gen_op_paddl_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_paddl_mmx;
}

static inline void gen_op_paddq_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_paddq_mmx;
}

static inline void gen_op_psubb_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psubb_mmx;
}

static inline void gen_op_psubw_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psubw_mmx;
}

static inline void gen_op_psubl_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psubl_mmx;
}

static inline void gen_op_psubq_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psubq_mmx;
}

static inline void gen_op_paddusb_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_paddusb_mmx;
}

static inline void gen_op_paddsb_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_paddsb_mmx;
}

static inline void gen_op_psubusb_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psubusb_mmx;
}

static inline void gen_op_psubsb_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psubsb_mmx;
}

static inline void gen_op_paddusw_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_paddusw_mmx;
}

static inline void gen_op_paddsw_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_paddsw_mmx;
}

static inline void gen_op_psubusw_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psubusw_mmx;
}

static inline void gen_op_psubsw_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psubsw_mmx;
}

static inline void gen_op_pminub_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pminub_mmx;
}

static inline void gen_op_pmaxub_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pmaxub_mmx;
}

static inline void gen_op_pminsw_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pminsw_mmx;
}

static inline void gen_op_pmaxsw_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pmaxsw_mmx;
}

static inline void gen_op_pand_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pand_mmx;
}

static inline void gen_op_pandn_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pandn_mmx;
}

static inline void gen_op_por_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_por_mmx;
}

static inline void gen_op_pxor_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pxor_mmx;
}

static inline void gen_op_pcmpgtb_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pcmpgtb_mmx;
}

static inline void gen_op_pcmpgtw_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pcmpgtw_mmx;
}

static inline void gen_op_pcmpgtl_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pcmpgtl_mmx;
}

static inline void gen_op_pcmpeqb_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pcmpeqb_mmx;
}

static inline void gen_op_pcmpeqw_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pcmpeqw_mmx;
}

static inline void gen_op_pcmpeql_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pcmpeql_mmx;
}

static inline void gen_op_pmullw_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pmullw_mmx;
}

static inline void gen_op_pmulhuw_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pmulhuw_mmx;
}

static inline void gen_op_pmulhw_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pmulhw_mmx;
}

static inline void gen_op_pavgb_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pavgb_mmx;
}

static inline void gen_op_pavgw_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pavgw_mmx;
}

static inline void gen_op_pmuludq_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pmuludq_mmx;
}

static inline void gen_op_pmaddwd_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pmaddwd_mmx;
}

static inline void gen_op_psadbw_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psadbw_mmx;
}

static inline void gen_op_maskmov_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_maskmov_mmx;
}

static inline void gen_op_movl_mm_T0_mmx(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movl_mm_T0_mmx;
}

static inline void gen_op_movl_T0_mm_mmx(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movl_T0_mm_mmx;
}

static inline void gen_op_pshufw_mmx(long param1, long param2, long param3)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opparam_ptr++ = param3;
    *gen_opc_ptr++ = INDEX_op_pshufw_mmx;
}

static inline void gen_op_pmovmskb_mmx(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_pmovmskb_mmx;
}

static inline void gen_op_pinsrw_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pinsrw_mmx;
}

static inline void gen_op_pextrw_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pextrw_mmx;
}

static inline void gen_op_packsswb_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_packsswb_mmx;
}

static inline void gen_op_packuswb_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_packuswb_mmx;
}

static inline void gen_op_packssdw_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_packssdw_mmx;
}

static inline void gen_op_punpcklbw_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_punpcklbw_mmx;
}

static inline void gen_op_punpcklwd_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_punpcklwd_mmx;
}

static inline void gen_op_punpckldq_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_punpckldq_mmx;
}

static inline void gen_op_punpckhbw_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_punpckhbw_mmx;
}

static inline void gen_op_punpckhwd_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_punpckhwd_mmx;
}

static inline void gen_op_punpckhdq_mmx(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_punpckhdq_mmx;
}

static inline void gen_op_psrlw_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psrlw_xmm;
}

static inline void gen_op_psraw_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psraw_xmm;
}

static inline void gen_op_psllw_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psllw_xmm;
}

static inline void gen_op_psrld_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psrld_xmm;
}

static inline void gen_op_psrad_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psrad_xmm;
}

static inline void gen_op_pslld_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pslld_xmm;
}

static inline void gen_op_psrlq_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psrlq_xmm;
}

static inline void gen_op_psllq_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psllq_xmm;
}

static inline void gen_op_psrldq_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psrldq_xmm;
}

static inline void gen_op_pslldq_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pslldq_xmm;
}

static inline void gen_op_paddb_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_paddb_xmm;
}

static inline void gen_op_paddw_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_paddw_xmm;
}

static inline void gen_op_paddl_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_paddl_xmm;
}

static inline void gen_op_paddq_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_paddq_xmm;
}

static inline void gen_op_psubb_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psubb_xmm;
}

static inline void gen_op_psubw_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psubw_xmm;
}

static inline void gen_op_psubl_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psubl_xmm;
}

static inline void gen_op_psubq_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psubq_xmm;
}

static inline void gen_op_paddusb_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_paddusb_xmm;
}

static inline void gen_op_paddsb_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_paddsb_xmm;
}

static inline void gen_op_psubusb_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psubusb_xmm;
}

static inline void gen_op_psubsb_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psubsb_xmm;
}

static inline void gen_op_paddusw_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_paddusw_xmm;
}

static inline void gen_op_paddsw_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_paddsw_xmm;
}

static inline void gen_op_psubusw_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psubusw_xmm;
}

static inline void gen_op_psubsw_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psubsw_xmm;
}

static inline void gen_op_pminub_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pminub_xmm;
}

static inline void gen_op_pmaxub_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pmaxub_xmm;
}

static inline void gen_op_pminsw_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pminsw_xmm;
}

static inline void gen_op_pmaxsw_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pmaxsw_xmm;
}

static inline void gen_op_pand_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pand_xmm;
}

static inline void gen_op_pandn_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pandn_xmm;
}

static inline void gen_op_por_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_por_xmm;
}

static inline void gen_op_pxor_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pxor_xmm;
}

static inline void gen_op_pcmpgtb_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pcmpgtb_xmm;
}

static inline void gen_op_pcmpgtw_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pcmpgtw_xmm;
}

static inline void gen_op_pcmpgtl_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pcmpgtl_xmm;
}

static inline void gen_op_pcmpeqb_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pcmpeqb_xmm;
}

static inline void gen_op_pcmpeqw_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pcmpeqw_xmm;
}

static inline void gen_op_pcmpeql_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pcmpeql_xmm;
}

static inline void gen_op_pmullw_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pmullw_xmm;
}

static inline void gen_op_pmulhuw_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pmulhuw_xmm;
}

static inline void gen_op_pmulhw_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pmulhw_xmm;
}

static inline void gen_op_pavgb_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pavgb_xmm;
}

static inline void gen_op_pavgw_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pavgw_xmm;
}

static inline void gen_op_pmuludq_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pmuludq_xmm;
}

static inline void gen_op_pmaddwd_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pmaddwd_xmm;
}

static inline void gen_op_psadbw_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_psadbw_xmm;
}

static inline void gen_op_maskmov_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_maskmov_xmm;
}

static inline void gen_op_movl_mm_T0_xmm(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movl_mm_T0_xmm;
}

static inline void gen_op_movl_T0_mm_xmm(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movl_T0_mm_xmm;
}

static inline void gen_op_shufps(long param1, long param2, long param3)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opparam_ptr++ = param3;
    *gen_opc_ptr++ = INDEX_op_shufps;
}

static inline void gen_op_shufpd(long param1, long param2, long param3)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opparam_ptr++ = param3;
    *gen_opc_ptr++ = INDEX_op_shufpd;
}

static inline void gen_op_pshufd_xmm(long param1, long param2, long param3)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opparam_ptr++ = param3;
    *gen_opc_ptr++ = INDEX_op_pshufd_xmm;
}

static inline void gen_op_pshuflw_xmm(long param1, long param2, long param3)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opparam_ptr++ = param3;
    *gen_opc_ptr++ = INDEX_op_pshuflw_xmm;
}

static inline void gen_op_pshufhw_xmm(long param1, long param2, long param3)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opparam_ptr++ = param3;
    *gen_opc_ptr++ = INDEX_op_pshufhw_xmm;
}

static inline void gen_op_addps(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_addps;
}

static inline void gen_op_addss(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_addss;
}

static inline void gen_op_addpd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_addpd;
}

static inline void gen_op_addsd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_addsd;
}

static inline void gen_op_subps(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_subps;
}

static inline void gen_op_subss(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_subss;
}

static inline void gen_op_subpd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_subpd;
}

static inline void gen_op_subsd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_subsd;
}

static inline void gen_op_mulps(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_mulps;
}

static inline void gen_op_mulss(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_mulss;
}

static inline void gen_op_mulpd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_mulpd;
}

static inline void gen_op_mulsd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_mulsd;
}

static inline void gen_op_divps(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_divps;
}

static inline void gen_op_divss(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_divss;
}

static inline void gen_op_divpd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_divpd;
}

static inline void gen_op_divsd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_divsd;
}

static inline void gen_op_minps(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_minps;
}

static inline void gen_op_minss(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_minss;
}

static inline void gen_op_minpd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_minpd;
}

static inline void gen_op_minsd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_minsd;
}

static inline void gen_op_maxps(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_maxps;
}

static inline void gen_op_maxss(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_maxss;
}

static inline void gen_op_maxpd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_maxpd;
}

static inline void gen_op_maxsd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_maxsd;
}

static inline void gen_op_sqrtps(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_sqrtps;
}

static inline void gen_op_sqrtss(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_sqrtss;
}

static inline void gen_op_sqrtpd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_sqrtpd;
}

static inline void gen_op_sqrtsd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_sqrtsd;
}

static inline void gen_op_cvtps2pd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cvtps2pd;
}

static inline void gen_op_cvtpd2ps(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cvtpd2ps;
}

static inline void gen_op_cvtss2sd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cvtss2sd;
}

static inline void gen_op_cvtsd2ss(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cvtsd2ss;
}

static inline void gen_op_cvtdq2ps(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cvtdq2ps;
}

static inline void gen_op_cvtdq2pd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cvtdq2pd;
}

static inline void gen_op_cvtpi2ps(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cvtpi2ps;
}

static inline void gen_op_cvtpi2pd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cvtpi2pd;
}

static inline void gen_op_cvtsi2ss(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_cvtsi2ss;
}

static inline void gen_op_cvtsi2sd(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_cvtsi2sd;
}

static inline void gen_op_cvtps2dq(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cvtps2dq;
}

static inline void gen_op_cvtpd2dq(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cvtpd2dq;
}

static inline void gen_op_cvtps2pi(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cvtps2pi;
}

static inline void gen_op_cvtpd2pi(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cvtpd2pi;
}

static inline void gen_op_cvtss2si(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_cvtss2si;
}

static inline void gen_op_cvtsd2si(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_cvtsd2si;
}

static inline void gen_op_cvttps2dq(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cvttps2dq;
}

static inline void gen_op_cvttpd2dq(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cvttpd2dq;
}

static inline void gen_op_cvttps2pi(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cvttps2pi;
}

static inline void gen_op_cvttpd2pi(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cvttpd2pi;
}

static inline void gen_op_cvttss2si(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_cvttss2si;
}

static inline void gen_op_cvttsd2si(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_cvttsd2si;
}

static inline void gen_op_rsqrtps(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_rsqrtps;
}

static inline void gen_op_rsqrtss(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_rsqrtss;
}

static inline void gen_op_rcpps(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_rcpps;
}

static inline void gen_op_rcpss(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_rcpss;
}

static inline void gen_op_haddps(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_haddps;
}

static inline void gen_op_haddpd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_haddpd;
}

static inline void gen_op_hsubps(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_hsubps;
}

static inline void gen_op_hsubpd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_hsubpd;
}

static inline void gen_op_addsubps(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_addsubps;
}

static inline void gen_op_addsubpd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_addsubpd;
}

static inline void gen_op_cmpeqps(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpeqps;
}

static inline void gen_op_cmpeqss(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpeqss;
}

static inline void gen_op_cmpeqpd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpeqpd;
}

static inline void gen_op_cmpeqsd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpeqsd;
}

static inline void gen_op_cmpltps(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpltps;
}

static inline void gen_op_cmpltss(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpltss;
}

static inline void gen_op_cmpltpd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpltpd;
}

static inline void gen_op_cmpltsd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpltsd;
}

static inline void gen_op_cmpleps(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpleps;
}

static inline void gen_op_cmpless(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpless;
}

static inline void gen_op_cmplepd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmplepd;
}

static inline void gen_op_cmplesd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmplesd;
}

static inline void gen_op_cmpunordps(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpunordps;
}

static inline void gen_op_cmpunordss(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpunordss;
}

static inline void gen_op_cmpunordpd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpunordpd;
}

static inline void gen_op_cmpunordsd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpunordsd;
}

static inline void gen_op_cmpneqps(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpneqps;
}

static inline void gen_op_cmpneqss(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpneqss;
}

static inline void gen_op_cmpneqpd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpneqpd;
}

static inline void gen_op_cmpneqsd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpneqsd;
}

static inline void gen_op_cmpnltps(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpnltps;
}

static inline void gen_op_cmpnltss(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpnltss;
}

static inline void gen_op_cmpnltpd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpnltpd;
}

static inline void gen_op_cmpnltsd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpnltsd;
}

static inline void gen_op_cmpnleps(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpnleps;
}

static inline void gen_op_cmpnless(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpnless;
}

static inline void gen_op_cmpnlepd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpnlepd;
}

static inline void gen_op_cmpnlesd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpnlesd;
}

static inline void gen_op_cmpordps(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpordps;
}

static inline void gen_op_cmpordss(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpordss;
}

static inline void gen_op_cmpordpd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpordpd;
}

static inline void gen_op_cmpordsd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_cmpordsd;
}

static inline void gen_op_ucomiss(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_ucomiss;
}

static inline void gen_op_comiss(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_comiss;
}

static inline void gen_op_ucomisd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_ucomisd;
}

static inline void gen_op_comisd(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_comisd;
}

static inline void gen_op_movmskps(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movmskps;
}

static inline void gen_op_movmskpd(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_movmskpd;
}

static inline void gen_op_pmovmskb_xmm(long param1)
{
    *gen_opparam_ptr++ = param1;
    *gen_opc_ptr++ = INDEX_op_pmovmskb_xmm;
}

static inline void gen_op_pinsrw_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pinsrw_xmm;
}

static inline void gen_op_pextrw_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_pextrw_xmm;
}

static inline void gen_op_packsswb_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_packsswb_xmm;
}

static inline void gen_op_packuswb_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_packuswb_xmm;
}

static inline void gen_op_packssdw_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_packssdw_xmm;
}

static inline void gen_op_punpcklbw_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_punpcklbw_xmm;
}

static inline void gen_op_punpcklwd_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_punpcklwd_xmm;
}

static inline void gen_op_punpckldq_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_punpckldq_xmm;
}

static inline void gen_op_punpcklqdq_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_punpcklqdq_xmm;
}

static inline void gen_op_punpckhbw_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_punpckhbw_xmm;
}

static inline void gen_op_punpckhwd_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_punpckhwd_xmm;
}

static inline void gen_op_punpckhdq_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_punpckhdq_xmm;
}

static inline void gen_op_punpckhqdq_xmm(long param1, long param2)
{
    *gen_opparam_ptr++ = param1;
    *gen_opparam_ptr++ = param2;
    *gen_opc_ptr++ = INDEX_op_punpckhqdq_xmm;
}

static inline void gen_op_vmrun(void)
{
    *gen_opc_ptr++ = INDEX_op_vmrun;
}

static inline void gen_op_vmmcall(void)
{
    *gen_opc_ptr++ = INDEX_op_vmmcall;
}

static inline void gen_op_vmload(void)
{
    *gen_opc_ptr++ = INDEX_op_vmload;
}

static inline void gen_op_vmsave(void)
{
    *gen_opc_ptr++ = INDEX_op_vmsave;
}

static inline void gen_op_stgi(void)
{
    *gen_opc_ptr++ = INDEX_op_stgi;
}

static inline void gen_op_clgi(void)
{
    *gen_opc_ptr++ = INDEX_op_clgi;
}

static inline void gen_op_skinit(void)
{
    *gen_opc_ptr++ = INDEX_op_skinit;
}

static inline void gen_op_invlpga(void)
{
    *gen_opc_ptr++ = INDEX_op_invlpga;
}

