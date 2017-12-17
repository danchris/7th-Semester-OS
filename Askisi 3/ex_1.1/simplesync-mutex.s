	.file	"simplesync.c"
	.text
.Ltext0:
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"About to increase variable %d times\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Done increasing variable.\n"
	.text
	.p2align 4,,15
	.globl	increase_fn
	.type	increase_fn, @function
increase_fn:
.LFB53:
	.file 1 "simplesync.c"
	.loc 1 42 0
	.cfi_startproc
.LVL0:
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
.LVL1:
.LBB12:
.LBB13:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"
	.loc 2 97 0
	movq	stderr(%rip), %rdi
.LVL2:
.LBE13:
.LBE12:
	.loc 1 42 0
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
.LBB16:
.LBB14:
	.loc 2 97 0
	leaq	.LC0(%rip), %rdx
.LBE14:
.LBE16:
	.loc 1 42 0
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.loc 1 54 0
	leaq	m(%rip), %rbp
.LBB17:
.LBB15:
	.loc 2 97 0
	movl	$10000000, %ecx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	$10000000, %ebx
	call	__fprintf_chk@PLT
.LVL3:
	.p2align 4,,10
	.p2align 3
.L2:
.LBE15:
.LBE17:
	.loc 1 54 0
	movq	%rbp, %rdi
	call	pthread_mutex_lock@PLT
.LVL4:
	.loc 1 55 0
	movl	(%r12), %eax
	.loc 1 56 0
	movq	%rbp, %rdi
	.loc 1 55 0
	addl	$1, %eax
	movl	%eax, (%r12)
	.loc 1 56 0
	call	pthread_mutex_unlock@PLT
.LVL5:
	.loc 1 49 0
	subl	$1, %ebx
.LVL6:
	jne	.L2
.LVL7:
.LBB18:
.LBB19:
	.loc 2 97 0
	movq	stderr(%rip), %rcx
	leaq	.LC1(%rip), %rdi
	movl	$26, %edx
	movl	$1, %esi
	call	fwrite@PLT
.LVL8:
.LBE19:
.LBE18:
	.loc 1 63 0
	popq	%rbx
	.cfi_def_cfa_offset 24
.LVL9:
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL10:
	ret
	.cfi_endproc
.LFE53:
	.size	increase_fn, .-increase_fn
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"About to decrease variable %d times\n"
	.section	.rodata.str1.1
.LC3:
	.string	"Done decreasing variable.\n"
	.text
	.p2align 4,,15
	.globl	decrease_fn
	.type	decrease_fn, @function
decrease_fn:
.LFB54:
	.loc 1 66 0
	.cfi_startproc
.LVL11:
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
.LVL12:
.LBB20:
.LBB21:
	.loc 2 97 0
	movq	stderr(%rip), %rdi
.LVL13:
.LBE21:
.LBE20:
	.loc 1 66 0
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
.LBB24:
.LBB22:
	.loc 2 97 0
	leaq	.LC2(%rip), %rdx
.LBE22:
.LBE24:
	.loc 1 66 0
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.loc 1 78 0
	leaq	m(%rip), %rbp
.LBB25:
.LBB23:
	.loc 2 97 0
	movl	$10000000, %ecx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	$10000000, %ebx
	call	__fprintf_chk@PLT
.LVL14:
	.p2align 4,,10
	.p2align 3
.L7:
.LBE23:
.LBE25:
	.loc 1 78 0
	movq	%rbp, %rdi
	call	pthread_mutex_lock@PLT
.LVL15:
	.loc 1 79 0
	movl	(%r12), %eax
	.loc 1 80 0
	movq	%rbp, %rdi
	.loc 1 79 0
	subl	$1, %eax
	movl	%eax, (%r12)
	.loc 1 80 0
	call	pthread_mutex_unlock@PLT
.LVL16:
	.loc 1 73 0
	subl	$1, %ebx
.LVL17:
	jne	.L7
.LVL18:
.LBB26:
.LBB27:
	.loc 2 97 0
	movq	stderr(%rip), %rcx
	leaq	.LC3(%rip), %rdi
	movl	$26, %edx
	movl	$1, %esi
	call	fwrite@PLT
.LVL19:
.LBE27:
.LBE26:
	.loc 1 86 0
	popq	%rbx
	.cfi_def_cfa_offset 24
.LVL20:
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL21:
	ret
	.cfi_endproc
.LFE54:
	.size	decrease_fn, .-decrease_fn
	.section	.rodata.str1.1
.LC4:
	.string	""
.LC5:
	.string	"NOT "
.LC6:
	.string	"pthread_create"
.LC7:
	.string	"pthread_join"
.LC8:
	.string	"%sOK, val = %d.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB55:
	.loc 1 90 0
	.cfi_startproc
.LVL22:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	.loc 1 102 0
	leaq	increase_fn(%rip), %rdx
	xorl	%esi, %esi
.LVL23:
	.loc 1 90 0
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	.loc 1 102 0
	leaq	4(%rsp), %rbx
	leaq	8(%rsp), %rdi
