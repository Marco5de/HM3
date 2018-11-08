	.file	"runge_kutta.c"
	.text
	.globl	phi
	.type	phi, @function
phi:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
	movsd	-24(%rbp), %xmm0
	call	sin
	movapd	%xmm0, %xmm1
	movq	.LC0(%rip), %xmm0
	xorpd	%xmm1, %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	phi, .-phi
	.section	.rodata
.LC1:
	.string	"DeltaT stepwidth: %s\n"
.LC2:
	.string	"y0 starting point: %s\n"
.LC3:
	.string	"t0 as starting point: %s\n"
.LC4:
	.string	"t_final endpoint: %s\n"
.LC6:
	.string	"%10c   %10c\n\n"
.LC7:
	.string	"%10.2f   %10.2f\n"
.LC8:
	.string	"%10.2f    %10.2f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, -132(%rbp)
	movq	%rsi, -144(%rbp)
	movq	%rsp, %rax
	movq	%rax, %rbx
	movq	-144(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movq	-144(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movq	-144(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movq	-144(%rbp), %rax
	addq	$32, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movq	-144(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atof
	movq	%xmm0, %rax
	movq	%rax, -72(%rbp)
	movq	-144(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atof
	movq	%xmm0, %rax
	movq	%rax, -80(%rbp)
	movq	-144(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atof
	movq	%xmm0, %rax
	movq	%rax, -64(%rbp)
	movq	-144(%rbp), %rax
	addq	$32, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atof
	movq	%xmm0, %rax
	movq	%rax, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	subsd	-64(%rbp), %xmm0
	divsd	-72(%rbp), %xmm0
	movsd	.LC5(%rip), %xmm1
	addsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, -92(%rbp)
	movq	$phi, -104(%rbp)
	movl	$121, %edx
	movl	$116, %esi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	printf
	movsd	-80(%rbp), %xmm0
	movq	-64(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, -152(%rbp)
	movsd	-152(%rbp), %xmm0
	movl	$.LC7, %edi
	movl	$2, %eax
	call	printf
	movl	-92(%rbp), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -112(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, %r14
	movl	$0, %r15d
	movslq	%eax, %rdx
	movq	%rdx, %r12
	movl	$0, %r13d
	cltq
	salq	$3, %rax
	leaq	7(%rax), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ecx
	movl	$0, %edx
	divq	%rcx
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -120(%rbp)
	movq	-120(%rbp), %rax
	movsd	-80(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	movl	$1, -52(%rbp)
	jmp	.L4
.L5:
	movl	-52(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-120(%rbp), %rax
	movslq	%edx, %rdx
	movsd	(%rax,%rdx,8), %xmm0
	movq	-104(%rbp), %rdx
	movsd	-64(%rbp), %xmm1
	movq	-72(%rbp), %rax
	movq	%rdx, %rdi
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rax, -152(%rbp)
	movsd	-152(%rbp), %xmm0
	call	runge_kutta
	movq	%xmm0, %rcx
	movq	-120(%rbp), %rax
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	movq	%rcx, (%rax,%rdx,8)
	movq	-120(%rbp), %rax
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	movsd	(%rax,%rdx,8), %xmm1
	movsd	-64(%rbp), %xmm0
	addsd	-72(%rbp), %xmm0
	movl	$.LC8, %edi
	movl	$2, %eax
	call	printf
	movsd	-64(%rbp), %xmm0
	addsd	-72(%rbp), %xmm0
	movsd	%xmm0, -64(%rbp)
	addl	$1, -52(%rbp)
.L4:
	movl	-52(%rbp), %eax
	cmpl	-92(%rbp), %eax
	jl	.L5
	movq	%rbx, %rsp
	movl	$0, %eax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.globl	runge_kutta
	.type	runge_kutta, @function
runge_kutta:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movsd	%xmm0, -40(%rbp)
	movsd	%xmm1, -48(%rbp)
	movsd	%xmm2, -56(%rbp)
	movq	%rdi, -64(%rbp)
	movsd	-48(%rbp), %xmm0
	movq	-56(%rbp), %rdx
	movq	-64(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rdx, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	call	*%rax
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	movsd	-40(%rbp), %xmm1
	movsd	.LC9(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	-8(%rbp), %xmm0
	movapd	%xmm0, %xmm2
	addsd	-48(%rbp), %xmm2
	movsd	-40(%rbp), %xmm1
	movsd	.LC9(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	addsd	-56(%rbp), %xmm0
	movq	-64(%rbp), %rax
	movapd	%xmm2, %xmm1
	call	*%rax
	movq	%xmm0, %rax
	movq	%rax, -16(%rbp)
	movsd	-40(%rbp), %xmm1
	movsd	.LC9(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	-16(%rbp), %xmm0
	movapd	%xmm0, %xmm2
	addsd	-48(%rbp), %xmm2
	movsd	-40(%rbp), %xmm1
	movsd	.LC9(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	addsd	-56(%rbp), %xmm0
	movq	-64(%rbp), %rax
	movapd	%xmm2, %xmm1
	call	*%rax
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
	movsd	-24(%rbp), %xmm0
	mulsd	-40(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	addsd	-48(%rbp), %xmm1
	movsd	-56(%rbp), %xmm0
	addsd	-40(%rbp), %xmm0
	movq	-64(%rbp), %rax
	call	*%rax
	movq	%xmm0, %rax
	movq	%rax, -32(%rbp)
	movsd	-8(%rbp), %xmm0
	movsd	.LC10(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movsd	-16(%rbp), %xmm0
	movsd	.LC11(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movsd	-24(%rbp), %xmm0
	movsd	.LC11(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movsd	-32(%rbp), %xmm0
	movsd	.LC10(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	mulsd	-40(%rbp), %xmm0
	addsd	-48(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	runge_kutta, .-runge_kutta
	.section	.rodata
	.align 16
.LC0:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.align 8
.LC5:
	.long	0
	.long	1072693248
	.align 8
.LC9:
	.long	0
	.long	1071644672
	.align 8
.LC10:
	.long	0
	.long	1075314688
	.align 8
.LC11:
	.long	0
	.long	1074266112
	.ident	"GCC: (GNU) 7.3.0"
