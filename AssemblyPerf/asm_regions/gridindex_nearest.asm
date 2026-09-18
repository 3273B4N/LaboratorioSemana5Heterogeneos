000000000000cae0 <GridIndex::nearest(Point const&, Point&, double&) const>:
    cae0:	f3 0f 1e fa          	endbr64
    cae4:	55                   	push   rbp
    cae5:	49 89 f9             	mov    r9,rdi
    cae8:	48 89 e5             	mov    rbp,rsp
    caeb:	41 57                	push   r15
    caed:	49 89 cf             	mov    r15,rcx
    caf0:	41 56                	push   r14
    caf2:	49 89 f6             	mov    r14,rsi
    caf5:	41 55                	push   r13
    caf7:	41 54                	push   r12
    caf9:	53                   	push   rbx
    cafa:	48 89 d3             	mov    rbx,rdx
    cafd:	f2 0f 10 77 08       	movsd  xmm6,QWORD PTR [rdi+0x8]
    cb02:	f2 0f 10 06          	movsd  xmm0,QWORD PTR [rsi]
    cb06:	f3 0f 7e 0d 92 2f 00 00 	movq   xmm1,QWORD PTR [rip+0x2f92]        # faa0 <_IO_stdin_used+0xaa0>
    cb0e:	f2 0f 10 2d 52 2e 00 00 	movsd  xmm5,QWORD PTR [rip+0x2e52]        # f968 <_IO_stdin_used+0x968>
    cb16:	f2 0f 5e c6          	divsd  xmm0,xmm6
    cb1a:	66 0f 28 d0          	movapd xmm2,xmm0
    cb1e:	66 0f 54 d1          	andpd  xmm2,xmm1
    cb22:	66 0f 2e ea          	ucomisd xmm5,xmm2
    cb26:	76 37                	jbe    cb5f <GridIndex::nearest(Point const&, Point&, double&) const+0x7f>
    cb28:	f2 48 0f 2c c0       	cvttsd2si rax,xmm0
    cb2d:	66 0f ef d2          	pxor   xmm2,xmm2
    cb31:	f2 0f 10 3d 17 2e 00 00 	movsd  xmm7,QWORD PTR [rip+0x2e17]        # f950 <_IO_stdin_used+0x950>
    cb39:	66 0f 28 d9          	movapd xmm3,xmm1
    cb3d:	66 0f 55 d8          	andnpd xmm3,xmm0
    cb41:	f2 48 0f 2a d0       	cvtsi2sd xmm2,rax
    cb46:	66 0f 28 e2          	movapd xmm4,xmm2
    cb4a:	f2 0f c2 e0 06       	cmpnlesd xmm4,xmm0
    cb4f:	66 0f 54 e7          	andpd  xmm4,xmm7
    cb53:	f2 0f 5c d4          	subsd  xmm2,xmm4
    cb57:	66 0f 56 d3          	orpd   xmm2,xmm3
    cb5b:	66 0f 28 c2          	movapd xmm0,xmm2
    cb5f:	f2 0f 2c c0          	cvttsd2si eax,xmm0
    cb63:	f2 41 0f 10 46 08    	movsd  xmm0,QWORD PTR [r14+0x8]
    cb69:	f2 0f 5e c6          	divsd  xmm0,xmm6
    cb6d:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
    cb70:	66 0f 28 d0          	movapd xmm2,xmm0
    cb74:	66 0f 54 d1          	andpd  xmm2,xmm1
    cb78:	66 0f 2e ea          	ucomisd xmm5,xmm2
    cb7c:	76 33                	jbe    cbb1 <GridIndex::nearest(Point const&, Point&, double&) const+0xd1>
    cb7e:	f2 48 0f 2c c0       	cvttsd2si rax,xmm0
    cb83:	66 0f ef d2          	pxor   xmm2,xmm2
    cb87:	f2 0f 10 25 c1 2d 00 00 	movsd  xmm4,QWORD PTR [rip+0x2dc1]        # f950 <_IO_stdin_used+0x950>
    cb8f:	66 0f 55 c8          	andnpd xmm1,xmm0
    cb93:	f2 48 0f 2a d0       	cvtsi2sd xmm2,rax
    cb98:	66 0f 28 da          	movapd xmm3,xmm2
    cb9c:	f2 0f c2 d8 06       	cmpnlesd xmm3,xmm0
    cba1:	66 0f 54 dc          	andpd  xmm3,xmm4
    cba5:	f2 0f 5c d3          	subsd  xmm2,xmm3
    cba9:	66 0f 56 d1          	orpd   xmm2,xmm1
    cbad:	66 0f 28 c2          	movapd xmm0,xmm2
    cbb1:	f2 0f 2c c8          	cvttsd2si ecx,xmm0
    cbb5:	41 bc 01 00 00 00    	mov    r12d,0x1
    cbbb:	45 31 ed             	xor    r13d,r13d
    cbbe:	45 31 d2             	xor    r10d,r10d
    cbc1:	48 8b 05 a8 2d 00 00 	mov    rax,QWORD PTR [rip+0x2da8]        # f970 <_IO_stdin_used+0x970>
    cbc8:	49 89 07             	mov    QWORD PTR [r15],rax
    cbcb:	48 89 d8             	mov    rax,rbx
    cbce:	44 89 d3             	mov    ebx,r10d
    cbd1:	45 89 e2             	mov    r10d,r12d
    cbd4:	89 4d a0             	mov    DWORD PTR [rbp-0x60],ecx
    cbd7:	45 89 ec             	mov    r12d,r13d
    cbda:	49 89 c5             	mov    r13,rax
    cbdd:	44 89 e6             	mov    esi,r12d
    cbe0:	44 8b 5d a0          	mov    r11d,DWORD PTR [rbp-0x60]
    cbe4:	89 d8                	mov    eax,ebx
    cbe6:	f7 de                	neg    esi
    cbe8:	89 75 a4             	mov    DWORD PTR [rbp-0x5c],esi
    cbeb:	45 29 e3             	sub    r11d,r12d
    cbee:	41 89 f0             	mov    r8d,esi
    cbf1:	44 89 db             	mov    ebx,r11d
    cbf4:	45 89 e3             	mov    r11d,r12d
    cbf7:	41 89 c4             	mov    r12d,eax
    cbfa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    cc00:	44 89 c7             	mov    edi,r8d
    cc03:	89 d8                	mov    eax,ebx
    cc05:	89 5d c0             	mov    DWORD PTR [rbp-0x40],ebx
    cc08:	8b 4d a4             	mov    ecx,DWORD PTR [rbp-0x5c]
    cc0b:	f7 df                	neg    edi
    cc0d:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    cc11:	4c 89 eb             	mov    rbx,r13
    cc14:	44 89 45 ac          	mov    DWORD PTR [rbp-0x54],r8d
    cc18:	41 0f 48 f8          	cmovs  edi,r8d
    cc1c:	eb 0e                	jmp    cc2c <GridIndex::nearest(Point const&, Point&, double&) const+0x14c>
    cc1e:	66 90                	xchg   ax,ax
    cc20:	83 c1 01             	add    ecx,0x1
    cc23:	44 39 d1             	cmp    ecx,r10d
    cc26:	0f 84 c4 00 00 00    	je     ccf0 <GridIndex::nearest(Point const&, Point&, double&) const+0x210>
    cc2c:	89 c8                	mov    eax,ecx
    cc2e:	f7 d8                	neg    eax
    cc30:	0f 48 c1             	cmovs  eax,ecx
    cc33:	39 f8                	cmp    eax,edi
    cc35:	0f 4c c7             	cmovl  eax,edi
    cc38:	44 39 d8             	cmp    eax,r11d
    cc3b:	75 e3                	jne    cc20 <GridIndex::nearest(Point const&, Point&, double&) const+0x140>
    cc3d:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    cc40:	8d 34 01             	lea    esi,[rcx+rax*1]
    cc43:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    cc47:	48 c1 e6 20          	shl    rsi,0x20
    cc4b:	48 31 c6             	xor    rsi,rax
    cc4e:	49 83 79 28 00       	cmp    QWORD PTR [r9+0x28],0x0
    cc53:	0f 85 ff 00 00 00    	jne    cd58 <GridIndex::nearest(Point const&, Point&, double&) const+0x278>
    cc59:	49 8b 41 20          	mov    rax,QWORD PTR [r9+0x20]
    cc5d:	48 85 c0             	test   rax,rax
    cc60:	75 0e                	jne    cc70 <GridIndex::nearest(Point const&, Point&, double&) const+0x190>
    cc62:	eb bc                	jmp    cc20 <GridIndex::nearest(Point const&, Point&, double&) const+0x140>
    cc64:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    cc68:	48 8b 00             	mov    rax,QWORD PTR [rax]
    cc6b:	48 85 c0             	test   rax,rax
    cc6e:	74 b0                	je     cc20 <GridIndex::nearest(Point const&, Point&, double&) const+0x140>
    cc70:	48 3b 70 08          	cmp    rsi,QWORD PTR [rax+0x8]
    cc74:	75 f2                	jne    cc68 <GridIndex::nearest(Point const&, Point&, double&) const+0x188>
    cc76:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
    cc7a:	48 8b 70 18          	mov    rsi,QWORD PTR [rax+0x18]
    cc7e:	48 39 d6             	cmp    rsi,rdx
    cc81:	74 9d                	je     cc20 <GridIndex::nearest(Point const&, Point&, double&) const+0x140>
    cc83:	49 8b 01             	mov    rax,QWORD PTR [r9]
    cc86:	4c 8b 00             	mov    r8,QWORD PTR [rax]
    cc89:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    cc90:	48 63 02             	movsxd rax,DWORD PTR [rdx]
    cc93:	f2 41 0f 10 06       	movsd  xmm0,QWORD PTR [r14]
    cc98:	f2 41 0f 10 4e 08    	movsd  xmm1,QWORD PTR [r14+0x8]
    cc9e:	48 c1 e0 04          	shl    rax,0x4
    cca2:	4c 01 c0             	add    rax,r8
    cca5:	f2 0f 5c 00          	subsd  xmm0,QWORD PTR [rax]
    cca9:	f2 0f 5c 48 08       	subsd  xmm1,QWORD PTR [rax+0x8]
    ccae:	f2 0f 59 c0          	mulsd  xmm0,xmm0
    ccb2:	f2 0f 59 c9          	mulsd  xmm1,xmm1
    ccb6:	f2 0f 58 c1          	addsd  xmm0,xmm1
    ccba:	f2 41 0f 10 0f       	movsd  xmm1,QWORD PTR [r15]
    ccbf:	66 0f 2f c8          	comisd xmm1,xmm0
    ccc3:	76 12                	jbe    ccd7 <GridIndex::nearest(Point const&, Point&, double&) const+0x1f7>
    ccc5:	f2 41 0f 11 07       	movsd  QWORD PTR [r15],xmm0
    ccca:	f3 0f 6f 38          	movdqu xmm7,XMMWORD PTR [rax]
    ccce:	41 bc 01 00 00 00    	mov    r12d,0x1
    ccd4:	0f 11 3b             	movups XMMWORD PTR [rbx],xmm7
    ccd7:	48 83 c2 04          	add    rdx,0x4
    ccdb:	48 39 d6             	cmp    rsi,rdx
    ccde:	75 b0                	jne    cc90 <GridIndex::nearest(Point const&, Point&, double&) const+0x1b0>
    cce0:	83 c1 01             	add    ecx,0x1
    cce3:	44 39 d1             	cmp    ecx,r10d
    cce6:	0f 85 40 ff ff ff    	jne    cc2c <GridIndex::nearest(Point const&, Point&, double&) const+0x14c>
    ccec:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    ccf0:	44 8b 45 ac          	mov    r8d,DWORD PTR [rbp-0x54]
    ccf4:	49 89 dd             	mov    r13,rbx
    ccf7:	8b 5d c0             	mov    ebx,DWORD PTR [rbp-0x40]
    ccfa:	41 83 c0 01          	add    r8d,0x1
    ccfe:	83 c3 01             	add    ebx,0x1
    cd01:	45 39 d0             	cmp    r8d,r10d
    cd04:	0f 85 f6 fe ff ff    	jne    cc00 <GridIndex::nearest(Point const&, Point&, double&) const+0x120>
    cd0a:	44 89 e3             	mov    ebx,r12d
    cd0d:	45 89 dc             	mov    r12d,r11d
    cd10:	84 db                	test   bl,bl
    cd12:	74 22                	je     cd36 <GridIndex::nearest(Point const&, Point&, double&) const+0x256>
    cd14:	f2 41 0f 10 41 08    	movsd  xmm0,QWORD PTR [r9+0x8]
    cd1a:	66 0f ef c9          	pxor   xmm1,xmm1
    cd1e:	f2 41 0f 2a cb       	cvtsi2sd xmm1,r11d
    cd23:	f2 0f 59 c0          	mulsd  xmm0,xmm0
    cd27:	f2 0f 59 c1          	mulsd  xmm0,xmm1
    cd2b:	f2 0f 59 c1          	mulsd  xmm0,xmm1
    cd2f:	66 41 0f 2f 07       	comisd xmm0,QWORD PTR [r15]
    cd34:	77 12                	ja     cd48 <GridIndex::nearest(Point const&, Point&, double&) const+0x268>
    cd36:	41 83 c4 01          	add    r12d,0x1
    cd3a:	41 83 c2 01          	add    r10d,0x1
    cd3e:	41 83 fc 11          	cmp    r12d,0x11
    cd42:	0f 85 95 fe ff ff    	jne    cbdd <GridIndex::nearest(Point const&, Point&, double&) const+0xfd>
    cd48:	89 d8                	mov    eax,ebx
    cd4a:	5b                   	pop    rbx
    cd4b:	41 5c                	pop    r12
    cd4d:	41 5d                	pop    r13
    cd4f:	41 5e                	pop    r14
    cd51:	41 5f                	pop    r15
    cd53:	5d                   	pop    rbp
    cd54:	c3                   	ret
    cd55:	0f 1f 00             	nop    DWORD PTR [rax]
    cd58:	4d 8b 41 18          	mov    r8,QWORD PTR [r9+0x18]
    cd5c:	48 89 f0             	mov    rax,rsi
    cd5f:	31 d2                	xor    edx,edx
    cd61:	49 f7 f0             	div    r8
    cd64:	49 8b 41 10          	mov    rax,QWORD PTR [r9+0x10]
    cd68:	4c 89 45 b8          	mov    QWORD PTR [rbp-0x48],r8
    cd6c:	4c 8b 2c d0          	mov    r13,QWORD PTR [rax+rdx*8]
    cd70:	48 89 55 b0          	mov    QWORD PTR [rbp-0x50],rdx
    cd74:	4d 85 ed             	test   r13,r13
    cd77:	0f 84 a3 fe ff ff    	je     cc20 <GridIndex::nearest(Point const&, Point&, double&) const+0x140>
    cd7d:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
    cd81:	44 89 55 a8          	mov    DWORD PTR [rbp-0x58],r10d
    cd85:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
    cd89:	4c 39 c6             	cmp    rsi,r8
    cd8c:	74 26                	je     cdb4 <GridIndex::nearest(Point const&, Point&, double&) const+0x2d4>
    cd8e:	4c 8b 10             	mov    r10,QWORD PTR [rax]
    cd91:	4d 85 d2             	test   r10,r10
    cd94:	74 3a                	je     cdd0 <GridIndex::nearest(Point const&, Point&, double&) const+0x2f0>
    cd96:	4d 8b 42 08          	mov    r8,QWORD PTR [r10+0x8]
    cd9a:	49 89 c5             	mov    r13,rax
    cd9d:	31 d2                	xor    edx,edx
    cd9f:	4c 89 c0             	mov    rax,r8
    cda2:	48 f7 75 b8          	div    QWORD PTR [rbp-0x48]
    cda6:	48 39 55 b0          	cmp    QWORD PTR [rbp-0x50],rdx
    cdaa:	75 24                	jne    cdd0 <GridIndex::nearest(Point const&, Point&, double&) const+0x2f0>
    cdac:	4c 89 d0             	mov    rax,r10
    cdaf:	4c 39 c6             	cmp    rsi,r8
    cdb2:	75 da                	jne    cd8e <GridIndex::nearest(Point const&, Point&, double&) const+0x2ae>
    cdb4:	49 8b 45 00          	mov    rax,QWORD PTR [r13+0x0]
    cdb8:	44 8b 55 a8          	mov    r10d,DWORD PTR [rbp-0x58]
    cdbc:	48 85 c0             	test   rax,rax
    cdbf:	0f 85 b1 fe ff ff    	jne    cc76 <GridIndex::nearest(Point const&, Point&, double&) const+0x196>
    cdc5:	e9 56 fe ff ff       	jmp    cc20 <GridIndex::nearest(Point const&, Point&, double&) const+0x140>
    cdca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    cdd0:	44 8b 55 a8          	mov    r10d,DWORD PTR [rbp-0x58]
    cdd4:	e9 47 fe ff ff       	jmp    cc20 <GridIndex::nearest(Point const&, Point&, double&) const+0x140>
    cdd9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