.LVL24:
	.loc 1 97 0
	movl	$0, 4(%rsp)
	.loc 1 90 0
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	.loc 1 102 0
	movq	%rbx, %rcx
	call	pthread_create@PLT
.LVL25:
	.loc 1 103 0
	testl	%eax, %eax
	jne	.L25
	.loc 1 107 0
	leaq	16(%rsp), %rdi
	leaq	decrease_fn(%rip), %rdx
	movq	%rbx, %rcx
	xorl	%esi, %esi
	call	pthread_create@PLT
.LVL26:
	.loc 1 108 0
	testl	%eax, %eax
	.loc 1 107 0
	movl	%eax, %ebx
.LVL27:
	.loc 1 108 0
	jne	.L26
	.loc 1 116 0
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
.LVL28:
	.loc 1 117 0
	testl	%eax, %eax
	.loc 1 116 0
	movl	%eax, %ebx
.LVL29:
	.loc 1 117 0
	jne	.L27
.LVL30:
.L13:
	.loc 1 119 0
	movq	16(%rsp), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
.LVL31:
	.loc 1 120 0
	testl	%eax, %eax
	.loc 1 119 0
	movl	%eax, %ebx
.LVL32:
	.loc 1 120 0
	jne	.L28
.LVL33:
.L14:
	.loc 1 126 0
	movl	4(%rsp), %ecx
	.loc 1 128 0
	leaq	.LC5(%rip), %rax
	leaq	.LC4(%rip), %rdx
	.loc 1 126 0
	xorl	%ebx, %ebx
.LVL34:
.LBB28:
.LBB29:
	.loc 2 104 0
	leaq	.LC8(%rip), %rsi
	movl	$1, %edi
.LBE29:
.LBE28:
	.loc 1 126 0
	testl	%ecx, %ecx
	sete	%bl
.LVL35:
	.loc 1 128 0
	cmovne	%rax, %rdx
.LVL36:
.LBB31:
.LBB30:
	.loc 2 104 0
	xorl	%eax, %eax
	call	__printf_chk@PLT
.LVL37:
.LBE30:
.LBE31:
	.loc 1 130 0
	movq	24(%rsp), %rsi
	xorq	%fs:40, %rsi
	movl	%ebx, %eax
	jne	.L29
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
.LVL38:
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.LVL39:
.L27:
	.cfi_restore_state
	.loc 1 118 0
	call	__errno_location@PLT
.LVL40:
	leaq	.LC7(%rip), %rdi
	movl	%ebx, (%rax)
	call	perror@PLT
.LVL41:
	jmp	.L13
.LVL42:
.L28:
	.loc 1 121 0
	call	__errno_location@PLT
.LVL43:
	leaq	.LC7(%rip), %rdi
	movl	%ebx, (%rax)
	call	perror@PLT
.LVL44:
	jmp	.L14
.LVL45:
.L29:
	.loc 1 130 0
	call	__stack_chk_fail@PLT
.LVL46:
.L26:
	.loc 1 109 0
	call	__errno_location@PLT
.LVL47:
	leaq	.LC6(%rip), %rdi
	movl	%ebx, (%rax)
	call	perror@PLT
.LVL48:
	.loc 1 110 0
	movl	$1, %edi
	call	exit@PLT
.LVL49:
.L25:
	movl	%eax, %ebp
	.loc 1 104 0
	call	__errno_location@PLT
.LVL50:
	leaq	.LC6(%rip), %rdi
	movl	%ebp, (%rax)
	call	perror@PLT
.LVL51:
	.loc 1 105 0
	movl	$1, %edi
	call	exit@PLT
.LVL52:
	.cfi_endproc
.LFE55:
	.size	main, .-main
	.globl	m
	.bss
	.align 32
	.type	m, @object
	.size	m, 40
m:
	.zero	40
	.text
