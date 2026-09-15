000000000000baf0 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]>:
    baf0:	55                   	push   rbp
    baf1:	48 89 e5             	mov    rbp,rsp
    baf4:	41 57                	push   r15
    baf6:	49 89 ff             	mov    r15,rdi
    baf9:	41 56                	push   r14
    bafb:	41 55                	push   r13
    bafd:	41 54                	push   r12
    baff:	53                   	push   rbx
    bb00:	48 81 ec b8 01 00 00 	sub    rsp,0x1b8
    bb07:	48 89 b5 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rsi
    bb0e:	48 89 95 70 fe ff ff 	mov    QWORD PTR [rbp-0x190],rdx
    bb15:	64 48 8b 04 25 28 00 00 00 	mov    rax,QWORD PTR fs:0x28
    bb1e:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    bb22:	31 c0                	xor    eax,eax
    bb24:	48 8b 05 85 3e 00 00 	mov    rax,QWORD PTR [rip+0x3e85]        # f9b0 <_IO_stdin_used+0x9b0>
    bb2b:	48 89 b5 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rsi
    bb32:	48 c7 85 48 ff ff ff 01 00 00 00 	mov    QWORD PTR [rbp-0xb8],0x1
    bb3d:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
    bb44:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
    bb4b:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    bb52:	48 8b 06             	mov    rax,QWORD PTR [rsi]
    bb55:	48 c7 85 50 ff ff ff 00 00 00 00 	mov    QWORD PTR [rbp-0xb0],0x0
    bb60:	48 c7 85 58 ff ff ff 00 00 00 00 	mov    QWORD PTR [rbp-0xa8],0x0
    bb6b:	c7 85 60 ff ff ff 00 00 80 3f 	mov    DWORD PTR [rbp-0xa0],0x3f800000
    bb75:	48 c7 85 68 ff ff ff 00 00 00 00 	mov    QWORD PTR [rbp-0x98],0x0
    bb80:	48 c7 85 70 ff ff ff 00 00 00 00 	mov    QWORD PTR [rbp-0x90],0x0
    bb8b:	48 39 46 08          	cmp    QWORD PTR [rsi+0x8],rax
    bb8f:	0f 84 73 01 00 00    	je     bd08 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x218>
    bb95:	f2 0f 10 3d cb 3d 00 00 	movsd  xmm7,QWORD PTR [rip+0x3dcb]        # f968 <_IO_stdin_used+0x968>
    bb9d:	f2 0f 10 15 0b 3e 00 00 	movsd  xmm2,QWORD PTR [rip+0x3e0b]        # f9b0 <_IO_stdin_used+0x9b0>
    bba5:	31 db                	xor    ebx,ebx
    bba7:	4c 8d 6d 80          	lea    r13,[rbp-0x80]
    bbab:	4c 8d a5 40 ff ff ff 	lea    r12,[rbp-0xc0]
    bbb2:	4c 8d b5 10 ff ff ff 	lea    r14,[rbp-0xf0]
    bbb9:	f2 0f 11 bd 88 fe ff ff 	movsd  QWORD PTR [rbp-0x178],xmm7
    bbc1:	eb 39                	jmp    bbfc <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x10c>
    bbc3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    bbc8:	89 1e                	mov    DWORD PTR [rsi],ebx
    bbca:	48 83 c6 04          	add    rsi,0x4
    bbce:	48 89 70 08          	mov    QWORD PTR [rax+0x8],rsi
    bbd2:	48 8b 95 30 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd0]
    bbd9:	48 83 c3 01          	add    rbx,0x1
    bbdd:	48 8b 02             	mov    rax,QWORD PTR [rdx]
    bbe0:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8]
    bbe4:	48 29 c2             	sub    rdx,rax
    bbe7:	48 c1 fa 04          	sar    rdx,0x4
    bbeb:	48 39 d3             	cmp    rbx,rdx
    bbee:	0f 83 14 01 00 00    	jae    bd08 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x218>
    bbf4:	f2 0f 10 95 38 ff ff ff 	movsd  xmm2,QWORD PTR [rbp-0xc8]
    bbfc:	48 89 da             	mov    rdx,rbx
    bbff:	f2 0f 10 05 99 3e 00 00 	movsd  xmm0,QWORD PTR [rip+0x3e99]        # faa0 <_IO_stdin_used+0xaa0>
    bc07:	f2 0f 10 b5 88 fe ff ff 	movsd  xmm6,QWORD PTR [rbp-0x178]
    bc0f:	48 c1 e2 04          	shl    rdx,0x4
    bc13:	48 01 d0             	add    rax,rdx
    bc16:	f2 0f 10 08          	movsd  xmm1,QWORD PTR [rax]
    bc1a:	f2 0f 5e ca          	divsd  xmm1,xmm2
    bc1e:	66 0f 54 c1          	andpd  xmm0,xmm1
    bc22:	66 0f 2e f0          	ucomisd xmm6,xmm0
    bc26:	76 3b                	jbe    bc63 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x173>
    bc28:	f2 48 0f 2c d1       	cvttsd2si rdx,xmm1
    bc2d:	66 0f ef c0          	pxor   xmm0,xmm0
    bc31:	f2 0f 10 2d 17 3d 00 00 	movsd  xmm5,QWORD PTR [rip+0x3d17]        # f950 <_IO_stdin_used+0x950>
    bc39:	f2 48 0f 2a c2       	cvtsi2sd xmm0,rdx
    bc3e:	66 0f 28 d8          	movapd xmm3,xmm0
    bc42:	f2 0f c2 d9 06       	cmpnlesd xmm3,xmm1
    bc47:	66 0f 54 dd          	andpd  xmm3,xmm5
    bc4b:	f2 0f 5c c3          	subsd  xmm0,xmm3
    bc4f:	f2 0f 10 1d 49 3e 00 00 	movsd  xmm3,QWORD PTR [rip+0x3e49]        # faa0 <_IO_stdin_used+0xaa0>
    bc57:	66 0f 55 d9          	andnpd xmm3,xmm1
    bc5b:	66 0f 28 c8          	movapd xmm1,xmm0
    bc5f:	66 0f 56 cb          	orpd   xmm1,xmm3
    bc63:	f2 0f 10 40 08       	movsd  xmm0,QWORD PTR [rax+0x8]
    bc68:	f2 0f 10 bd 88 fe ff ff 	movsd  xmm7,QWORD PTR [rbp-0x178]
    bc70:	f2 0f 5e c2          	divsd  xmm0,xmm2
    bc74:	f2 0f 10 15 24 3e 00 00 	movsd  xmm2,QWORD PTR [rip+0x3e24]        # faa0 <_IO_stdin_used+0xaa0>
    bc7c:	66 0f 54 d0          	andpd  xmm2,xmm0
    bc80:	66 0f 2e fa          	ucomisd xmm7,xmm2
    bc84:	76 3b                	jbe    bcc1 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x1d1>
    bc86:	f2 48 0f 2c c0       	cvttsd2si rax,xmm0
    bc8b:	66 0f ef d2          	pxor   xmm2,xmm2
    bc8f:	f2 0f 10 25 b9 3c 00 00 	movsd  xmm4,QWORD PTR [rip+0x3cb9]        # f950 <_IO_stdin_used+0x950>
    bc97:	f2 48 0f 2a d0       	cvtsi2sd xmm2,rax
    bc9c:	66 0f 28 da          	movapd xmm3,xmm2
    bca0:	f2 0f c2 d8 06       	cmpnlesd xmm3,xmm0
    bca5:	66 0f 54 dc          	andpd  xmm3,xmm4
    bca9:	f2 0f 5c d3          	subsd  xmm2,xmm3
    bcad:	f2 0f 10 1d eb 3d 00 00 	movsd  xmm3,QWORD PTR [rip+0x3deb]        # faa0 <_IO_stdin_used+0xaa0>
    bcb5:	66 0f 55 d8          	andnpd xmm3,xmm0
    bcb9:	66 0f 56 d3          	orpd   xmm2,xmm3
    bcbd:	66 0f 28 c2          	movapd xmm0,xmm2
    bcc1:	f2 0f 2c c1          	cvttsd2si eax,xmm1
    bcc5:	4c 89 ee             	mov    rsi,r13
    bcc8:	4c 89 e7             	mov    rdi,r12
    bccb:	f2 0f 2c d0          	cvttsd2si edx,xmm0
    bccf:	48 c1 e0 20          	shl    rax,0x20
    bcd3:	89 d2                	mov    edx,edx
    bcd5:	48 31 d0             	xor    rax,rdx
    bcd8:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    bcdc:	e8 8f 30 00 00       	call   ed70 <std::__detail::_Map_base<long, std::pair<long const, std::vector<int, std::allocator<int> > >, std::allocator<std::pair<long const, std::vector<int, std::allocator<int> > > >, std::__detail::_Select1st, std::equal_to<long>, std::hash<long>, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<false, false, true>, true>::operator[](long&&)>
    bce1:	89 9d 10 ff ff ff    	mov    DWORD PTR [rbp-0xf0],ebx
    bce7:	48 8b 70 08          	mov    rsi,QWORD PTR [rax+0x8]
    bceb:	48 3b 70 10          	cmp    rsi,QWORD PTR [rax+0x10]
    bcef:	0f 85 d3 fe ff ff    	jne    bbc8 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xd8>
    bcf5:	4c 89 f2             	mov    rdx,r14
    bcf8:	48 89 c7             	mov    rdi,rax
    bcfb:	e8 80 22 00 00       	call   df80 <void std::vector<int, std::allocator<int> >::_M_realloc_insert<int>(__gnu_cxx::__normal_iterator<int*, std::vector<int, std::allocator<int> > >, int&&)>
    bd00:	e9 cd fe ff ff       	jmp    bbd2 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xe2>
    bd05:	0f 1f 00             	nop    DWORD PTR [rax]
    bd08:	48 8b 05 a1 3c 00 00 	mov    rax,QWORD PTR [rip+0x3ca1]        # f9b0 <_IO_stdin_used+0x9b0>
    bd0f:	48 8b 8d 70 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x190]
    bd16:	48 c7 45 98 01 00 00 00 	mov    QWORD PTR [rbp-0x68],0x1
    bd1e:	48 c7 45 a0 00 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
    bd26:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
    bd2a:	48 8d 45 c0          	lea    rax,[rbp-0x40]
    bd2e:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    bd32:	48 8b 01             	mov    rax,QWORD PTR [rcx]
    bd35:	48 89 4d 80          	mov    QWORD PTR [rbp-0x80],rcx
    bd39:	48 c7 45 a8 00 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
    bd41:	c7 45 b0 00 00 80 3f 	mov    DWORD PTR [rbp-0x50],0x3f800000
    bd48:	48 c7 45 b8 00 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
    bd50:	48 c7 45 c0 00 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
    bd58:	48 3b 41 08          	cmp    rax,QWORD PTR [rcx+0x8]
    bd5c:	0f 84 6e 01 00 00    	je     bed0 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x3e0>
    bd62:	f2 0f 10 3d fe 3b 00 00 	movsd  xmm7,QWORD PTR [rip+0x3bfe]        # f968 <_IO_stdin_used+0x968>
    bd6a:	31 db                	xor    ebx,ebx
    bd6c:	4c 8d 65 90          	lea    r12,[rbp-0x70]
    bd70:	f2 0f 10 15 38 3c 00 00 	movsd  xmm2,QWORD PTR [rip+0x3c38]        # f9b0 <_IO_stdin_used+0x9b0>
    bd78:	4c 8d ad 10 ff ff ff 	lea    r13,[rbp-0xf0]
    bd7f:	4c 8d b5 f0 fe ff ff 	lea    r14,[rbp-0x110]
    bd86:	f2 0f 11 bd 88 fe ff ff 	movsd  QWORD PTR [rbp-0x178],xmm7
    bd8e:	eb 2e                	jmp    bdbe <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x2ce>
    bd90:	89 1e                	mov    DWORD PTR [rsi],ebx
    bd92:	48 83 c6 04          	add    rsi,0x4
    bd96:	48 89 70 08          	mov    QWORD PTR [rax+0x8],rsi
    bd9a:	48 8b 55 80          	mov    rdx,QWORD PTR [rbp-0x80]
    bd9e:	48 83 c3 01          	add    rbx,0x1
    bda2:	48 8b 02             	mov    rax,QWORD PTR [rdx]
    bda5:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8]
    bda9:	48 29 c2             	sub    rdx,rax
    bdac:	48 c1 fa 04          	sar    rdx,0x4
    bdb0:	48 39 d3             	cmp    rbx,rdx
    bdb3:	0f 83 17 01 00 00    	jae    bed0 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x3e0>
    bdb9:	f2 0f 10 55 88       	movsd  xmm2,QWORD PTR [rbp-0x78]
    bdbe:	48 89 da             	mov    rdx,rbx
    bdc1:	f2 0f 10 05 d7 3c 00 00 	movsd  xmm0,QWORD PTR [rip+0x3cd7]        # faa0 <_IO_stdin_used+0xaa0>
    bdc9:	f2 0f 10 ad 88 fe ff ff 	movsd  xmm5,QWORD PTR [rbp-0x178]
    bdd1:	48 c1 e2 04          	shl    rdx,0x4
    bdd5:	48 01 d0             	add    rax,rdx
    bdd8:	f2 0f 10 08          	movsd  xmm1,QWORD PTR [rax]
    bddc:	f2 0f 5e ca          	divsd  xmm1,xmm2
    bde0:	66 0f 54 c1          	andpd  xmm0,xmm1
    bde4:	66 0f 2e e8          	ucomisd xmm5,xmm0
    bde8:	76 3b                	jbe    be25 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x335>
    bdea:	f2 48 0f 2c d1       	cvttsd2si rdx,xmm1
    bdef:	66 0f ef c0          	pxor   xmm0,xmm0
    bdf3:	f2 0f 10 2d 55 3b 00 00 	movsd  xmm5,QWORD PTR [rip+0x3b55]        # f950 <_IO_stdin_used+0x950>
    bdfb:	f2 48 0f 2a c2       	cvtsi2sd xmm0,rdx
    be00:	66 0f 28 d8          	movapd xmm3,xmm0
    be04:	f2 0f c2 d9 06       	cmpnlesd xmm3,xmm1
    be09:	66 0f 54 dd          	andpd  xmm3,xmm5
    be0d:	f2 0f 5c c3          	subsd  xmm0,xmm3
    be11:	f2 0f 10 1d 87 3c 00 00 	movsd  xmm3,QWORD PTR [rip+0x3c87]        # faa0 <_IO_stdin_used+0xaa0>
    be19:	66 0f 55 d9          	andnpd xmm3,xmm1
    be1d:	66 0f 28 c8          	movapd xmm1,xmm0
    be21:	66 0f 56 cb          	orpd   xmm1,xmm3
    be25:	f2 0f 10 40 08       	movsd  xmm0,QWORD PTR [rax+0x8]
    be2a:	f2 0f 10 a5 88 fe ff ff 	movsd  xmm4,QWORD PTR [rbp-0x178]
    be32:	f2 0f 5e c2          	divsd  xmm0,xmm2
    be36:	f2 0f 10 15 62 3c 00 00 	movsd  xmm2,QWORD PTR [rip+0x3c62]        # faa0 <_IO_stdin_used+0xaa0>
    be3e:	66 0f 54 d0          	andpd  xmm2,xmm0
    be42:	66 0f 2e e2          	ucomisd xmm4,xmm2
    be46:	76 3b                	jbe    be83 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x393>
    be48:	f2 48 0f 2c c0       	cvttsd2si rax,xmm0
    be4d:	66 0f ef d2          	pxor   xmm2,xmm2
    be51:	f2 0f 10 35 f7 3a 00 00 	movsd  xmm6,QWORD PTR [rip+0x3af7]        # f950 <_IO_stdin_used+0x950>
    be59:	f2 48 0f 2a d0       	cvtsi2sd xmm2,rax
    be5e:	66 0f 28 da          	movapd xmm3,xmm2
    be62:	f2 0f c2 d8 06       	cmpnlesd xmm3,xmm0
    be67:	66 0f 54 de          	andpd  xmm3,xmm6
    be6b:	f2 0f 5c d3          	subsd  xmm2,xmm3
    be6f:	f2 0f 10 1d 29 3c 00 00 	movsd  xmm3,QWORD PTR [rip+0x3c29]        # faa0 <_IO_stdin_used+0xaa0>
    be77:	66 0f 55 d8          	andnpd xmm3,xmm0
    be7b:	66 0f 56 d3          	orpd   xmm2,xmm3
    be7f:	66 0f 28 c2          	movapd xmm0,xmm2
    be83:	f2 0f 2c c1          	cvttsd2si eax,xmm1
    be87:	4c 89 ee             	mov    rsi,r13
    be8a:	4c 89 e7             	mov    rdi,r12
    be8d:	f2 0f 2c d0          	cvttsd2si edx,xmm0
    be91:	48 c1 e0 20          	shl    rax,0x20
    be95:	89 d2                	mov    edx,edx
    be97:	48 31 d0             	xor    rax,rdx
    be9a:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
    bea1:	e8 ca 2e 00 00       	call   ed70 <std::__detail::_Map_base<long, std::pair<long const, std::vector<int, std::allocator<int> > >, std::allocator<std::pair<long const, std::vector<int, std::allocator<int> > > >, std::__detail::_Select1st, std::equal_to<long>, std::hash<long>, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<false, false, true>, true>::operator[](long&&)>
    bea6:	89 9d f0 fe ff ff    	mov    DWORD PTR [rbp-0x110],ebx
    beac:	48 8b 70 08          	mov    rsi,QWORD PTR [rax+0x8]
    beb0:	48 3b 70 10          	cmp    rsi,QWORD PTR [rax+0x10]
    beb4:	0f 85 d6 fe ff ff    	jne    bd90 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x2a0>
    beba:	4c 89 f2             	mov    rdx,r14
    bebd:	48 89 c7             	mov    rdi,rax
    bec0:	e8 bb 20 00 00       	call   df80 <void std::vector<int, std::allocator<int> >::_M_realloc_insert<int>(__gnu_cxx::__normal_iterator<int*, std::vector<int, std::allocator<int> > >, int&&)>
    bec5:	e9 d0 fe ff ff       	jmp    bd9a <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x2aa>
    beca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    bed0:	48 8d 85 90 fe ff ff 	lea    rax,[rbp-0x170]
    bed7:	48 8b 95 70 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x190]
    bede:	48 8d b5 30 ff ff ff 	lea    rsi,[rbp-0xd0]
    bee5:	48 89 c7             	mov    rdi,rax
    bee8:	48 89 85 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rax
    beef:	e8 0c ca ff ff       	call   8900 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]>
    bef4:	48 8d 85 b0 fe ff ff 	lea    rax,[rbp-0x150]
    befb:	48 8b 95 50 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b0]
    bf02:	48 8d 75 80          	lea    rsi,[rbp-0x80]
    bf06:	48 89 c7             	mov    rdi,rax
    bf09:	48 89 85 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rax
    bf10:	e8 eb c9 ff ff       	call   8900 <nearest_neighbor_distances(GridIndex const&, std::vector<Point, std::allocator<Point> > const&, double) [clone .constprop.0]>
    bf15:	4c 8b b5 98 fe ff ff 	mov    r14,QWORD PTR [rbp-0x168]
    bf1c:	66 0f ef c0          	pxor   xmm0,xmm0
    bf20:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
    bf27:	48 c7 85 e0 fe ff ff 00 00 00 00 	mov    QWORD PTR [rbp-0x120],0x0
    bf32:	0f 29 85 d0 fe ff ff 	movaps XMMWORD PTR [rbp-0x130],xmm0
    bf39:	4d 89 f4             	mov    r12,r14
    bf3c:	48 89 85 68 fe ff ff 	mov    QWORD PTR [rbp-0x198],rax
    bf43:	49 29 c4             	sub    r12,rax
    bf46:	4c 89 e0             	mov    rax,r12
    bf49:	48 c1 f8 03          	sar    rax,0x3
    bf4d:	48 89 85 60 fe ff ff 	mov    QWORD PTR [rbp-0x1a0],rax
    bf54:	0f 84 8e 01 00 00    	je     c0e8 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x5f8>
    bf5a:	48 b8 f8 ff ff ff ff ff ff 7f 	movabs rax,0x7ffffffffffffff8
    bf64:	4c 89 a5 48 fe ff ff 	mov    QWORD PTR [rbp-0x1b8],r12
    bf6b:	4c 39 e0             	cmp    rax,r12
    bf6e:	0f 82 c5 08 00 00    	jb     c839 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xd49>
    bf74:	4c 89 e7             	mov    rdi,r12
    bf77:	e8 74 78 ff ff       	call   37f0 <operator new(unsigned long)@plt>
    bf7c:	66 48 0f 6e c0       	movq   xmm0,rax
    bf81:	4a 8d 1c 20          	lea    rbx,[rax+r12*1]
    bf85:	48 89 85 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rax
    bf8c:	48 89 c7             	mov    rdi,rax
    bf8f:	66 0f 6c c0          	punpcklqdq xmm0,xmm0
    bf93:	48 89 9d e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rbx
    bf9a:	0f 29 85 d0 fe ff ff 	movaps XMMWORD PTR [rbp-0x130],xmm0
    bfa1:	49 83 fc 08          	cmp    r12,0x8
    bfa5:	0f 84 01 09 00 00    	je     c8ac <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xdbc>
    bfab:	48 8b b5 68 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x198]
    bfb2:	4c 89 e2             	mov    rdx,r12
    bfb5:	e8 e6 79 ff ff       	call   39a0 <memmove@plt>
    bfba:	48 8b 85 b0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x150]
    bfc1:	4c 8b ad b8 fe ff ff 	mov    r13,QWORD PTR [rbp-0x148]
    bfc8:	48 89 9d d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],rbx
    bfcf:	48 89 85 80 fe ff ff 	mov    QWORD PTR [rbp-0x180],rax
    bfd6:	49 39 c5             	cmp    r13,rax
    bfd9:	0f 84 41 01 00 00    	je     c120 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x630>
    bfdf:	48 8b 85 80 fe ff ff 	mov    rax,QWORD PTR [rbp-0x180]
    bfe6:	4c 89 eb             	mov    rbx,r13
    bfe9:	48 8b 8d 60 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1a0]
    bff0:	48 29 c3             	sub    rbx,rax
    bff3:	48 b8 ff ff ff ff ff ff ff 0f 	movabs rax,0xfffffffffffffff
    bffd:	48 89 da             	mov    rdx,rbx
    c000:	48 29 c8             	sub    rax,rcx
    c003:	48 c1 fa 03          	sar    rdx,0x3
    c007:	48 39 d0             	cmp    rax,rdx
    c00a:	0f 82 12 0a 00 00    	jb     ca22 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xf32>
    c010:	48 8b 85 60 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1a0]
    c017:	48 b9 ff ff ff ff ff ff ff 0f 	movabs rcx,0xfffffffffffffff
    c021:	48 01 c0             	add    rax,rax
    c024:	48 39 c8             	cmp    rax,rcx
    c027:	48 0f 47 c1          	cmova  rax,rcx
    c02b:	49 39 dc             	cmp    r12,rbx
    c02e:	0f 82 bb 07 00 00    	jb     c7ef <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xcff>
    c034:	48 c1 e0 03          	shl    rax,0x3
    c038:	48 89 c7             	mov    rdi,rax
    c03b:	48 89 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rax
    c042:	e8 a9 77 ff ff       	call   37f0 <operator new(unsigned long)@plt>
    c047:	48 89 85 88 fe ff ff 	mov    QWORD PTR [rbp-0x178],rax
    c04e:	48 8b bd 88 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x178]
    c055:	48 8b 95 48 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b8]
    c05c:	48 8d 04 17          	lea    rax,[rdi+rdx*1]
    c060:	48 89 85 20 fe ff ff 	mov    QWORD PTR [rbp-0x1e0],rax
    c067:	49 83 fc 08          	cmp    r12,0x8
    c06b:	0f 8e c0 08 00 00    	jle    c931 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xe41>
    c071:	48 8b b5 40 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1c0]
    c078:	e8 43 77 ff ff       	call   37c0 <memcpy@plt>
    c07d:	48 83 fb 08          	cmp    rbx,0x8
    c081:	0f 8e 57 09 00 00    	jle    c9de <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xeee>
    c087:	4c 8b a5 20 fe ff ff 	mov    r12,QWORD PTR [rbp-0x1e0]
    c08e:	48 8b b5 80 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x180]
    c095:	48 89 da             	mov    rdx,rbx
    c098:	4c 89 e7             	mov    rdi,r12
    c09b:	e8 00 79 ff ff       	call   39a0 <memmove@plt>
    c0a0:	48 01 d8             	add    rax,rbx
    c0a3:	48 89 c3             	mov    rbx,rax
    c0a6:	48 8b b5 48 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x1b8]
    c0ad:	48 8b bd 40 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1c0]
    c0b4:	e8 57 77 ff ff       	call   3810 <operator delete(void*, unsigned long)@plt>
    c0b9:	48 8b 8d 88 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x178]
    c0c0:	48 8b 85 28 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1d8]
    c0c7:	48 89 9d d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],rbx
    c0ce:	48 01 c8             	add    rax,rcx
    c0d1:	48 89 8d d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rcx
    c0d8:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
    c0df:	eb 4d                	jmp    c12e <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x63e>
    c0e1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    c0e8:	48 c7 85 d0 fe ff ff 00 00 00 00 	mov    QWORD PTR [rbp-0x130],0x0
    c0f3:	31 db                	xor    ebx,ebx
    c0f5:	48 c7 85 e0 fe ff ff 00 00 00 00 	mov    QWORD PTR [rbp-0x120],0x0
    c100:	48 c7 85 48 fe ff ff 00 00 00 00 	mov    QWORD PTR [rbp-0x1b8],0x0
    c10b:	48 c7 85 40 fe ff ff 00 00 00 00 	mov    QWORD PTR [rbp-0x1c0],0x0
    c116:	e9 9f fe ff ff       	jmp    bfba <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x4ca>
    c11b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    c120:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
    c127:	48 89 85 88 fe ff ff 	mov    QWORD PTR [rbp-0x178],rax
    c12e:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
    c135:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    c138:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    c13c:	48 39 d1             	cmp    rcx,rdx
    c13f:	0f 84 eb 06 00 00    	je     c830 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xd40>
    c145:	48 89 c8             	mov    rax,rcx
    c148:	66 0f ef c0          	pxor   xmm0,xmm0
    c14c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    c150:	66 0f 10 30          	movupd xmm6,XMMWORD PTR [rax]
    c154:	48 83 c0 10          	add    rax,0x10
    c158:	66 0f 58 c6          	addpd  xmm0,xmm6
    c15c:	48 39 c2             	cmp    rdx,rax
    c15f:	75 ef                	jne    c150 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x660>
    c161:	48 29 ca             	sub    rdx,rcx
    c164:	48 c1 fa 04          	sar    rdx,0x4
    c168:	0f 88 82 04 00 00    	js     c5f0 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xb00>
    c16e:	66 0f ef c9          	pxor   xmm1,xmm1
    c172:	f2 48 0f 2a ca       	cvtsi2sd xmm1,rdx
    c177:	f2 0f 10 1d d1 37 00 00 	movsd  xmm3,QWORD PTR [rip+0x37d1]        # f950 <_IO_stdin_used+0x950>
    c17f:	48 8b 85 70 fe ff ff 	mov    rax,QWORD PTR [rbp-0x190]
    c186:	66 0f 28 e3          	movapd xmm4,xmm3
    c18a:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    c18d:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    c191:	f2 0f 5e e1          	divsd  xmm4,xmm1
    c195:	66 0f 14 e4          	unpcklpd xmm4,xmm4
    c199:	66 0f 59 e0          	mulpd  xmm4,xmm0
    c19d:	66 0f 28 fc          	movapd xmm7,xmm4
    c1a1:	66 0f 28 c4          	movapd xmm0,xmm4
    c1a5:	66 0f 15 ff          	unpckhpd xmm7,xmm7
    c1a9:	66 0f 28 cf          	movapd xmm1,xmm7
    c1ad:	48 39 d1             	cmp    rcx,rdx
    c1b0:	0f 84 6a 06 00 00    	je     c820 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xd30>
    c1b6:	48 89 c8             	mov    rax,rcx
    c1b9:	66 0f ef d2          	pxor   xmm2,xmm2
    c1bd:	0f 1f 00             	nop    DWORD PTR [rax]
    c1c0:	66 0f 10 38          	movupd xmm7,XMMWORD PTR [rax]
    c1c4:	48 83 c0 10          	add    rax,0x10
    c1c8:	66 0f 58 d7          	addpd  xmm2,xmm7
    c1cc:	48 39 c2             	cmp    rdx,rax
    c1cf:	75 ef                	jne    c1c0 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x6d0>
    c1d1:	48 29 ca             	sub    rdx,rcx
    c1d4:	48 c1 fa 04          	sar    rdx,0x4
    c1d8:	0f 88 f2 03 00 00    	js     c5d0 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xae0>
    c1de:	66 0f ef ed          	pxor   xmm5,xmm5
    c1e2:	f2 48 0f 2a ea       	cvtsi2sd xmm5,rdx
    c1e7:	f2 0f 5e dd          	divsd  xmm3,xmm5
    c1eb:	0f 29 a5 50 fe ff ff 	movaps XMMWORD PTR [rbp-0x1b0],xmm4
    c1f2:	45 31 e4             	xor    r12d,r12d
    c1f5:	66 0f 14 db          	unpcklpd xmm3,xmm3
    c1f9:	66 0f 59 d3          	mulpd  xmm2,xmm3
    c1fd:	66 0f 28 e2          	movapd xmm4,xmm2
    c201:	f2 0f 5c c2          	subsd  xmm0,xmm2
    c205:	0f 29 95 70 fe ff ff 	movaps XMMWORD PTR [rbp-0x190],xmm2
    c20c:	66 0f 15 e4          	unpckhpd xmm4,xmm4
    c210:	f2 0f 5c cc          	subsd  xmm1,xmm4
    c214:	e8 f7 73 ff ff       	call   3610 <hypot@plt>
    c219:	48 8b 85 88 fe ff ff 	mov    rax,QWORD PTR [rbp-0x178]
    c220:	66 0f 28 95 70 fe ff ff 	movapd xmm2,XMMWORD PTR [rbp-0x190]
    c228:	66 0f 28 a5 50 fe ff ff 	movapd xmm4,XMMWORD PTR [rbp-0x1b0]
    c230:	48 39 c3             	cmp    rbx,rax
    c233:	74 1c                	je     c251 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x761>
    c235:	f2 0f 10 0d 7b 37 00 00 	movsd  xmm1,QWORD PTR [rip+0x377b]        # f9b8 <_IO_stdin_used+0x9b8>
    c23d:	0f 1f 00             	nop    DWORD PTR [rax]
    c240:	66 0f 2f 08          	comisd xmm1,QWORD PTR [rax]
    c244:	49 83 dc ff          	sbb    r12,0xffffffffffffffff
    c248:	48 83 c0 08          	add    rax,0x8
    c24c:	48 39 c3             	cmp    rbx,rax
    c24f:	75 ef                	jne    c240 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x750>
    c251:	48 8b 85 68 fe ff ff 	mov    rax,QWORD PTR [rbp-0x198]
    c258:	41 0f 11 27          	movups XMMWORD PTR [r15],xmm4
    c25c:	41 0f 11 57 10       	movups XMMWORD PTR [r15+0x10],xmm2
    c261:	f2 41 0f 11 47 20    	movsd  QWORD PTR [r15+0x20],xmm0
    c267:	49 39 c6             	cmp    r14,rax
    c26a:	0f 84 40 04 00 00    	je     c6b0 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xbc0>
    c270:	66 0f ef c0          	pxor   xmm0,xmm0
    c274:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    c278:	f2 0f 10 08          	movsd  xmm1,QWORD PTR [rax]
    c27c:	48 83 c0 08          	add    rax,0x8
    c280:	f2 0f 59 c9          	mulsd  xmm1,xmm1
    c284:	f2 0f 58 c1          	addsd  xmm0,xmm1
    c288:	4c 39 f0             	cmp    rax,r14
    c28b:	75 eb                	jne    c278 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x788>
    c28d:	66 0f ef c9          	pxor   xmm1,xmm1
    c291:	f2 48 0f 2a 8d 60 fe ff ff 	cvtsi2sd xmm1,QWORD PTR [rbp-0x1a0]
    c29a:	f2 0f 5e c1          	divsd  xmm0,xmm1
    c29e:	66 0f ef c9          	pxor   xmm1,xmm1
    c2a2:	66 0f 2e c8          	ucomisd xmm1,xmm0
    c2a6:	0f 87 aa 07 00 00    	ja     ca56 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xf66>
    c2ac:	f2 0f 51 c0          	sqrtsd xmm0,xmm0
    c2b0:	48 8b 85 80 fe ff ff 	mov    rax,QWORD PTR [rbp-0x180]
    c2b7:	f2 41 0f 11 47 28    	movsd  QWORD PTR [r15+0x28],xmm0
    c2bd:	49 39 c5             	cmp    r13,rax
    c2c0:	0f 84 da 03 00 00    	je     c6a0 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xbb0>
    c2c6:	66 0f ef c0          	pxor   xmm0,xmm0
    c2ca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    c2d0:	f2 0f 10 08          	movsd  xmm1,QWORD PTR [rax]
    c2d4:	48 83 c0 08          	add    rax,0x8
    c2d8:	f2 0f 59 c9          	mulsd  xmm1,xmm1
    c2dc:	f2 0f 58 c1          	addsd  xmm0,xmm1
    c2e0:	49 39 c5             	cmp    r13,rax
    c2e3:	75 eb                	jne    c2d0 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x7e0>
    c2e5:	48 8b 85 80 fe ff ff 	mov    rax,QWORD PTR [rbp-0x180]
    c2ec:	49 29 c5             	sub    r13,rax
    c2ef:	49 c1 fd 03          	sar    r13,0x3
    c2f3:	0f 88 67 04 00 00    	js     c760 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xc70>
    c2f9:	66 0f ef c9          	pxor   xmm1,xmm1
    c2fd:	f2 49 0f 2a cd       	cvtsi2sd xmm1,r13
    c302:	f2 0f 5e c1          	divsd  xmm0,xmm1
    c306:	66 0f ef c9          	pxor   xmm1,xmm1
    c30a:	66 0f 2e c8          	ucomisd xmm1,xmm0
    c30e:	0f 87 4c 07 00 00    	ja     ca60 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xf70>
    c314:	f2 0f 51 c0          	sqrtsd xmm0,xmm0
    c318:	48 8b 8d 88 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x178]
    c31f:	f2 41 0f 11 47 30    	movsd  QWORD PTR [r15+0x30],xmm0
    c325:	66 0f ef c0          	pxor   xmm0,xmm0
    c329:	48 89 c8             	mov    rax,rcx
    c32c:	48 39 cb             	cmp    rbx,rcx
    c32f:	0f 84 8b 03 00 00    	je     c6c0 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xbd0>
    c335:	0f 1f 00             	nop    DWORD PTR [rax]
    c338:	f2 0f 10 08          	movsd  xmm1,QWORD PTR [rax]
    c33c:	48 83 c0 08          	add    rax,0x8
    c340:	f2 0f 59 c9          	mulsd  xmm1,xmm1
    c344:	f2 0f 58 c1          	addsd  xmm0,xmm1
    c348:	48 39 c3             	cmp    rbx,rax
    c34b:	75 eb                	jne    c338 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x848>
    c34d:	48 8b 85 88 fe ff ff 	mov    rax,QWORD PTR [rbp-0x178]
    c354:	49 89 de             	mov    r14,rbx
    c357:	49 29 c6             	sub    r14,rax
    c35a:	4d 89 f5             	mov    r13,r14
    c35d:	49 c1 fd 03          	sar    r13,0x3
    c361:	4c 89 ad 48 fe ff ff 	mov    QWORD PTR [rbp-0x1b8],r13
    c368:	0f 88 12 04 00 00    	js     c780 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xc90>
    c36e:	66 0f ef c9          	pxor   xmm1,xmm1
    c372:	f2 49 0f 2a cd       	cvtsi2sd xmm1,r13
    c377:	f2 0f 5e c1          	divsd  xmm0,xmm1
    c37b:	66 0f ef c9          	pxor   xmm1,xmm1
    c37f:	66 0f 2e c8          	ucomisd xmm1,xmm0
    c383:	0f 87 e1 06 00 00    	ja     ca6a <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xf7a>
    c389:	f2 0f 51 c0          	sqrtsd xmm0,xmm0
    c38d:	66 0f ef c9          	pxor   xmm1,xmm1
    c391:	f2 41 0f 11 47 38    	movsd  QWORD PTR [r15+0x38],xmm0
    c397:	48 c7 85 20 ff ff ff 00 00 00 00 	mov    QWORD PTR [rbp-0xe0],0x0
    c3a2:	0f 29 8d 10 ff ff ff 	movaps XMMWORD PTR [rbp-0xf0],xmm1
    c3a9:	4d 85 ed             	test   r13,r13
    c3ac:	0f 84 5c 02 00 00    	je     c60e <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xb1e>
    c3b2:	48 b8 f8 ff ff ff ff ff ff 7f 	movabs rax,0x7ffffffffffffff8
    c3bc:	4c 89 b5 70 fe ff ff 	mov    QWORD PTR [rbp-0x190],r14
    c3c3:	4c 39 f0             	cmp    rax,r14
    c3c6:	0f 82 4d 05 00 00    	jb     c919 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xe29>
    c3cc:	4c 89 f7             	mov    rdi,r14
    c3cf:	e8 1c 74 ff ff       	call   37f0 <operator new(unsigned long)@plt>
    c3d4:	66 48 0f 6e c0       	movq   xmm0,rax
    c3d9:	4e 8d 2c 30          	lea    r13,[rax+r14*1]
    c3dd:	48 89 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],rax
    c3e4:	48 89 c7             	mov    rdi,rax
    c3e7:	66 0f 6c c0          	punpcklqdq xmm0,xmm0
    c3eb:	4c 89 ad 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],r13
    c3f2:	0f 29 85 10 ff ff ff 	movaps XMMWORD PTR [rbp-0xf0],xmm0
    c3f9:	49 83 fe 08          	cmp    r14,0x8
    c3fd:	0f 84 cf 04 00 00    	je     c8d2 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xde2>
    c403:	48 8b b5 88 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x178]
    c40a:	4c 89 f2             	mov    rdx,r14
    c40d:	e8 ae 73 ff ff       	call   37c0 <memcpy@plt>
    c412:	4c 89 ad 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],r13
    c419:	f2 0f 10 05 9f 35 00 00 	movsd  xmm0,QWORD PTR [rip+0x359f]        # f9c0 <_IO_stdin_used+0x9c0>
    c421:	4c 8d ad 10 ff ff ff 	lea    r13,[rbp-0xf0]
    c428:	4c 89 ef             	mov    rdi,r13
    c42b:	e8 b0 be ff ff       	call   82e0 <percentile(std::vector<double, std::allocator<double> >, double)>
    c430:	48 8b bd 70 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x190]
    c437:	f2 41 0f 11 47 40    	movsd  QWORD PTR [r15+0x40],xmm0
    c43d:	e8 ae 73 ff ff       	call   37f0 <operator new(unsigned long)@plt>
    c442:	49 89 c5             	mov    r13,rax
    c445:	66 48 0f 6e c0       	movq   xmm0,rax
    c44a:	48 8b 85 70 fe ff ff 	mov    rax,QWORD PTR [rbp-0x190]
    c451:	66 0f 6c c0          	punpcklqdq xmm0,xmm0
    c455:	49 8d 4c 05 00       	lea    rcx,[r13+rax*1+0x0]
    c45a:	0f 29 85 f0 fe ff ff 	movaps XMMWORD PTR [rbp-0x110],xmm0
    c461:	48 89 8d 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rcx
    c468:	49 83 fe 08          	cmp    r14,0x8
    c46c:	0f 84 91 04 00 00    	je     c903 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xe13>
    c472:	48 8b 95 70 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x190]
    c479:	48 8b b5 88 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x178]
    c480:	4c 89 ef             	mov    rdi,r13
    c483:	48 89 8d 60 fe ff ff 	mov    QWORD PTR [rbp-0x1a0],rcx
    c48a:	e8 31 73 ff ff       	call   37c0 <memcpy@plt>
    c48f:	48 8b 8d 60 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1a0]
    c496:	f2 0f 10 05 2a 35 00 00 	movsd  xmm0,QWORD PTR [rip+0x352a]        # f9c8 <_IO_stdin_used+0x9c8>
    c49e:	48 8d bd f0 fe ff ff 	lea    rdi,[rbp-0x110]
    c4a5:	48 89 8d f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rcx
    c4ac:	e8 2f be ff ff       	call   82e0 <percentile(std::vector<double, std::allocator<double> >, double)>
    c4b1:	48 8b 8d 88 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x178]
    c4b8:	66 0f ef d2          	pxor   xmm2,xmm2
    c4bc:	f2 48 0f 2a 95 48 fe ff ff 	cvtsi2sd xmm2,QWORD PTR [rbp-0x1b8]
    c4c5:	f2 41 0f 11 47 48    	movsd  QWORD PTR [r15+0x48],xmm0
    c4cb:	48 8d 41 08          	lea    rax,[rcx+0x8]
    c4cf:	f2 0f 10 01          	movsd  xmm0,QWORD PTR [rcx]
    c4d3:	48 39 d8             	cmp    rax,rbx
    c4d6:	0f 84 9d 03 00 00    	je     c879 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xd89>
    c4dc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    c4e0:	f2 0f 10 08          	movsd  xmm1,QWORD PTR [rax]
    c4e4:	48 83 c0 08          	add    rax,0x8
    c4e8:	f2 0f 5f c8          	maxsd  xmm1,xmm0
    c4ec:	66 0f 28 c1          	movapd xmm0,xmm1
    c4f0:	48 39 c3             	cmp    rbx,rax
    c4f3:	75 eb                	jne    c4e0 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x9f0>
    c4f5:	4d 85 e4             	test   r12,r12
    c4f8:	0f 88 aa 02 00 00    	js     c7a8 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xcb8>
    c4fe:	66 0f ef c9          	pxor   xmm1,xmm1
    c502:	f2 49 0f 2a cc       	cvtsi2sd xmm1,r12
    c507:	f2 0f 5e ca          	divsd  xmm1,xmm2
    c50b:	66 0f 14 c1          	unpcklpd xmm0,xmm1
    c50f:	41 0f 11 47 50       	movups XMMWORD PTR [r15+0x50],xmm0
    c514:	4d 85 ed             	test   r13,r13
    c517:	74 0f                	je     c528 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xa38>
    c519:	48 8b b5 70 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x190]
    c520:	4c 89 ef             	mov    rdi,r13
    c523:	e8 e8 72 ff ff       	call   3810 <operator delete(void*, unsigned long)@plt>
    c528:	48 83 bd 50 fe ff ff 00 	cmp    QWORD PTR [rbp-0x1b0],0x0
    c530:	74 13                	je     c545 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xa55>
    c532:	48 8b b5 70 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x190]
    c539:	48 8b bd 50 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1b0]
    c540:	e8 cb 72 ff ff       	call   3810 <operator delete(void*, unsigned long)@plt>
    c545:	48 8b bd 88 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x178]
    c54c:	48 8b b5 e0 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x120]
    c553:	48 29 fe             	sub    rsi,rdi
    c556:	e8 b5 72 ff ff       	call   3810 <operator delete(void*, unsigned long)@plt>
    c55b:	48 8b bd 80 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x180]
    c562:	48 85 ff             	test   rdi,rdi
    c565:	74 0f                	je     c576 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xa86>
    c567:	48 8b b5 c0 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x140]
    c56e:	48 29 fe             	sub    rsi,rdi
    c571:	e8 9a 72 ff ff       	call   3810 <operator delete(void*, unsigned long)@plt>
    c576:	48 8b bd 68 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x198]
    c57d:	48 85 ff             	test   rdi,rdi
    c580:	74 0f                	je     c591 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xaa1>
    c582:	48 8b b5 a0 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x160]
    c589:	48 29 fe             	sub    rsi,rdi
    c58c:	e8 7f 72 ff ff       	call   3810 <operator delete(void*, unsigned long)@plt>
    c591:	48 8d 7d 90          	lea    rdi,[rbp-0x70]
    c595:	e8 86 0d 00 00       	call   d320 <std::_Hashtable<long, std::pair<long const, std::vector<int, std::allocator<int> > >, std::allocator<std::pair<long const, std::vector<int, std::allocator<int> > > >, std::__detail::_Select1st, std::equal_to<long>, std::hash<long>, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<false, false, true> >::~_Hashtable()>
    c59a:	48 8d bd 40 ff ff ff 	lea    rdi,[rbp-0xc0]
    c5a1:	e8 7a 0d 00 00       	call   d320 <std::_Hashtable<long, std::pair<long const, std::vector<int, std::allocator<int> > >, std::allocator<std::pair<long const, std::vector<int, std::allocator<int> > > >, std::__detail::_Select1st, std::equal_to<long>, std::hash<long>, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<false, false, true> >::~_Hashtable()>
    c5a6:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    c5aa:	64 48 2b 04 25 28 00 00 00 	sub    rax,QWORD PTR fs:0x28
    c5b3:	0f 85 64 04 00 00    	jne    ca1d <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xf2d>
    c5b9:	48 81 c4 b8 01 00 00 	add    rsp,0x1b8
    c5c0:	4c 89 f8             	mov    rax,r15
    c5c3:	5b                   	pop    rbx
    c5c4:	41 5c                	pop    r12
    c5c6:	41 5d                	pop    r13
    c5c8:	41 5e                	pop    r14
    c5ca:	41 5f                	pop    r15
    c5cc:	5d                   	pop    rbp
    c5cd:	c3                   	ret
    c5ce:	66 90                	xchg   ax,ax
    c5d0:	48 89 d0             	mov    rax,rdx
    c5d3:	83 e2 01             	and    edx,0x1
    c5d6:	66 0f ef ed          	pxor   xmm5,xmm5
    c5da:	48 d1 e8             	shr    rax,1
    c5dd:	48 09 d0             	or     rax,rdx
    c5e0:	f2 48 0f 2a e8       	cvtsi2sd xmm5,rax
    c5e5:	f2 0f 58 ed          	addsd  xmm5,xmm5
    c5e9:	e9 f9 fb ff ff       	jmp    c1e7 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x6f7>
    c5ee:	66 90                	xchg   ax,ax
    c5f0:	48 89 d0             	mov    rax,rdx
    c5f3:	83 e2 01             	and    edx,0x1
    c5f6:	66 0f ef c9          	pxor   xmm1,xmm1
    c5fa:	48 d1 e8             	shr    rax,1
    c5fd:	48 09 d0             	or     rax,rdx
    c600:	f2 48 0f 2a c8       	cvtsi2sd xmm1,rax
    c605:	f2 0f 58 c9          	addsd  xmm1,xmm1
    c609:	e9 69 fb ff ff       	jmp    c177 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x687>
    c60e:	f2 0f 10 05 aa 33 00 00 	movsd  xmm0,QWORD PTR [rip+0x33aa]        # f9c0 <_IO_stdin_used+0x9c0>
    c616:	48 8d bd 10 ff ff ff 	lea    rdi,[rbp-0xf0]
    c61d:	48 c7 85 20 ff ff ff 00 00 00 00 	mov    QWORD PTR [rbp-0xe0],0x0
    c628:	e8 b3 bc ff ff       	call   82e0 <percentile(std::vector<double, std::allocator<double> >, double)>
    c62d:	66 0f ef c9          	pxor   xmm1,xmm1
    c631:	48 8d bd f0 fe ff ff 	lea    rdi,[rbp-0x110]
    c638:	48 c7 85 00 ff ff ff 00 00 00 00 	mov    QWORD PTR [rbp-0x100],0x0
    c643:	f2 41 0f 11 47 40    	movsd  QWORD PTR [r15+0x40],xmm0
    c649:	f2 0f 10 05 77 33 00 00 	movsd  xmm0,QWORD PTR [rip+0x3377]        # f9c8 <_IO_stdin_used+0x9c8>
    c651:	0f 29 8d f0 fe ff ff 	movaps XMMWORD PTR [rbp-0x110],xmm1
    c658:	e8 83 bc ff ff       	call   82e0 <percentile(std::vector<double, std::allocator<double> >, double)>
    c65d:	48 8b 8d 88 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x178]
    c664:	f2 41 0f 11 47 48    	movsd  QWORD PTR [r15+0x48],xmm0
    c66a:	48 8d 41 08          	lea    rax,[rcx+0x8]
    c66e:	f2 0f 10 01          	movsd  xmm0,QWORD PTR [rcx]
    c672:	48 39 c3             	cmp    rbx,rax
    c675:	0f 84 d6 01 00 00    	je     c851 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xd61>
    c67b:	48 c7 85 70 fe ff ff 00 00 00 00 	mov    QWORD PTR [rbp-0x190],0x0
    c686:	66 0f ef d2          	pxor   xmm2,xmm2
    c68a:	45 31 ed             	xor    r13d,r13d
    c68d:	48 c7 85 50 fe ff ff 00 00 00 00 	mov    QWORD PTR [rbp-0x1b0],0x0
    c698:	e9 43 fe ff ff       	jmp    c4e0 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x9f0>
    c69d:	0f 1f 00             	nop    DWORD PTR [rax]
    c6a0:	f2 0f 10 05 b0 32 00 00 	movsd  xmm0,QWORD PTR [rip+0x32b0]        # f958 <_IO_stdin_used+0x958>
    c6a8:	e9 6b fc ff ff       	jmp    c318 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x828>
    c6ad:	0f 1f 00             	nop    DWORD PTR [rax]
    c6b0:	f2 0f 10 05 a0 32 00 00 	movsd  xmm0,QWORD PTR [rip+0x32a0]        # f958 <_IO_stdin_used+0x958>
    c6b8:	e9 f3 fb ff ff       	jmp    c2b0 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x7c0>
    c6bd:	0f 1f 00             	nop    DWORD PTR [rax]
    c6c0:	48 8b 05 91 32 00 00 	mov    rax,QWORD PTR [rip+0x3291]        # f958 <_IO_stdin_used+0x958>
    c6c7:	f2 0f 10 05 f1 32 00 00 	movsd  xmm0,QWORD PTR [rip+0x32f1]        # f9c0 <_IO_stdin_used+0x9c0>
    c6cf:	66 0f ef c9          	pxor   xmm1,xmm1
    c6d3:	48 8d bd 10 ff ff ff 	lea    rdi,[rbp-0xf0]
    c6da:	0f 29 8d 10 ff ff ff 	movaps XMMWORD PTR [rbp-0xf0],xmm1
    c6e1:	49 89 47 38          	mov    QWORD PTR [r15+0x38],rax
    c6e5:	48 c7 85 20 ff ff ff 00 00 00 00 	mov    QWORD PTR [rbp-0xe0],0x0
    c6f0:	e8 eb bb ff ff       	call   82e0 <percentile(std::vector<double, std::allocator<double> >, double)>
    c6f5:	66 0f ef c9          	pxor   xmm1,xmm1
    c6f9:	48 8d bd f0 fe ff ff 	lea    rdi,[rbp-0x110]
    c700:	48 c7 85 00 ff ff ff 00 00 00 00 	mov    QWORD PTR [rbp-0x100],0x0
    c70b:	f2 41 0f 11 47 40    	movsd  QWORD PTR [r15+0x40],xmm0
    c711:	f2 0f 10 05 af 32 00 00 	movsd  xmm0,QWORD PTR [rip+0x32af]        # f9c8 <_IO_stdin_used+0x9c8>
    c719:	0f 29 8d f0 fe ff ff 	movaps XMMWORD PTR [rbp-0x110],xmm1
    c720:	e8 bb bb ff ff       	call   82e0 <percentile(std::vector<double, std::allocator<double> >, double)>
    c725:	f2 41 0f 11 47 48    	movsd  QWORD PTR [r15+0x48],xmm0
    c72b:	4d 85 e4             	test   r12,r12
    c72e:	0f 88 9c 00 00 00    	js     c7d0 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xce0>
    c734:	66 0f ef c0          	pxor   xmm0,xmm0
    c738:	f2 49 0f 2a c4       	cvtsi2sd xmm0,r12
    c73d:	66 0f ef c9          	pxor   xmm1,xmm1
    c741:	48 8b 85 88 fe ff ff 	mov    rax,QWORD PTR [rbp-0x178]
    c748:	f2 0f 5e c1          	divsd  xmm0,xmm1
    c74c:	f2 0f 10 08          	movsd  xmm1,QWORD PTR [rax]
    c750:	66 0f 14 c8          	unpcklpd xmm1,xmm0
    c754:	41 0f 11 4f 50       	movups XMMWORD PTR [r15+0x50],xmm1
    c759:	e9 e7 fd ff ff       	jmp    c545 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xa55>
    c75e:	66 90                	xchg   ax,ax
    c760:	4c 89 e8             	mov    rax,r13
    c763:	41 83 e5 01          	and    r13d,0x1
    c767:	66 0f ef c9          	pxor   xmm1,xmm1
    c76b:	48 d1 e8             	shr    rax,1
    c76e:	4c 09 e8             	or     rax,r13
    c771:	f2 48 0f 2a c8       	cvtsi2sd xmm1,rax
    c776:	f2 0f 58 c9          	addsd  xmm1,xmm1
    c77a:	e9 83 fb ff ff       	jmp    c302 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x812>
    c77f:	90                   	nop
    c780:	4c 89 e8             	mov    rax,r13
    c783:	4c 89 ea             	mov    rdx,r13
    c786:	66 0f ef c9          	pxor   xmm1,xmm1
    c78a:	48 d1 e8             	shr    rax,1
    c78d:	83 e2 01             	and    edx,0x1
    c790:	48 09 d0             	or     rax,rdx
    c793:	f2 48 0f 2a c8       	cvtsi2sd xmm1,rax
    c798:	f2 0f 58 c9          	addsd  xmm1,xmm1
    c79c:	e9 d6 fb ff ff       	jmp    c377 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x887>
    c7a1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    c7a8:	4c 89 e0             	mov    rax,r12
    c7ab:	41 83 e4 01          	and    r12d,0x1
    c7af:	66 0f ef c9          	pxor   xmm1,xmm1
    c7b3:	48 d1 e8             	shr    rax,1
    c7b6:	4c 09 e0             	or     rax,r12
    c7b9:	f2 48 0f 2a c8       	cvtsi2sd xmm1,rax
    c7be:	f2 0f 58 c9          	addsd  xmm1,xmm1
    c7c2:	e9 40 fd ff ff       	jmp    c507 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xa17>
    c7c7:	66 0f 1f 84 00 00 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    c7d0:	4c 89 e0             	mov    rax,r12
    c7d3:	41 83 e4 01          	and    r12d,0x1
    c7d7:	66 0f ef c0          	pxor   xmm0,xmm0
    c7db:	48 d1 e8             	shr    rax,1
    c7de:	4c 09 e0             	or     rax,r12
    c7e1:	f2 48 0f 2a c0       	cvtsi2sd xmm0,rax
    c7e6:	f2 0f 58 c0          	addsd  xmm0,xmm0
    c7ea:	e9 4e ff ff ff       	jmp    c73d <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xc4d>
    c7ef:	48 8b 85 60 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1a0]
    c7f6:	48 01 c2             	add    rdx,rax
    c7f9:	48 89 95 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rdx
    c800:	0f 85 37 02 00 00    	jne    ca3d <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xf4d>
    c806:	48 c7 85 88 fe ff ff 00 00 00 00 	mov    QWORD PTR [rbp-0x178],0x0
    c811:	e9 38 f8 ff ff       	jmp    c04e <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x55e>
    c816:	66 2e 0f 1f 84 00 00 00 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    c820:	66 0f ef d2          	pxor   xmm2,xmm2
    c824:	e9 a8 f9 ff ff       	jmp    c1d1 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x6e1>
    c829:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    c830:	66 0f ef c0          	pxor   xmm0,xmm0
    c834:	e9 28 f9 ff ff       	jmp    c161 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x671>
    c839:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    c83d:	64 48 2b 04 25 28 00 00 00 	sub    rax,QWORD PTR fs:0x28
    c846:	0f 85 00 02 00 00    	jne    ca4c <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xf5c>
    c84c:	e8 2f 6f ff ff       	call   3780 <std::__throw_bad_array_new_length()@plt>
    c851:	4d 85 e4             	test   r12,r12
    c854:	0f 88 26 01 00 00    	js     c980 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xe90>
    c85a:	66 0f ef c9          	pxor   xmm1,xmm1
    c85e:	f2 49 0f 2a cc       	cvtsi2sd xmm1,r12
    c863:	66 0f ef d2          	pxor   xmm2,xmm2
    c867:	f2 0f 5e ca          	divsd  xmm1,xmm2
    c86b:	66 0f 14 c1          	unpcklpd xmm0,xmm1
    c86f:	41 0f 11 47 50       	movups XMMWORD PTR [r15+0x50],xmm0
    c874:	e9 cc fc ff ff       	jmp    c545 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xa55>
    c879:	4d 85 e4             	test   r12,r12
    c87c:	0f 88 1d 01 00 00    	js     c99f <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xeaf>
    c882:	66 0f ef c9          	pxor   xmm1,xmm1
    c886:	f2 49 0f 2a cc       	cvtsi2sd xmm1,r12
    c88b:	f2 0f 5e ca          	divsd  xmm1,xmm2
    c88f:	48 8b b5 70 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x190]
    c896:	4c 89 ef             	mov    rdi,r13
    c899:	66 0f 14 c1          	unpcklpd xmm0,xmm1
    c89d:	41 0f 11 47 50       	movups XMMWORD PTR [r15+0x50],xmm0
    c8a2:	e8 69 6f ff ff       	call   3810 <operator delete(void*, unsigned long)@plt>
    c8a7:	e9 86 fc ff ff       	jmp    c532 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xa42>
    c8ac:	48 8b 85 68 fe ff ff 	mov    rax,QWORD PTR [rbp-0x198]
    c8b3:	48 c7 85 48 fe ff ff 08 00 00 00 	mov    QWORD PTR [rbp-0x1b8],0x8
    c8be:	f2 0f 10 00          	movsd  xmm0,QWORD PTR [rax]
    c8c2:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
    c8c9:	f2 0f 11 00          	movsd  QWORD PTR [rax],xmm0
    c8cd:	e9 e8 f6 ff ff       	jmp    bfba <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x4ca>
    c8d2:	48 8b 85 88 fe ff ff 	mov    rax,QWORD PTR [rbp-0x178]
    c8d9:	48 c7 85 70 fe ff ff 08 00 00 00 	mov    QWORD PTR [rbp-0x190],0x8
    c8e4:	48 c7 85 48 fe ff ff 01 00 00 00 	mov    QWORD PTR [rbp-0x1b8],0x1
    c8ef:	f2 0f 10 00          	movsd  xmm0,QWORD PTR [rax]
    c8f3:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
    c8fa:	f2 0f 11 00          	movsd  QWORD PTR [rax],xmm0
    c8fe:	e9 0f fb ff ff       	jmp    c412 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x922>
    c903:	48 8b 85 88 fe ff ff 	mov    rax,QWORD PTR [rbp-0x178]
    c90a:	f2 0f 10 00          	movsd  xmm0,QWORD PTR [rax]
    c90e:	f2 41 0f 11 45 00    	movsd  QWORD PTR [r13+0x0],xmm0
    c914:	e9 7d fb ff ff       	jmp    c496 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x9a6>
    c919:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    c91d:	64 48 2b 04 25 28 00 00 00 	sub    rax,QWORD PTR fs:0x28
    c926:	0f 85 ec 00 00 00    	jne    ca18 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xf28>
    c92c:	e8 4f 6e ff ff       	call   3780 <std::__throw_bad_array_new_length()@plt>
    c931:	0f 84 87 00 00 00    	je     c9be <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xece>
    c937:	48 83 fb 08          	cmp    rbx,0x8
    c93b:	0f 8e bc 00 00 00    	jle    c9fd <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xf0d>
    c941:	48 8b b5 80 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x180]
    c948:	48 8b bd 20 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x1e0]
    c94f:	48 89 da             	mov    rdx,rbx
    c952:	e8 49 70 ff ff       	call   39a0 <memmove@plt>
    c957:	48 8b 85 20 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1e0]
    c95e:	48 01 d8             	add    rax,rbx
    c961:	48 83 bd 40 fe ff ff 00 	cmp    QWORD PTR [rbp-0x1c0],0x0
    c969:	48 89 c3             	mov    rbx,rax
    c96c:	0f 84 47 f7 ff ff    	je     c0b9 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x5c9>
    c972:	e9 2f f7 ff ff       	jmp    c0a6 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x5b6>
    c977:	66 0f 1f 84 00 00 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    c980:	4c 89 e0             	mov    rax,r12
    c983:	41 83 e4 01          	and    r12d,0x1
    c987:	66 0f ef c9          	pxor   xmm1,xmm1
    c98b:	48 d1 e8             	shr    rax,1
    c98e:	4c 09 e0             	or     rax,r12
    c991:	f2 48 0f 2a c8       	cvtsi2sd xmm1,rax
    c996:	f2 0f 58 c9          	addsd  xmm1,xmm1
    c99a:	e9 c4 fe ff ff       	jmp    c863 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xd73>
    c99f:	4c 89 e0             	mov    rax,r12
    c9a2:	41 83 e4 01          	and    r12d,0x1
    c9a6:	66 0f ef c9          	pxor   xmm1,xmm1
    c9aa:	48 d1 e8             	shr    rax,1
    c9ad:	4c 09 e0             	or     rax,r12
    c9b0:	f2 48 0f 2a c8       	cvtsi2sd xmm1,rax
    c9b5:	f2 0f 58 c9          	addsd  xmm1,xmm1
    c9b9:	e9 cd fe ff ff       	jmp    c88b <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xd9b>
    c9be:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
    c9c5:	f2 0f 10 00          	movsd  xmm0,QWORD PTR [rax]
    c9c9:	48 8b 85 88 fe ff ff 	mov    rax,QWORD PTR [rbp-0x178]
    c9d0:	f2 0f 11 00          	movsd  QWORD PTR [rax],xmm0
    c9d4:	48 83 fb 08          	cmp    rbx,0x8
    c9d8:	0f 8f a9 f6 ff ff    	jg     c087 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x597>
    c9de:	48 8b 85 80 fe ff ff 	mov    rax,QWORD PTR [rbp-0x180]
    c9e5:	f2 0f 10 00          	movsd  xmm0,QWORD PTR [rax]
    c9e9:	48 8b 85 20 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1e0]
    c9f0:	f2 0f 11 00          	movsd  QWORD PTR [rax],xmm0
    c9f4:	48 8d 58 08          	lea    rbx,[rax+0x8]
    c9f8:	e9 a9 f6 ff ff       	jmp    c0a6 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x5b6>
    c9fd:	48 8b 85 80 fe ff ff 	mov    rax,QWORD PTR [rbp-0x180]
    ca04:	f2 0f 10 00          	movsd  xmm0,QWORD PTR [rax]
    ca08:	48 8b 85 20 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1e0]
    ca0f:	f2 0f 11 00          	movsd  QWORD PTR [rax],xmm0
    ca13:	e9 3f ff ff ff       	jmp    c957 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xe67>
    ca18:	e8 23 6e ff ff       	call   3840 <__stack_chk_fail@plt>
    ca1d:	e8 1e 6e ff ff       	call   3840 <__stack_chk_fail@plt>
    ca22:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    ca26:	64 48 2b 04 25 28 00 00 00 	sub    rax,QWORD PTR fs:0x28
    ca2f:	75 20                	jne    ca51 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0xf61>
    ca31:	48 8d 3d 3a 27 00 00 	lea    rdi,[rip+0x273a]        # f172 <_IO_stdin_used+0x172>
    ca38:	e8 a3 6c ff ff       	call   36e0 <std::__throw_length_error(char const*)@plt>
    ca3d:	48 89 c8             	mov    rax,rcx
    ca40:	48 39 ca             	cmp    rdx,rcx
    ca43:	48 0f 46 c2          	cmovbe rax,rdx
    ca47:	e9 e8 f5 ff ff       	jmp    c034 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x544>
    ca4c:	e8 ef 6d ff ff       	call   3840 <__stack_chk_fail@plt>
    ca51:	e8 ea 6d ff ff       	call   3840 <__stack_chk_fail@plt>
    ca56:	e8 45 6d ff ff       	call   37a0 <sqrt@plt>
    ca5b:	e9 50 f8 ff ff       	jmp    c2b0 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x7c0>
    ca60:	e8 3b 6d ff ff       	call   37a0 <sqrt@plt>
    ca65:	e9 ae f8 ff ff       	jmp    c318 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x828>
    ca6a:	e8 31 6d ff ff       	call   37a0 <sqrt@plt>
    ca6f:	e9 19 f9 ff ff       	jmp    c38d <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0]+0x89d>
    ca74:	f3 0f 1e fa          	endbr64
    ca78:	48 89 c3             	mov    rbx,rax
    ca7b:	e9 6e 7a ff ff       	jmp    44ee <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0] [clone .cold]>
    ca80:	f3 0f 1e fa          	endbr64
    ca84:	48 89 c3             	mov    rbx,rax
    ca87:	e9 82 7a ff ff       	jmp    450e <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0] [clone .cold]+0x20>
    ca8c:	f3 0f 1e fa          	endbr64
    ca90:	48 89 c3             	mov    rbx,rax
    ca93:	e9 82 7a ff ff       	jmp    451a <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0] [clone .cold]+0x2c>
    ca98:	f3 0f 1e fa          	endbr64
    ca9c:	48 89 c3             	mov    rbx,rax
    ca9f:	e9 a2 7a ff ff       	jmp    4546 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0] [clone .cold]+0x58>
    caa4:	f3 0f 1e fa          	endbr64
    caa8:	48 89 c3             	mov    rbx,rax
    caab:	e9 a0 7a ff ff       	jmp    4550 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0] [clone .cold]+0x62>
    cab0:	f3 0f 1e fa          	endbr64
    cab4:	48 89 c3             	mov    rbx,rax
    cab7:	e9 3a 7a ff ff       	jmp    44f6 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0] [clone .cold]+0x8>
    cabc:	f3 0f 1e fa          	endbr64
    cac0:	48 89 c3             	mov    rbx,rax
    cac3:	e9 3a 7a ff ff       	jmp    4502 <compare_profiles(std::vector<Point, std::allocator<Point> > const&, std::vector<Point, std::allocator<Point> > const&, double, double) [clone .constprop.0] [clone .cold]+0x14>
    cac8:	0f 1f 84 00 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]

