0000000000007ff0 <render_motion_frame(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, std::vector<std::vector<Point, std::allocator<Point> >, std::allocator<std::vector<Point, std::allocator<Point> > > > const&, unsigned long, int, int) [clone .constprop.0]>:
    7ff0:	55                   	push   rbp
    7ff1:	66 0f ef c0          	pxor   xmm0,xmm0
    7ff5:	48 89 e5             	mov    rbp,rsp
    7ff8:	41 57                	push   r15
    7ffa:	49 89 cf             	mov    r15,rcx
    7ffd:	41 56                	push   r14
    7fff:	49 89 d6             	mov    r14,rdx
    8002:	41 55                	push   r13
    8004:	41 54                	push   r12
    8006:	4d 89 c4             	mov    r12,r8
    8009:	53                   	push   rbx
    800a:	48 89 fb             	mov    rbx,rdi
    800d:	48 83 ec 18          	sub    rsp,0x18
    8011:	48 c7 47 10 00 00 00 00 	mov    QWORD PTR [rdi+0x10],0x0
    8019:	0f 11 07             	movups XMMWORD PTR [rdi],xmm0
    801c:	bf 00 a4 1f 00       	mov    edi,0x1fa400
    8021:	48 89 75 c8          	mov    QWORD PTR [rbp-0x38],rsi
    8025:	e8 c6 b7 ff ff       	call   37f0 <operator new(unsigned long)@plt>
    802a:	ba 00 a4 1f 00       	mov    edx,0x1fa400
    802f:	be ff 00 00 00       	mov    esi,0xff
    8034:	4c 8d a8 00 a4 1f 00 	lea    r13,[rax+0x1fa400]
    803b:	48 89 03             	mov    QWORD PTR [rbx],rax
    803e:	48 89 c7             	mov    rdi,rax
    8041:	4c 89 6b 10          	mov    QWORD PTR [rbx+0x10],r13
    8045:	e8 b6 b6 ff ff       	call   3700 <memset@plt>
    804a:	4c 89 6b 08          	mov    QWORD PTR [rbx+0x8],r13
    804e:	4c 89 f6             	mov    rsi,r14
    8051:	48 89 df             	mov    rdi,rbx
    8054:	41 b8 5a 00 00 00    	mov    r8d,0x5a
    805a:	b9 78 00 00 00       	mov    ecx,0x78
    805f:	ba e6 00 00 00       	mov    edx,0xe6
    8064:	e8 17 fb ff ff       	call   7b80 <draw_cloud(std::vector<unsigned char, std::allocator<unsigned char> >&, std::vector<Point, std::allocator<Point> > const&, int, int, unsigned char, unsigned char, unsigned char) [clone .constprop.0]>
    8069:	48 8b 75 c8          	mov    rsi,QWORD PTR [rbp-0x38]
    806d:	41 b8 d2 00 00 00    	mov    r8d,0xd2
    8073:	48 89 df             	mov    rdi,rbx
    8076:	b9 5a 00 00 00       	mov    ecx,0x5a
    807b:	ba 32 00 00 00       	mov    edx,0x32
    8080:	e8 fb fa ff ff       	call   7b80 <draw_cloud(std::vector<unsigned char, std::allocator<unsigned char> >&, std::vector<Point, std::allocator<Point> > const&, int, int, unsigned char, unsigned char, unsigned char) [clone .constprop.0]>
    8085:	49 83 fc 01          	cmp    r12,0x1
    8089:	0f 86 21 02 00 00    	jbe    82b0 <render_motion_frame(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, std::vector<std::vector<Point, std::allocator<Point> >, std::allocator<std::vector<Point, std::allocator<Point> > > > const&, unsigned long, int, int) [clone .constprop.0]+0x2c0>
    808f:	49 bd ab aa aa aa aa aa aa aa 	movabs r13,0xaaaaaaaaaaaaaaab
    8099:	41 be 01 00 00 00    	mov    r14d,0x1
    809f:	eb 4c                	jmp    80ed <render_motion_frame(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, std::vector<std::vector<Point, std::allocator<Point> >, std::allocator<std::vector<Point, std::allocator<Point> > > > const&, unsigned long, int, int) [clone .constprop.0]+0xfd>
    80a1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    80a8:	4b 8d 04 b6          	lea    rax,[r14+r14*4]
    80ac:	b9 37 00 00 00       	mov    ecx,0x37
    80b1:	41 b8 aa 00 00 00    	mov    r8d,0xaa
    80b7:	48 89 df             	mov    rdi,rbx
    80ba:	48 01 c0             	add    rax,rax
    80bd:	48 39 c8             	cmp    rax,rcx
    80c0:	48 0f 47 c1          	cmova  rax,rcx
    80c4:	b9 cd ff ff ff       	mov    ecx,0xffffffcd
    80c9:	29 c1                	sub    ecx,eax
    80cb:	4b 8d 04 76          	lea    rax,[r14+r14*2]
    80cf:	49 83 c6 01          	add    r14,0x1
    80d3:	48 8d 34 c2          	lea    rsi,[rdx+rax*8]
    80d7:	0f b6 c9             	movzx  ecx,cl
    80da:	ba aa 00 00 00       	mov    edx,0xaa
    80df:	e8 9c fa ff ff       	call   7b80 <draw_cloud(std::vector<unsigned char, std::allocator<unsigned char> >&, std::vector<Point, std::allocator<Point> > const&, int, int, unsigned char, unsigned char, unsigned char) [clone .constprop.0]>
    80e4:	4d 39 e6             	cmp    r14,r12
    80e7:	0f 84 c3 01 00 00    	je     82b0 <render_motion_frame(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, std::vector<std::vector<Point, std::allocator<Point> >, std::allocator<std::vector<Point, std::allocator<Point> > > > const&, unsigned long, int, int) [clone .constprop.0]+0x2c0>
    80ed:	49 8b 17             	mov    rdx,QWORD PTR [r15]
    80f0:	49 8b 47 08          	mov    rax,QWORD PTR [r15+0x8]
    80f4:	48 29 d0             	sub    rax,rdx
    80f7:	48 c1 f8 03          	sar    rax,0x3
    80fb:	49 0f af c5          	imul   rax,r13
    80ff:	49 39 c6             	cmp    r14,rax
    8102:	72 a4                	jb     80a8 <render_motion_frame(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, std::vector<std::vector<Point, std::allocator<Point> >, std::allocator<std::vector<Point, std::allocator<Point> > > > const&, unsigned long, int, int) [clone .constprop.0]+0xb8>
    8104:	4b 8d 04 64          	lea    rax,[r12+r12*2]
    8108:	41 b8 50 00 00 00    	mov    r8d,0x50
    810e:	b9 aa 00 00 00       	mov    ecx,0xaa
    8113:	48 89 df             	mov    rdi,rbx
    8116:	48 8d 34 c2          	lea    rsi,[rdx+rax*8]
    811a:	ba 28 00 00 00       	mov    edx,0x28
    811f:	e8 5c fa ff ff       	call   7b80 <draw_cloud(std::vector<unsigned char, std::allocator<unsigned char> >&, std::vector<Point, std::allocator<Point> > const&, int, int, unsigned char, unsigned char, unsigned char) [clone .constprop.0]>
    8124:	49 8b 47 08          	mov    rax,QWORD PTR [r15+0x8]
    8128:	49 2b 07             	sub    rax,QWORD PTR [r15]
    812b:	f2 0f 10 05 15 78 00 00 	movsd  xmm0,QWORD PTR [rip+0x7815]        # f948 <_IO_stdin_used+0x948>
    8133:	48 83 f8 18          	cmp    rax,0x18
    8137:	76 43                	jbe    817c <render_motion_frame(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, std::vector<std::vector<Point, std::allocator<Point> >, std::allocator<std::vector<Point, std::allocator<Point> > > > const&, unsigned long, int, int) [clone .constprop.0]+0x18c>
    8139:	4d 85 e4             	test   r12,r12
    813c:	0f 88 46 01 00 00    	js     8288 <render_motion_frame(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, std::vector<std::vector<Point, std::allocator<Point> >, std::allocator<std::vector<Point, std::allocator<Point> > > > const&, unsigned long, int, int) [clone .constprop.0]+0x298>
    8142:	66 0f ef c0          	pxor   xmm0,xmm0
    8146:	f2 49 0f 2a c4       	cvtsi2sd xmm0,r12
    814b:	48 ba ab aa aa aa aa aa aa aa 	movabs rdx,0xaaaaaaaaaaaaaaab
    8155:	48 c1 f8 03          	sar    rax,0x3
    8159:	48 0f af c2          	imul   rax,rdx
    815d:	48 83 e8 01          	sub    rax,0x1
    8161:	0f 88 59 01 00 00    	js     82c0 <render_motion_frame(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, std::vector<std::vector<Point, std::allocator<Point> >, std::allocator<std::vector<Point, std::allocator<Point> > > > const&, unsigned long, int, int) [clone .constprop.0]+0x2d0>
    8167:	66 0f ef c9          	pxor   xmm1,xmm1
    816b:	f2 48 0f 2a c8       	cvtsi2sd xmm1,rax
    8170:	f2 0f 5e c1          	divsd  xmm0,xmm1
    8174:	f2 0f 59 05 cc 77 00 00 	mulsd  xmm0,QWORD PTR [rip+0x77cc]        # f948 <_IO_stdin_used+0x948>
    817c:	e8 df b3 ff ff       	call   3560 <lround@plt>
    8181:	48 83 ec 08          	sub    rsp,0x8
    8185:	48 89 df             	mov    rdi,rbx
    8188:	41 b9 eb 00 00 00    	mov    r9d,0xeb
    818e:	68 eb 00 00 00       	push   0xeb
    8193:	41 b8 eb 00 00 00    	mov    r8d,0xeb
    8199:	b9 ae 02 00 00       	mov    ecx,0x2ae
    819e:	49 89 c4             	mov    r12,rax
    81a1:	ba 08 01 00 00       	mov    edx,0x108
    81a6:	be a2 02 00 00       	mov    esi,0x2a2
    81ab:	e8 b0 fd ff ff       	call   7f60 <draw_rect(std::vector<unsigned char, std::allocator<unsigned char> >&, int, int, int, int, int, int, unsigned char, unsigned char, unsigned char) [clone .constprop.0]>
    81b0:	41 8d 54 24 18       	lea    edx,[r12+0x18]
    81b5:	b9 ae 02 00 00       	mov    ecx,0x2ae
    81ba:	c7 04 24 50 00 00 00 	mov    DWORD PTR [rsp],0x50
    81c1:	41 b9 aa 00 00 00    	mov    r9d,0xaa
    81c7:	41 b8 28 00 00 00    	mov    r8d,0x28
    81cd:	be a2 02 00 00       	mov    esi,0x2a2
    81d2:	e8 89 fd ff ff       	call   7f60 <draw_rect(std::vector<unsigned char, std::allocator<unsigned char> >&, int, int, int, int, int, int, unsigned char, unsigned char, unsigned char) [clone .constprop.0]>
    81d7:	41 b9 5a 00 00 00    	mov    r9d,0x5a
    81dd:	41 b8 32 00 00 00    	mov    r8d,0x32
    81e3:	c7 04 24 d2 00 00 00 	mov    DWORD PTR [rsp],0xd2
    81ea:	b9 26 00 00 00       	mov    ecx,0x26
    81ef:	ba 30 00 00 00       	mov    edx,0x30
    81f4:	be 18 00 00 00       	mov    esi,0x18
    81f9:	e8 62 fd ff ff       	call   7f60 <draw_rect(std::vector<unsigned char, std::allocator<unsigned char> >&, int, int, int, int, int, int, unsigned char, unsigned char, unsigned char) [clone .constprop.0]>
    81fe:	41 b9 78 00 00 00    	mov    r9d,0x78
    8204:	41 b8 e6 00 00 00    	mov    r8d,0xe6
    820a:	c7 04 24 5a 00 00 00 	mov    DWORD PTR [rsp],0x5a
    8211:	b9 3c 00 00 00       	mov    ecx,0x3c
    8216:	ba 30 00 00 00       	mov    edx,0x30
    821b:	be 2e 00 00 00       	mov    esi,0x2e
    8220:	e8 3b fd ff ff       	call   7f60 <draw_rect(std::vector<unsigned char, std::allocator<unsigned char> >&, int, int, int, int, int, int, unsigned char, unsigned char, unsigned char) [clone .constprop.0]>
    8225:	41 b9 cd 00 00 00    	mov    r9d,0xcd
    822b:	41 b8 aa 00 00 00    	mov    r8d,0xaa
    8231:	c7 04 24 aa 00 00 00 	mov    DWORD PTR [rsp],0xaa
    8238:	b9 52 00 00 00       	mov    ecx,0x52
    823d:	ba 30 00 00 00       	mov    edx,0x30
    8242:	be 44 00 00 00       	mov    esi,0x44
    8247:	e8 14 fd ff ff       	call   7f60 <draw_rect(std::vector<unsigned char, std::allocator<unsigned char> >&, int, int, int, int, int, int, unsigned char, unsigned char, unsigned char) [clone .constprop.0]>
    824c:	41 b9 aa 00 00 00    	mov    r9d,0xaa
    8252:	41 b8 28 00 00 00    	mov    r8d,0x28
    8258:	c7 04 24 50 00 00 00 	mov    DWORD PTR [rsp],0x50
    825f:	b9 68 00 00 00       	mov    ecx,0x68
    8264:	ba 30 00 00 00       	mov    edx,0x30
    8269:	be 5a 00 00 00       	mov    esi,0x5a
    826e:	e8 ed fc ff ff       	call   7f60 <draw_rect(std::vector<unsigned char, std::allocator<unsigned char> >&, int, int, int, int, int, int, unsigned char, unsigned char, unsigned char) [clone .constprop.0]>
    8273:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
    8277:	48 89 d8             	mov    rax,rbx
    827a:	5b                   	pop    rbx
    827b:	41 5c                	pop    r12
    827d:	41 5d                	pop    r13
    827f:	41 5e                	pop    r14
    8281:	41 5f                	pop    r15
    8283:	5d                   	pop    rbp
    8284:	c3                   	ret
    8285:	0f 1f 00             	nop    DWORD PTR [rax]
    8288:	4c 89 e2             	mov    rdx,r12
    828b:	41 83 e4 01          	and    r12d,0x1
    828f:	66 0f ef c0          	pxor   xmm0,xmm0
    8293:	48 d1 ea             	shr    rdx,1
    8296:	4c 09 e2             	or     rdx,r12
    8299:	f2 48 0f 2a c2       	cvtsi2sd xmm0,rdx
    829e:	f2 0f 58 c0          	addsd  xmm0,xmm0
    82a2:	e9 a4 fe ff ff       	jmp    814b <render_motion_frame(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, std::vector<std::vector<Point, std::allocator<Point> >, std::allocator<std::vector<Point, std::allocator<Point> > > > const&, unsigned long, int, int) [clone .constprop.0]+0x15b>
    82a7:	66 0f 1f 84 00 00 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    82b0:	49 8b 17             	mov    rdx,QWORD PTR [r15]
    82b3:	e9 4c fe ff ff       	jmp    8104 <render_motion_frame(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, std::vector<std::vector<Point, std::allocator<Point> >, std::allocator<std::vector<Point, std::allocator<Point> > > > const&, unsigned long, int, int) [clone .constprop.0]+0x114>
    82b8:	0f 1f 84 00 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    82c0:	48 89 c2             	mov    rdx,rax
    82c3:	83 e0 01             	and    eax,0x1
    82c6:	66 0f ef c9          	pxor   xmm1,xmm1
    82ca:	48 d1 ea             	shr    rdx,1
    82cd:	48 09 c2             	or     rdx,rax
    82d0:	f2 48 0f 2a ca       	cvtsi2sd xmm1,rdx
    82d5:	f2 0f 58 c9          	addsd  xmm1,xmm1
    82d9:	e9 92 fe ff ff       	jmp    8170 <render_motion_frame(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, std::vector<std::vector<Point, std::allocator<Point> >, std::allocator<std::vector<Point, std::allocator<Point> > > > const&, unsigned long, int, int) [clone .constprop.0]+0x180>
    82de:	66 90                	xchg   ax,ax