.Letext0:
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 5 "/usr/include/libio.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 7 "/usr/include/stdio.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 11 "/usr/include/unistd.h"
	.file 12 "/usr/include/x86_64-linux-gnu/bits/getopt_core.h"
	.file 13 "/usr/include/time.h"
	.file 14 "/usr/include/pthread.h"
	.file 15 "/usr/include/errno.h"
	.file 16 "/usr/include/stdlib.h"
	.file 17 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x9e4
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF103
	.byte	0xc
	.long	.LASF104
	.long	.LASF105
	.long	.Ldebug_ranges0+0xb0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x3
	.byte	0xd8
	.long	0x34
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x5
	.long	0x5e
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x4
	.byte	0x8c
	.long	0x6a
	.uleb128 0x2
	.long	.LASF9
	.byte	0x4
	.byte	0x8d
	.long	0x6a
	.uleb128 0x6
	.byte	0x8
	.uleb128 0x7
	.byte	0x8
	.long	0x8f
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF10
	.uleb128 0x8
	.long	0x8f
	.uleb128 0x9
	.long	.LASF41
	.byte	0xd8
	.byte	0x5
	.byte	0xf1
	.long	0x218
	.uleb128 0xa
	.long	.LASF11
	.byte	0x5
	.byte	0xf2
	.long	0x5e
	.byte	0
	.uleb128 0xa
	.long	.LASF12
	.byte	0x5
	.byte	0xf7
	.long	0x89
	.byte	0x8
	.uleb128 0xa
	.long	.LASF13
	.byte	0x5
	.byte	0xf8
	.long	0x89
	.byte	0x10
	.uleb128 0xa
	.long	.LASF14
	.byte	0x5
	.byte	0xf9
	.long	0x89
	.byte	0x18
	.uleb128 0xa
	.long	.LASF15
	.byte	0x5
	.byte	0xfa
	.long	0x89
	.byte	0x20
	.uleb128 0xa
	.long	.LASF16
	.byte	0x5
	.byte	0xfb
	.long	0x89
	.byte	0x28
	.uleb128 0xa
	.long	.LASF17
	.byte	0x5
	.byte	0xfc
	.long	0x89
	.byte	0x30
	.uleb128 0xa
	.long	.LASF18
	.byte	0x5
	.byte	0xfd
	.long	0x89
	.byte	0x38
	.uleb128 0xa
	.long	.LASF19
	.byte	0x5
	.byte	0xfe
	.long	0x89
	.byte	0x40
	.uleb128 0xb
	.long	.LASF20
	.byte	0x5
	.value	0x100
	.long	0x89
	.byte	0x48
	.uleb128 0xb
	.long	.LASF21
	.byte	0x5
	.value	0x101
	.long	0x89
	.byte	0x50
	.uleb128 0xb
	.long	.LASF22
	.byte	0x5
	.value	0x102
	.long	0x89
	.byte	0x58
	.uleb128 0xb
	.long	.LASF23
	.byte	0x5
	.value	0x104
	.long	0x25b
	.byte	0x60
	.uleb128 0xb
	.long	.LASF24
	.byte	0x5
	.value	0x106
	.long	0x261
	.byte	0x68
	.uleb128 0xb
	.long	.LASF25
	.byte	0x5
	.value	0x108
	.long	0x5e
	.byte	0x70
	.uleb128 0xb
	.long	.LASF26
	.byte	0x5
	.value	0x10c
	.long	0x5e
	.byte	0x74
	.uleb128 0xb
	.long	.LASF27
	.byte	0x5
	.value	0x10e
	.long	0x71
	.byte	0x78
	.uleb128 0xb
	.long	.LASF28
	.byte	0x5
	.value	0x112
	.long	0x42
	.byte	0x80
	.uleb128 0xb
	.long	.LASF29
	.byte	0x5
	.value	0x113
	.long	0x50
	.byte	0x82
	.uleb128 0xb
	.long	.LASF30
	.byte	0x5
	.value	0x114
	.long	0x267
	.byte	0x83
	.uleb128 0xb
	.long	.LASF31
	.byte	0x5
	.value	0x118
	.long	0x277
	.byte	0x88
	.uleb128 0xb
	.long	.LASF32
	.byte	0x5
	.value	0x121
	.long	0x7c
	.byte	0x90
	.uleb128 0xb
	.long	.LASF33
	.byte	0x5
	.value	0x129
	.long	0x87
	.byte	0x98
	.uleb128 0xb
	.long	.LASF34
	.byte	0x5
	.value	0x12a
	.long	0x87
	.byte	0xa0
	.uleb128 0xb
	.long	.LASF35
	.byte	0x5
	.value	0x12b
	.long	0x87
	.byte	0xa8
	.uleb128 0xb
	.long	.LASF36
	.byte	0x5
	.value	0x12c
	.long	0x87
	.byte	0xb0
	.uleb128 0xb
	.long	.LASF37
	.byte	0x5
	.value	0x12e
	.long	0x29
	.byte	0xb8
	.uleb128 0xb
	.long	.LASF38
	.byte	0x5
	.value	0x12f
	.long	0x5e
	.byte	0xc0
	.uleb128 0xb
	.long	.LASF39
	.byte	0x5
	.value	0x131
	.long	0x27d
	.byte	0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF40
	.byte	0x6
	.byte	0x7
	.long	0x9b
	.uleb128 0xc
	.long	.LASF106
	.byte	0x5
	.byte	0x96
	.uleb128 0x9
	.long	.LASF42
	.byte	0x18
	.byte	0x5
	.byte	0x9c
	.long	0x25b
	.uleb128 0xa
	.long	.LASF43
	.byte	0x5
	.byte	0x9d
	.long	0x25b
	.byte	0
	.uleb128 0xa
	.long	.LASF44
	.byte	0x5
	.byte	0x9e
	.long	0x261
	.byte	0x8
	.uleb128 0xa
	.long	.LASF45
	.byte	0x5
	.byte	0xa2
	.long	0x5e
	.byte	0x10
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x22a
	.uleb128 0x7
	.byte	0x8
	.long	0x9b
	.uleb128 0xd
	.long	0x8f
	.long	0x277
	.uleb128 0xe
	.long	0x34
	.byte	0
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x223
	.uleb128 0xd
	.long	0x8f
	.long	0x28d
	.uleb128 0xe
	.long	0x34
	.byte	0x13
	.byte	0
	.uleb128 0xf
	.long	.LASF107
	.uleb128 0x10
	.long	.LASF46
	.byte	0x5
	.value	0x13b
	.long	0x28d
	.uleb128 0x10
	.long	.LASF47
	.byte	0x5
	.value	0x13c
	.long	0x28d
	.uleb128 0x10
	.long	.LASF48
	.byte	0x5
	.value	0x13d
	.long	0x28d
	.uleb128 0x7
	.byte	0x8
	.long	0x96
	.uleb128 0x8
	.long	0x2b6
	.uleb128 0x11
	.long	0x2b6
	.uleb128 0x12
	.long	.LASF49
	.byte	0x7
	.byte	0x87
	.long	0x261
	.uleb128 0x12
	.long	.LASF50
	.byte	0x7
	.byte	0x88
	.long	0x261
	.uleb128 0x12
	.long	.LASF51
	.byte	0x7
	.byte	0x89
	.long	0x261
	.uleb128 0x12
	.long	.LASF52
	.byte	0x8
	.byte	0x1a
	.long	0x5e
	.uleb128 0xd
	.long	0x2bc
	.long	0x2fd
	.uleb128 0x13
	.byte	0
	.uleb128 0x8
	.long	0x2f2
	.uleb128 0x12
	.long	.LASF53
	.byte	0x8
	.byte	0x1b
	.long	0x2fd
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF54
	.uleb128 0x9
	.long	.LASF55
	.byte	0x10
	.byte	0x9
	.byte	0x3f
	.long	0x339
	.uleb128 0xa
	.long	.LASF56
	.byte	0x9
	.byte	0x41
	.long	0x339
	.byte	0
	.uleb128 0xa
	.long	.LASF57
	.byte	0x9
	.byte	0x42
	.long	0x339
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x314
	.uleb128 0x2
	.long	.LASF58
	.byte	0x9
	.byte	0x43
	.long	0x314
	.uleb128 0x9
	.long	.LASF59
	.byte	0x28
	.byte	0x9
	.byte	0x63
	.long	0x3b7
	.uleb128 0xa
	.long	.LASF60
	.byte	0x9
	.byte	0x65
	.long	0x5e
	.byte	0
	.uleb128 0xa
	.long	.LASF61
	.byte	0x9
	.byte	0x66
	.long	0x49
	.byte	0x4
	.uleb128 0xa
	.long	.LASF62
	.byte	0x9
	.byte	0x67
	.long	0x5e
	.byte	0x8
	.uleb128 0xa
	.long	.LASF63
	.byte	0x9
	.byte	0x69
	.long	0x49
	.byte	0xc
	.uleb128 0xa
	.long	.LASF64
	.byte	0x9
	.byte	0x6d
	.long	0x5e
	.byte	0x10
	.uleb128 0xa
	.long	.LASF65
	.byte	0x9
	.byte	0x70
	.long	0x57
	.byte	0x14
	.uleb128 0xa
	.long	.LASF66
	.byte	0x9
	.byte	0x70
	.long	0x57
	.byte	0x16
	.uleb128 0xa
	.long	.LASF67
	.byte	0x9
	.byte	0x71
	.long	0x33f
	.byte	0x18
	.byte	0
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF68
	.uleb128 0x2
	.long	.LASF69
	.byte	0xa
	.byte	0x1b
	.long	0x34
	.uleb128 0x14
	.byte	0x28
	.byte	0xa
	.byte	0x43
	.long	0x3f3
	.uleb128 0x15
	.long	.LASF70
	.byte	0xa
	.byte	0x45
	.long	0x34a
	.uleb128 0x15
	.long	.LASF71
	.byte	0xa
	.byte	0x46
	.long	0x3f3
	.uleb128 0x15
	.long	.LASF72
	.byte	0xa
	.byte	0x47
	.long	0x6a
	.byte	0
	.uleb128 0xd
	.long	0x8f
	.long	0x403
	.uleb128 0xe
	.long	0x34
	.byte	0x27
	.byte	0
	.uleb128 0x2
	.long	.LASF73
	.byte	0xa
	.byte	0x48
	.long	0x3c9
	.uleb128 0x10
	.long	.LASF74
	.byte	0xb
	.value	0x222
	.long	0x41a
	.uleb128 0x7
	.byte	0x8
	.long	0x89
	.uleb128 0x12
	.long	.LASF75
	.byte	0xc
	.byte	0x24
	.long	0x89
	.uleb128 0x12
	.long	.LASF76
	.byte	0xc
	.byte	0x32
	.long	0x5e
	.uleb128 0x12
	.long	.LASF77
	.byte	0xc
	.byte	0x37
	.long	0x5e
	.uleb128 0x12
	.long	.LASF78
	.byte	0xc
	.byte	0x3b
	.long	0x5e
	.uleb128 0xd
	.long	0x89
	.long	0x45c
	.uleb128 0xe
	.long	0x34
	.byte	0x1
	.byte	0
	.uleb128 0x12
	.long	.LASF79
	.byte	0xd
	.byte	0x9f
	.long	0x44c
	.uleb128 0x12
	.long	.LASF80
	.byte	0xd
	.byte	0xa0
	.long	0x5e
	.uleb128 0x12
	.long	.LASF81
	.byte	0xd
	.byte	0xa1
	.long	0x6a
	.uleb128 0x12
	.long	.LASF82
	.byte	0xd
	.byte	0xa6
	.long	0x44c
	.uleb128 0x12
	.long	.LASF83
	.byte	0xd
	.byte	0xae
	.long	0x5e
	.uleb128 0x12
	.long	.LASF84
	.byte	0xd
	.byte	0xaf
	.long	0x6a
	.uleb128 0x16
	.string	"m"
	.byte	0x1
	.byte	0x26
	.long	0x403
	.uleb128 0x9
	.byte	0x3
	.quad	m
	.uleb128 0x17
	.long	.LASF87
	.byte	0x1
	.byte	0x59
	.long	0x5e
	.quad	.LFB55
	.quad	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.long	0x6ec
	.uleb128 0x18
	.long	.LASF85
	.byte	0x1
	.byte	0x59
	.long	0x5e
	.long	.LLST10
	.uleb128 0x18
	.long	.LASF86
	.byte	0x1
	.byte	0x59
	.long	0x41a
	.long	.LLST11
	.uleb128 0x19
	.string	"val"
	.byte	0x1
	.byte	0x5b
	.long	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1a
	.string	"ret"
	.byte	0x1
	.byte	0x5b
	.long	0x5e
	.long	.LLST12
	.uleb128 0x1a
	.string	"ok"
	.byte	0x1
	.byte	0x5b
	.long	0x5e
	.long	.LLST13
	.uleb128 0x19
	.string	"t1"
	.byte	0x1
	.byte	0x5c
	.long	0x3be
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x19
	.string	"t2"
	.byte	0x1
	.byte	0x5c
	.long	0x3be
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1b
	.long	0x918
	.quad	.LBB28
	.long	.Ldebug_ranges0+0x80
	.byte	0x1
	.byte	0x80
	.long	0x576
	.uleb128 0x1c
	.long	0x928
	.long	.LLST14
	.uleb128 0x1d
	.quad	.LVL37
	.long	0x968
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC8
	.byte	0
	.byte	0
	.uleb128 0x1f
	.quad	.LVL25
	.long	0x973
	.long	0x5a6
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	increase_fn
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x1f
	.quad	.LVL26
	.long	0x973
	.long	0x5d6
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	decrease_fn
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x1f
	.quad	.LVL28
	.long	0x97e
	.long	0x5ed
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1f
	.quad	.LVL31
	.long	0x97e
	.long	0x604
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x20
	.quad	.LVL40
	.long	0x989
	.uleb128 0x1f
	.quad	.LVL41
	.long	0x994
	.long	0x630
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC7
	.byte	0
	.uleb128 0x20
	.quad	.LVL43
	.long	0x989
	.uleb128 0x1f
	.quad	.LVL44
	.long	0x994
	.long	0x65c
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC7
	.byte	0
	.uleb128 0x20
	.quad	.LVL46
	.long	0x9a0
	.uleb128 0x20
	.quad	.LVL47
	.long	0x989
	.uleb128 0x1f
	.quad	.LVL48
	.long	0x994
	.long	0x695
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC6
	.byte	0
	.uleb128 0x1f
	.quad	.LVL49
	.long	0x9a9
	.long	0x6ac
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x20
	.quad	.LVL50
	.long	0x989
	.uleb128 0x1f
	.quad	.LVL51
	.long	0x994
	.long	0x6d8
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC6
	.byte	0
	.uleb128 0x1d
	.quad	.LVL52
	.long	0x9a9
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x17
	.long	.LASF88
	.byte	0x1
	.byte	0x41
	.long	0x87
	.quad	.LFB54
	.quad	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.long	0x7ff
	.uleb128 0x21
	.string	"arg"
	.byte	0x1
	.byte	0x41
	.long	0x87
	.long	.LLST5
	.uleb128 0x1a
	.string	"i"
	.byte	0x1
	.byte	0x43
	.long	0x5e
	.long	.LLST6
	.uleb128 0x1a
	.string	"ip"
	.byte	0x1
	.byte	0x44
	.long	0x7ff
	.long	.LLST7
	.uleb128 0x1b
	.long	0x935
	.quad	.LBB20
	.long	.Ldebug_ranges0+0x40
	.byte	0x1
	.byte	0x46
	.long	0x783
	.uleb128 0x1c
	.long	0x950
	.long	.LLST8
	.uleb128 0x22
	.long	0x945
	.uleb128 0x1d
	.quad	.LVL14
	.long	0x9b5
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x23
	.long	0x935
	.quad	.LBB26
	.quad	.LBE26-.LBB26
	.byte	0x1
	.byte	0x53
	.long	0x7d2
	.uleb128 0x1c
	.long	0x950
	.long	.LLST9
	.uleb128 0x22
	.long	0x945
	.uleb128 0x1d
	.quad	.LVL19
	.long	0x9c0
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC3
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x4a
	.byte	0
	.byte	0
	.uleb128 0x1f
	.quad	.LVL15
	.long	0x9cf
	.long	0x7ea
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x1d
	.quad	.LVL16
	.long	0x9db
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x65
	.uleb128 0x17
	.long	.LASF89
	.byte	0x1
	.byte	0x29
	.long	0x87
	.quad	.LFB53
	.quad	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.long	0x918
	.uleb128 0x21
	.string	"arg"
	.byte	0x1
	.byte	0x29
	.long	0x87
	.long	.LLST0
	.uleb128 0x1a
	.string	"i"
	.byte	0x1
	.byte	0x2b
	.long	0x5e
	.long	.LLST1
	.uleb128 0x1a
	.string	"ip"
	.byte	0x1
	.byte	0x2c
	.long	0x7ff
	.long	.LLST2
	.uleb128 0x1b
	.long	0x935
	.quad	.LBB12
	.long	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x2e
	.long	0x89c
	.uleb128 0x1c
	.long	0x950
	.long	.LLST3
	.uleb128 0x22
	.long	0x945
	.uleb128 0x1d
	.quad	.LVL3
	.long	0x9b5
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC0
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x23
	.long	0x935
	.quad	.LBB18
	.quad	.LBE18-.LBB18
	.byte	0x1
	.byte	0x3b
	.long	0x8eb
	.uleb128 0x1c
	.long	0x950
	.long	.LLST4
	.uleb128 0x22
	.long	0x945
	.uleb128 0x1d
	.quad	.LVL8
	.long	0x9c0
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x4a
	.byte	0
	.byte	0
	.uleb128 0x1f
	.quad	.LVL4
	.long	0x9cf
	.long	0x903
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x1d
	.quad	.LVL5
	.long	0x9db
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x24
	.long	.LASF90
	.byte	0x2
	.byte	0x66
	.long	0x5e
	.byte	0x3
	.long	0x935
	.uleb128 0x25
	.long	.LASF92
	.byte	0x2
	.byte	0x66
	.long	0x2c1
	.uleb128 0x26
	.byte	0
	.uleb128 0x24
	.long	.LASF91
	.byte	0x2
	.byte	0x5f
	.long	0x5e
	.byte	0x3
	.long	0x95d
	.uleb128 0x25
	.long	.LASF93
	.byte	0x2
	.byte	0x5f
	.long	0x963
	.uleb128 0x25
	.long	.LASF92
	.byte	0x2
	.byte	0x5f
	.long	0x2c1
	.uleb128 0x26
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x218
	.uleb128 0x11
	.long	0x95d
	.uleb128 0x27
	.long	.LASF94
	.long	.LASF94
	.byte	0x2
	.byte	0x57
	.uleb128 0x27
	.long	.LASF95
	.long	.LASF95
	.byte	0xe
	.byte	0xea
	.uleb128 0x27
	.long	.LASF96
	.long	.LASF96
	.byte	0xe
	.byte	0xfb
	.uleb128 0x27
	.long	.LASF97
	.long	.LASF97
	.byte	0xf
	.byte	0x25
	.uleb128 0x28
	.long	.LASF98
	.long	.LASF98
	.byte	0x7
	.value	0x307
	.uleb128 0x29
	.long	.LASF108
	.long	.LASF108
	.uleb128 0x28
	.long	.LASF99
	.long	.LASF99
	.byte	0x10
	.value	0x1f3
	.uleb128 0x27
	.long	.LASF100
	.long	.LASF100
	.byte	0x2
	.byte	0x55
	.uleb128 0x2a
	.long	.LASF109
	.long	.LASF110
	.byte	0x11
	.byte	0
	.long	.LASF109
	.uleb128 0x28
	.long	.LASF101
	.long	.LASF101
	.byte	0xe
	.value	0x2fb
	.uleb128 0x28
	.long	.LASF102
	.long	.LASF102
	.byte	0xe
	.value	0x306
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST10:
	.quad	.LVL22
	.quad	.LVL24
	.value	0x1
	.byte	0x55
	.quad	.LVL24
	.quad	.LFE55
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST11:
	.quad	.LVL22
	.quad	.LVL23
	.value	0x1
	.byte	0x54
	.quad	.LVL23
	.quad	.LFE55
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST12:
	.quad	.LVL25
	.quad	.LVL26-1
	.value	0x1
	.byte	0x50
	.quad	.LVL27
	.quad	.LVL28-1
	.value	0x1
	.byte	0x50
	.quad	.LVL28-1
	.quad	.LVL29
	.value	0x1
	.byte	0x53
	.quad	.LVL29
	.quad	.LVL30
	.value	0x1
	.byte	0x50
	.quad	.LVL30
	.quad	.LVL32
	.value	0x1
	.byte	0x53
	.quad	.LVL32
	.quad	.LVL33
	.value	0x1
	.byte	0x50
	.quad	.LVL33
	.quad	.LVL34
	.value	0x1
	.byte	0x53
	.quad	.LVL39
	.quad	.LVL40-1
	.value	0x1
	.byte	0x50
	.quad	.LVL40-1
	.quad	.LVL42
	.value	0x1
	.byte	0x53
	.quad	.LVL42
	.quad	.LVL43-1
	.value	0x1
	.byte	0x50
	.quad	.LVL43-1
	.quad	.LVL45
	.value	0x1
	.byte	0x53
	.quad	.LVL46
	.quad	.LVL47-1
	.value	0x1
	.byte	0x50
	.quad	.LVL47-1
	.quad	.LVL49
	.value	0x1
	.byte	0x53
	.quad	.LVL49
	.quad	.LVL50-1
	.value	0x1
	.byte	0x50
	.quad	.LVL50-1
	.quad	.LFE55
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST13:
	.quad	.LVL35
	.quad	.LVL38
	.value	0x1
	.byte	0x53
	.quad	.LVL38
	.quad	.LVL39
	.value	0x1
	.byte	0x50
	.quad	.LVL45
	.quad	.LVL46-1
	.value	0x1
	.byte	0x50
	.quad	.LVL46-1
	.quad	.LVL46
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST14:
	.quad	.LVL36
	.quad	.LVL37
	.value	0xa
	.byte	0x3
	.quad	.LC8
	.byte	0x9f
	.quad	0
	.quad	0
