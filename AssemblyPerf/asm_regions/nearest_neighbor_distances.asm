0000000000008900 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]>:
    8900:	55                   	push   rbp
    8901:	66 0f ef c0          	pxor   xmm0,xmm0
    8905:	48 89 e5             	mov    rbp,rsp
    8908:	41 57                	push   r15
    890a:	41 56                	push   r14
    890c:	41 55                	push   r13
    890e:	41 54                	push   r12
    8910:	49 89 fc             	mov    r12,rdi
    8913:	53                   	push   rbx
    8914:	48 83 ec 78          	sub    rsp,0x78
    8918:	4c 8b 6a 08          	mov    r13,QWORD PTR [rdx+0x8]
    891c:	48 8b 1a             	mov    rbx,QWORD PTR [rdx]
    891f:	64 48 8b 04 25 28 00 00 00 	mov    rax,QWORD PTR fs:0x28
    8928:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    892c:	31 c0                	xor    eax,eax
    892e:	48 c7 47 10 00 00 00 00 	mov    QWORD PTR [rdi+0x10],0x0
    8936:	4c 89 e8             	mov    rax,r13
    8939:	0f 11 07             	movups XMMWORD PTR [rdi],xmm0
    893c:	48 29 d8             	sub    rax,rbx
    893f:	0f 88 04 05 00 00    	js     8e49 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x549>
    8945:	49 89 f6             	mov    r14,rsi
    8948:	0f 85 d2 02 00 00    	jne    8c20 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x320>
    894e:	48 8d 45 a8          	lea    rax,[rbp-0x58]
    8952:	4c 8d 7d b0          	lea    r15,[rbp-0x50]
    8956:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    895a:	4c 39 eb             	cmp    rbx,r13
    895d:	75 51                	jne    89b0 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0xb0>
    895f:	e9 9f 00 00 00       	jmp    8a03 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x103>
    8964:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    8968:	f2 0f 10 45 a8       	movsd  xmm0,QWORD PTR [rbp-0x58]
    896d:	66 0f ef d2          	pxor   xmm2,xmm2
    8971:	66 0f 2e d0          	ucomisd xmm2,xmm0
    8975:	0f 87 9f 04 00 00    	ja     8e1a <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x51a>
    897b:	f2 0f 51 c0          	sqrtsd xmm0,xmm0
    897f:	f2 0f 11 45 80       	movsd  QWORD PTR [rbp-0x80],xmm0
    8984:	49 8b 44 24 08       	mov    rax,QWORD PTR [r12+0x8]
    8989:	49 3b 44 24 10       	cmp    rax,QWORD PTR [r12+0x10]
    898e:	0f 84 9c 00 00 00    	je     8a30 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x130>
    8994:	f2 0f 10 5d 80       	movsd  xmm3,QWORD PTR [rbp-0x80]
    8999:	48 83 c0 08          	add    rax,0x8
    899d:	f2 0f 11 58 f8       	movsd  QWORD PTR [rax-0x8],xmm3
    89a2:	49 89 44 24 08       	mov    QWORD PTR [r12+0x8],rax
    89a7:	48 83 c3 10          	add    rbx,0x10
    89ab:	49 39 dd             	cmp    r13,rbx
    89ae:	74 53                	je     8a03 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x103>
    89b0:	48 8b 4d 90          	mov    rcx,QWORD PTR [rbp-0x70]
    89b4:	66 0f ef c9          	pxor   xmm1,xmm1
    89b8:	4c 89 fa             	mov    rdx,r15
    89bb:	48 89 de             	mov    rsi,rbx
    89be:	4c 89 f7             	mov    rdi,r14
    89c1:	48 c7 45 a8 00 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
    89c9:	0f 29 4d b0          	movaps XMMWORD PTR [rbp-0x50],xmm1
    89cd:	e8 0e 41 00 00       	call   cae0 <GridIndex::nearest(Point const&, Point&, double&) const>
    89d2:	84 c0                	test   al,al
    89d4:	75 92                	jne    8968 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x68>
    89d6:	49 8b 44 24 08       	mov    rax,QWORD PTR [r12+0x8]
    89db:	49 3b 44 24 10       	cmp    rax,QWORD PTR [r12+0x10]
    89e0:	0f 84 fa 00 00 00    	je     8ae0 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x1e0>
    89e6:	48 8b 3d 8b 6f 00 00 	mov    rdi,QWORD PTR [rip+0x6f8b]        # f978 <_IO_stdin_used+0x978>
    89ed:	48 83 c0 08          	add    rax,0x8
    89f1:	48 83 c3 10          	add    rbx,0x10
    89f5:	48 89 78 f8          	mov    QWORD PTR [rax-0x8],rdi
    89f9:	49 89 44 24 08       	mov    QWORD PTR [r12+0x8],rax
    89fe:	49 39 dd             	cmp    r13,rbx
    8a01:	75 ad                	jne    89b0 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0xb0>
    8a03:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    8a07:	64 48 2b 04 25 28 00 00 00 	sub    rax,QWORD PTR fs:0x28
    8a10:	0f 85 2e 04 00 00    	jne    8e44 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x544>
    8a16:	48 83 c4 78          	add    rsp,0x78
    8a1a:	4c 89 e0             	mov    rax,r12
    8a1d:	5b                   	pop    rbx
    8a1e:	41 5c                	pop    r12
    8a20:	41 5d                	pop    r13
    8a22:	41 5e                	pop    r14
    8a24:	41 5f                	pop    r15
    8a26:	5d                   	pop    rbp
    8a27:	c3                   	ret
    8a28:	0f 1f 84 00 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    8a30:	49 8b 3c 24          	mov    rdi,QWORD PTR [r12]
    8a34:	48 89 c6             	mov    rsi,rax
    8a37:	48 b9 ff ff ff ff ff ff ff 0f 	movabs rcx,0xfffffffffffffff
    8a41:	48 29 fe             	sub    rsi,rdi
    8a44:	48 89 bd 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdi
    8a4b:	48 89 f2             	mov    rdx,rsi
    8a4e:	48 89 b5 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rsi
    8a55:	48 c1 fa 03          	sar    rdx,0x3
    8a59:	48 39 ca             	cmp    rdx,rcx
    8a5c:	0f 84 02 04 00 00    	je     8e64 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x564>
    8a62:	48 8b b5 78 ff ff ff 	mov    rsi,QWORD PTR [rbp-0x88]
    8a69:	48 39 f0             	cmp    rax,rsi
    8a6c:	0f 84 5e 01 00 00    	je     8bd0 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x2d0>
    8a72:	48 8d 04 12          	lea    rax,[rdx+rdx*1]
    8a76:	48 39 d0             	cmp    rax,rdx
    8a79:	0f 82 f1 02 00 00    	jb     8d70 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x470>
    8a7f:	48 c7 85 68 ff ff ff 00 00 00 00 	mov    QWORD PTR [rbp-0x98],0x0
    8a8a:	31 c9                	xor    ecx,ecx
    8a8c:	48 85 c0             	test   rax,rax
    8a8f:	0f 85 43 03 00 00    	jne    8dd8 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x4d8>
    8a95:	48 8b 95 70 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x90]
    8a9c:	f2 0f 10 65 80       	movsd  xmm4,QWORD PTR [rbp-0x80]
    8aa1:	4c 8d 44 11 08       	lea    r8,[rcx+rdx*1+0x8]
    8aa6:	f2 0f 11 24 11       	movsd  QWORD PTR [rcx+rdx*1],xmm4
    8aab:	48 85 d2             	test   rdx,rdx
    8aae:	0f 8f cc 01 00 00    	jg     8c80 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x380>
    8ab4:	48 83 bd 78 ff ff ff 00 	cmp    QWORD PTR [rbp-0x88],0x0
    8abc:	0f 85 e4 02 00 00    	jne    8da6 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x4a6>
    8ac2:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    8ac9:	49 89 0c 24          	mov    QWORD PTR [r12],rcx
    8acd:	4d 89 44 24 08       	mov    QWORD PTR [r12+0x8],r8
    8ad2:	49 89 44 24 10       	mov    QWORD PTR [r12+0x10],rax
    8ad7:	e9 cb fe ff ff       	jmp    89a7 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0xa7>
    8adc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    8ae0:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    8ae4:	48 89 c6             	mov    rsi,rax
    8ae7:	48 29 ce             	sub    rsi,rcx
    8aea:	48 89 4d 80          	mov    QWORD PTR [rbp-0x80],rcx
    8aee:	48 b9 ff ff ff ff ff ff ff 0f 	movabs rcx,0xfffffffffffffff
    8af8:	48 89 f2             	mov    rdx,rsi
    8afb:	48 89 b5 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rsi
    8b02:	48 c1 fa 03          	sar    rdx,0x3
    8b06:	48 39 ca             	cmp    rdx,rcx
    8b09:	0f 84 1a 03 00 00    	je     8e29 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x529>
    8b0f:	48 8b 75 80          	mov    rsi,QWORD PTR [rbp-0x80]
    8b13:	48 39 f0             	cmp    rax,rsi
    8b16:	74 68                	je     8b80 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x280>
    8b18:	48 8d 04 12          	lea    rax,[rdx+rdx*1]
    8b1c:	48 39 d0             	cmp    rax,rdx
    8b1f:	0f 82 6b 02 00 00    	jb     8d90 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x490>
    8b25:	48 c7 85 70 ff ff ff 00 00 00 00 	mov    QWORD PTR [rbp-0x90],0x0
    8b30:	31 c9                	xor    ecx,ecx
    8b32:	48 85 c0             	test   rax,rax
    8b35:	0f 85 be 02 00 00    	jne    8df9 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x4f9>
    8b3b:	48 8b 95 78 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x88]
    8b42:	48 8b 05 2f 6e 00 00 	mov    rax,QWORD PTR [rip+0x6e2f]        # f978 <_IO_stdin_used+0x978>
    8b49:	4c 8d 44 11 08       	lea    r8,[rcx+rdx*1+0x8]
    8b4e:	48 89 04 11          	mov    QWORD PTR [rcx+rdx*1],rax
    8b52:	48 85 d2             	test   rdx,rdx
    8b55:	0f 8f 7d 01 00 00    	jg     8cd8 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x3d8>
    8b5b:	48 83 7d 80 00       	cmp    QWORD PTR [rbp-0x80],0x0
    8b60:	0f 85 54 02 00 00    	jne    8dba <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x4ba>
    8b66:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
    8b6d:	49 89 0c 24          	mov    QWORD PTR [r12],rcx
    8b71:	4d 89 44 24 08       	mov    QWORD PTR [r12+0x8],r8
    8b76:	49 89 44 24 10       	mov    QWORD PTR [r12+0x10],rax
    8b7b:	e9 27 fe ff ff       	jmp    89a7 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0xa7>
    8b80:	48 83 c2 01          	add    rdx,0x1
    8b84:	0f 82 06 02 00 00    	jb     8d90 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x490>
    8b8a:	48 b8 ff ff ff ff ff ff ff 0f 	movabs rax,0xfffffffffffffff
    8b94:	48 39 c2             	cmp    rdx,rax
    8b97:	48 0f 47 d0          	cmova  rdx,rax
    8b9b:	48 8d 04 d5 00 00 00 00 	lea    rax,[rdx*8+0x0]
    8ba3:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    8baa:	48 8b bd 70 ff ff ff 	mov    rdi,QWORD PTR [rbp-0x90]
    8bb1:	e8 3a ac ff ff       	call   37f0 <operator new(unsigned long)@plt>
    8bb6:	48 89 c1             	mov    rcx,rax
    8bb9:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
    8bc0:	48 01 c8             	add    rax,rcx
    8bc3:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    8bca:	e9 6c ff ff ff       	jmp    8b3b <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x23b>
    8bcf:	90                   	nop
    8bd0:	48 83 c2 01          	add    rdx,0x1
    8bd4:	0f 82 96 01 00 00    	jb     8d70 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x470>
    8bda:	48 b8 ff ff ff ff ff ff ff 0f 	movabs rax,0xfffffffffffffff
    8be4:	48 39 c2             	cmp    rdx,rax
    8be7:	48 0f 47 d0          	cmova  rdx,rax
    8beb:	48 8d 04 d5 00 00 00 00 	lea    rax,[rdx*8+0x0]
    8bf3:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    8bfa:	48 8b bd 68 ff ff ff 	mov    rdi,QWORD PTR [rbp-0x98]
    8c01:	e8 ea ab ff ff       	call   37f0 <operator new(unsigned long)@plt>
    8c06:	48 89 c1             	mov    rcx,rax
    8c09:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    8c10:	48 01 c8             	add    rax,rcx
    8c13:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    8c1a:	e9 76 fe ff ff       	jmp    8a95 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x195>
    8c1f:	90                   	nop
    8c20:	48 c1 f8 04          	sar    rax,0x4
    8c24:	49 89 d7             	mov    r15,rdx
    8c27:	48 8d 1c c5 00 00 00 00 	lea    rbx,[rax*8+0x0]
    8c2f:	48 89 df             	mov    rdi,rbx
    8c32:	e8 b9 ab ff ff       	call   37f0 <operator new(unsigned long)@plt>
    8c37:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
    8c3b:	49 8b 54 24 08       	mov    rdx,QWORD PTR [r12+0x8]
    8c40:	66 48 0f 6e c0       	movq   xmm0,rax
    8c45:	49 89 c5             	mov    r13,rax
    8c48:	66 0f 6c c0          	punpcklqdq xmm0,xmm0
    8c4c:	48 29 ca             	sub    rdx,rcx
    8c4f:	48 85 d2             	test   rdx,rdx
    8c52:	0f 8f d8 00 00 00    	jg     8d30 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x430>
    8c58:	48 85 c9             	test   rcx,rcx
    8c5b:	0f 85 6a 01 00 00    	jne    8dcb <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x4cb>
    8c61:	49 01 dd             	add    r13,rbx
    8c64:	41 0f 11 04 24       	movups XMMWORD PTR [r12],xmm0
    8c69:	49 8b 1f             	mov    rbx,QWORD PTR [r15]
    8c6c:	4d 89 6c 24 10       	mov    QWORD PTR [r12+0x10],r13
    8c71:	4d 8b 6f 08          	mov    r13,QWORD PTR [r15+0x8]
    8c75:	e9 d4 fc ff ff       	jmp    894e <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x4e>
    8c7a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    8c80:	48 8b b5 78 ff ff ff 	mov    rsi,QWORD PTR [rbp-0x88]
    8c87:	48 89 cf             	mov    rdi,rcx
    8c8a:	4c 89 45 80          	mov    QWORD PTR [rbp-0x80],r8
    8c8e:	e8 0d ad ff ff       	call   39a0 <memmove@plt>
    8c93:	48 8b bd 78 ff ff ff 	mov    rdi,QWORD PTR [rbp-0x88]
    8c9a:	4c 8b 45 80          	mov    r8,QWORD PTR [rbp-0x80]
    8c9e:	48 89 c1             	mov    rcx,rax
    8ca1:	49 8b 44 24 10       	mov    rax,QWORD PTR [r12+0x10]
    8ca6:	48 29 f8             	sub    rax,rdi
    8ca9:	48 89 c6             	mov    rsi,rax
    8cac:	48 8b bd 78 ff ff ff 	mov    rdi,QWORD PTR [rbp-0x88]
    8cb3:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
    8cba:	48 89 4d 80          	mov    QWORD PTR [rbp-0x80],rcx
    8cbe:	e8 4d ab ff ff       	call   3810 <operator delete(void*, unsigned long)@plt>
    8cc3:	4c 8b 85 70 ff ff ff 	mov    r8,QWORD PTR [rbp-0x90]
    8cca:	48 8b 4d 80          	mov    rcx,QWORD PTR [rbp-0x80]
    8cce:	e9 ef fd ff ff       	jmp    8ac2 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x1c2>
    8cd3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    8cd8:	48 8b 75 80          	mov    rsi,QWORD PTR [rbp-0x80]
    8cdc:	48 89 cf             	mov    rdi,rcx
    8cdf:	4c 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r8
    8ce6:	e8 b5 ac ff ff       	call   39a0 <memmove@plt>
    8ceb:	48 8b 75 80          	mov    rsi,QWORD PTR [rbp-0x80]
    8cef:	4c 8b 85 78 ff ff ff 	mov    r8,QWORD PTR [rbp-0x88]
    8cf6:	48 89 c1             	mov    rcx,rax
    8cf9:	49 8b 44 24 10       	mov    rax,QWORD PTR [r12+0x10]
    8cfe:	48 29 f0             	sub    rax,rsi
    8d01:	48 89 c6             	mov    rsi,rax
    8d04:	48 8b 7d 80          	mov    rdi,QWORD PTR [rbp-0x80]
    8d08:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
    8d0f:	4c 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r8
    8d16:	e8 f5 aa ff ff       	call   3810 <operator delete(void*, unsigned long)@plt>
    8d1b:	48 8b 8d 68 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x98]
    8d22:	4c 8b 85 78 ff ff ff 	mov    r8,QWORD PTR [rbp-0x88]
    8d29:	e9 38 fe ff ff       	jmp    8b66 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x266>
    8d2e:	66 90                	xchg   ax,ax
    8d30:	48 89 ce             	mov    rsi,rcx
    8d33:	48 89 c7             	mov    rdi,rax
    8d36:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
    8d3a:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
    8d3e:	e8 5d ac ff ff       	call   39a0 <memmove@plt>
    8d43:	49 8b 74 24 10       	mov    rsi,QWORD PTR [r12+0x10]
    8d48:	48 8b 4d 90          	mov    rcx,QWORD PTR [rbp-0x70]
    8d4c:	66 0f 6f 45 80       	movdqa xmm0,XMMWORD PTR [rbp-0x80]
    8d51:	48 29 ce             	sub    rsi,rcx
    8d54:	48 89 cf             	mov    rdi,rcx
    8d57:	0f 29 45 90          	movaps XMMWORD PTR [rbp-0x70],xmm0
    8d5b:	e8 b0 aa ff ff       	call   3810 <operator delete(void*, unsigned long)@plt>
    8d60:	66 0f 6f 45 90       	movdqa xmm0,XMMWORD PTR [rbp-0x70]
    8d65:	e9 f7 fe ff ff       	jmp    8c61 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x361>
    8d6a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    8d70:	48 b8 f8 ff ff ff ff ff ff 7f 	movabs rax,0x7ffffffffffffff8
    8d7a:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    8d81:	e9 74 fe ff ff       	jmp    8bfa <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x2fa>
    8d86:	66 2e 0f 1f 84 00 00 00 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    8d90:	48 b8 f8 ff ff ff ff ff ff 7f 	movabs rax,0x7ffffffffffffff8
    8d9a:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    8da1:	e9 04 fe ff ff       	jmp    8baa <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x2aa>
    8da6:	49 8b 74 24 10       	mov    rsi,QWORD PTR [r12+0x10]
    8dab:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
    8db2:	48 29 c6             	sub    rsi,rax
    8db5:	e9 f2 fe ff ff       	jmp    8cac <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x3ac>
    8dba:	49 8b 74 24 10       	mov    rsi,QWORD PTR [r12+0x10]
    8dbf:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
    8dc3:	48 29 c6             	sub    rsi,rax
    8dc6:	e9 39 ff ff ff       	jmp    8d04 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x404>
    8dcb:	49 8b 74 24 10       	mov    rsi,QWORD PTR [r12+0x10]
    8dd0:	48 29 ce             	sub    rsi,rcx
    8dd3:	e9 7c ff ff ff       	jmp    8d54 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x454>
    8dd8:	48 ba ff ff ff ff ff ff ff 0f 	movabs rdx,0xfffffffffffffff
    8de2:	48 39 d0             	cmp    rax,rdx
    8de5:	48 0f 47 c2          	cmova  rax,rdx
    8de9:	48 c1 e0 03          	shl    rax,0x3
    8ded:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    8df4:	e9 01 fe ff ff       	jmp    8bfa <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x2fa>
    8df9:	48 ba ff ff ff ff ff ff ff 0f 	movabs rdx,0xfffffffffffffff
    8e03:	48 39 d0             	cmp    rax,rdx
    8e06:	48 0f 47 c2          	cmova  rax,rdx
    8e0a:	48 c1 e0 03          	shl    rax,0x3
    8e0e:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    8e15:	e9 90 fd ff ff       	jmp    8baa <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x2aa>
    8e1a:	e8 81 a9 ff ff       	call   37a0 <sqrt@plt>
    8e1f:	f2 0f 11 45 80       	movsd  QWORD PTR [rbp-0x80],xmm0
    8e24:	e9 5b fb ff ff       	jmp    8984 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x84>
    8e29:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    8e2d:	64 48 2b 04 25 28 00 00 00 	sub    rax,QWORD PTR fs:0x28
    8e36:	75 0c                	jne    8e44 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x544>
    8e38:	48 8d 3d 6a 62 00 00 	lea    rdi,[rip+0x626a]        # f0a9 <_IO_stdin_used+0xa9>
    8e3f:	e8 9c a8 ff ff       	call   36e0 <std::__throw_length_error(char const*)@plt>
    8e44:	e8 f7 a9 ff ff       	call   3840 <__stack_chk_fail@plt>
    8e49:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    8e4d:	64 48 2b 04 25 28 00 00 00 	sub    rax,QWORD PTR fs:0x28
    8e56:	75 ec                	jne    8e44 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x544>
    8e58:	48 8d 3d 9f 64 00 00 	lea    rdi,[rip+0x649f]        # f2fe <_IO_stdin_used+0x2fe>
    8e5f:	e8 7c a8 ff ff       	call   36e0 <std::__throw_length_error(char const*)@plt>
    8e64:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    8e68:	64 48 2b 04 25 28 00 00 00 	sub    rax,QWORD PTR fs:0x28
    8e71:	75 d1                	jne    8e44 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]+0x544>
    8e73:	48 8d 3d 2f 62 00 00 	lea    rdi,[rip+0x622f]        # f0a9 <_IO_stdin_used+0xa9>
    8e7a:	e8 61 a8 ff ff       	call   36e0 <std::__throw_length_error(char const*)@plt>
    8e7f:	f3 0f 1e fa          	endbr64
    8e83:	48 89 c3             	mov    rbx,rax
    8e86:	e9 9d ac ff ff       	jmp    3b28 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0] [clone .cold]>
    8e8b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

