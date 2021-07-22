	.text
	.file	"timedloop.c"
	.globl	get_time
	.align	16, 0x90
	.type	get_time,@function
get_time:                               # @get_time
	.cfi_startproc
# BB#0:
	subq	$24, %rsp
.Ltmp0:
	.cfi_def_cfa_offset 32
	leaq	8(%rsp), %rsi
	movl	$1, %edi
	callq	clock_gettime
	imulq	$1000000000, 8(%rsp), %rax # imm = 0x3B9ACA00
	addq	16(%rsp), %rax
	addq	$24, %rsp
	retq
.Lfunc_end0:
	.size	get_time, .Lfunc_end0-get_time
	.cfi_endproc

	.globl	output_timings
	.align	16, 0x90
	.type	output_timings,@function
output_timings:                         # @output_timings
	.cfi_startproc
# BB#0:
	pushq	%r14
.Ltmp1:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp2:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Ltmp3:
	.cfi_def_cfa_offset 32
.Ltmp4:
	.cfi_offset %rbx, -24
.Ltmp5:
	.cfi_offset %r14, -16
	movq	%rdi, %r14
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movq	(%r14,%rbx,8), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	incq	%rbx
	cmpq	$10000000, %rbx         # imm = 0x989680
	jne	.LBB1_1
# BB#2:
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end1:
	.size	output_timings, .Lfunc_end1-output_timings
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:
	pushq	%r15
.Ltmp6:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp7:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp8:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp9:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp10:
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
.Ltmp11:
	.cfi_def_cfa_offset 64
.Ltmp12:
	.cfi_offset %rbx, -48
.Ltmp13:
	.cfi_offset %r12, -40
.Ltmp14:
	.cfi_offset %r13, -32
.Ltmp15:
	.cfi_offset %r14, -24
.Ltmp16:
	.cfi_offset %r15, -16
	xorl	%r15d, %r15d
	leaq	(%rsp), %r14
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	movl	$1, %edi
	movq	%r14, %rsi
	callq	clock_gettime
	movq	(%rsp), %r12
	movq	8(%rsp), %r13
	movl	$1, %edi
	movq	%r14, %rsi
	callq	clock_gettime
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	subq	%r12, %rax
	imulq	$1000000000, %rax, %rax # imm = 0x3B9ACA00
	subq	%r13, %rcx
	addq	%rax, %rcx
	movq	%rcx, times(%rbx)
	addq	$8, %rbx
	cmpq	$80000000, %rbx         # imm = 0x4C4B400
	jne	.LBB2_1
	.align	16, 0x90
.LBB2_2:                                # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movq	times(%r15), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	addq	$8, %r15
	cmpq	$80000000, %r15         # imm = 0x4C4B400
	jne	.LBB2_2
# BB#3:                                 # %output_timings.exit
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%ld\n"
	.size	.L.str, 5

	.type	times,@object           # @times
	.comm	times,80000000,16

	.ident	"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"
	.section	".note.GNU-stack","",@progbits