.LLST5:
	.quad	.LVL11
	.quad	.LVL13
	.value	0x1
	.byte	0x55
	.quad	.LVL13
	.quad	.LVL21
	.value	0x1
	.byte	0x5c
	.quad	.LVL21
	.quad	.LFE54
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST6:
	.quad	.LVL14
	.quad	.LVL16
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL16
	.quad	.LVL17
	.value	0x9
	.byte	0xc
	.long	0x989681
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL17
	.quad	.LVL20
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LLST7:
	.quad	.LVL12
	.quad	.LVL13
	.value	0x1
	.byte	0x55
	.quad	.LVL13
	.quad	.LVL19
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST8:
	.quad	.LVL12
	.quad	.LVL14
	.value	0xa
	.byte	0x3
	.quad	.LC2
	.byte	0x9f
	.quad	0
	.quad	0
.LLST9:
	.quad	.LVL18
	.quad	.LVL19
	.value	0xa
	.byte	0x3
	.quad	.LC3
	.byte	0x9f
	.quad	0
	.quad	0
.LLST0:
	.quad	.LVL0
	.quad	.LVL2
	.value	0x1
	.byte	0x55
	.quad	.LVL2
	.quad	.LVL10
	.value	0x1
	.byte	0x5c
	.quad	.LVL10
	.quad	.LFE53
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL3
	.quad	.LVL5
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL5
	.quad	.LVL6
	.value	0x9
	.byte	0xc
	.long	0x989681
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL6
	.quad	.LVL9
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL1
	.quad	.LVL2
	.value	0x1
	.byte	0x55
	.quad	.LVL2
	.quad	.LVL8
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL1
	.quad	.LVL3
	.value	0xa
	.byte	0x3
	.quad	.LC0
	.byte	0x9f
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL7
	.quad	.LVL8
	.value	0xa
	.byte	0x3
	.quad	.LC1
	.byte	0x9f
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x3c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	.LFB55
	.quad	.LFE55-.LFB55
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB12
	.quad	.LBE12
	.quad	.LBB16
	.quad	.LBE16
	.quad	.LBB17
	.quad	.LBE17
	.quad	0
	.quad	0
	.quad	.LBB20
	.quad	.LBE20
	.quad	.LBB24
	.quad	.LBE24
	.quad	.LBB25
	.quad	.LBE25
	.quad	0
	.quad	0
	.quad	.LBB28
	.quad	.LBE28
	.quad	.LBB31
	.quad	.LBE31
	.quad	0
	.quad	0
	.quad	.Ltext0
	.quad	.Letext0
	.quad	.LFB55
	.quad	.LFE55
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF97:
	.string	"__errno_location"
.LASF75:
	.string	"optarg"
.LASF94:
	.string	"__printf_chk"
.LASF41:
	.string	"_IO_FILE"
.LASF52:
	.string	"sys_nerr"
.LASF22:
	.string	"_IO_save_end"
.LASF5:
	.string	"short int"
.LASF7:
	.string	"size_t"
.LASF32:
	.string	"_offset"
.LASF55:
	.string	"__pthread_internal_list"
.LASF51:
	.string	"stderr"
.LASF16:
	.string	"_IO_write_ptr"
.LASF11:
	.string	"_flags"
.LASF73:
	.string	"pthread_mutex_t"
.LASF61:
	.string	"__count"
.LASF31:
	.string	"_lock"
.LASF103:
	.string	"GNU C11 7.2.0 -mtune=generic -march=x86-64 -g -O2 -fstack-protector-strong"
.LASF74:
	.string	"__environ"
.LASF23:
	.string	"_markers"
.LASF13:
	.string	"_IO_read_end"
.LASF84:
	.string	"timezone"
.LASF83:
	.string	"daylight"
.LASF56:
	.string	"__prev"
.LASF100:
	.string	"__fprintf_chk"
.LASF101:
	.string	"pthread_mutex_lock"
.LASF105:
	.string	"/home/daniel/Sxolh/ROH Y/7o eksamino/Leitourgika Sustimata/Ergastirio/Askisi 3/ex_1.1"
.LASF12:
	.string	"_IO_read_ptr"
.LASF57:
	.string	"__next"
.LASF40:
	.string	"FILE"
.LASF102:
	.string	"pthread_mutex_unlock"
.LASF42:
	.string	"_IO_marker"
.LASF54:
	.string	"long long int"
.LASF96:
	.string	"pthread_join"
.LASF81:
	.string	"__timezone"
.LASF95:
	.string	"pthread_create"
.LASF80:
	.string	"__daylight"
.LASF6:
	.string	"long int"
.LASF90:
	.string	"printf"
.LASF28:
	.string	"_cur_column"
.LASF48:
	.string	"_IO_2_1_stderr_"
.LASF98:
	.string	"perror"
.LASF107:
	.string	"_IO_FILE_plus"
.LASF45:
	.string	"_pos"
.LASF91:
	.string	"fprintf"
.LASF65:
	.string	"__spins"
.LASF15:
	.string	"_IO_write_base"
.LASF86:
	.string	"argv"
.LASF99:
	.string	"exit"
.LASF44:
	.string	"_sbuf"
.LASF27:
	.string	"_old_offset"
.LASF1:
	.string	"unsigned char"
.LASF85:
	.string	"argc"
.LASF4:
	.string	"signed char"
.LASF68:
	.string	"long long unsigned int"
.LASF46:
	.string	"_IO_2_1_stdin_"
.LASF3:
	.string	"unsigned int"
.LASF92:
	.string	"__fmt"
.LASF30:
	.string	"_shortbuf"
.LASF82:
	.string	"tzname"
.LASF39:
	.string	"_unused2"
.LASF77:
	.string	"opterr"
.LASF37:
	.string	"__pad5"
.LASF71:
	.string	"__size"
.LASF19:
	.string	"_IO_buf_end"
.LASF87:
	.string	"main"
.LASF10:
	.string	"char"
.LASF63:
	.string	"__nusers"
.LASF76:
	.string	"optind"
.LASF104:
	.string	"simplesync.c"
.LASF79:
	.string	"__tzname"
.LASF43:
	.string	"_next"
.LASF33:
	.string	"__pad1"
.LASF34:
	.string	"__pad2"
.LASF35:
	.string	"__pad3"
.LASF36:
	.string	"__pad4"
.LASF110:
	.string	"__builtin_fwrite"
.LASF60:
	.string	"__lock"
.LASF62:
	.string	"__owner"
.LASF2:
	.string	"short unsigned int"
.LASF89:
	.string	"increase_fn"
.LASF59:
	.string	"__pthread_mutex_s"
.LASF109:
	.string	"fwrite"
.LASF0:
	.string	"long unsigned int"
.LASF17:
	.string	"_IO_write_end"
.LASF9:
	.string	"__off64_t"
.LASF66:
	.string	"__elision"
.LASF25:
	.string	"_fileno"
.LASF24:
	.string	"_chain"
.LASF58:
	.string	"__pthread_list_t"
.LASF88:
	.string	"decrease_fn"
.LASF70:
	.string	"__data"
.LASF8:
	.string	"__off_t"
.LASF21:
	.string	"_IO_backup_base"
.LASF49:
	.string	"stdin"
.LASF18:
	.string	"_IO_buf_base"
.LASF26:
	.string	"_flags2"
.LASF38:
	.string	"_mode"
.LASF14:
	.string	"_IO_read_base"
.LASF67:
	.string	"__list"
.LASF29:
	.string	"_vtable_offset"
.LASF20:
	.string	"_IO_save_base"
.LASF53:
	.string	"sys_errlist"
.LASF78:
	.string	"optopt"
.LASF108:
	.string	"__stack_chk_fail"
.LASF64:
	.string	"__kind"
.LASF93:
	.string	"__stream"
.LASF69:
	.string	"pthread_t"
.LASF72:
	.string	"__align"
.LASF50:
	.string	"stdout"
.LASF47:
	.string	"_IO_2_1_stdout_"
.LASF106:
	.string	"_IO_lock_t"
	.ident	"GCC: (Ubuntu 7.2.0-8ubuntu3) 7.2.0"
	.section	.note.GNU-stack,"",@progbits
