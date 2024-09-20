
riscv-spike.elf:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <boot>:
    80000000:	6f89                	lui	t6,0x2
    80000002:	800f8f9b          	addiw	t6,t6,-2048 # 1800 <_HEAP_SIZE+0x800>
    80000006:	300f9073          	csrw	mstatus,t6
    8000000a:	a009                	j	8000000c <_mstart>

000000008000000c <_mstart>:
    8000000c:	00000297          	auipc	t0,0x0
    80000010:	0cc28293          	addi	t0,t0,204 # 800000d8 <trap_entry>
    80000014:	30529073          	csrw	mtvec,t0
    80000018:	4081                	li	ra,0
    8000001a:	4101                	li	sp,0
    8000001c:	4181                	li	gp,0
    8000001e:	4201                	li	tp,0
    80000020:	4281                	li	t0,0
    80000022:	4301                	li	t1,0
    80000024:	4381                	li	t2,0
    80000026:	4401                	li	s0,0
    80000028:	4481                	li	s1,0
    8000002a:	4501                	li	a0,0
    8000002c:	4581                	li	a1,0
    8000002e:	4601                	li	a2,0
    80000030:	4681                	li	a3,0
    80000032:	4701                	li	a4,0
    80000034:	4781                	li	a5,0
    80000036:	4801                	li	a6,0
    80000038:	4881                	li	a7,0
    8000003a:	4901                	li	s2,0
    8000003c:	4981                	li	s3,0
    8000003e:	4a01                	li	s4,0
    80000040:	4a81                	li	s5,0
    80000042:	4b01                	li	s6,0
    80000044:	4b81                	li	s7,0
    80000046:	4c01                	li	s8,0
    80000048:	4c81                	li	s9,0
    8000004a:	4d01                	li	s10,0
    8000004c:	4d81                	li	s11,0
    8000004e:	4e01                	li	t3,0
    80000050:	4e81                	li	t4,0
    80000052:	4f01                	li	t5,0
    80000054:	4f81                	li	t6,0
    80000056:	00021197          	auipc	gp,0x21
    8000005a:	b7218193          	addi	gp,gp,-1166 # 80020bc8 <_gp>

000000008000005e <init_bss>:
    8000005e:	00020517          	auipc	a0,0x20
    80000062:	3a250513          	addi	a0,a0,930 # 80020400 <xStartContext>
    80000066:	0003a597          	auipc	a1,0x3a
    8000006a:	93a58593          	addi	a1,a1,-1734 # 800399a0 <uxLastPollingCycles.0>
    8000006e:	4601                	li	a2,0
    80000070:	112000ef          	jal	80000182 <fill_block>

0000000080000074 <init_sbss>:
    80000074:	00020517          	auipc	a0,0x20
    80000078:	2cc50513          	addi	a0,a0,716 # 80020340 <pxCurrentTCB>
    8000007c:	00020597          	auipc	a1,0x20
    80000080:	34458593          	addi	a1,a1,836 # 800203c0 <fromhost>
    80000084:	4601                	li	a2,0
    80000086:	0fc000ef          	jal	80000182 <fill_block>

000000008000008a <write_stack_pattern>:
    8000008a:	0003b517          	auipc	a0,0x3b
    8000008e:	91e50513          	addi	a0,a0,-1762 # 8003a9a8 <_heap_end>
    80000092:	0003c597          	auipc	a1,0x3c
    80000096:	90e58593          	addi	a1,a1,-1778 # 8003b9a0 <_heap_end+0xff8>
    8000009a:	000ac637          	lui	a2,0xac
    8000009e:	abb6061b          	addiw	a2,a2,-1349 # ababb <_HEAP_SIZE+0xaaabb>
    800000a2:	0632                	slli	a2,a2,0xc
    800000a4:	bab60613          	addi	a2,a2,-1109
    800000a8:	0da000ef          	jal	80000182 <fill_block>

00000000800000ac <init_stack>:
    800000ac:	0003c117          	auipc	sp,0x3c
    800000b0:	8fc10113          	addi	sp,sp,-1796 # 8003b9a8 <__stack>
    800000b4:	6f00406f          	j	800047a4 <vSyscallInit>

00000000800000b8 <interrupt>:
    800000b8:	0286                	slli	t0,t0,0x1
    800000ba:	0012d293          	srli	t0,t0,0x1
    800000be:	12f5                	addi	t0,t0,-3
    800000c0:	00028863          	beqz	t0,800000d0 <softwareInterrupt>
    800000c4:	6282                	ld	t0,0(sp)
    800000c6:	0121                	addi	sp,sp,8
    800000c8:	0c60006f          	j	8000018e <TIMER_CMP_INT>
    800000cc:	30200073          	mret

00000000800000d0 <softwareInterrupt>:
    800000d0:	6282                	ld	t0,0(sp)
    800000d2:	0121                	addi	sp,sp,8
    800000d4:	30200073          	mret

00000000800000d8 <trap_entry>:
    800000d8:	1161                	addi	sp,sp,-8
    800000da:	e016                	sd	t0,0(sp)
    800000dc:	342022f3          	csrr	t0,mcause
    800000e0:	fc02cce3          	bltz	t0,800000b8 <interrupt>
    800000e4:	6282                	ld	t0,0(sp)
    800000e6:	0121                	addi	sp,sp,8
    800000e8:	f0810113          	addi	sp,sp,-248
    800000ec:	e406                	sd	ra,8(sp)
    800000ee:	e80a                	sd	sp,16(sp)
    800000f0:	ec0e                	sd	gp,24(sp)
    800000f2:	f012                	sd	tp,32(sp)
    800000f4:	f416                	sd	t0,40(sp)
    800000f6:	f81a                	sd	t1,48(sp)
    800000f8:	fc1e                	sd	t2,56(sp)
    800000fa:	e0a2                	sd	s0,64(sp)
    800000fc:	e4a6                	sd	s1,72(sp)
    800000fe:	e8aa                	sd	a0,80(sp)
    80000100:	ecae                	sd	a1,88(sp)
    80000102:	f0b2                	sd	a2,96(sp)
    80000104:	f4b6                	sd	a3,104(sp)
    80000106:	f8ba                	sd	a4,112(sp)
    80000108:	fcbe                	sd	a5,120(sp)
    8000010a:	e142                	sd	a6,128(sp)
    8000010c:	e546                	sd	a7,136(sp)
    8000010e:	e94a                	sd	s2,144(sp)
    80000110:	ed4e                	sd	s3,152(sp)
    80000112:	f152                	sd	s4,160(sp)
    80000114:	f556                	sd	s5,168(sp)
    80000116:	f95a                	sd	s6,176(sp)
    80000118:	fd5e                	sd	s7,184(sp)
    8000011a:	e1e2                	sd	s8,192(sp)
    8000011c:	e5e6                	sd	s9,200(sp)
    8000011e:	e9ea                	sd	s10,208(sp)
    80000120:	edee                	sd	s11,216(sp)
    80000122:	f1f2                	sd	t3,224(sp)
    80000124:	f5f6                	sd	t4,232(sp)
    80000126:	f9fa                	sd	t5,240(sp)
    80000128:	fdfe                	sd	t6,248(sp)
    8000012a:	34202573          	csrr	a0,mcause
    8000012e:	341025f3          	csrr	a1,mepc
    80000132:	860a                	mv	a2,sp
    80000134:	690040ef          	jal	800047c4 <ulSyscallTrap>
    80000138:	34151073          	csrw	mepc,a0
    8000013c:	60a2                	ld	ra,8(sp)
    8000013e:	6142                	ld	sp,16(sp)
    80000140:	61e2                	ld	gp,24(sp)
    80000142:	7202                	ld	tp,32(sp)
    80000144:	72a2                	ld	t0,40(sp)
    80000146:	7342                	ld	t1,48(sp)
    80000148:	73e2                	ld	t2,56(sp)
    8000014a:	6406                	ld	s0,64(sp)
    8000014c:	64a6                	ld	s1,72(sp)
    8000014e:	6546                	ld	a0,80(sp)
    80000150:	65e6                	ld	a1,88(sp)
    80000152:	7606                	ld	a2,96(sp)
    80000154:	76a6                	ld	a3,104(sp)
    80000156:	7746                	ld	a4,112(sp)
    80000158:	77e6                	ld	a5,120(sp)
    8000015a:	680a                	ld	a6,128(sp)
    8000015c:	68aa                	ld	a7,136(sp)
    8000015e:	694a                	ld	s2,144(sp)
    80000160:	69ea                	ld	s3,152(sp)
    80000162:	7a0a                	ld	s4,160(sp)
    80000164:	7aaa                	ld	s5,168(sp)
    80000166:	7b4a                	ld	s6,176(sp)
    80000168:	7bea                	ld	s7,184(sp)
    8000016a:	6c0e                	ld	s8,192(sp)
    8000016c:	6cae                	ld	s9,200(sp)
    8000016e:	6d4e                	ld	s10,208(sp)
    80000170:	6dee                	ld	s11,216(sp)
    80000172:	7e0e                	ld	t3,224(sp)
    80000174:	7eae                	ld	t4,232(sp)
    80000176:	7f4e                	ld	t5,240(sp)
    80000178:	7fee                	ld	t6,248(sp)
    8000017a:	0f810113          	addi	sp,sp,248
    8000017e:	30200073          	mret

0000000080000182 <fill_block>:
    80000182:	c110                	sw	a2,0(a0)
    80000184:	00b57463          	bgeu	a0,a1,8000018c <fb_end>
    80000188:	0511                	addi	a0,a0,4
    8000018a:	bfe5                	j	80000182 <fill_block>

000000008000018c <fb_end>:
    8000018c:	8082                	ret

000000008000018e <TIMER_CMP_INT>:
    8000018e:	7111                	addi	sp,sp,-256
    80000190:	e006                	sd	ra,0(sp)
    80000192:	e40a                	sd	sp,8(sp)
    80000194:	e80e                	sd	gp,16(sp)
    80000196:	ec12                	sd	tp,24(sp)
    80000198:	f016                	sd	t0,32(sp)
    8000019a:	f41a                	sd	t1,40(sp)
    8000019c:	f81e                	sd	t2,48(sp)
    8000019e:	fc22                	sd	s0,56(sp)
    800001a0:	e0a6                	sd	s1,64(sp)
    800001a2:	e4aa                	sd	a0,72(sp)
    800001a4:	e8ae                	sd	a1,80(sp)
    800001a6:	ecb2                	sd	a2,88(sp)
    800001a8:	f0b6                	sd	a3,96(sp)
    800001aa:	f4ba                	sd	a4,104(sp)
    800001ac:	f8be                	sd	a5,112(sp)
    800001ae:	fcc2                	sd	a6,120(sp)
    800001b0:	e146                	sd	a7,128(sp)
    800001b2:	e54a                	sd	s2,136(sp)
    800001b4:	e94e                	sd	s3,144(sp)
    800001b6:	ed52                	sd	s4,152(sp)
    800001b8:	f156                	sd	s5,160(sp)
    800001ba:	f55a                	sd	s6,168(sp)
    800001bc:	f95e                	sd	s7,176(sp)
    800001be:	fd62                	sd	s8,184(sp)
    800001c0:	e1e6                	sd	s9,192(sp)
    800001c2:	e5ea                	sd	s10,200(sp)
    800001c4:	e9ee                	sd	s11,208(sp)
    800001c6:	edf2                	sd	t3,216(sp)
    800001c8:	f1f6                	sd	t4,224(sp)
    800001ca:	f5fa                	sd	t5,232(sp)
    800001cc:	f9fe                	sd	t6,240(sp)
    800001ce:	00020297          	auipc	t0,0x20
    800001d2:	1722b283          	ld	t0,370(t0) # 80020340 <pxCurrentTCB>
    800001d6:	0022b023          	sd	sp,0(t0)
    800001da:	341022f3          	csrr	t0,mepc
    800001de:	fd96                	sd	t0,248(sp)
    800001e0:	358000ef          	jal	80000538 <vPortSysTickHandler>
    800001e4:	00020117          	auipc	sp,0x20
    800001e8:	15c13103          	ld	sp,348(sp) # 80020340 <pxCurrentTCB>
    800001ec:	6102                	ld	sp,0(sp)
    800001ee:	72ee                	ld	t0,248(sp)
    800001f0:	34129073          	csrw	mepc,t0
    800001f4:	6289                	lui	t0,0x2
    800001f6:	8802829b          	addiw	t0,t0,-1920 # 1880 <_HEAP_SIZE+0x880>
    800001fa:	3002a073          	csrs	mstatus,t0
    800001fe:	6082                	ld	ra,0(sp)
    80000200:	6262                	ld	tp,24(sp)
    80000202:	7282                	ld	t0,32(sp)
    80000204:	7322                	ld	t1,40(sp)
    80000206:	73c2                	ld	t2,48(sp)
    80000208:	7462                	ld	s0,56(sp)
    8000020a:	6486                	ld	s1,64(sp)
    8000020c:	6526                	ld	a0,72(sp)
    8000020e:	65c6                	ld	a1,80(sp)
    80000210:	6666                	ld	a2,88(sp)
    80000212:	7686                	ld	a3,96(sp)
    80000214:	7726                	ld	a4,104(sp)
    80000216:	77c6                	ld	a5,112(sp)
    80000218:	7866                	ld	a6,120(sp)
    8000021a:	688a                	ld	a7,128(sp)
    8000021c:	692a                	ld	s2,136(sp)
    8000021e:	69ca                	ld	s3,144(sp)
    80000220:	6a6a                	ld	s4,152(sp)
    80000222:	7a8a                	ld	s5,160(sp)
    80000224:	7b2a                	ld	s6,168(sp)
    80000226:	7bca                	ld	s7,176(sp)
    80000228:	7c6a                	ld	s8,184(sp)
    8000022a:	6c8e                	ld	s9,192(sp)
    8000022c:	6d2e                	ld	s10,200(sp)
    8000022e:	6dce                	ld	s11,208(sp)
    80000230:	6e6e                	ld	t3,216(sp)
    80000232:	7e8e                	ld	t4,224(sp)
    80000234:	7f2e                	ld	t5,232(sp)
    80000236:	7fce                	ld	t6,240(sp)
    80000238:	6111                	addi	sp,sp,256
    8000023a:	30200073          	mret

000000008000023e <xPortStartScheduler>:
    8000023e:	00020297          	auipc	t0,0x20
    80000242:	1c228293          	addi	t0,t0,450 # 80020400 <xStartContext>
    80000246:	0012b023          	sd	ra,0(t0)
    8000024a:	0022b423          	sd	sp,8(t0)
    8000024e:	0032b823          	sd	gp,16(t0)
    80000252:	0042bc23          	sd	tp,24(t0)
    80000256:	0252b023          	sd	t0,32(t0)
    8000025a:	0262b423          	sd	t1,40(t0)
    8000025e:	0272b823          	sd	t2,48(t0)
    80000262:	0282bc23          	sd	s0,56(t0)
    80000266:	0492b023          	sd	s1,64(t0)
    8000026a:	04a2b423          	sd	a0,72(t0)
    8000026e:	04b2b823          	sd	a1,80(t0)
    80000272:	04c2bc23          	sd	a2,88(t0)
    80000276:	06d2b023          	sd	a3,96(t0)
    8000027a:	06e2b423          	sd	a4,104(t0)
    8000027e:	06f2b823          	sd	a5,112(t0)
    80000282:	0702bc23          	sd	a6,120(t0)
    80000286:	0912b023          	sd	a7,128(t0)
    8000028a:	0922b423          	sd	s2,136(t0)
    8000028e:	0932b823          	sd	s3,144(t0)
    80000292:	0942bc23          	sd	s4,152(t0)
    80000296:	0b52b023          	sd	s5,160(t0)
    8000029a:	0b62b423          	sd	s6,168(t0)
    8000029e:	0b72b823          	sd	s7,176(t0)
    800002a2:	0b82bc23          	sd	s8,184(t0)
    800002a6:	0d92b023          	sd	s9,192(t0)
    800002aa:	0da2b423          	sd	s10,200(t0)
    800002ae:	0db2b823          	sd	s11,208(t0)
    800002b2:	0dc2bc23          	sd	t3,216(t0)
    800002b6:	0fd2b023          	sd	t4,224(t0)
    800002ba:	0fe2b423          	sd	t5,232(t0)
    800002be:	0ff2b823          	sd	t6,240(t0)
    800002c2:	1cc000ef          	jal	8000048e <vPortSetupTimer>
    800002c6:	00020117          	auipc	sp,0x20
    800002ca:	07a13103          	ld	sp,122(sp) # 80020340 <pxCurrentTCB>
    800002ce:	6102                	ld	sp,0(sp)
    800002d0:	72ee                	ld	t0,248(sp)
    800002d2:	34129073          	csrw	mepc,t0
    800002d6:	6289                	lui	t0,0x2
    800002d8:	8802829b          	addiw	t0,t0,-1920 # 1880 <_HEAP_SIZE+0x880>
    800002dc:	3002a073          	csrs	mstatus,t0
    800002e0:	6082                	ld	ra,0(sp)
    800002e2:	6262                	ld	tp,24(sp)
    800002e4:	7282                	ld	t0,32(sp)
    800002e6:	7322                	ld	t1,40(sp)
    800002e8:	73c2                	ld	t2,48(sp)
    800002ea:	7462                	ld	s0,56(sp)
    800002ec:	6486                	ld	s1,64(sp)
    800002ee:	6526                	ld	a0,72(sp)
    800002f0:	65c6                	ld	a1,80(sp)
    800002f2:	6666                	ld	a2,88(sp)
    800002f4:	7686                	ld	a3,96(sp)
    800002f6:	7726                	ld	a4,104(sp)
    800002f8:	77c6                	ld	a5,112(sp)
    800002fa:	7866                	ld	a6,120(sp)
    800002fc:	688a                	ld	a7,128(sp)
    800002fe:	692a                	ld	s2,136(sp)
    80000300:	69ca                	ld	s3,144(sp)
    80000302:	6a6a                	ld	s4,152(sp)
    80000304:	7a8a                	ld	s5,160(sp)
    80000306:	7b2a                	ld	s6,168(sp)
    80000308:	7bca                	ld	s7,176(sp)
    8000030a:	7c6a                	ld	s8,184(sp)
    8000030c:	6c8e                	ld	s9,192(sp)
    8000030e:	6d2e                	ld	s10,200(sp)
    80000310:	6dce                	ld	s11,208(sp)
    80000312:	6e6e                	ld	t3,216(sp)
    80000314:	7e8e                	ld	t4,224(sp)
    80000316:	7f2e                	ld	t5,232(sp)
    80000318:	7fce                	ld	t6,240(sp)
    8000031a:	6111                	addi	sp,sp,256
    8000031c:	30200073          	mret

0000000080000320 <vPortEndScheduler>:
    80000320:	00020297          	auipc	t0,0x20
    80000324:	0e028293          	addi	t0,t0,224 # 80020400 <xStartContext>
    80000328:	0002b083          	ld	ra,0(t0)
    8000032c:	0082b103          	ld	sp,8(t0)
    80000330:	0102b183          	ld	gp,16(t0)
    80000334:	0182b203          	ld	tp,24(t0)
    80000338:	0202b283          	ld	t0,32(t0)
    8000033c:	0282b303          	ld	t1,40(t0)
    80000340:	0302b383          	ld	t2,48(t0)
    80000344:	0382b403          	ld	s0,56(t0)
    80000348:	0402b483          	ld	s1,64(t0)
    8000034c:	0482b503          	ld	a0,72(t0)
    80000350:	0502b583          	ld	a1,80(t0)
    80000354:	0582b603          	ld	a2,88(t0)
    80000358:	0602b683          	ld	a3,96(t0)
    8000035c:	0682b703          	ld	a4,104(t0)
    80000360:	0702b783          	ld	a5,112(t0)
    80000364:	0782b803          	ld	a6,120(t0)
    80000368:	0802b883          	ld	a7,128(t0)
    8000036c:	0882b903          	ld	s2,136(t0)
    80000370:	0902b983          	ld	s3,144(t0)
    80000374:	0982ba03          	ld	s4,152(t0)
    80000378:	0a02ba83          	ld	s5,160(t0)
    8000037c:	0a82bb03          	ld	s6,168(t0)
    80000380:	0b02bb83          	ld	s7,176(t0)
    80000384:	0b82bc03          	ld	s8,184(t0)
    80000388:	0c02bc83          	ld	s9,192(t0)
    8000038c:	0c82bd03          	ld	s10,200(t0)
    80000390:	0d02bd83          	ld	s11,208(t0)
    80000394:	0d82be03          	ld	t3,216(t0)
    80000398:	0e02be83          	ld	t4,224(t0)
    8000039c:	1382bf03          	ld	t5,312(t0)
    800003a0:	0f02bf83          	ld	t6,240(t0)
    800003a4:	8082                	ret

00000000800003a6 <vPortYield>:
    800003a6:	30047073          	csrci	mstatus,8
    800003aa:	7111                	addi	sp,sp,-256
    800003ac:	e006                	sd	ra,0(sp)
    800003ae:	e40a                	sd	sp,8(sp)
    800003b0:	e80e                	sd	gp,16(sp)
    800003b2:	ec12                	sd	tp,24(sp)
    800003b4:	f016                	sd	t0,32(sp)
    800003b6:	f41a                	sd	t1,40(sp)
    800003b8:	f81e                	sd	t2,48(sp)
    800003ba:	fc22                	sd	s0,56(sp)
    800003bc:	e0a6                	sd	s1,64(sp)
    800003be:	e4aa                	sd	a0,72(sp)
    800003c0:	e8ae                	sd	a1,80(sp)
    800003c2:	ecb2                	sd	a2,88(sp)
    800003c4:	f0b6                	sd	a3,96(sp)
    800003c6:	f4ba                	sd	a4,104(sp)
    800003c8:	f8be                	sd	a5,112(sp)
    800003ca:	fcc2                	sd	a6,120(sp)
    800003cc:	e146                	sd	a7,128(sp)
    800003ce:	e54a                	sd	s2,136(sp)
    800003d0:	e94e                	sd	s3,144(sp)
    800003d2:	ed52                	sd	s4,152(sp)
    800003d4:	f156                	sd	s5,160(sp)
    800003d6:	f55a                	sd	s6,168(sp)
    800003d8:	f95e                	sd	s7,176(sp)
    800003da:	fd62                	sd	s8,184(sp)
    800003dc:	e1e6                	sd	s9,192(sp)
    800003de:	e5ea                	sd	s10,200(sp)
    800003e0:	e9ee                	sd	s11,208(sp)
    800003e2:	edf2                	sd	t3,216(sp)
    800003e4:	f1f6                	sd	t4,224(sp)
    800003e6:	f5fa                	sd	t5,232(sp)
    800003e8:	f9fe                	sd	t6,240(sp)
    800003ea:	00020297          	auipc	t0,0x20
    800003ee:	f562b283          	ld	t0,-170(t0) # 80020340 <pxCurrentTCB>
    800003f2:	0022b023          	sd	sp,0(t0)
    800003f6:	fd86                	sd	ra,248(sp)
    800003f8:	599010ef          	jal	80002190 <vTaskSwitchContext>
    800003fc:	00020117          	auipc	sp,0x20
    80000400:	f4413103          	ld	sp,-188(sp) # 80020340 <pxCurrentTCB>
    80000404:	6102                	ld	sp,0(sp)
    80000406:	72ee                	ld	t0,248(sp)
    80000408:	34129073          	csrw	mepc,t0
    8000040c:	6289                	lui	t0,0x2
    8000040e:	8802829b          	addiw	t0,t0,-1920 # 1880 <_HEAP_SIZE+0x880>
    80000412:	3002a073          	csrs	mstatus,t0
    80000416:	6082                	ld	ra,0(sp)
    80000418:	6262                	ld	tp,24(sp)
    8000041a:	7282                	ld	t0,32(sp)
    8000041c:	7322                	ld	t1,40(sp)
    8000041e:	73c2                	ld	t2,48(sp)
    80000420:	7462                	ld	s0,56(sp)
    80000422:	6486                	ld	s1,64(sp)
    80000424:	6526                	ld	a0,72(sp)
    80000426:	65c6                	ld	a1,80(sp)
    80000428:	6666                	ld	a2,88(sp)
    8000042a:	7686                	ld	a3,96(sp)
    8000042c:	7726                	ld	a4,104(sp)
    8000042e:	77c6                	ld	a5,112(sp)
    80000430:	7866                	ld	a6,120(sp)
    80000432:	688a                	ld	a7,128(sp)
    80000434:	692a                	ld	s2,136(sp)
    80000436:	69ca                	ld	s3,144(sp)
    80000438:	6a6a                	ld	s4,152(sp)
    8000043a:	7a8a                	ld	s5,160(sp)
    8000043c:	7b2a                	ld	s6,168(sp)
    8000043e:	7bca                	ld	s7,176(sp)
    80000440:	7c6a                	ld	s8,184(sp)
    80000442:	6c8e                	ld	s9,192(sp)
    80000444:	6d2e                	ld	s10,200(sp)
    80000446:	6dce                	ld	s11,208(sp)
    80000448:	6e6e                	ld	t3,216(sp)
    8000044a:	7e8e                	ld	t4,224(sp)
    8000044c:	7f2e                	ld	t5,232(sp)
    8000044e:	7fce                	ld	t6,240(sp)
    80000450:	6111                	addi	sp,sp,256
    80000452:	30200073          	mret

0000000080000456 <prvSetNextTimerInterrupt>:
    80000456:	00020797          	auipc	a5,0x20
    8000045a:	f8278793          	addi	a5,a5,-126 # 800203d8 <mtime>
    8000045e:	639c                	ld	a5,0(a5)
    80000460:	c78d                	beqz	a5,8000048a <prvSetNextTimerInterrupt+0x34>
    80000462:	00020797          	auipc	a5,0x20
    80000466:	f7e78793          	addi	a5,a5,-130 # 800203e0 <timecmp>
    8000046a:	639c                	ld	a5,0(a5)
    8000046c:	cf99                	beqz	a5,8000048a <prvSetNextTimerInterrupt+0x34>
    8000046e:	00020797          	auipc	a5,0x20
    80000472:	f6a78793          	addi	a5,a5,-150 # 800203d8 <mtime>
    80000476:	639c                	ld	a5,0(a5)
    80000478:	6398                	ld	a4,0(a5)
    8000047a:	00020797          	auipc	a5,0x20
    8000047e:	f6678793          	addi	a5,a5,-154 # 800203e0 <timecmp>
    80000482:	639c                	ld	a5,0(a5)
    80000484:	3e870713          	addi	a4,a4,1000
    80000488:	e398                	sd	a4,0(a5)
    8000048a:	0001                	nop
    8000048c:	8082                	ret

000000008000048e <vPortSetupTimer>:
    8000048e:	1141                	addi	sp,sp,-16
    80000490:	e406                	sd	ra,8(sp)
    80000492:	fc5ff0ef          	jal	80000456 <prvSetNextTimerInterrupt>
    80000496:	08000793          	li	a5,128
    8000049a:	3047a073          	csrs	mie,a5
    8000049e:	0001                	nop
    800004a0:	60a2                	ld	ra,8(sp)
    800004a2:	0141                	addi	sp,sp,16
    800004a4:	8082                	ret

00000000800004a6 <prvTaskExitError>:
    800004a6:	00020797          	auipc	a5,0x20
    800004aa:	f2a78793          	addi	a5,a5,-214 # 800203d0 <uxCriticalNesting>
    800004ae:	6398                	ld	a4,0(a5)
    800004b0:	57fd                	li	a5,-1
    800004b2:	00f70663          	beq	a4,a5,800004be <prvTaskExitError+0x18>
    800004b6:	30047073          	csrci	mstatus,8
    800004ba:	0001                	nop
    800004bc:	bffd                	j	800004ba <prvTaskExitError+0x14>
    800004be:	30047073          	csrci	mstatus,8
    800004c2:	0001                	nop
    800004c4:	bffd                	j	800004c2 <prvTaskExitError+0x1c>

00000000800004c6 <vPortClearInterruptMask>:
    800004c6:	1141                	addi	sp,sp,-16
    800004c8:	87aa                	mv	a5,a0
    800004ca:	c63e                	sw	a5,12(sp)
    800004cc:	47b2                	lw	a5,12(sp)
    800004ce:	30479073          	csrw	mie,a5
    800004d2:	0001                	nop
    800004d4:	0141                	addi	sp,sp,16
    800004d6:	8082                	ret

00000000800004d8 <vPortSetInterruptMask>:
    800004d8:	1141                	addi	sp,sp,-16
    800004da:	304027f3          	csrr	a5,mie
    800004de:	c63e                	sw	a5,12(sp)
    800004e0:	3043f073          	csrci	mie,7
    800004e4:	47b2                	lw	a5,12(sp)
    800004e6:	853e                	mv	a0,a5
    800004e8:	0141                	addi	sp,sp,16
    800004ea:	8082                	ret

00000000800004ec <pxPortInitialiseStack>:
    800004ec:	1101                	addi	sp,sp,-32
    800004ee:	ec2a                	sd	a0,24(sp)
    800004f0:	e82e                	sd	a1,16(sp)
    800004f2:	e432                	sd	a2,8(sp)
    800004f4:	67e2                	ld	a5,24(sp)
    800004f6:	17e1                	addi	a5,a5,-8
    800004f8:	ec3e                	sd	a5,24(sp)
    800004fa:	6742                	ld	a4,16(sp)
    800004fc:	67e2                	ld	a5,24(sp)
    800004fe:	e398                	sd	a4,0(a5)
    80000500:	67e2                	ld	a5,24(sp)
    80000502:	f5078793          	addi	a5,a5,-176
    80000506:	ec3e                	sd	a5,24(sp)
    80000508:	6722                	ld	a4,8(sp)
    8000050a:	67e2                	ld	a5,24(sp)
    8000050c:	e398                	sd	a4,0(a5)
    8000050e:	67e2                	ld	a5,24(sp)
    80000510:	fd078793          	addi	a5,a5,-48
    80000514:	ec3e                	sd	a5,24(sp)
    80000516:	878e                	mv	a5,gp
    80000518:	873e                	mv	a4,a5
    8000051a:	67e2                	ld	a5,24(sp)
    8000051c:	e398                	sd	a4,0(a5)
    8000051e:	67e2                	ld	a5,24(sp)
    80000520:	17a1                	addi	a5,a5,-24
    80000522:	ec3e                	sd	a5,24(sp)
    80000524:	00000717          	auipc	a4,0x0
    80000528:	f8270713          	addi	a4,a4,-126 # 800004a6 <prvTaskExitError>
    8000052c:	67e2                	ld	a5,24(sp)
    8000052e:	e398                	sd	a4,0(a5)
    80000530:	67e2                	ld	a5,24(sp)
    80000532:	853e                	mv	a0,a5
    80000534:	6105                	addi	sp,sp,32
    80000536:	8082                	ret

0000000080000538 <vPortSysTickHandler>:
    80000538:	1141                	addi	sp,sp,-16
    8000053a:	e406                	sd	ra,8(sp)
    8000053c:	f1bff0ef          	jal	80000456 <prvSetNextTimerInterrupt>
    80000540:	26f010ef          	jal	80001fae <xTaskIncrementTick>
    80000544:	87aa                	mv	a5,a0
    80000546:	c399                	beqz	a5,8000054c <vPortSysTickHandler+0x14>
    80000548:	449010ef          	jal	80002190 <vTaskSwitchContext>
    8000054c:	0001                	nop
    8000054e:	60a2                	ld	ra,8(sp)
    80000550:	0141                	addi	sp,sp,16
    80000552:	8082                	ret

0000000080000554 <vListInitialise>:
    80000554:	1141                	addi	sp,sp,-16
    80000556:	e42a                	sd	a0,8(sp)
    80000558:	67a2                	ld	a5,8(sp)
    8000055a:	01078713          	addi	a4,a5,16
    8000055e:	67a2                	ld	a5,8(sp)
    80000560:	e798                	sd	a4,8(a5)
    80000562:	67a2                	ld	a5,8(sp)
    80000564:	577d                	li	a4,-1
    80000566:	cb98                	sw	a4,16(a5)
    80000568:	67a2                	ld	a5,8(sp)
    8000056a:	01078713          	addi	a4,a5,16
    8000056e:	67a2                	ld	a5,8(sp)
    80000570:	ef98                	sd	a4,24(a5)
    80000572:	67a2                	ld	a5,8(sp)
    80000574:	01078713          	addi	a4,a5,16
    80000578:	67a2                	ld	a5,8(sp)
    8000057a:	f398                	sd	a4,32(a5)
    8000057c:	67a2                	ld	a5,8(sp)
    8000057e:	0007b023          	sd	zero,0(a5)
    80000582:	0001                	nop
    80000584:	0141                	addi	sp,sp,16
    80000586:	8082                	ret

0000000080000588 <vListInitialiseItem>:
    80000588:	1141                	addi	sp,sp,-16
    8000058a:	e42a                	sd	a0,8(sp)
    8000058c:	67a2                	ld	a5,8(sp)
    8000058e:	0207b023          	sd	zero,32(a5)
    80000592:	0001                	nop
    80000594:	0141                	addi	sp,sp,16
    80000596:	8082                	ret

0000000080000598 <vListInsertEnd>:
    80000598:	1101                	addi	sp,sp,-32
    8000059a:	e42a                	sd	a0,8(sp)
    8000059c:	e02e                	sd	a1,0(sp)
    8000059e:	67a2                	ld	a5,8(sp)
    800005a0:	679c                	ld	a5,8(a5)
    800005a2:	ec3e                	sd	a5,24(sp)
    800005a4:	6782                	ld	a5,0(sp)
    800005a6:	6762                	ld	a4,24(sp)
    800005a8:	e798                	sd	a4,8(a5)
    800005aa:	67e2                	ld	a5,24(sp)
    800005ac:	6b98                	ld	a4,16(a5)
    800005ae:	6782                	ld	a5,0(sp)
    800005b0:	eb98                	sd	a4,16(a5)
    800005b2:	67e2                	ld	a5,24(sp)
    800005b4:	6b9c                	ld	a5,16(a5)
    800005b6:	6702                	ld	a4,0(sp)
    800005b8:	e798                	sd	a4,8(a5)
    800005ba:	67e2                	ld	a5,24(sp)
    800005bc:	6702                	ld	a4,0(sp)
    800005be:	eb98                	sd	a4,16(a5)
    800005c0:	6782                	ld	a5,0(sp)
    800005c2:	6722                	ld	a4,8(sp)
    800005c4:	f398                	sd	a4,32(a5)
    800005c6:	67a2                	ld	a5,8(sp)
    800005c8:	639c                	ld	a5,0(a5)
    800005ca:	00178713          	addi	a4,a5,1
    800005ce:	67a2                	ld	a5,8(sp)
    800005d0:	e398                	sd	a4,0(a5)
    800005d2:	0001                	nop
    800005d4:	6105                	addi	sp,sp,32
    800005d6:	8082                	ret

00000000800005d8 <vListInsert>:
    800005d8:	1101                	addi	sp,sp,-32
    800005da:	e42a                	sd	a0,8(sp)
    800005dc:	e02e                	sd	a1,0(sp)
    800005de:	6782                	ld	a5,0(sp)
    800005e0:	439c                	lw	a5,0(a5)
    800005e2:	ca3e                	sw	a5,20(sp)
    800005e4:	47d2                	lw	a5,20(sp)
    800005e6:	0007871b          	sext.w	a4,a5
    800005ea:	57fd                	li	a5,-1
    800005ec:	00f71663          	bne	a4,a5,800005f8 <vListInsert+0x20>
    800005f0:	67a2                	ld	a5,8(sp)
    800005f2:	739c                	ld	a5,32(a5)
    800005f4:	ec3e                	sd	a5,24(sp)
    800005f6:	a839                	j	80000614 <vListInsert+0x3c>
    800005f8:	67a2                	ld	a5,8(sp)
    800005fa:	07c1                	addi	a5,a5,16
    800005fc:	ec3e                	sd	a5,24(sp)
    800005fe:	a021                	j	80000606 <vListInsert+0x2e>
    80000600:	67e2                	ld	a5,24(sp)
    80000602:	679c                	ld	a5,8(a5)
    80000604:	ec3e                	sd	a5,24(sp)
    80000606:	67e2                	ld	a5,24(sp)
    80000608:	679c                	ld	a5,8(a5)
    8000060a:	4398                	lw	a4,0(a5)
    8000060c:	47d2                	lw	a5,20(sp)
    8000060e:	2781                	sext.w	a5,a5
    80000610:	fee7f8e3          	bgeu	a5,a4,80000600 <vListInsert+0x28>
    80000614:	67e2                	ld	a5,24(sp)
    80000616:	6798                	ld	a4,8(a5)
    80000618:	6782                	ld	a5,0(sp)
    8000061a:	e798                	sd	a4,8(a5)
    8000061c:	6782                	ld	a5,0(sp)
    8000061e:	679c                	ld	a5,8(a5)
    80000620:	6702                	ld	a4,0(sp)
    80000622:	eb98                	sd	a4,16(a5)
    80000624:	6782                	ld	a5,0(sp)
    80000626:	6762                	ld	a4,24(sp)
    80000628:	eb98                	sd	a4,16(a5)
    8000062a:	67e2                	ld	a5,24(sp)
    8000062c:	6702                	ld	a4,0(sp)
    8000062e:	e798                	sd	a4,8(a5)
    80000630:	6782                	ld	a5,0(sp)
    80000632:	6722                	ld	a4,8(sp)
    80000634:	f398                	sd	a4,32(a5)
    80000636:	67a2                	ld	a5,8(sp)
    80000638:	639c                	ld	a5,0(a5)
    8000063a:	00178713          	addi	a4,a5,1
    8000063e:	67a2                	ld	a5,8(sp)
    80000640:	e398                	sd	a4,0(a5)
    80000642:	0001                	nop
    80000644:	6105                	addi	sp,sp,32
    80000646:	8082                	ret

0000000080000648 <uxListRemove>:
    80000648:	1101                	addi	sp,sp,-32
    8000064a:	e42a                	sd	a0,8(sp)
    8000064c:	67a2                	ld	a5,8(sp)
    8000064e:	739c                	ld	a5,32(a5)
    80000650:	ec3e                	sd	a5,24(sp)
    80000652:	67a2                	ld	a5,8(sp)
    80000654:	679c                	ld	a5,8(a5)
    80000656:	6722                	ld	a4,8(sp)
    80000658:	6b18                	ld	a4,16(a4)
    8000065a:	eb98                	sd	a4,16(a5)
    8000065c:	67a2                	ld	a5,8(sp)
    8000065e:	6b9c                	ld	a5,16(a5)
    80000660:	6722                	ld	a4,8(sp)
    80000662:	6718                	ld	a4,8(a4)
    80000664:	e798                	sd	a4,8(a5)
    80000666:	67e2                	ld	a5,24(sp)
    80000668:	679c                	ld	a5,8(a5)
    8000066a:	6722                	ld	a4,8(sp)
    8000066c:	00f71663          	bne	a4,a5,80000678 <uxListRemove+0x30>
    80000670:	67a2                	ld	a5,8(sp)
    80000672:	6b98                	ld	a4,16(a5)
    80000674:	67e2                	ld	a5,24(sp)
    80000676:	e798                	sd	a4,8(a5)
    80000678:	67a2                	ld	a5,8(sp)
    8000067a:	0207b023          	sd	zero,32(a5)
    8000067e:	67e2                	ld	a5,24(sp)
    80000680:	639c                	ld	a5,0(a5)
    80000682:	fff78713          	addi	a4,a5,-1
    80000686:	67e2                	ld	a5,24(sp)
    80000688:	e398                	sd	a4,0(a5)
    8000068a:	67e2                	ld	a5,24(sp)
    8000068c:	639c                	ld	a5,0(a5)
    8000068e:	853e                	mv	a0,a5
    80000690:	6105                	addi	sp,sp,32
    80000692:	8082                	ret

0000000080000694 <xQueueGenericReset>:
    80000694:	7179                	addi	sp,sp,-48
    80000696:	f406                	sd	ra,40(sp)
    80000698:	e42a                	sd	a0,8(sp)
    8000069a:	e02e                	sd	a1,0(sp)
    8000069c:	67a2                	ld	a5,8(sp)
    8000069e:	ec3e                	sd	a5,24(sp)
    800006a0:	67e2                	ld	a5,24(sp)
    800006a2:	e789                	bnez	a5,800006ac <xQueueGenericReset+0x18>
    800006a4:	30047073          	csrci	mstatus,8
    800006a8:	0001                	nop
    800006aa:	bffd                	j	800006a8 <xQueueGenericReset+0x14>
    800006ac:	7a0020ef          	jal	80002e4c <vTaskEnterCritical>
    800006b0:	67e2                	ld	a5,24(sp)
    800006b2:	6398                	ld	a4,0(a5)
    800006b4:	67e2                	ld	a5,24(sp)
    800006b6:	7fb4                	ld	a3,120(a5)
    800006b8:	67e2                	ld	a5,24(sp)
    800006ba:	63dc                	ld	a5,128(a5)
    800006bc:	02f687b3          	mul	a5,a3,a5
    800006c0:	973e                	add	a4,a4,a5
    800006c2:	67e2                	ld	a5,24(sp)
    800006c4:	e798                	sd	a4,8(a5)
    800006c6:	67e2                	ld	a5,24(sp)
    800006c8:	0607b823          	sd	zero,112(a5)
    800006cc:	67e2                	ld	a5,24(sp)
    800006ce:	6398                	ld	a4,0(a5)
    800006d0:	67e2                	ld	a5,24(sp)
    800006d2:	eb98                	sd	a4,16(a5)
    800006d4:	67e2                	ld	a5,24(sp)
    800006d6:	6398                	ld	a4,0(a5)
    800006d8:	67e2                	ld	a5,24(sp)
    800006da:	7fbc                	ld	a5,120(a5)
    800006dc:	fff78693          	addi	a3,a5,-1
    800006e0:	67e2                	ld	a5,24(sp)
    800006e2:	63dc                	ld	a5,128(a5)
    800006e4:	02f687b3          	mul	a5,a3,a5
    800006e8:	973e                	add	a4,a4,a5
    800006ea:	67e2                	ld	a5,24(sp)
    800006ec:	ef98                	sd	a4,24(a5)
    800006ee:	67e2                	ld	a5,24(sp)
    800006f0:	577d                	li	a4,-1
    800006f2:	e7d8                	sd	a4,136(a5)
    800006f4:	67e2                	ld	a5,24(sp)
    800006f6:	577d                	li	a4,-1
    800006f8:	ebd8                	sd	a4,144(a5)
    800006fa:	6782                	ld	a5,0(sp)
    800006fc:	e38d                	bnez	a5,8000071e <xQueueGenericReset+0x8a>
    800006fe:	67e2                	ld	a5,24(sp)
    80000700:	739c                	ld	a5,32(a5)
    80000702:	cb95                	beqz	a5,80000736 <xQueueGenericReset+0xa2>
    80000704:	67e2                	ld	a5,24(sp)
    80000706:	02078793          	addi	a5,a5,32
    8000070a:	853e                	mv	a0,a5
    8000070c:	589010ef          	jal	80002494 <xTaskRemoveFromEventList>
    80000710:	872a                	mv	a4,a0
    80000712:	4785                	li	a5,1
    80000714:	02f71163          	bne	a4,a5,80000736 <xQueueGenericReset+0xa2>
    80000718:	c8fff0ef          	jal	800003a6 <vPortYield>
    8000071c:	a829                	j	80000736 <xQueueGenericReset+0xa2>
    8000071e:	67e2                	ld	a5,24(sp)
    80000720:	02078793          	addi	a5,a5,32
    80000724:	853e                	mv	a0,a5
    80000726:	e2fff0ef          	jal	80000554 <vListInitialise>
    8000072a:	67e2                	ld	a5,24(sp)
    8000072c:	04878793          	addi	a5,a5,72
    80000730:	853e                	mv	a0,a5
    80000732:	e23ff0ef          	jal	80000554 <vListInitialise>
    80000736:	744020ef          	jal	80002e7a <vTaskExitCritical>
    8000073a:	4785                	li	a5,1
    8000073c:	853e                	mv	a0,a5
    8000073e:	70a2                	ld	ra,40(sp)
    80000740:	6145                	addi	sp,sp,48
    80000742:	8082                	ret

0000000080000744 <xQueueGenericCreate>:
    80000744:	715d                	addi	sp,sp,-80
    80000746:	e486                	sd	ra,72(sp)
    80000748:	ec2a                	sd	a0,24(sp)
    8000074a:	e82e                	sd	a1,16(sp)
    8000074c:	87b2                	mv	a5,a2
    8000074e:	00f107a3          	sb	a5,15(sp)
    80000752:	f802                	sd	zero,48(sp)
    80000754:	67e2                	ld	a5,24(sp)
    80000756:	e789                	bnez	a5,80000760 <xQueueGenericCreate+0x1c>
    80000758:	30047073          	csrci	mstatus,8
    8000075c:	0001                	nop
    8000075e:	bffd                	j	8000075c <xQueueGenericCreate+0x18>
    80000760:	67c2                	ld	a5,16(sp)
    80000762:	e399                	bnez	a5,80000768 <xQueueGenericCreate+0x24>
    80000764:	fc02                	sd	zero,56(sp)
    80000766:	a039                	j	80000774 <xQueueGenericCreate+0x30>
    80000768:	6762                	ld	a4,24(sp)
    8000076a:	67c2                	ld	a5,16(sp)
    8000076c:	02f707b3          	mul	a5,a4,a5
    80000770:	0785                	addi	a5,a5,1
    80000772:	fc3e                	sd	a5,56(sp)
    80000774:	77e2                	ld	a5,56(sp)
    80000776:	0a878793          	addi	a5,a5,168
    8000077a:	853e                	mv	a0,a5
    8000077c:	2a9030ef          	jal	80004224 <pvPortMalloc>
    80000780:	f42a                	sd	a0,40(sp)
    80000782:	77a2                	ld	a5,40(sp)
    80000784:	cf8d                	beqz	a5,800007be <xQueueGenericCreate+0x7a>
    80000786:	67c2                	ld	a5,16(sp)
    80000788:	e789                	bnez	a5,80000792 <xQueueGenericCreate+0x4e>
    8000078a:	77a2                	ld	a5,40(sp)
    8000078c:	7722                	ld	a4,40(sp)
    8000078e:	e398                	sd	a4,0(a5)
    80000790:	a031                	j	8000079c <xQueueGenericCreate+0x58>
    80000792:	77a2                	ld	a5,40(sp)
    80000794:	0a878713          	addi	a4,a5,168
    80000798:	77a2                	ld	a5,40(sp)
    8000079a:	e398                	sd	a4,0(a5)
    8000079c:	77a2                	ld	a5,40(sp)
    8000079e:	6762                	ld	a4,24(sp)
    800007a0:	ffb8                	sd	a4,120(a5)
    800007a2:	77a2                	ld	a5,40(sp)
    800007a4:	6742                	ld	a4,16(sp)
    800007a6:	e3d8                	sd	a4,128(a5)
    800007a8:	4585                	li	a1,1
    800007aa:	7522                	ld	a0,40(sp)
    800007ac:	ee9ff0ef          	jal	80000694 <xQueueGenericReset>
    800007b0:	77a2                	ld	a5,40(sp)
    800007b2:	00f14703          	lbu	a4,15(sp)
    800007b6:	0ae78023          	sb	a4,160(a5)
    800007ba:	77a2                	ld	a5,40(sp)
    800007bc:	f83e                	sd	a5,48(sp)
    800007be:	77c2                	ld	a5,48(sp)
    800007c0:	e789                	bnez	a5,800007ca <xQueueGenericCreate+0x86>
    800007c2:	30047073          	csrci	mstatus,8
    800007c6:	0001                	nop
    800007c8:	bffd                	j	800007c6 <xQueueGenericCreate+0x82>
    800007ca:	77c2                	ld	a5,48(sp)
    800007cc:	853e                	mv	a0,a5
    800007ce:	60a6                	ld	ra,72(sp)
    800007d0:	6161                	addi	sp,sp,80
    800007d2:	8082                	ret

00000000800007d4 <xQueueCreateMutex>:
    800007d4:	7179                	addi	sp,sp,-48
    800007d6:	f406                	sd	ra,40(sp)
    800007d8:	87aa                	mv	a5,a0
    800007da:	00f107a3          	sb	a5,15(sp)
    800007de:	0a800513          	li	a0,168
    800007e2:	243030ef          	jal	80004224 <pvPortMalloc>
    800007e6:	ec2a                	sd	a0,24(sp)
    800007e8:	67e2                	ld	a5,24(sp)
    800007ea:	c3bd                	beqz	a5,80000850 <xQueueCreateMutex+0x7c>
    800007ec:	67e2                	ld	a5,24(sp)
    800007ee:	0007b423          	sd	zero,8(a5)
    800007f2:	67e2                	ld	a5,24(sp)
    800007f4:	0007b023          	sd	zero,0(a5)
    800007f8:	67e2                	ld	a5,24(sp)
    800007fa:	0007b823          	sd	zero,16(a5)
    800007fe:	67e2                	ld	a5,24(sp)
    80000800:	0007bc23          	sd	zero,24(a5)
    80000804:	67e2                	ld	a5,24(sp)
    80000806:	0607b823          	sd	zero,112(a5)
    8000080a:	67e2                	ld	a5,24(sp)
    8000080c:	4705                	li	a4,1
    8000080e:	ffb8                	sd	a4,120(a5)
    80000810:	67e2                	ld	a5,24(sp)
    80000812:	0807b023          	sd	zero,128(a5)
    80000816:	67e2                	ld	a5,24(sp)
    80000818:	577d                	li	a4,-1
    8000081a:	e7d8                	sd	a4,136(a5)
    8000081c:	67e2                	ld	a5,24(sp)
    8000081e:	577d                	li	a4,-1
    80000820:	ebd8                	sd	a4,144(a5)
    80000822:	67e2                	ld	a5,24(sp)
    80000824:	00f14703          	lbu	a4,15(sp)
    80000828:	0ae78023          	sb	a4,160(a5)
    8000082c:	67e2                	ld	a5,24(sp)
    8000082e:	02078793          	addi	a5,a5,32
    80000832:	853e                	mv	a0,a5
    80000834:	d21ff0ef          	jal	80000554 <vListInitialise>
    80000838:	67e2                	ld	a5,24(sp)
    8000083a:	04878793          	addi	a5,a5,72
    8000083e:	853e                	mv	a0,a5
    80000840:	d15ff0ef          	jal	80000554 <vListInitialise>
    80000844:	4681                	li	a3,0
    80000846:	4601                	li	a2,0
    80000848:	4581                	li	a1,0
    8000084a:	6562                	ld	a0,24(sp)
    8000084c:	122000ef          	jal	8000096e <xQueueGenericSend>
    80000850:	67e2                	ld	a5,24(sp)
    80000852:	853e                	mv	a0,a5
    80000854:	70a2                	ld	ra,40(sp)
    80000856:	6145                	addi	sp,sp,48
    80000858:	8082                	ret

000000008000085a <xQueueGiveMutexRecursive>:
    8000085a:	7179                	addi	sp,sp,-48
    8000085c:	f406                	sd	ra,40(sp)
    8000085e:	f022                	sd	s0,32(sp)
    80000860:	e42a                	sd	a0,8(sp)
    80000862:	67a2                	ld	a5,8(sp)
    80000864:	e83e                	sd	a5,16(sp)
    80000866:	67c2                	ld	a5,16(sp)
    80000868:	e789                	bnez	a5,80000872 <xQueueGiveMutexRecursive+0x18>
    8000086a:	30047073          	csrci	mstatus,8
    8000086e:	0001                	nop
    80000870:	bffd                	j	8000086e <xQueueGiveMutexRecursive+0x14>
    80000872:	67c2                	ld	a5,16(sp)
    80000874:	6780                	ld	s0,8(a5)
    80000876:	3e2020ef          	jal	80002c58 <xTaskGetCurrentTaskHandle>
    8000087a:	87aa                	mv	a5,a0
    8000087c:	02f41463          	bne	s0,a5,800008a4 <xQueueGiveMutexRecursive+0x4a>
    80000880:	67c2                	ld	a5,16(sp)
    80000882:	6f9c                	ld	a5,24(a5)
    80000884:	fff78713          	addi	a4,a5,-1
    80000888:	67c2                	ld	a5,16(sp)
    8000088a:	ef98                	sd	a4,24(a5)
    8000088c:	67c2                	ld	a5,16(sp)
    8000088e:	6f9c                	ld	a5,24(a5)
    80000890:	e799                	bnez	a5,8000089e <xQueueGiveMutexRecursive+0x44>
    80000892:	4681                	li	a3,0
    80000894:	4601                	li	a2,0
    80000896:	4581                	li	a1,0
    80000898:	6542                	ld	a0,16(sp)
    8000089a:	0d4000ef          	jal	8000096e <xQueueGenericSend>
    8000089e:	4785                	li	a5,1
    800008a0:	ec3e                	sd	a5,24(sp)
    800008a2:	a011                	j	800008a6 <xQueueGiveMutexRecursive+0x4c>
    800008a4:	ec02                	sd	zero,24(sp)
    800008a6:	67e2                	ld	a5,24(sp)
    800008a8:	853e                	mv	a0,a5
    800008aa:	70a2                	ld	ra,40(sp)
    800008ac:	7402                	ld	s0,32(sp)
    800008ae:	6145                	addi	sp,sp,48
    800008b0:	8082                	ret

00000000800008b2 <xQueueTakeMutexRecursive>:
    800008b2:	7179                	addi	sp,sp,-48
    800008b4:	f406                	sd	ra,40(sp)
    800008b6:	f022                	sd	s0,32(sp)
    800008b8:	e42a                	sd	a0,8(sp)
    800008ba:	87ae                	mv	a5,a1
    800008bc:	c23e                	sw	a5,4(sp)
    800008be:	67a2                	ld	a5,8(sp)
    800008c0:	e83e                	sd	a5,16(sp)
    800008c2:	67c2                	ld	a5,16(sp)
    800008c4:	e789                	bnez	a5,800008ce <xQueueTakeMutexRecursive+0x1c>
    800008c6:	30047073          	csrci	mstatus,8
    800008ca:	0001                	nop
    800008cc:	bffd                	j	800008ca <xQueueTakeMutexRecursive+0x18>
    800008ce:	67c2                	ld	a5,16(sp)
    800008d0:	6780                	ld	s0,8(a5)
    800008d2:	386020ef          	jal	80002c58 <xTaskGetCurrentTaskHandle>
    800008d6:	87aa                	mv	a5,a0
    800008d8:	00f41b63          	bne	s0,a5,800008ee <xQueueTakeMutexRecursive+0x3c>
    800008dc:	67c2                	ld	a5,16(sp)
    800008de:	6f9c                	ld	a5,24(a5)
    800008e0:	00178713          	addi	a4,a5,1
    800008e4:	67c2                	ld	a5,16(sp)
    800008e6:	ef98                	sd	a4,24(a5)
    800008e8:	4785                	li	a5,1
    800008ea:	ec3e                	sd	a5,24(sp)
    800008ec:	a01d                	j	80000912 <xQueueTakeMutexRecursive+0x60>
    800008ee:	4792                	lw	a5,4(sp)
    800008f0:	4681                	li	a3,0
    800008f2:	863e                	mv	a2,a5
    800008f4:	4581                	li	a1,0
    800008f6:	6542                	ld	a0,16(sp)
    800008f8:	376000ef          	jal	80000c6e <xQueueGenericReceive>
    800008fc:	ec2a                	sd	a0,24(sp)
    800008fe:	6762                	ld	a4,24(sp)
    80000900:	4785                	li	a5,1
    80000902:	00f71863          	bne	a4,a5,80000912 <xQueueTakeMutexRecursive+0x60>
    80000906:	67c2                	ld	a5,16(sp)
    80000908:	6f9c                	ld	a5,24(a5)
    8000090a:	00178713          	addi	a4,a5,1
    8000090e:	67c2                	ld	a5,16(sp)
    80000910:	ef98                	sd	a4,24(a5)
    80000912:	67e2                	ld	a5,24(sp)
    80000914:	853e                	mv	a0,a5
    80000916:	70a2                	ld	ra,40(sp)
    80000918:	7402                	ld	s0,32(sp)
    8000091a:	6145                	addi	sp,sp,48
    8000091c:	8082                	ret

000000008000091e <xQueueCreateCountingSemaphore>:
    8000091e:	7179                	addi	sp,sp,-48
    80000920:	f406                	sd	ra,40(sp)
    80000922:	e42a                	sd	a0,8(sp)
    80000924:	e02e                	sd	a1,0(sp)
    80000926:	67a2                	ld	a5,8(sp)
    80000928:	e789                	bnez	a5,80000932 <xQueueCreateCountingSemaphore+0x14>
    8000092a:	30047073          	csrci	mstatus,8
    8000092e:	0001                	nop
    80000930:	bffd                	j	8000092e <xQueueCreateCountingSemaphore+0x10>
    80000932:	6702                	ld	a4,0(sp)
    80000934:	67a2                	ld	a5,8(sp)
    80000936:	00e7f663          	bgeu	a5,a4,80000942 <xQueueCreateCountingSemaphore+0x24>
    8000093a:	30047073          	csrci	mstatus,8
    8000093e:	0001                	nop
    80000940:	bffd                	j	8000093e <xQueueCreateCountingSemaphore+0x20>
    80000942:	4609                	li	a2,2
    80000944:	4581                	li	a1,0
    80000946:	6522                	ld	a0,8(sp)
    80000948:	dfdff0ef          	jal	80000744 <xQueueGenericCreate>
    8000094c:	ec2a                	sd	a0,24(sp)
    8000094e:	67e2                	ld	a5,24(sp)
    80000950:	c781                	beqz	a5,80000958 <xQueueCreateCountingSemaphore+0x3a>
    80000952:	67e2                	ld	a5,24(sp)
    80000954:	6702                	ld	a4,0(sp)
    80000956:	fbb8                	sd	a4,112(a5)
    80000958:	67e2                	ld	a5,24(sp)
    8000095a:	e789                	bnez	a5,80000964 <xQueueCreateCountingSemaphore+0x46>
    8000095c:	30047073          	csrci	mstatus,8
    80000960:	0001                	nop
    80000962:	bffd                	j	80000960 <xQueueCreateCountingSemaphore+0x42>
    80000964:	67e2                	ld	a5,24(sp)
    80000966:	853e                	mv	a0,a5
    80000968:	70a2                	ld	ra,40(sp)
    8000096a:	6145                	addi	sp,sp,48
    8000096c:	8082                	ret

000000008000096e <xQueueGenericSend>:
    8000096e:	711d                	addi	sp,sp,-96
    80000970:	ec86                	sd	ra,88(sp)
    80000972:	ec2a                	sd	a0,24(sp)
    80000974:	e82e                	sd	a1,16(sp)
    80000976:	87b2                	mv	a5,a2
    80000978:	e036                	sd	a3,0(sp)
    8000097a:	c63e                	sw	a5,12(sp)
    8000097c:	e482                	sd	zero,72(sp)
    8000097e:	67e2                	ld	a5,24(sp)
    80000980:	e0be                	sd	a5,64(sp)
    80000982:	6786                	ld	a5,64(sp)
    80000984:	e789                	bnez	a5,8000098e <xQueueGenericSend+0x20>
    80000986:	30047073          	csrci	mstatus,8
    8000098a:	0001                	nop
    8000098c:	bffd                	j	8000098a <xQueueGenericSend+0x1c>
    8000098e:	67c2                	ld	a5,16(sp)
    80000990:	e781                	bnez	a5,80000998 <xQueueGenericSend+0x2a>
    80000992:	6786                	ld	a5,64(sp)
    80000994:	63dc                	ld	a5,128(a5)
    80000996:	e399                	bnez	a5,8000099c <xQueueGenericSend+0x2e>
    80000998:	4785                	li	a5,1
    8000099a:	a011                	j	8000099e <xQueueGenericSend+0x30>
    8000099c:	4781                	li	a5,0
    8000099e:	e789                	bnez	a5,800009a8 <xQueueGenericSend+0x3a>
    800009a0:	30047073          	csrci	mstatus,8
    800009a4:	0001                	nop
    800009a6:	bffd                	j	800009a4 <xQueueGenericSend+0x36>
    800009a8:	6702                	ld	a4,0(sp)
    800009aa:	4789                	li	a5,2
    800009ac:	00f71763          	bne	a4,a5,800009ba <xQueueGenericSend+0x4c>
    800009b0:	6786                	ld	a5,64(sp)
    800009b2:	7fb8                	ld	a4,120(a5)
    800009b4:	4785                	li	a5,1
    800009b6:	00f71463          	bne	a4,a5,800009be <xQueueGenericSend+0x50>
    800009ba:	4785                	li	a5,1
    800009bc:	a011                	j	800009c0 <xQueueGenericSend+0x52>
    800009be:	4781                	li	a5,0
    800009c0:	e789                	bnez	a5,800009ca <xQueueGenericSend+0x5c>
    800009c2:	30047073          	csrci	mstatus,8
    800009c6:	0001                	nop
    800009c8:	bffd                	j	800009c6 <xQueueGenericSend+0x58>
    800009ca:	2a4020ef          	jal	80002c6e <xTaskGetSchedulerState>
    800009ce:	87aa                	mv	a5,a0
    800009d0:	e399                	bnez	a5,800009d6 <xQueueGenericSend+0x68>
    800009d2:	47b2                	lw	a5,12(sp)
    800009d4:	e399                	bnez	a5,800009da <xQueueGenericSend+0x6c>
    800009d6:	4785                	li	a5,1
    800009d8:	a011                	j	800009dc <xQueueGenericSend+0x6e>
    800009da:	4781                	li	a5,0
    800009dc:	e789                	bnez	a5,800009e6 <xQueueGenericSend+0x78>
    800009de:	30047073          	csrci	mstatus,8
    800009e2:	0001                	nop
    800009e4:	bffd                	j	800009e2 <xQueueGenericSend+0x74>
    800009e6:	466020ef          	jal	80002e4c <vTaskEnterCritical>
    800009ea:	6786                	ld	a5,64(sp)
    800009ec:	7bb8                	ld	a4,112(a5)
    800009ee:	6786                	ld	a5,64(sp)
    800009f0:	7fbc                	ld	a5,120(a5)
    800009f2:	00f76663          	bltu	a4,a5,800009fe <xQueueGenericSend+0x90>
    800009f6:	6702                	ld	a4,0(sp)
    800009f8:	4789                	li	a5,2
    800009fa:	04f71063          	bne	a4,a5,80000a3a <xQueueGenericSend+0xcc>
    800009fe:	6602                	ld	a2,0(sp)
    80000a00:	65c2                	ld	a1,16(sp)
    80000a02:	6506                	ld	a0,64(sp)
    80000a04:	604000ef          	jal	80001008 <prvCopyDataToQueue>
    80000a08:	fc2a                	sd	a0,56(sp)
    80000a0a:	6786                	ld	a5,64(sp)
    80000a0c:	67bc                	ld	a5,72(a5)
    80000a0e:	cf91                	beqz	a5,80000a2a <xQueueGenericSend+0xbc>
    80000a10:	6786                	ld	a5,64(sp)
    80000a12:	04878793          	addi	a5,a5,72
    80000a16:	853e                	mv	a0,a5
    80000a18:	27d010ef          	jal	80002494 <xTaskRemoveFromEventList>
    80000a1c:	872a                	mv	a4,a0
    80000a1e:	4785                	li	a5,1
    80000a20:	00f71963          	bne	a4,a5,80000a32 <xQueueGenericSend+0xc4>
    80000a24:	983ff0ef          	jal	800003a6 <vPortYield>
    80000a28:	a029                	j	80000a32 <xQueueGenericSend+0xc4>
    80000a2a:	77e2                	ld	a5,56(sp)
    80000a2c:	c399                	beqz	a5,80000a32 <xQueueGenericSend+0xc4>
    80000a2e:	979ff0ef          	jal	800003a6 <vPortYield>
    80000a32:	448020ef          	jal	80002e7a <vTaskExitCritical>
    80000a36:	4785                	li	a5,1
    80000a38:	a05d                	j	80000ade <xQueueGenericSend+0x170>
    80000a3a:	47b2                	lw	a5,12(sp)
    80000a3c:	e789                	bnez	a5,80000a46 <xQueueGenericSend+0xd8>
    80000a3e:	43c020ef          	jal	80002e7a <vTaskExitCritical>
    80000a42:	4781                	li	a5,0
    80000a44:	a869                	j	80000ade <xQueueGenericSend+0x170>
    80000a46:	67a6                	ld	a5,72(sp)
    80000a48:	e799                	bnez	a5,80000a56 <xQueueGenericSend+0xe8>
    80000a4a:	103c                	addi	a5,sp,40
    80000a4c:	853e                	mv	a0,a5
    80000a4e:	3d3010ef          	jal	80002620 <vTaskSetTimeOutState>
    80000a52:	4785                	li	a5,1
    80000a54:	e4be                	sd	a5,72(sp)
    80000a56:	424020ef          	jal	80002e7a <vTaskExitCritical>
    80000a5a:	264010ef          	jal	80001cbe <vTaskSuspendAll>
    80000a5e:	3ee020ef          	jal	80002e4c <vTaskEnterCritical>
    80000a62:	6786                	ld	a5,64(sp)
    80000a64:	67d8                	ld	a4,136(a5)
    80000a66:	57fd                	li	a5,-1
    80000a68:	00f71563          	bne	a4,a5,80000a72 <xQueueGenericSend+0x104>
    80000a6c:	6786                	ld	a5,64(sp)
    80000a6e:	0807b423          	sd	zero,136(a5)
    80000a72:	6786                	ld	a5,64(sp)
    80000a74:	6bd8                	ld	a4,144(a5)
    80000a76:	57fd                	li	a5,-1
    80000a78:	00f71563          	bne	a4,a5,80000a82 <xQueueGenericSend+0x114>
    80000a7c:	6786                	ld	a5,64(sp)
    80000a7e:	0807b823          	sd	zero,144(a5)
    80000a82:	3f8020ef          	jal	80002e7a <vTaskExitCritical>
    80000a86:	0078                	addi	a4,sp,12
    80000a88:	103c                	addi	a5,sp,40
    80000a8a:	85ba                	mv	a1,a4
    80000a8c:	853e                	mv	a0,a5
    80000a8e:	3c9010ef          	jal	80002656 <xTaskCheckForTimeOut>
    80000a92:	87aa                	mv	a5,a0
    80000a94:	ef9d                	bnez	a5,80000ad2 <xQueueGenericSend+0x164>
    80000a96:	6506                	ld	a0,64(sp)
    80000a98:	770000ef          	jal	80001208 <prvIsQueueFull>
    80000a9c:	87aa                	mv	a5,a0
    80000a9e:	c785                	beqz	a5,80000ac6 <xQueueGenericSend+0x158>
    80000aa0:	6786                	ld	a5,64(sp)
    80000aa2:	02078793          	addi	a5,a5,32
    80000aa6:	4732                	lw	a4,12(sp)
    80000aa8:	85ba                	mv	a1,a4
    80000aaa:	853e                	mv	a0,a5
    80000aac:	021010ef          	jal	800022cc <vTaskPlaceOnEventList>
    80000ab0:	6506                	ld	a0,64(sp)
    80000ab2:	678000ef          	jal	8000112a <prvUnlockQueue>
    80000ab6:	224010ef          	jal	80001cda <xTaskResumeAll>
    80000aba:	87aa                	mv	a5,a0
    80000abc:	f20795e3          	bnez	a5,800009e6 <xQueueGenericSend+0x78>
    80000ac0:	8e7ff0ef          	jal	800003a6 <vPortYield>
    80000ac4:	b70d                	j	800009e6 <xQueueGenericSend+0x78>
    80000ac6:	6506                	ld	a0,64(sp)
    80000ac8:	662000ef          	jal	8000112a <prvUnlockQueue>
    80000acc:	20e010ef          	jal	80001cda <xTaskResumeAll>
    80000ad0:	bf19                	j	800009e6 <xQueueGenericSend+0x78>
    80000ad2:	6506                	ld	a0,64(sp)
    80000ad4:	656000ef          	jal	8000112a <prvUnlockQueue>
    80000ad8:	202010ef          	jal	80001cda <xTaskResumeAll>
    80000adc:	4781                	li	a5,0
    80000ade:	853e                	mv	a0,a5
    80000ae0:	60e6                	ld	ra,88(sp)
    80000ae2:	6125                	addi	sp,sp,96
    80000ae4:	8082                	ret

0000000080000ae6 <xQueueGenericSendFromISR>:
    80000ae6:	715d                	addi	sp,sp,-80
    80000ae8:	e486                	sd	ra,72(sp)
    80000aea:	ec2a                	sd	a0,24(sp)
    80000aec:	e82e                	sd	a1,16(sp)
    80000aee:	e432                	sd	a2,8(sp)
    80000af0:	e036                	sd	a3,0(sp)
    80000af2:	67e2                	ld	a5,24(sp)
    80000af4:	f83e                	sd	a5,48(sp)
    80000af6:	77c2                	ld	a5,48(sp)
    80000af8:	e789                	bnez	a5,80000b02 <xQueueGenericSendFromISR+0x1c>
    80000afa:	30047073          	csrci	mstatus,8
    80000afe:	0001                	nop
    80000b00:	bffd                	j	80000afe <xQueueGenericSendFromISR+0x18>
    80000b02:	67c2                	ld	a5,16(sp)
    80000b04:	e781                	bnez	a5,80000b0c <xQueueGenericSendFromISR+0x26>
    80000b06:	77c2                	ld	a5,48(sp)
    80000b08:	63dc                	ld	a5,128(a5)
    80000b0a:	e399                	bnez	a5,80000b10 <xQueueGenericSendFromISR+0x2a>
    80000b0c:	4785                	li	a5,1
    80000b0e:	a011                	j	80000b12 <xQueueGenericSendFromISR+0x2c>
    80000b10:	4781                	li	a5,0
    80000b12:	e789                	bnez	a5,80000b1c <xQueueGenericSendFromISR+0x36>
    80000b14:	30047073          	csrci	mstatus,8
    80000b18:	0001                	nop
    80000b1a:	bffd                	j	80000b18 <xQueueGenericSendFromISR+0x32>
    80000b1c:	6702                	ld	a4,0(sp)
    80000b1e:	4789                	li	a5,2
    80000b20:	00f71763          	bne	a4,a5,80000b2e <xQueueGenericSendFromISR+0x48>
    80000b24:	77c2                	ld	a5,48(sp)
    80000b26:	7fb8                	ld	a4,120(a5)
    80000b28:	4785                	li	a5,1
    80000b2a:	00f71463          	bne	a4,a5,80000b32 <xQueueGenericSendFromISR+0x4c>
    80000b2e:	4785                	li	a5,1
    80000b30:	a011                	j	80000b34 <xQueueGenericSendFromISR+0x4e>
    80000b32:	4781                	li	a5,0
    80000b34:	e789                	bnez	a5,80000b3e <xQueueGenericSendFromISR+0x58>
    80000b36:	30047073          	csrci	mstatus,8
    80000b3a:	0001                	nop
    80000b3c:	bffd                	j	80000b3a <xQueueGenericSendFromISR+0x54>
    80000b3e:	99bff0ef          	jal	800004d8 <vPortSetInterruptMask>
    80000b42:	87aa                	mv	a5,a0
    80000b44:	f43e                	sd	a5,40(sp)
    80000b46:	77c2                	ld	a5,48(sp)
    80000b48:	7bb8                	ld	a4,112(a5)
    80000b4a:	77c2                	ld	a5,48(sp)
    80000b4c:	7fbc                	ld	a5,120(a5)
    80000b4e:	00f76663          	bltu	a4,a5,80000b5a <xQueueGenericSendFromISR+0x74>
    80000b52:	6702                	ld	a4,0(sp)
    80000b54:	4789                	li	a5,2
    80000b56:	04f71663          	bne	a4,a5,80000ba2 <xQueueGenericSendFromISR+0xbc>
    80000b5a:	6602                	ld	a2,0(sp)
    80000b5c:	65c2                	ld	a1,16(sp)
    80000b5e:	7542                	ld	a0,48(sp)
    80000b60:	4a8000ef          	jal	80001008 <prvCopyDataToQueue>
    80000b64:	77c2                	ld	a5,48(sp)
    80000b66:	6bd8                	ld	a4,144(a5)
    80000b68:	57fd                	li	a5,-1
    80000b6a:	02f71363          	bne	a4,a5,80000b90 <xQueueGenericSendFromISR+0xaa>
    80000b6e:	77c2                	ld	a5,48(sp)
    80000b70:	67bc                	ld	a5,72(a5)
    80000b72:	c78d                	beqz	a5,80000b9c <xQueueGenericSendFromISR+0xb6>
    80000b74:	77c2                	ld	a5,48(sp)
    80000b76:	04878793          	addi	a5,a5,72
    80000b7a:	853e                	mv	a0,a5
    80000b7c:	119010ef          	jal	80002494 <xTaskRemoveFromEventList>
    80000b80:	87aa                	mv	a5,a0
    80000b82:	cf89                	beqz	a5,80000b9c <xQueueGenericSendFromISR+0xb6>
    80000b84:	67a2                	ld	a5,8(sp)
    80000b86:	cb99                	beqz	a5,80000b9c <xQueueGenericSendFromISR+0xb6>
    80000b88:	67a2                	ld	a5,8(sp)
    80000b8a:	4705                	li	a4,1
    80000b8c:	e398                	sd	a4,0(a5)
    80000b8e:	a039                	j	80000b9c <xQueueGenericSendFromISR+0xb6>
    80000b90:	77c2                	ld	a5,48(sp)
    80000b92:	6bdc                	ld	a5,144(a5)
    80000b94:	00178713          	addi	a4,a5,1
    80000b98:	77c2                	ld	a5,48(sp)
    80000b9a:	ebd8                	sd	a4,144(a5)
    80000b9c:	4785                	li	a5,1
    80000b9e:	fc3e                	sd	a5,56(sp)
    80000ba0:	a011                	j	80000ba4 <xQueueGenericSendFromISR+0xbe>
    80000ba2:	fc02                	sd	zero,56(sp)
    80000ba4:	77a2                	ld	a5,40(sp)
    80000ba6:	2781                	sext.w	a5,a5
    80000ba8:	853e                	mv	a0,a5
    80000baa:	91dff0ef          	jal	800004c6 <vPortClearInterruptMask>
    80000bae:	77e2                	ld	a5,56(sp)
    80000bb0:	853e                	mv	a0,a5
    80000bb2:	60a6                	ld	ra,72(sp)
    80000bb4:	6161                	addi	sp,sp,80
    80000bb6:	8082                	ret

0000000080000bb8 <xQueueGiveFromISR>:
    80000bb8:	7139                	addi	sp,sp,-64
    80000bba:	fc06                	sd	ra,56(sp)
    80000bbc:	e42a                	sd	a0,8(sp)
    80000bbe:	e02e                	sd	a1,0(sp)
    80000bc0:	67a2                	ld	a5,8(sp)
    80000bc2:	f03e                	sd	a5,32(sp)
    80000bc4:	7782                	ld	a5,32(sp)
    80000bc6:	e789                	bnez	a5,80000bd0 <xQueueGiveFromISR+0x18>
    80000bc8:	30047073          	csrci	mstatus,8
    80000bcc:	0001                	nop
    80000bce:	bffd                	j	80000bcc <xQueueGiveFromISR+0x14>
    80000bd0:	7782                	ld	a5,32(sp)
    80000bd2:	63dc                	ld	a5,128(a5)
    80000bd4:	c789                	beqz	a5,80000bde <xQueueGiveFromISR+0x26>
    80000bd6:	30047073          	csrci	mstatus,8
    80000bda:	0001                	nop
    80000bdc:	bffd                	j	80000bda <xQueueGiveFromISR+0x22>
    80000bde:	7782                	ld	a5,32(sp)
    80000be0:	639c                	ld	a5,0(a5)
    80000be2:	e781                	bnez	a5,80000bea <xQueueGiveFromISR+0x32>
    80000be4:	7782                	ld	a5,32(sp)
    80000be6:	679c                	ld	a5,8(a5)
    80000be8:	e399                	bnez	a5,80000bee <xQueueGiveFromISR+0x36>
    80000bea:	4785                	li	a5,1
    80000bec:	a011                	j	80000bf0 <xQueueGiveFromISR+0x38>
    80000bee:	4781                	li	a5,0
    80000bf0:	e789                	bnez	a5,80000bfa <xQueueGiveFromISR+0x42>
    80000bf2:	30047073          	csrci	mstatus,8
    80000bf6:	0001                	nop
    80000bf8:	bffd                	j	80000bf6 <xQueueGiveFromISR+0x3e>
    80000bfa:	8dfff0ef          	jal	800004d8 <vPortSetInterruptMask>
    80000bfe:	87aa                	mv	a5,a0
    80000c00:	ec3e                	sd	a5,24(sp)
    80000c02:	7782                	ld	a5,32(sp)
    80000c04:	7bb8                	ld	a4,112(a5)
    80000c06:	7782                	ld	a5,32(sp)
    80000c08:	7fbc                	ld	a5,120(a5)
    80000c0a:	04f77763          	bgeu	a4,a5,80000c58 <xQueueGiveFromISR+0xa0>
    80000c0e:	7782                	ld	a5,32(sp)
    80000c10:	7bbc                	ld	a5,112(a5)
    80000c12:	00178713          	addi	a4,a5,1
    80000c16:	7782                	ld	a5,32(sp)
    80000c18:	fbb8                	sd	a4,112(a5)
    80000c1a:	7782                	ld	a5,32(sp)
    80000c1c:	6bd8                	ld	a4,144(a5)
    80000c1e:	57fd                	li	a5,-1
    80000c20:	02f71363          	bne	a4,a5,80000c46 <xQueueGiveFromISR+0x8e>
    80000c24:	7782                	ld	a5,32(sp)
    80000c26:	67bc                	ld	a5,72(a5)
    80000c28:	c78d                	beqz	a5,80000c52 <xQueueGiveFromISR+0x9a>
    80000c2a:	7782                	ld	a5,32(sp)
    80000c2c:	04878793          	addi	a5,a5,72
    80000c30:	853e                	mv	a0,a5
    80000c32:	063010ef          	jal	80002494 <xTaskRemoveFromEventList>
    80000c36:	87aa                	mv	a5,a0
    80000c38:	cf89                	beqz	a5,80000c52 <xQueueGiveFromISR+0x9a>
    80000c3a:	6782                	ld	a5,0(sp)
    80000c3c:	cb99                	beqz	a5,80000c52 <xQueueGiveFromISR+0x9a>
    80000c3e:	6782                	ld	a5,0(sp)
    80000c40:	4705                	li	a4,1
    80000c42:	e398                	sd	a4,0(a5)
    80000c44:	a039                	j	80000c52 <xQueueGiveFromISR+0x9a>
    80000c46:	7782                	ld	a5,32(sp)
    80000c48:	6bdc                	ld	a5,144(a5)
    80000c4a:	00178713          	addi	a4,a5,1
    80000c4e:	7782                	ld	a5,32(sp)
    80000c50:	ebd8                	sd	a4,144(a5)
    80000c52:	4785                	li	a5,1
    80000c54:	f43e                	sd	a5,40(sp)
    80000c56:	a011                	j	80000c5a <xQueueGiveFromISR+0xa2>
    80000c58:	f402                	sd	zero,40(sp)
    80000c5a:	67e2                	ld	a5,24(sp)
    80000c5c:	2781                	sext.w	a5,a5
    80000c5e:	853e                	mv	a0,a5
    80000c60:	867ff0ef          	jal	800004c6 <vPortClearInterruptMask>
    80000c64:	77a2                	ld	a5,40(sp)
    80000c66:	853e                	mv	a0,a5
    80000c68:	70e2                	ld	ra,56(sp)
    80000c6a:	6121                	addi	sp,sp,64
    80000c6c:	8082                	ret

0000000080000c6e <xQueueGenericReceive>:
    80000c6e:	711d                	addi	sp,sp,-96
    80000c70:	ec86                	sd	ra,88(sp)
    80000c72:	ec2a                	sd	a0,24(sp)
    80000c74:	e82e                	sd	a1,16(sp)
    80000c76:	87b2                	mv	a5,a2
    80000c78:	e036                	sd	a3,0(sp)
    80000c7a:	c63e                	sw	a5,12(sp)
    80000c7c:	e482                	sd	zero,72(sp)
    80000c7e:	67e2                	ld	a5,24(sp)
    80000c80:	e0be                	sd	a5,64(sp)
    80000c82:	6786                	ld	a5,64(sp)
    80000c84:	e789                	bnez	a5,80000c8e <xQueueGenericReceive+0x20>
    80000c86:	30047073          	csrci	mstatus,8
    80000c8a:	0001                	nop
    80000c8c:	bffd                	j	80000c8a <xQueueGenericReceive+0x1c>
    80000c8e:	67c2                	ld	a5,16(sp)
    80000c90:	e781                	bnez	a5,80000c98 <xQueueGenericReceive+0x2a>
    80000c92:	6786                	ld	a5,64(sp)
    80000c94:	63dc                	ld	a5,128(a5)
    80000c96:	e399                	bnez	a5,80000c9c <xQueueGenericReceive+0x2e>
    80000c98:	4785                	li	a5,1
    80000c9a:	a011                	j	80000c9e <xQueueGenericReceive+0x30>
    80000c9c:	4781                	li	a5,0
    80000c9e:	e789                	bnez	a5,80000ca8 <xQueueGenericReceive+0x3a>
    80000ca0:	30047073          	csrci	mstatus,8
    80000ca4:	0001                	nop
    80000ca6:	bffd                	j	80000ca4 <xQueueGenericReceive+0x36>
    80000ca8:	7c7010ef          	jal	80002c6e <xTaskGetSchedulerState>
    80000cac:	87aa                	mv	a5,a0
    80000cae:	e399                	bnez	a5,80000cb4 <xQueueGenericReceive+0x46>
    80000cb0:	47b2                	lw	a5,12(sp)
    80000cb2:	e399                	bnez	a5,80000cb8 <xQueueGenericReceive+0x4a>
    80000cb4:	4785                	li	a5,1
    80000cb6:	a011                	j	80000cba <xQueueGenericReceive+0x4c>
    80000cb8:	4781                	li	a5,0
    80000cba:	e789                	bnez	a5,80000cc4 <xQueueGenericReceive+0x56>
    80000cbc:	30047073          	csrci	mstatus,8
    80000cc0:	0001                	nop
    80000cc2:	bffd                	j	80000cc0 <xQueueGenericReceive+0x52>
    80000cc4:	188020ef          	jal	80002e4c <vTaskEnterCritical>
    80000cc8:	6786                	ld	a5,64(sp)
    80000cca:	7bbc                	ld	a5,112(a5)
    80000ccc:	cfa5                	beqz	a5,80000d44 <xQueueGenericReceive+0xd6>
    80000cce:	6786                	ld	a5,64(sp)
    80000cd0:	6f9c                	ld	a5,24(a5)
    80000cd2:	fc3e                	sd	a5,56(sp)
    80000cd4:	65c2                	ld	a1,16(sp)
    80000cd6:	6506                	ld	a0,64(sp)
    80000cd8:	408000ef          	jal	800010e0 <prvCopyDataFromQueue>
    80000cdc:	6782                	ld	a5,0(sp)
    80000cde:	ef9d                	bnez	a5,80000d1c <xQueueGenericReceive+0xae>
    80000ce0:	6786                	ld	a5,64(sp)
    80000ce2:	7bbc                	ld	a5,112(a5)
    80000ce4:	fff78713          	addi	a4,a5,-1
    80000ce8:	6786                	ld	a5,64(sp)
    80000cea:	fbb8                	sd	a4,112(a5)
    80000cec:	6786                	ld	a5,64(sp)
    80000cee:	639c                	ld	a5,0(a5)
    80000cf0:	e791                	bnez	a5,80000cfc <xQueueGenericReceive+0x8e>
    80000cf2:	204020ef          	jal	80002ef6 <pvTaskIncrementMutexHeldCount>
    80000cf6:	872a                	mv	a4,a0
    80000cf8:	6786                	ld	a5,64(sp)
    80000cfa:	e798                	sd	a4,8(a5)
    80000cfc:	6786                	ld	a5,64(sp)
    80000cfe:	739c                	ld	a5,32(a5)
    80000d00:	cf95                	beqz	a5,80000d3c <xQueueGenericReceive+0xce>
    80000d02:	6786                	ld	a5,64(sp)
    80000d04:	02078793          	addi	a5,a5,32
    80000d08:	853e                	mv	a0,a5
    80000d0a:	78a010ef          	jal	80002494 <xTaskRemoveFromEventList>
    80000d0e:	872a                	mv	a4,a0
    80000d10:	4785                	li	a5,1
    80000d12:	02f71563          	bne	a4,a5,80000d3c <xQueueGenericReceive+0xce>
    80000d16:	e90ff0ef          	jal	800003a6 <vPortYield>
    80000d1a:	a00d                	j	80000d3c <xQueueGenericReceive+0xce>
    80000d1c:	6786                	ld	a5,64(sp)
    80000d1e:	7762                	ld	a4,56(sp)
    80000d20:	ef98                	sd	a4,24(a5)
    80000d22:	6786                	ld	a5,64(sp)
    80000d24:	67bc                	ld	a5,72(a5)
    80000d26:	cb99                	beqz	a5,80000d3c <xQueueGenericReceive+0xce>
    80000d28:	6786                	ld	a5,64(sp)
    80000d2a:	04878793          	addi	a5,a5,72
    80000d2e:	853e                	mv	a0,a5
    80000d30:	764010ef          	jal	80002494 <xTaskRemoveFromEventList>
    80000d34:	87aa                	mv	a5,a0
    80000d36:	c399                	beqz	a5,80000d3c <xQueueGenericReceive+0xce>
    80000d38:	e6eff0ef          	jal	800003a6 <vPortYield>
    80000d3c:	13e020ef          	jal	80002e7a <vTaskExitCritical>
    80000d40:	4785                	li	a5,1
    80000d42:	a87d                	j	80000e00 <xQueueGenericReceive+0x192>
    80000d44:	47b2                	lw	a5,12(sp)
    80000d46:	e789                	bnez	a5,80000d50 <xQueueGenericReceive+0xe2>
    80000d48:	132020ef          	jal	80002e7a <vTaskExitCritical>
    80000d4c:	4781                	li	a5,0
    80000d4e:	a84d                	j	80000e00 <xQueueGenericReceive+0x192>
    80000d50:	67a6                	ld	a5,72(sp)
    80000d52:	e799                	bnez	a5,80000d60 <xQueueGenericReceive+0xf2>
    80000d54:	103c                	addi	a5,sp,40
    80000d56:	853e                	mv	a0,a5
    80000d58:	0c9010ef          	jal	80002620 <vTaskSetTimeOutState>
    80000d5c:	4785                	li	a5,1
    80000d5e:	e4be                	sd	a5,72(sp)
    80000d60:	11a020ef          	jal	80002e7a <vTaskExitCritical>
    80000d64:	75b000ef          	jal	80001cbe <vTaskSuspendAll>
    80000d68:	0e4020ef          	jal	80002e4c <vTaskEnterCritical>
    80000d6c:	6786                	ld	a5,64(sp)
    80000d6e:	67d8                	ld	a4,136(a5)
    80000d70:	57fd                	li	a5,-1
    80000d72:	00f71563          	bne	a4,a5,80000d7c <xQueueGenericReceive+0x10e>
    80000d76:	6786                	ld	a5,64(sp)
    80000d78:	0807b423          	sd	zero,136(a5)
    80000d7c:	6786                	ld	a5,64(sp)
    80000d7e:	6bd8                	ld	a4,144(a5)
    80000d80:	57fd                	li	a5,-1
    80000d82:	00f71563          	bne	a4,a5,80000d8c <xQueueGenericReceive+0x11e>
    80000d86:	6786                	ld	a5,64(sp)
    80000d88:	0807b823          	sd	zero,144(a5)
    80000d8c:	0ee020ef          	jal	80002e7a <vTaskExitCritical>
    80000d90:	0078                	addi	a4,sp,12
    80000d92:	103c                	addi	a5,sp,40
    80000d94:	85ba                	mv	a1,a4
    80000d96:	853e                	mv	a0,a5
    80000d98:	0bf010ef          	jal	80002656 <xTaskCheckForTimeOut>
    80000d9c:	87aa                	mv	a5,a0
    80000d9e:	ebb9                	bnez	a5,80000df4 <xQueueGenericReceive+0x186>
    80000da0:	6506                	ld	a0,64(sp)
    80000da2:	41a000ef          	jal	800011bc <prvIsQueueEmpty>
    80000da6:	87aa                	mv	a5,a0
    80000da8:	c3a1                	beqz	a5,80000de8 <xQueueGenericReceive+0x17a>
    80000daa:	6786                	ld	a5,64(sp)
    80000dac:	639c                	ld	a5,0(a5)
    80000dae:	eb91                	bnez	a5,80000dc2 <xQueueGenericReceive+0x154>
    80000db0:	09c020ef          	jal	80002e4c <vTaskEnterCritical>
    80000db4:	6786                	ld	a5,64(sp)
    80000db6:	679c                	ld	a5,8(a5)
    80000db8:	853e                	mv	a0,a5
    80000dba:	6e5010ef          	jal	80002c9e <vTaskPriorityInherit>
    80000dbe:	0bc020ef          	jal	80002e7a <vTaskExitCritical>
    80000dc2:	6786                	ld	a5,64(sp)
    80000dc4:	04878793          	addi	a5,a5,72
    80000dc8:	4732                	lw	a4,12(sp)
    80000dca:	85ba                	mv	a1,a4
    80000dcc:	853e                	mv	a0,a5
    80000dce:	4fe010ef          	jal	800022cc <vTaskPlaceOnEventList>
    80000dd2:	6506                	ld	a0,64(sp)
    80000dd4:	356000ef          	jal	8000112a <prvUnlockQueue>
    80000dd8:	703000ef          	jal	80001cda <xTaskResumeAll>
    80000ddc:	87aa                	mv	a5,a0
    80000dde:	ee0793e3          	bnez	a5,80000cc4 <xQueueGenericReceive+0x56>
    80000de2:	dc4ff0ef          	jal	800003a6 <vPortYield>
    80000de6:	bdf9                	j	80000cc4 <xQueueGenericReceive+0x56>
    80000de8:	6506                	ld	a0,64(sp)
    80000dea:	340000ef          	jal	8000112a <prvUnlockQueue>
    80000dee:	6ed000ef          	jal	80001cda <xTaskResumeAll>
    80000df2:	bdc9                	j	80000cc4 <xQueueGenericReceive+0x56>
    80000df4:	6506                	ld	a0,64(sp)
    80000df6:	334000ef          	jal	8000112a <prvUnlockQueue>
    80000dfa:	6e1000ef          	jal	80001cda <xTaskResumeAll>
    80000dfe:	4781                	li	a5,0
    80000e00:	853e                	mv	a0,a5
    80000e02:	60e6                	ld	ra,88(sp)
    80000e04:	6125                	addi	sp,sp,96
    80000e06:	8082                	ret

0000000080000e08 <xQueueReceiveFromISR>:
    80000e08:	715d                	addi	sp,sp,-80
    80000e0a:	e486                	sd	ra,72(sp)
    80000e0c:	ec2a                	sd	a0,24(sp)
    80000e0e:	e82e                	sd	a1,16(sp)
    80000e10:	e432                	sd	a2,8(sp)
    80000e12:	67e2                	ld	a5,24(sp)
    80000e14:	f83e                	sd	a5,48(sp)
    80000e16:	77c2                	ld	a5,48(sp)
    80000e18:	e789                	bnez	a5,80000e22 <xQueueReceiveFromISR+0x1a>
    80000e1a:	30047073          	csrci	mstatus,8
    80000e1e:	0001                	nop
    80000e20:	bffd                	j	80000e1e <xQueueReceiveFromISR+0x16>
    80000e22:	67c2                	ld	a5,16(sp)
    80000e24:	e781                	bnez	a5,80000e2c <xQueueReceiveFromISR+0x24>
    80000e26:	77c2                	ld	a5,48(sp)
    80000e28:	63dc                	ld	a5,128(a5)
    80000e2a:	e399                	bnez	a5,80000e30 <xQueueReceiveFromISR+0x28>
    80000e2c:	4785                	li	a5,1
    80000e2e:	a011                	j	80000e32 <xQueueReceiveFromISR+0x2a>
    80000e30:	4781                	li	a5,0
    80000e32:	e789                	bnez	a5,80000e3c <xQueueReceiveFromISR+0x34>
    80000e34:	30047073          	csrci	mstatus,8
    80000e38:	0001                	nop
    80000e3a:	bffd                	j	80000e38 <xQueueReceiveFromISR+0x30>
    80000e3c:	e9cff0ef          	jal	800004d8 <vPortSetInterruptMask>
    80000e40:	87aa                	mv	a5,a0
    80000e42:	f43e                	sd	a5,40(sp)
    80000e44:	77c2                	ld	a5,48(sp)
    80000e46:	7bbc                	ld	a5,112(a5)
    80000e48:	cbb1                	beqz	a5,80000e9c <xQueueReceiveFromISR+0x94>
    80000e4a:	65c2                	ld	a1,16(sp)
    80000e4c:	7542                	ld	a0,48(sp)
    80000e4e:	292000ef          	jal	800010e0 <prvCopyDataFromQueue>
    80000e52:	77c2                	ld	a5,48(sp)
    80000e54:	7bbc                	ld	a5,112(a5)
    80000e56:	fff78713          	addi	a4,a5,-1
    80000e5a:	77c2                	ld	a5,48(sp)
    80000e5c:	fbb8                	sd	a4,112(a5)
    80000e5e:	77c2                	ld	a5,48(sp)
    80000e60:	67d8                	ld	a4,136(a5)
    80000e62:	57fd                	li	a5,-1
    80000e64:	02f71363          	bne	a4,a5,80000e8a <xQueueReceiveFromISR+0x82>
    80000e68:	77c2                	ld	a5,48(sp)
    80000e6a:	739c                	ld	a5,32(a5)
    80000e6c:	c78d                	beqz	a5,80000e96 <xQueueReceiveFromISR+0x8e>
    80000e6e:	77c2                	ld	a5,48(sp)
    80000e70:	02078793          	addi	a5,a5,32
    80000e74:	853e                	mv	a0,a5
    80000e76:	61e010ef          	jal	80002494 <xTaskRemoveFromEventList>
    80000e7a:	87aa                	mv	a5,a0
    80000e7c:	cf89                	beqz	a5,80000e96 <xQueueReceiveFromISR+0x8e>
    80000e7e:	67a2                	ld	a5,8(sp)
    80000e80:	cb99                	beqz	a5,80000e96 <xQueueReceiveFromISR+0x8e>
    80000e82:	67a2                	ld	a5,8(sp)
    80000e84:	4705                	li	a4,1
    80000e86:	e398                	sd	a4,0(a5)
    80000e88:	a039                	j	80000e96 <xQueueReceiveFromISR+0x8e>
    80000e8a:	77c2                	ld	a5,48(sp)
    80000e8c:	67dc                	ld	a5,136(a5)
    80000e8e:	00178713          	addi	a4,a5,1
    80000e92:	77c2                	ld	a5,48(sp)
    80000e94:	e7d8                	sd	a4,136(a5)
    80000e96:	4785                	li	a5,1
    80000e98:	fc3e                	sd	a5,56(sp)
    80000e9a:	a011                	j	80000e9e <xQueueReceiveFromISR+0x96>
    80000e9c:	fc02                	sd	zero,56(sp)
    80000e9e:	77a2                	ld	a5,40(sp)
    80000ea0:	2781                	sext.w	a5,a5
    80000ea2:	853e                	mv	a0,a5
    80000ea4:	e22ff0ef          	jal	800004c6 <vPortClearInterruptMask>
    80000ea8:	77e2                	ld	a5,56(sp)
    80000eaa:	853e                	mv	a0,a5
    80000eac:	60a6                	ld	ra,72(sp)
    80000eae:	6161                	addi	sp,sp,80
    80000eb0:	8082                	ret

0000000080000eb2 <xQueuePeekFromISR>:
    80000eb2:	7139                	addi	sp,sp,-64
    80000eb4:	fc06                	sd	ra,56(sp)
    80000eb6:	e42a                	sd	a0,8(sp)
    80000eb8:	e02e                	sd	a1,0(sp)
    80000eba:	67a2                	ld	a5,8(sp)
    80000ebc:	f03e                	sd	a5,32(sp)
    80000ebe:	7782                	ld	a5,32(sp)
    80000ec0:	e789                	bnez	a5,80000eca <xQueuePeekFromISR+0x18>
    80000ec2:	30047073          	csrci	mstatus,8
    80000ec6:	0001                	nop
    80000ec8:	bffd                	j	80000ec6 <xQueuePeekFromISR+0x14>
    80000eca:	6782                	ld	a5,0(sp)
    80000ecc:	e781                	bnez	a5,80000ed4 <xQueuePeekFromISR+0x22>
    80000ece:	7782                	ld	a5,32(sp)
    80000ed0:	63dc                	ld	a5,128(a5)
    80000ed2:	e399                	bnez	a5,80000ed8 <xQueuePeekFromISR+0x26>
    80000ed4:	4785                	li	a5,1
    80000ed6:	a011                	j	80000eda <xQueuePeekFromISR+0x28>
    80000ed8:	4781                	li	a5,0
    80000eda:	e789                	bnez	a5,80000ee4 <xQueuePeekFromISR+0x32>
    80000edc:	30047073          	csrci	mstatus,8
    80000ee0:	0001                	nop
    80000ee2:	bffd                	j	80000ee0 <xQueuePeekFromISR+0x2e>
    80000ee4:	7782                	ld	a5,32(sp)
    80000ee6:	63dc                	ld	a5,128(a5)
    80000ee8:	e789                	bnez	a5,80000ef2 <xQueuePeekFromISR+0x40>
    80000eea:	30047073          	csrci	mstatus,8
    80000eee:	0001                	nop
    80000ef0:	bffd                	j	80000eee <xQueuePeekFromISR+0x3c>
    80000ef2:	de6ff0ef          	jal	800004d8 <vPortSetInterruptMask>
    80000ef6:	87aa                	mv	a5,a0
    80000ef8:	ec3e                	sd	a5,24(sp)
    80000efa:	7782                	ld	a5,32(sp)
    80000efc:	7bbc                	ld	a5,112(a5)
    80000efe:	cf91                	beqz	a5,80000f1a <xQueuePeekFromISR+0x68>
    80000f00:	7782                	ld	a5,32(sp)
    80000f02:	6f9c                	ld	a5,24(a5)
    80000f04:	e83e                	sd	a5,16(sp)
    80000f06:	6582                	ld	a1,0(sp)
    80000f08:	7502                	ld	a0,32(sp)
    80000f0a:	1d6000ef          	jal	800010e0 <prvCopyDataFromQueue>
    80000f0e:	7782                	ld	a5,32(sp)
    80000f10:	6742                	ld	a4,16(sp)
    80000f12:	ef98                	sd	a4,24(a5)
    80000f14:	4785                	li	a5,1
    80000f16:	f43e                	sd	a5,40(sp)
    80000f18:	a011                	j	80000f1c <xQueuePeekFromISR+0x6a>
    80000f1a:	f402                	sd	zero,40(sp)
    80000f1c:	67e2                	ld	a5,24(sp)
    80000f1e:	2781                	sext.w	a5,a5
    80000f20:	853e                	mv	a0,a5
    80000f22:	da4ff0ef          	jal	800004c6 <vPortClearInterruptMask>
    80000f26:	77a2                	ld	a5,40(sp)
    80000f28:	853e                	mv	a0,a5
    80000f2a:	70e2                	ld	ra,56(sp)
    80000f2c:	6121                	addi	sp,sp,64
    80000f2e:	8082                	ret

0000000080000f30 <uxQueueMessagesWaiting>:
    80000f30:	7179                	addi	sp,sp,-48
    80000f32:	f406                	sd	ra,40(sp)
    80000f34:	e42a                	sd	a0,8(sp)
    80000f36:	67a2                	ld	a5,8(sp)
    80000f38:	e789                	bnez	a5,80000f42 <uxQueueMessagesWaiting+0x12>
    80000f3a:	30047073          	csrci	mstatus,8
    80000f3e:	0001                	nop
    80000f40:	bffd                	j	80000f3e <uxQueueMessagesWaiting+0xe>
    80000f42:	70b010ef          	jal	80002e4c <vTaskEnterCritical>
    80000f46:	67a2                	ld	a5,8(sp)
    80000f48:	7bbc                	ld	a5,112(a5)
    80000f4a:	ec3e                	sd	a5,24(sp)
    80000f4c:	72f010ef          	jal	80002e7a <vTaskExitCritical>
    80000f50:	67e2                	ld	a5,24(sp)
    80000f52:	853e                	mv	a0,a5
    80000f54:	70a2                	ld	ra,40(sp)
    80000f56:	6145                	addi	sp,sp,48
    80000f58:	8082                	ret

0000000080000f5a <uxQueueSpacesAvailable>:
    80000f5a:	7179                	addi	sp,sp,-48
    80000f5c:	f406                	sd	ra,40(sp)
    80000f5e:	e42a                	sd	a0,8(sp)
    80000f60:	67a2                	ld	a5,8(sp)
    80000f62:	ec3e                	sd	a5,24(sp)
    80000f64:	67e2                	ld	a5,24(sp)
    80000f66:	e789                	bnez	a5,80000f70 <uxQueueSpacesAvailable+0x16>
    80000f68:	30047073          	csrci	mstatus,8
    80000f6c:	0001                	nop
    80000f6e:	bffd                	j	80000f6c <uxQueueSpacesAvailable+0x12>
    80000f70:	6dd010ef          	jal	80002e4c <vTaskEnterCritical>
    80000f74:	67e2                	ld	a5,24(sp)
    80000f76:	7fb8                	ld	a4,120(a5)
    80000f78:	67e2                	ld	a5,24(sp)
    80000f7a:	7bbc                	ld	a5,112(a5)
    80000f7c:	40f707b3          	sub	a5,a4,a5
    80000f80:	e83e                	sd	a5,16(sp)
    80000f82:	6f9010ef          	jal	80002e7a <vTaskExitCritical>
    80000f86:	67c2                	ld	a5,16(sp)
    80000f88:	853e                	mv	a0,a5
    80000f8a:	70a2                	ld	ra,40(sp)
    80000f8c:	6145                	addi	sp,sp,48
    80000f8e:	8082                	ret

0000000080000f90 <uxQueueMessagesWaitingFromISR>:
    80000f90:	1101                	addi	sp,sp,-32
    80000f92:	e42a                	sd	a0,8(sp)
    80000f94:	67a2                	ld	a5,8(sp)
    80000f96:	e789                	bnez	a5,80000fa0 <uxQueueMessagesWaitingFromISR+0x10>
    80000f98:	30047073          	csrci	mstatus,8
    80000f9c:	0001                	nop
    80000f9e:	bffd                	j	80000f9c <uxQueueMessagesWaitingFromISR+0xc>
    80000fa0:	67a2                	ld	a5,8(sp)
    80000fa2:	7bbc                	ld	a5,112(a5)
    80000fa4:	ec3e                	sd	a5,24(sp)
    80000fa6:	67e2                	ld	a5,24(sp)
    80000fa8:	853e                	mv	a0,a5
    80000faa:	6105                	addi	sp,sp,32
    80000fac:	8082                	ret

0000000080000fae <vQueueDelete>:
    80000fae:	7179                	addi	sp,sp,-48
    80000fb0:	f406                	sd	ra,40(sp)
    80000fb2:	e42a                	sd	a0,8(sp)
    80000fb4:	67a2                	ld	a5,8(sp)
    80000fb6:	ec3e                	sd	a5,24(sp)
    80000fb8:	67e2                	ld	a5,24(sp)
    80000fba:	e789                	bnez	a5,80000fc4 <vQueueDelete+0x16>
    80000fbc:	30047073          	csrci	mstatus,8
    80000fc0:	0001                	nop
    80000fc2:	bffd                	j	80000fc0 <vQueueDelete+0x12>
    80000fc4:	6562                	ld	a0,24(sp)
    80000fc6:	2f2000ef          	jal	800012b8 <vQueueUnregisterQueue>
    80000fca:	6562                	ld	a0,24(sp)
    80000fcc:	390030ef          	jal	8000435c <vPortFree>
    80000fd0:	0001                	nop
    80000fd2:	70a2                	ld	ra,40(sp)
    80000fd4:	6145                	addi	sp,sp,48
    80000fd6:	8082                	ret

0000000080000fd8 <uxQueueGetQueueNumber>:
    80000fd8:	1141                	addi	sp,sp,-16
    80000fda:	e42a                	sd	a0,8(sp)
    80000fdc:	67a2                	ld	a5,8(sp)
    80000fde:	6fdc                	ld	a5,152(a5)
    80000fe0:	853e                	mv	a0,a5
    80000fe2:	0141                	addi	sp,sp,16
    80000fe4:	8082                	ret

0000000080000fe6 <vQueueSetQueueNumber>:
    80000fe6:	1141                	addi	sp,sp,-16
    80000fe8:	e42a                	sd	a0,8(sp)
    80000fea:	e02e                	sd	a1,0(sp)
    80000fec:	67a2                	ld	a5,8(sp)
    80000fee:	6702                	ld	a4,0(sp)
    80000ff0:	efd8                	sd	a4,152(a5)
    80000ff2:	0001                	nop
    80000ff4:	0141                	addi	sp,sp,16
    80000ff6:	8082                	ret

0000000080000ff8 <ucQueueGetQueueType>:
    80000ff8:	1141                	addi	sp,sp,-16
    80000ffa:	e42a                	sd	a0,8(sp)
    80000ffc:	67a2                	ld	a5,8(sp)
    80000ffe:	0a07c783          	lbu	a5,160(a5)
    80001002:	853e                	mv	a0,a5
    80001004:	0141                	addi	sp,sp,16
    80001006:	8082                	ret

0000000080001008 <prvCopyDataToQueue>:
    80001008:	7139                	addi	sp,sp,-64
    8000100a:	fc06                	sd	ra,56(sp)
    8000100c:	ec2a                	sd	a0,24(sp)
    8000100e:	e82e                	sd	a1,16(sp)
    80001010:	e432                	sd	a2,8(sp)
    80001012:	f402                	sd	zero,40(sp)
    80001014:	67e2                	ld	a5,24(sp)
    80001016:	63dc                	ld	a5,128(a5)
    80001018:	ef91                	bnez	a5,80001034 <prvCopyDataToQueue+0x2c>
    8000101a:	67e2                	ld	a5,24(sp)
    8000101c:	639c                	ld	a5,0(a5)
    8000101e:	e7d5                	bnez	a5,800010ca <prvCopyDataToQueue+0xc2>
    80001020:	67e2                	ld	a5,24(sp)
    80001022:	679c                	ld	a5,8(a5)
    80001024:	853e                	mv	a0,a5
    80001026:	55d010ef          	jal	80002d82 <xTaskPriorityDisinherit>
    8000102a:	f42a                	sd	a0,40(sp)
    8000102c:	67e2                	ld	a5,24(sp)
    8000102e:	0007b423          	sd	zero,8(a5)
    80001032:	a861                	j	800010ca <prvCopyDataToQueue+0xc2>
    80001034:	67a2                	ld	a5,8(sp)
    80001036:	ef85                	bnez	a5,8000106e <prvCopyDataToQueue+0x66>
    80001038:	67e2                	ld	a5,24(sp)
    8000103a:	6b98                	ld	a4,16(a5)
    8000103c:	67e2                	ld	a5,24(sp)
    8000103e:	63dc                	ld	a5,128(a5)
    80001040:	863e                	mv	a2,a5
    80001042:	65c2                	ld	a1,16(sp)
    80001044:	853a                	mv	a0,a4
    80001046:	400030ef          	jal	80004446 <memcpy>
    8000104a:	67e2                	ld	a5,24(sp)
    8000104c:	6b98                	ld	a4,16(a5)
    8000104e:	67e2                	ld	a5,24(sp)
    80001050:	63dc                	ld	a5,128(a5)
    80001052:	973e                	add	a4,a4,a5
    80001054:	67e2                	ld	a5,24(sp)
    80001056:	eb98                	sd	a4,16(a5)
    80001058:	67e2                	ld	a5,24(sp)
    8000105a:	6b98                	ld	a4,16(a5)
    8000105c:	67e2                	ld	a5,24(sp)
    8000105e:	679c                	ld	a5,8(a5)
    80001060:	06f76563          	bltu	a4,a5,800010ca <prvCopyDataToQueue+0xc2>
    80001064:	67e2                	ld	a5,24(sp)
    80001066:	6398                	ld	a4,0(a5)
    80001068:	67e2                	ld	a5,24(sp)
    8000106a:	eb98                	sd	a4,16(a5)
    8000106c:	a8b9                	j	800010ca <prvCopyDataToQueue+0xc2>
    8000106e:	67e2                	ld	a5,24(sp)
    80001070:	6f98                	ld	a4,24(a5)
    80001072:	67e2                	ld	a5,24(sp)
    80001074:	63dc                	ld	a5,128(a5)
    80001076:	863e                	mv	a2,a5
    80001078:	65c2                	ld	a1,16(sp)
    8000107a:	853a                	mv	a0,a4
    8000107c:	3ca030ef          	jal	80004446 <memcpy>
    80001080:	67e2                	ld	a5,24(sp)
    80001082:	6f98                	ld	a4,24(a5)
    80001084:	67e2                	ld	a5,24(sp)
    80001086:	63dc                	ld	a5,128(a5)
    80001088:	40f007b3          	neg	a5,a5
    8000108c:	973e                	add	a4,a4,a5
    8000108e:	67e2                	ld	a5,24(sp)
    80001090:	ef98                	sd	a4,24(a5)
    80001092:	67e2                	ld	a5,24(sp)
    80001094:	6f98                	ld	a4,24(a5)
    80001096:	67e2                	ld	a5,24(sp)
    80001098:	639c                	ld	a5,0(a5)
    8000109a:	00f77b63          	bgeu	a4,a5,800010b0 <prvCopyDataToQueue+0xa8>
    8000109e:	67e2                	ld	a5,24(sp)
    800010a0:	6798                	ld	a4,8(a5)
    800010a2:	67e2                	ld	a5,24(sp)
    800010a4:	63dc                	ld	a5,128(a5)
    800010a6:	40f007b3          	neg	a5,a5
    800010aa:	973e                	add	a4,a4,a5
    800010ac:	67e2                	ld	a5,24(sp)
    800010ae:	ef98                	sd	a4,24(a5)
    800010b0:	6722                	ld	a4,8(sp)
    800010b2:	4789                	li	a5,2
    800010b4:	00f71b63          	bne	a4,a5,800010ca <prvCopyDataToQueue+0xc2>
    800010b8:	67e2                	ld	a5,24(sp)
    800010ba:	7bbc                	ld	a5,112(a5)
    800010bc:	c799                	beqz	a5,800010ca <prvCopyDataToQueue+0xc2>
    800010be:	67e2                	ld	a5,24(sp)
    800010c0:	7bbc                	ld	a5,112(a5)
    800010c2:	fff78713          	addi	a4,a5,-1
    800010c6:	67e2                	ld	a5,24(sp)
    800010c8:	fbb8                	sd	a4,112(a5)
    800010ca:	67e2                	ld	a5,24(sp)
    800010cc:	7bbc                	ld	a5,112(a5)
    800010ce:	00178713          	addi	a4,a5,1
    800010d2:	67e2                	ld	a5,24(sp)
    800010d4:	fbb8                	sd	a4,112(a5)
    800010d6:	77a2                	ld	a5,40(sp)
    800010d8:	853e                	mv	a0,a5
    800010da:	70e2                	ld	ra,56(sp)
    800010dc:	6121                	addi	sp,sp,64
    800010de:	8082                	ret

00000000800010e0 <prvCopyDataFromQueue>:
    800010e0:	1101                	addi	sp,sp,-32
    800010e2:	ec06                	sd	ra,24(sp)
    800010e4:	e42a                	sd	a0,8(sp)
    800010e6:	e02e                	sd	a1,0(sp)
    800010e8:	67a2                	ld	a5,8(sp)
    800010ea:	63dc                	ld	a5,128(a5)
    800010ec:	cb9d                	beqz	a5,80001122 <prvCopyDataFromQueue+0x42>
    800010ee:	67a2                	ld	a5,8(sp)
    800010f0:	6f98                	ld	a4,24(a5)
    800010f2:	67a2                	ld	a5,8(sp)
    800010f4:	63dc                	ld	a5,128(a5)
    800010f6:	973e                	add	a4,a4,a5
    800010f8:	67a2                	ld	a5,8(sp)
    800010fa:	ef98                	sd	a4,24(a5)
    800010fc:	67a2                	ld	a5,8(sp)
    800010fe:	6f98                	ld	a4,24(a5)
    80001100:	67a2                	ld	a5,8(sp)
    80001102:	679c                	ld	a5,8(a5)
    80001104:	00f76663          	bltu	a4,a5,80001110 <prvCopyDataFromQueue+0x30>
    80001108:	67a2                	ld	a5,8(sp)
    8000110a:	6398                	ld	a4,0(a5)
    8000110c:	67a2                	ld	a5,8(sp)
    8000110e:	ef98                	sd	a4,24(a5)
    80001110:	67a2                	ld	a5,8(sp)
    80001112:	6f98                	ld	a4,24(a5)
    80001114:	67a2                	ld	a5,8(sp)
    80001116:	63dc                	ld	a5,128(a5)
    80001118:	863e                	mv	a2,a5
    8000111a:	85ba                	mv	a1,a4
    8000111c:	6502                	ld	a0,0(sp)
    8000111e:	328030ef          	jal	80004446 <memcpy>
    80001122:	0001                	nop
    80001124:	60e2                	ld	ra,24(sp)
    80001126:	6105                	addi	sp,sp,32
    80001128:	8082                	ret

000000008000112a <prvUnlockQueue>:
    8000112a:	1101                	addi	sp,sp,-32
    8000112c:	ec06                	sd	ra,24(sp)
    8000112e:	e42a                	sd	a0,8(sp)
    80001130:	51d010ef          	jal	80002e4c <vTaskEnterCritical>
    80001134:	a025                	j	8000115c <prvUnlockQueue+0x32>
    80001136:	67a2                	ld	a5,8(sp)
    80001138:	67bc                	ld	a5,72(a5)
    8000113a:	c795                	beqz	a5,80001166 <prvUnlockQueue+0x3c>
    8000113c:	67a2                	ld	a5,8(sp)
    8000113e:	04878793          	addi	a5,a5,72
    80001142:	853e                	mv	a0,a5
    80001144:	350010ef          	jal	80002494 <xTaskRemoveFromEventList>
    80001148:	87aa                	mv	a5,a0
    8000114a:	c399                	beqz	a5,80001150 <prvUnlockQueue+0x26>
    8000114c:	5b8010ef          	jal	80002704 <vTaskMissedYield>
    80001150:	67a2                	ld	a5,8(sp)
    80001152:	6bdc                	ld	a5,144(a5)
    80001154:	fff78713          	addi	a4,a5,-1
    80001158:	67a2                	ld	a5,8(sp)
    8000115a:	ebd8                	sd	a4,144(a5)
    8000115c:	67a2                	ld	a5,8(sp)
    8000115e:	6bdc                	ld	a5,144(a5)
    80001160:	fcf04be3          	bgtz	a5,80001136 <prvUnlockQueue+0xc>
    80001164:	a011                	j	80001168 <prvUnlockQueue+0x3e>
    80001166:	0001                	nop
    80001168:	67a2                	ld	a5,8(sp)
    8000116a:	577d                	li	a4,-1
    8000116c:	ebd8                	sd	a4,144(a5)
    8000116e:	50d010ef          	jal	80002e7a <vTaskExitCritical>
    80001172:	4db010ef          	jal	80002e4c <vTaskEnterCritical>
    80001176:	a025                	j	8000119e <prvUnlockQueue+0x74>
    80001178:	67a2                	ld	a5,8(sp)
    8000117a:	739c                	ld	a5,32(a5)
    8000117c:	c795                	beqz	a5,800011a8 <prvUnlockQueue+0x7e>
    8000117e:	67a2                	ld	a5,8(sp)
    80001180:	02078793          	addi	a5,a5,32
    80001184:	853e                	mv	a0,a5
    80001186:	30e010ef          	jal	80002494 <xTaskRemoveFromEventList>
    8000118a:	87aa                	mv	a5,a0
    8000118c:	c399                	beqz	a5,80001192 <prvUnlockQueue+0x68>
    8000118e:	576010ef          	jal	80002704 <vTaskMissedYield>
    80001192:	67a2                	ld	a5,8(sp)
    80001194:	67dc                	ld	a5,136(a5)
    80001196:	fff78713          	addi	a4,a5,-1
    8000119a:	67a2                	ld	a5,8(sp)
    8000119c:	e7d8                	sd	a4,136(a5)
    8000119e:	67a2                	ld	a5,8(sp)
    800011a0:	67dc                	ld	a5,136(a5)
    800011a2:	fcf04be3          	bgtz	a5,80001178 <prvUnlockQueue+0x4e>
    800011a6:	a011                	j	800011aa <prvUnlockQueue+0x80>
    800011a8:	0001                	nop
    800011aa:	67a2                	ld	a5,8(sp)
    800011ac:	577d                	li	a4,-1
    800011ae:	e7d8                	sd	a4,136(a5)
    800011b0:	4cb010ef          	jal	80002e7a <vTaskExitCritical>
    800011b4:	0001                	nop
    800011b6:	60e2                	ld	ra,24(sp)
    800011b8:	6105                	addi	sp,sp,32
    800011ba:	8082                	ret

00000000800011bc <prvIsQueueEmpty>:
    800011bc:	7179                	addi	sp,sp,-48
    800011be:	f406                	sd	ra,40(sp)
    800011c0:	e42a                	sd	a0,8(sp)
    800011c2:	48b010ef          	jal	80002e4c <vTaskEnterCritical>
    800011c6:	67a2                	ld	a5,8(sp)
    800011c8:	7bbc                	ld	a5,112(a5)
    800011ca:	e781                	bnez	a5,800011d2 <prvIsQueueEmpty+0x16>
    800011cc:	4785                	li	a5,1
    800011ce:	ec3e                	sd	a5,24(sp)
    800011d0:	a011                	j	800011d4 <prvIsQueueEmpty+0x18>
    800011d2:	ec02                	sd	zero,24(sp)
    800011d4:	4a7010ef          	jal	80002e7a <vTaskExitCritical>
    800011d8:	67e2                	ld	a5,24(sp)
    800011da:	853e                	mv	a0,a5
    800011dc:	70a2                	ld	ra,40(sp)
    800011de:	6145                	addi	sp,sp,48
    800011e0:	8082                	ret

00000000800011e2 <xQueueIsQueueEmptyFromISR>:
    800011e2:	1101                	addi	sp,sp,-32
    800011e4:	e42a                	sd	a0,8(sp)
    800011e6:	67a2                	ld	a5,8(sp)
    800011e8:	e789                	bnez	a5,800011f2 <xQueueIsQueueEmptyFromISR+0x10>
    800011ea:	30047073          	csrci	mstatus,8
    800011ee:	0001                	nop
    800011f0:	bffd                	j	800011ee <xQueueIsQueueEmptyFromISR+0xc>
    800011f2:	67a2                	ld	a5,8(sp)
    800011f4:	7bbc                	ld	a5,112(a5)
    800011f6:	e781                	bnez	a5,800011fe <xQueueIsQueueEmptyFromISR+0x1c>
    800011f8:	4785                	li	a5,1
    800011fa:	ec3e                	sd	a5,24(sp)
    800011fc:	a011                	j	80001200 <xQueueIsQueueEmptyFromISR+0x1e>
    800011fe:	ec02                	sd	zero,24(sp)
    80001200:	67e2                	ld	a5,24(sp)
    80001202:	853e                	mv	a0,a5
    80001204:	6105                	addi	sp,sp,32
    80001206:	8082                	ret

0000000080001208 <prvIsQueueFull>:
    80001208:	7179                	addi	sp,sp,-48
    8000120a:	f406                	sd	ra,40(sp)
    8000120c:	e42a                	sd	a0,8(sp)
    8000120e:	43f010ef          	jal	80002e4c <vTaskEnterCritical>
    80001212:	67a2                	ld	a5,8(sp)
    80001214:	7bb8                	ld	a4,112(a5)
    80001216:	67a2                	ld	a5,8(sp)
    80001218:	7fbc                	ld	a5,120(a5)
    8000121a:	00f71563          	bne	a4,a5,80001224 <prvIsQueueFull+0x1c>
    8000121e:	4785                	li	a5,1
    80001220:	ec3e                	sd	a5,24(sp)
    80001222:	a011                	j	80001226 <prvIsQueueFull+0x1e>
    80001224:	ec02                	sd	zero,24(sp)
    80001226:	455010ef          	jal	80002e7a <vTaskExitCritical>
    8000122a:	67e2                	ld	a5,24(sp)
    8000122c:	853e                	mv	a0,a5
    8000122e:	70a2                	ld	ra,40(sp)
    80001230:	6145                	addi	sp,sp,48
    80001232:	8082                	ret

0000000080001234 <xQueueIsQueueFullFromISR>:
    80001234:	1101                	addi	sp,sp,-32
    80001236:	e42a                	sd	a0,8(sp)
    80001238:	67a2                	ld	a5,8(sp)
    8000123a:	e789                	bnez	a5,80001244 <xQueueIsQueueFullFromISR+0x10>
    8000123c:	30047073          	csrci	mstatus,8
    80001240:	0001                	nop
    80001242:	bffd                	j	80001240 <xQueueIsQueueFullFromISR+0xc>
    80001244:	67a2                	ld	a5,8(sp)
    80001246:	7bb8                	ld	a4,112(a5)
    80001248:	67a2                	ld	a5,8(sp)
    8000124a:	7fbc                	ld	a5,120(a5)
    8000124c:	00f71563          	bne	a4,a5,80001256 <xQueueIsQueueFullFromISR+0x22>
    80001250:	4785                	li	a5,1
    80001252:	ec3e                	sd	a5,24(sp)
    80001254:	a011                	j	80001258 <xQueueIsQueueFullFromISR+0x24>
    80001256:	ec02                	sd	zero,24(sp)
    80001258:	67e2                	ld	a5,24(sp)
    8000125a:	853e                	mv	a0,a5
    8000125c:	6105                	addi	sp,sp,32
    8000125e:	8082                	ret

0000000080001260 <vQueueAddToRegistry>:
    80001260:	1101                	addi	sp,sp,-32
    80001262:	e42a                	sd	a0,8(sp)
    80001264:	e02e                	sd	a1,0(sp)
    80001266:	ec02                	sd	zero,24(sp)
    80001268:	a081                	j	800012a8 <vQueueAddToRegistry+0x48>
    8000126a:	0001f717          	auipc	a4,0x1f
    8000126e:	28e70713          	addi	a4,a4,654 # 800204f8 <xQueueRegistry>
    80001272:	67e2                	ld	a5,24(sp)
    80001274:	0792                	slli	a5,a5,0x4
    80001276:	97ba                	add	a5,a5,a4
    80001278:	639c                	ld	a5,0(a5)
    8000127a:	e785                	bnez	a5,800012a2 <vQueueAddToRegistry+0x42>
    8000127c:	0001f717          	auipc	a4,0x1f
    80001280:	27c70713          	addi	a4,a4,636 # 800204f8 <xQueueRegistry>
    80001284:	67e2                	ld	a5,24(sp)
    80001286:	0792                	slli	a5,a5,0x4
    80001288:	97ba                	add	a5,a5,a4
    8000128a:	6702                	ld	a4,0(sp)
    8000128c:	e398                	sd	a4,0(a5)
    8000128e:	0001f717          	auipc	a4,0x1f
    80001292:	26a70713          	addi	a4,a4,618 # 800204f8 <xQueueRegistry>
    80001296:	67e2                	ld	a5,24(sp)
    80001298:	0792                	slli	a5,a5,0x4
    8000129a:	97ba                	add	a5,a5,a4
    8000129c:	6722                	ld	a4,8(sp)
    8000129e:	e798                	sd	a4,8(a5)
    800012a0:	a809                	j	800012b2 <vQueueAddToRegistry+0x52>
    800012a2:	67e2                	ld	a5,24(sp)
    800012a4:	0785                	addi	a5,a5,1
    800012a6:	ec3e                	sd	a5,24(sp)
    800012a8:	6762                	ld	a4,24(sp)
    800012aa:	479d                	li	a5,7
    800012ac:	fae7ffe3          	bgeu	a5,a4,8000126a <vQueueAddToRegistry+0xa>
    800012b0:	0001                	nop
    800012b2:	0001                	nop
    800012b4:	6105                	addi	sp,sp,32
    800012b6:	8082                	ret

00000000800012b8 <vQueueUnregisterQueue>:
    800012b8:	1101                	addi	sp,sp,-32
    800012ba:	e42a                	sd	a0,8(sp)
    800012bc:	ec02                	sd	zero,24(sp)
    800012be:	a80d                	j	800012f0 <vQueueUnregisterQueue+0x38>
    800012c0:	0001f717          	auipc	a4,0x1f
    800012c4:	23870713          	addi	a4,a4,568 # 800204f8 <xQueueRegistry>
    800012c8:	67e2                	ld	a5,24(sp)
    800012ca:	0792                	slli	a5,a5,0x4
    800012cc:	97ba                	add	a5,a5,a4
    800012ce:	679c                	ld	a5,8(a5)
    800012d0:	6722                	ld	a4,8(sp)
    800012d2:	00f71c63          	bne	a4,a5,800012ea <vQueueUnregisterQueue+0x32>
    800012d6:	0001f717          	auipc	a4,0x1f
    800012da:	22270713          	addi	a4,a4,546 # 800204f8 <xQueueRegistry>
    800012de:	67e2                	ld	a5,24(sp)
    800012e0:	0792                	slli	a5,a5,0x4
    800012e2:	97ba                	add	a5,a5,a4
    800012e4:	0007b023          	sd	zero,0(a5)
    800012e8:	a809                	j	800012fa <vQueueUnregisterQueue+0x42>
    800012ea:	67e2                	ld	a5,24(sp)
    800012ec:	0785                	addi	a5,a5,1
    800012ee:	ec3e                	sd	a5,24(sp)
    800012f0:	6762                	ld	a4,24(sp)
    800012f2:	479d                	li	a5,7
    800012f4:	fce7f6e3          	bgeu	a5,a4,800012c0 <vQueueUnregisterQueue+0x8>
    800012f8:	0001                	nop
    800012fa:	0001                	nop
    800012fc:	6105                	addi	sp,sp,32
    800012fe:	8082                	ret

0000000080001300 <vQueueWaitForMessageRestricted>:
    80001300:	7139                	addi	sp,sp,-64
    80001302:	fc06                	sd	ra,56(sp)
    80001304:	ec2a                	sd	a0,24(sp)
    80001306:	87ae                	mv	a5,a1
    80001308:	e432                	sd	a2,8(sp)
    8000130a:	ca3e                	sw	a5,20(sp)
    8000130c:	67e2                	ld	a5,24(sp)
    8000130e:	f43e                	sd	a5,40(sp)
    80001310:	33d010ef          	jal	80002e4c <vTaskEnterCritical>
    80001314:	77a2                	ld	a5,40(sp)
    80001316:	67d8                	ld	a4,136(a5)
    80001318:	57fd                	li	a5,-1
    8000131a:	00f71563          	bne	a4,a5,80001324 <vQueueWaitForMessageRestricted+0x24>
    8000131e:	77a2                	ld	a5,40(sp)
    80001320:	0807b423          	sd	zero,136(a5)
    80001324:	77a2                	ld	a5,40(sp)
    80001326:	6bd8                	ld	a4,144(a5)
    80001328:	57fd                	li	a5,-1
    8000132a:	00f71563          	bne	a4,a5,80001334 <vQueueWaitForMessageRestricted+0x34>
    8000132e:	77a2                	ld	a5,40(sp)
    80001330:	0807b823          	sd	zero,144(a5)
    80001334:	347010ef          	jal	80002e7a <vTaskExitCritical>
    80001338:	77a2                	ld	a5,40(sp)
    8000133a:	7bbc                	ld	a5,112(a5)
    8000133c:	eb91                	bnez	a5,80001350 <vQueueWaitForMessageRestricted+0x50>
    8000133e:	77a2                	ld	a5,40(sp)
    80001340:	04878793          	addi	a5,a5,72
    80001344:	4752                	lw	a4,20(sp)
    80001346:	6622                	ld	a2,8(sp)
    80001348:	85ba                	mv	a1,a4
    8000134a:	853e                	mv	a0,a5
    8000134c:	0c2010ef          	jal	8000240e <vTaskPlaceOnEventListRestricted>
    80001350:	7522                	ld	a0,40(sp)
    80001352:	dd9ff0ef          	jal	8000112a <prvUnlockQueue>
    80001356:	0001                	nop
    80001358:	70e2                	ld	ra,56(sp)
    8000135a:	6121                	addi	sp,sp,64
    8000135c:	8082                	ret

000000008000135e <xTaskGenericCreate>:
    8000135e:	7159                	addi	sp,sp,-112
    80001360:	f486                	sd	ra,104(sp)
    80001362:	fc2a                	sd	a0,56(sp)
    80001364:	f82e                	sd	a1,48(sp)
    80001366:	f036                	sd	a3,32(sp)
    80001368:	ec3a                	sd	a4,24(sp)
    8000136a:	e83e                	sd	a5,16(sp)
    8000136c:	e442                	sd	a6,8(sp)
    8000136e:	e046                	sd	a7,0(sp)
    80001370:	87b2                	mv	a5,a2
    80001372:	02f11723          	sh	a5,46(sp)
    80001376:	77e2                	ld	a5,56(sp)
    80001378:	e789                	bnez	a5,80001382 <xTaskGenericCreate+0x24>
    8000137a:	30047073          	csrci	mstatus,8
    8000137e:	0001                	nop
    80001380:	bffd                	j	8000137e <xTaskGenericCreate+0x20>
    80001382:	6762                	ld	a4,24(sp)
    80001384:	4791                	li	a5,4
    80001386:	00e7f663          	bgeu	a5,a4,80001392 <xTaskGenericCreate+0x34>
    8000138a:	30047073          	csrci	mstatus,8
    8000138e:	0001                	nop
    80001390:	bffd                	j	8000138e <xTaskGenericCreate+0x30>
    80001392:	02e15783          	lhu	a5,46(sp)
    80001396:	65a2                	ld	a1,8(sp)
    80001398:	853e                	mv	a0,a5
    8000139a:	64a010ef          	jal	800029e4 <prvAllocateTCBAndStack>
    8000139e:	e8aa                	sd	a0,80(sp)
    800013a0:	67c6                	ld	a5,80(sp)
    800013a2:	12078d63          	beqz	a5,800014dc <xTaskGenericCreate+0x17e>
    800013a6:	67c6                	ld	a5,80(sp)
    800013a8:	73b8                	ld	a4,96(a5)
    800013aa:	02e15783          	lhu	a5,46(sp)
    800013ae:	078e                	slli	a5,a5,0x3
    800013b0:	17e1                	addi	a5,a5,-8
    800013b2:	97ba                	add	a5,a5,a4
    800013b4:	e4be                	sd	a5,72(sp)
    800013b6:	67a6                	ld	a5,72(sp)
    800013b8:	9be1                	andi	a5,a5,-8
    800013ba:	e4be                	sd	a5,72(sp)
    800013bc:	67a6                	ld	a5,72(sp)
    800013be:	8b9d                	andi	a5,a5,7
    800013c0:	c789                	beqz	a5,800013ca <xTaskGenericCreate+0x6c>
    800013c2:	30047073          	csrci	mstatus,8
    800013c6:	0001                	nop
    800013c8:	bffd                	j	800013c6 <xTaskGenericCreate+0x68>
    800013ca:	02e15783          	lhu	a5,46(sp)
    800013ce:	873e                	mv	a4,a5
    800013d0:	6682                	ld	a3,0(sp)
    800013d2:	6662                	ld	a2,24(sp)
    800013d4:	75c2                	ld	a1,48(sp)
    800013d6:	6546                	ld	a0,80(sp)
    800013d8:	394010ef          	jal	8000276c <prvInitialiseTCBVariables>
    800013dc:	7602                	ld	a2,32(sp)
    800013de:	75e2                	ld	a1,56(sp)
    800013e0:	6526                	ld	a0,72(sp)
    800013e2:	90aff0ef          	jal	800004ec <pxPortInitialiseStack>
    800013e6:	872a                	mv	a4,a0
    800013e8:	67c6                	ld	a5,80(sp)
    800013ea:	e398                	sd	a4,0(a5)
    800013ec:	67c2                	ld	a5,16(sp)
    800013ee:	c781                	beqz	a5,800013f6 <xTaskGenericCreate+0x98>
    800013f0:	67c2                	ld	a5,16(sp)
    800013f2:	6746                	ld	a4,80(sp)
    800013f4:	e398                	sd	a4,0(a5)
    800013f6:	257010ef          	jal	80002e4c <vTaskEnterCritical>
    800013fa:	0001f797          	auipc	a5,0x1f
    800013fe:	32678793          	addi	a5,a5,806 # 80020720 <uxCurrentNumberOfTasks>
    80001402:	639c                	ld	a5,0(a5)
    80001404:	00178713          	addi	a4,a5,1
    80001408:	0001f797          	auipc	a5,0x1f
    8000140c:	31878793          	addi	a5,a5,792 # 80020720 <uxCurrentNumberOfTasks>
    80001410:	e398                	sd	a4,0(a5)
    80001412:	0001f797          	auipc	a5,0x1f
    80001416:	f2e78793          	addi	a5,a5,-210 # 80020340 <pxCurrentTCB>
    8000141a:	639c                	ld	a5,0(a5)
    8000141c:	e395                	bnez	a5,80001440 <xTaskGenericCreate+0xe2>
    8000141e:	0001f797          	auipc	a5,0x1f
    80001422:	f2278793          	addi	a5,a5,-222 # 80020340 <pxCurrentTCB>
    80001426:	6746                	ld	a4,80(sp)
    80001428:	e398                	sd	a4,0(a5)
    8000142a:	0001f797          	auipc	a5,0x1f
    8000142e:	2f678793          	addi	a5,a5,758 # 80020720 <uxCurrentNumberOfTasks>
    80001432:	6398                	ld	a4,0(a5)
    80001434:	4785                	li	a5,1
    80001436:	02f71a63          	bne	a4,a5,8000146a <xTaskGenericCreate+0x10c>
    8000143a:	3ec010ef          	jal	80002826 <prvInitialiseTaskLists>
    8000143e:	a035                	j	8000146a <xTaskGenericCreate+0x10c>
    80001440:	0001f797          	auipc	a5,0x1f
    80001444:	2f878793          	addi	a5,a5,760 # 80020738 <xSchedulerRunning>
    80001448:	639c                	ld	a5,0(a5)
    8000144a:	e385                	bnez	a5,8000146a <xTaskGenericCreate+0x10c>
    8000144c:	0001f797          	auipc	a5,0x1f
    80001450:	ef478793          	addi	a5,a5,-268 # 80020340 <pxCurrentTCB>
    80001454:	639c                	ld	a5,0(a5)
    80001456:	6fbc                	ld	a5,88(a5)
    80001458:	6762                	ld	a4,24(sp)
    8000145a:	00f76863          	bltu	a4,a5,8000146a <xTaskGenericCreate+0x10c>
    8000145e:	0001f797          	auipc	a5,0x1f
    80001462:	ee278793          	addi	a5,a5,-286 # 80020340 <pxCurrentTCB>
    80001466:	6746                	ld	a4,80(sp)
    80001468:	e398                	sd	a4,0(a5)
    8000146a:	0001f797          	auipc	a5,0x1f
    8000146e:	2ee78793          	addi	a5,a5,750 # 80020758 <uxTaskNumber>
    80001472:	639c                	ld	a5,0(a5)
    80001474:	00178713          	addi	a4,a5,1
    80001478:	0001f797          	auipc	a5,0x1f
    8000147c:	2e078793          	addi	a5,a5,736 # 80020758 <uxTaskNumber>
    80001480:	e398                	sd	a4,0(a5)
    80001482:	0001f797          	auipc	a5,0x1f
    80001486:	2d678793          	addi	a5,a5,726 # 80020758 <uxTaskNumber>
    8000148a:	6398                	ld	a4,0(a5)
    8000148c:	67c6                	ld	a5,80(sp)
    8000148e:	e3d8                	sd	a4,128(a5)
    80001490:	67c6                	ld	a5,80(sp)
    80001492:	6fb8                	ld	a4,88(a5)
    80001494:	0001f797          	auipc	a5,0x1f
    80001498:	29c78793          	addi	a5,a5,668 # 80020730 <uxTopReadyPriority>
    8000149c:	639c                	ld	a5,0(a5)
    8000149e:	00e7f963          	bgeu	a5,a4,800014b0 <xTaskGenericCreate+0x152>
    800014a2:	67c6                	ld	a5,80(sp)
    800014a4:	6fb8                	ld	a4,88(a5)
    800014a6:	0001f797          	auipc	a5,0x1f
    800014aa:	28a78793          	addi	a5,a5,650 # 80020730 <uxTopReadyPriority>
    800014ae:	e398                	sd	a4,0(a5)
    800014b0:	67c6                	ld	a5,80(sp)
    800014b2:	6fb8                	ld	a4,88(a5)
    800014b4:	87ba                	mv	a5,a4
    800014b6:	078a                	slli	a5,a5,0x2
    800014b8:	97ba                	add	a5,a5,a4
    800014ba:	078e                	slli	a5,a5,0x3
    800014bc:	0001f717          	auipc	a4,0x1f
    800014c0:	0bc70713          	addi	a4,a4,188 # 80020578 <pxReadyTasksLists>
    800014c4:	973e                	add	a4,a4,a5
    800014c6:	67c6                	ld	a5,80(sp)
    800014c8:	07a1                	addi	a5,a5,8
    800014ca:	85be                	mv	a1,a5
    800014cc:	853a                	mv	a0,a4
    800014ce:	8caff0ef          	jal	80000598 <vListInsertEnd>
    800014d2:	4785                	li	a5,1
    800014d4:	ecbe                	sd	a5,88(sp)
    800014d6:	1a5010ef          	jal	80002e7a <vTaskExitCritical>
    800014da:	a019                	j	800014e0 <xTaskGenericCreate+0x182>
    800014dc:	57fd                	li	a5,-1
    800014de:	ecbe                	sd	a5,88(sp)
    800014e0:	6766                	ld	a4,88(sp)
    800014e2:	4785                	li	a5,1
    800014e4:	02f71363          	bne	a4,a5,8000150a <xTaskGenericCreate+0x1ac>
    800014e8:	0001f797          	auipc	a5,0x1f
    800014ec:	25078793          	addi	a5,a5,592 # 80020738 <xSchedulerRunning>
    800014f0:	639c                	ld	a5,0(a5)
    800014f2:	cf81                	beqz	a5,8000150a <xTaskGenericCreate+0x1ac>
    800014f4:	0001f797          	auipc	a5,0x1f
    800014f8:	e4c78793          	addi	a5,a5,-436 # 80020340 <pxCurrentTCB>
    800014fc:	639c                	ld	a5,0(a5)
    800014fe:	6fbc                	ld	a5,88(a5)
    80001500:	6762                	ld	a4,24(sp)
    80001502:	00e7f463          	bgeu	a5,a4,8000150a <xTaskGenericCreate+0x1ac>
    80001506:	ea1fe0ef          	jal	800003a6 <vPortYield>
    8000150a:	67e6                	ld	a5,88(sp)
    8000150c:	853e                	mv	a0,a5
    8000150e:	70a6                	ld	ra,104(sp)
    80001510:	6165                	addi	sp,sp,112
    80001512:	8082                	ret

0000000080001514 <vTaskDelete>:
    80001514:	7179                	addi	sp,sp,-48
    80001516:	f406                	sd	ra,40(sp)
    80001518:	e42a                	sd	a0,8(sp)
    8000151a:	133010ef          	jal	80002e4c <vTaskEnterCritical>
    8000151e:	67a2                	ld	a5,8(sp)
    80001520:	e799                	bnez	a5,8000152e <vTaskDelete+0x1a>
    80001522:	0001f797          	auipc	a5,0x1f
    80001526:	e1e78793          	addi	a5,a5,-482 # 80020340 <pxCurrentTCB>
    8000152a:	639c                	ld	a5,0(a5)
    8000152c:	a011                	j	80001530 <vTaskDelete+0x1c>
    8000152e:	67a2                	ld	a5,8(sp)
    80001530:	ec3e                	sd	a5,24(sp)
    80001532:	67e2                	ld	a5,24(sp)
    80001534:	07a1                	addi	a5,a5,8
    80001536:	853e                	mv	a0,a5
    80001538:	910ff0ef          	jal	80000648 <uxListRemove>
    8000153c:	67e2                	ld	a5,24(sp)
    8000153e:	6bbc                	ld	a5,80(a5)
    80001540:	c799                	beqz	a5,8000154e <vTaskDelete+0x3a>
    80001542:	67e2                	ld	a5,24(sp)
    80001544:	03078793          	addi	a5,a5,48
    80001548:	853e                	mv	a0,a5
    8000154a:	8feff0ef          	jal	80000648 <uxListRemove>
    8000154e:	67e2                	ld	a5,24(sp)
    80001550:	07a1                	addi	a5,a5,8
    80001552:	85be                	mv	a1,a5
    80001554:	0001f517          	auipc	a0,0x1f
    80001558:	17450513          	addi	a0,a0,372 # 800206c8 <xTasksWaitingTermination>
    8000155c:	83cff0ef          	jal	80000598 <vListInsertEnd>
    80001560:	0001f797          	auipc	a5,0x1f
    80001564:	19078793          	addi	a5,a5,400 # 800206f0 <uxTasksDeleted>
    80001568:	639c                	ld	a5,0(a5)
    8000156a:	00178713          	addi	a4,a5,1
    8000156e:	0001f797          	auipc	a5,0x1f
    80001572:	18278793          	addi	a5,a5,386 # 800206f0 <uxTasksDeleted>
    80001576:	e398                	sd	a4,0(a5)
    80001578:	0001f797          	auipc	a5,0x1f
    8000157c:	1e078793          	addi	a5,a5,480 # 80020758 <uxTaskNumber>
    80001580:	639c                	ld	a5,0(a5)
    80001582:	00178713          	addi	a4,a5,1
    80001586:	0001f797          	auipc	a5,0x1f
    8000158a:	1d278793          	addi	a5,a5,466 # 80020758 <uxTaskNumber>
    8000158e:	e398                	sd	a4,0(a5)
    80001590:	0eb010ef          	jal	80002e7a <vTaskExitCritical>
    80001594:	0001f797          	auipc	a5,0x1f
    80001598:	1a478793          	addi	a5,a5,420 # 80020738 <xSchedulerRunning>
    8000159c:	639c                	ld	a5,0(a5)
    8000159e:	cf85                	beqz	a5,800015d6 <vTaskDelete+0xc2>
    800015a0:	0001f797          	auipc	a5,0x1f
    800015a4:	da078793          	addi	a5,a5,-608 # 80020340 <pxCurrentTCB>
    800015a8:	639c                	ld	a5,0(a5)
    800015aa:	6762                	ld	a4,24(sp)
    800015ac:	00f71f63          	bne	a4,a5,800015ca <vTaskDelete+0xb6>
    800015b0:	0001f797          	auipc	a5,0x1f
    800015b4:	1b878793          	addi	a5,a5,440 # 80020768 <uxSchedulerSuspended>
    800015b8:	639c                	ld	a5,0(a5)
    800015ba:	c789                	beqz	a5,800015c4 <vTaskDelete+0xb0>
    800015bc:	30047073          	csrci	mstatus,8
    800015c0:	0001                	nop
    800015c2:	bffd                	j	800015c0 <vTaskDelete+0xac>
    800015c4:	de3fe0ef          	jal	800003a6 <vPortYield>
    800015c8:	a039                	j	800015d6 <vTaskDelete+0xc2>
    800015ca:	083010ef          	jal	80002e4c <vTaskEnterCritical>
    800015ce:	640010ef          	jal	80002c0e <prvResetNextTaskUnblockTime>
    800015d2:	0a9010ef          	jal	80002e7a <vTaskExitCritical>
    800015d6:	0001                	nop
    800015d8:	70a2                	ld	ra,40(sp)
    800015da:	6145                	addi	sp,sp,48
    800015dc:	8082                	ret

00000000800015de <vTaskDelayUntil>:
    800015de:	7139                	addi	sp,sp,-64
    800015e0:	fc06                	sd	ra,56(sp)
    800015e2:	e42a                	sd	a0,8(sp)
    800015e4:	87ae                	mv	a5,a1
    800015e6:	c23e                	sw	a5,4(sp)
    800015e8:	f402                	sd	zero,40(sp)
    800015ea:	67a2                	ld	a5,8(sp)
    800015ec:	e789                	bnez	a5,800015f6 <vTaskDelayUntil+0x18>
    800015ee:	30047073          	csrci	mstatus,8
    800015f2:	0001                	nop
    800015f4:	bffd                	j	800015f2 <vTaskDelayUntil+0x14>
    800015f6:	4792                	lw	a5,4(sp)
    800015f8:	2781                	sext.w	a5,a5
    800015fa:	e789                	bnez	a5,80001604 <vTaskDelayUntil+0x26>
    800015fc:	30047073          	csrci	mstatus,8
    80001600:	0001                	nop
    80001602:	bffd                	j	80001600 <vTaskDelayUntil+0x22>
    80001604:	0001f797          	auipc	a5,0x1f
    80001608:	16478793          	addi	a5,a5,356 # 80020768 <uxSchedulerSuspended>
    8000160c:	639c                	ld	a5,0(a5)
    8000160e:	c789                	beqz	a5,80001618 <vTaskDelayUntil+0x3a>
    80001610:	30047073          	csrci	mstatus,8
    80001614:	0001                	nop
    80001616:	bffd                	j	80001614 <vTaskDelayUntil+0x36>
    80001618:	6a6000ef          	jal	80001cbe <vTaskSuspendAll>
    8000161c:	0001f797          	auipc	a5,0x1f
    80001620:	10c78793          	addi	a5,a5,268 # 80020728 <xTickCount>
    80001624:	439c                	lw	a5,0(a5)
    80001626:	d23e                	sw	a5,36(sp)
    80001628:	67a2                	ld	a5,8(sp)
    8000162a:	439c                	lw	a5,0(a5)
    8000162c:	4712                	lw	a4,4(sp)
    8000162e:	9fb9                	addw	a5,a5,a4
    80001630:	d03e                	sw	a5,32(sp)
    80001632:	67a2                	ld	a5,8(sp)
    80001634:	4398                	lw	a4,0(a5)
    80001636:	5792                	lw	a5,36(sp)
    80001638:	2781                	sext.w	a5,a5
    8000163a:	02e7f263          	bgeu	a5,a4,8000165e <vTaskDelayUntil+0x80>
    8000163e:	67a2                	ld	a5,8(sp)
    80001640:	4398                	lw	a4,0(a5)
    80001642:	5782                	lw	a5,32(sp)
    80001644:	2781                	sext.w	a5,a5
    80001646:	02e7fb63          	bgeu	a5,a4,8000167c <vTaskDelayUntil+0x9e>
    8000164a:	5782                	lw	a5,32(sp)
    8000164c:	873e                	mv	a4,a5
    8000164e:	5792                	lw	a5,36(sp)
    80001650:	2701                	sext.w	a4,a4
    80001652:	2781                	sext.w	a5,a5
    80001654:	02e7f463          	bgeu	a5,a4,8000167c <vTaskDelayUntil+0x9e>
    80001658:	4785                	li	a5,1
    8000165a:	f43e                	sd	a5,40(sp)
    8000165c:	a005                	j	8000167c <vTaskDelayUntil+0x9e>
    8000165e:	67a2                	ld	a5,8(sp)
    80001660:	4398                	lw	a4,0(a5)
    80001662:	5782                	lw	a5,32(sp)
    80001664:	2781                	sext.w	a5,a5
    80001666:	00e7e963          	bltu	a5,a4,80001678 <vTaskDelayUntil+0x9a>
    8000166a:	5782                	lw	a5,32(sp)
    8000166c:	873e                	mv	a4,a5
    8000166e:	5792                	lw	a5,36(sp)
    80001670:	2701                	sext.w	a4,a4
    80001672:	2781                	sext.w	a5,a5
    80001674:	00e7f463          	bgeu	a5,a4,8000167c <vTaskDelayUntil+0x9e>
    80001678:	4785                	li	a5,1
    8000167a:	f43e                	sd	a5,40(sp)
    8000167c:	67a2                	ld	a5,8(sp)
    8000167e:	5702                	lw	a4,32(sp)
    80001680:	c398                	sw	a4,0(a5)
    80001682:	77a2                	ld	a5,40(sp)
    80001684:	cf91                	beqz	a5,800016a0 <vTaskDelayUntil+0xc2>
    80001686:	0001f797          	auipc	a5,0x1f
    8000168a:	cba78793          	addi	a5,a5,-838 # 80020340 <pxCurrentTCB>
    8000168e:	639c                	ld	a5,0(a5)
    80001690:	07a1                	addi	a5,a5,8
    80001692:	853e                	mv	a0,a5
    80001694:	fb5fe0ef          	jal	80000648 <uxListRemove>
    80001698:	5782                	lw	a5,32(sp)
    8000169a:	853e                	mv	a0,a5
    8000169c:	2b4010ef          	jal	80002950 <prvAddCurrentTaskToDelayedList>
    800016a0:	63a000ef          	jal	80001cda <xTaskResumeAll>
    800016a4:	ec2a                	sd	a0,24(sp)
    800016a6:	67e2                	ld	a5,24(sp)
    800016a8:	e399                	bnez	a5,800016ae <vTaskDelayUntil+0xd0>
    800016aa:	cfdfe0ef          	jal	800003a6 <vPortYield>
    800016ae:	0001                	nop
    800016b0:	70e2                	ld	ra,56(sp)
    800016b2:	6121                	addi	sp,sp,64
    800016b4:	8082                	ret

00000000800016b6 <vTaskDelay>:
    800016b6:	7179                	addi	sp,sp,-48
    800016b8:	f406                	sd	ra,40(sp)
    800016ba:	87aa                	mv	a5,a0
    800016bc:	c63e                	sw	a5,12(sp)
    800016be:	ec02                	sd	zero,24(sp)
    800016c0:	47b2                	lw	a5,12(sp)
    800016c2:	2781                	sext.w	a5,a5
    800016c4:	c7b1                	beqz	a5,80001710 <vTaskDelay+0x5a>
    800016c6:	0001f797          	auipc	a5,0x1f
    800016ca:	0a278793          	addi	a5,a5,162 # 80020768 <uxSchedulerSuspended>
    800016ce:	639c                	ld	a5,0(a5)
    800016d0:	c789                	beqz	a5,800016da <vTaskDelay+0x24>
    800016d2:	30047073          	csrci	mstatus,8
    800016d6:	0001                	nop
    800016d8:	bffd                	j	800016d6 <vTaskDelay+0x20>
    800016da:	5e4000ef          	jal	80001cbe <vTaskSuspendAll>
    800016de:	0001f797          	auipc	a5,0x1f
    800016e2:	04a78793          	addi	a5,a5,74 # 80020728 <xTickCount>
    800016e6:	439c                	lw	a5,0(a5)
    800016e8:	2781                	sext.w	a5,a5
    800016ea:	4732                	lw	a4,12(sp)
    800016ec:	9fb9                	addw	a5,a5,a4
    800016ee:	ca3e                	sw	a5,20(sp)
    800016f0:	0001f797          	auipc	a5,0x1f
    800016f4:	c5078793          	addi	a5,a5,-944 # 80020340 <pxCurrentTCB>
    800016f8:	639c                	ld	a5,0(a5)
    800016fa:	07a1                	addi	a5,a5,8
    800016fc:	853e                	mv	a0,a5
    800016fe:	f4bfe0ef          	jal	80000648 <uxListRemove>
    80001702:	47d2                	lw	a5,20(sp)
    80001704:	853e                	mv	a0,a5
    80001706:	24a010ef          	jal	80002950 <prvAddCurrentTaskToDelayedList>
    8000170a:	5d0000ef          	jal	80001cda <xTaskResumeAll>
    8000170e:	ec2a                	sd	a0,24(sp)
    80001710:	67e2                	ld	a5,24(sp)
    80001712:	e399                	bnez	a5,80001718 <vTaskDelay+0x62>
    80001714:	c93fe0ef          	jal	800003a6 <vPortYield>
    80001718:	0001                	nop
    8000171a:	70a2                	ld	ra,40(sp)
    8000171c:	6145                	addi	sp,sp,48
    8000171e:	8082                	ret

0000000080001720 <eTaskGetState>:
    80001720:	7139                	addi	sp,sp,-64
    80001722:	fc06                	sd	ra,56(sp)
    80001724:	e42a                	sd	a0,8(sp)
    80001726:	67a2                	ld	a5,8(sp)
    80001728:	f03e                	sd	a5,32(sp)
    8000172a:	7782                	ld	a5,32(sp)
    8000172c:	e789                	bnez	a5,80001736 <eTaskGetState+0x16>
    8000172e:	30047073          	csrci	mstatus,8
    80001732:	0001                	nop
    80001734:	bffd                	j	80001732 <eTaskGetState+0x12>
    80001736:	0001f797          	auipc	a5,0x1f
    8000173a:	c0a78793          	addi	a5,a5,-1014 # 80020340 <pxCurrentTCB>
    8000173e:	639c                	ld	a5,0(a5)
    80001740:	7702                	ld	a4,32(sp)
    80001742:	00f71463          	bne	a4,a5,8000174a <eTaskGetState+0x2a>
    80001746:	d602                	sw	zero,44(sp)
    80001748:	a0bd                	j	800017b6 <eTaskGetState+0x96>
    8000174a:	702010ef          	jal	80002e4c <vTaskEnterCritical>
    8000174e:	7782                	ld	a5,32(sp)
    80001750:	779c                	ld	a5,40(a5)
    80001752:	ec3e                	sd	a5,24(sp)
    80001754:	726010ef          	jal	80002e7a <vTaskExitCritical>
    80001758:	0001f797          	auipc	a5,0x1f
    8000175c:	f3878793          	addi	a5,a5,-200 # 80020690 <pxDelayedTaskList>
    80001760:	639c                	ld	a5,0(a5)
    80001762:	6762                	ld	a4,24(sp)
    80001764:	00f70a63          	beq	a4,a5,80001778 <eTaskGetState+0x58>
    80001768:	0001f797          	auipc	a5,0x1f
    8000176c:	f3078793          	addi	a5,a5,-208 # 80020698 <pxOverflowDelayedTaskList>
    80001770:	639c                	ld	a5,0(a5)
    80001772:	6762                	ld	a4,24(sp)
    80001774:	00f71563          	bne	a4,a5,8000177e <eTaskGetState+0x5e>
    80001778:	4789                	li	a5,2
    8000177a:	d63e                	sw	a5,44(sp)
    8000177c:	a82d                	j	800017b6 <eTaskGetState+0x96>
    8000177e:	6762                	ld	a4,24(sp)
    80001780:	0001f797          	auipc	a5,0x1f
    80001784:	f7878793          	addi	a5,a5,-136 # 800206f8 <xSuspendedTaskList>
    80001788:	00f71b63          	bne	a4,a5,8000179e <eTaskGetState+0x7e>
    8000178c:	7782                	ld	a5,32(sp)
    8000178e:	6bbc                	ld	a5,80(a5)
    80001790:	e781                	bnez	a5,80001798 <eTaskGetState+0x78>
    80001792:	478d                	li	a5,3
    80001794:	d63e                	sw	a5,44(sp)
    80001796:	a005                	j	800017b6 <eTaskGetState+0x96>
    80001798:	4789                	li	a5,2
    8000179a:	d63e                	sw	a5,44(sp)
    8000179c:	a829                	j	800017b6 <eTaskGetState+0x96>
    8000179e:	6762                	ld	a4,24(sp)
    800017a0:	0001f797          	auipc	a5,0x1f
    800017a4:	f2878793          	addi	a5,a5,-216 # 800206c8 <xTasksWaitingTermination>
    800017a8:	00f71563          	bne	a4,a5,800017b2 <eTaskGetState+0x92>
    800017ac:	4791                	li	a5,4
    800017ae:	d63e                	sw	a5,44(sp)
    800017b0:	a019                	j	800017b6 <eTaskGetState+0x96>
    800017b2:	4785                	li	a5,1
    800017b4:	d63e                	sw	a5,44(sp)
    800017b6:	57b2                	lw	a5,44(sp)
    800017b8:	853e                	mv	a0,a5
    800017ba:	70e2                	ld	ra,56(sp)
    800017bc:	6121                	addi	sp,sp,64
    800017be:	8082                	ret

00000000800017c0 <uxTaskPriorityGet>:
    800017c0:	7179                	addi	sp,sp,-48
    800017c2:	f406                	sd	ra,40(sp)
    800017c4:	e42a                	sd	a0,8(sp)
    800017c6:	686010ef          	jal	80002e4c <vTaskEnterCritical>
    800017ca:	67a2                	ld	a5,8(sp)
    800017cc:	e799                	bnez	a5,800017da <uxTaskPriorityGet+0x1a>
    800017ce:	0001f797          	auipc	a5,0x1f
    800017d2:	b7278793          	addi	a5,a5,-1166 # 80020340 <pxCurrentTCB>
    800017d6:	639c                	ld	a5,0(a5)
    800017d8:	a011                	j	800017dc <uxTaskPriorityGet+0x1c>
    800017da:	67a2                	ld	a5,8(sp)
    800017dc:	ec3e                	sd	a5,24(sp)
    800017de:	67e2                	ld	a5,24(sp)
    800017e0:	6fbc                	ld	a5,88(a5)
    800017e2:	e83e                	sd	a5,16(sp)
    800017e4:	696010ef          	jal	80002e7a <vTaskExitCritical>
    800017e8:	67c2                	ld	a5,16(sp)
    800017ea:	853e                	mv	a0,a5
    800017ec:	70a2                	ld	ra,40(sp)
    800017ee:	6145                	addi	sp,sp,48
    800017f0:	8082                	ret

00000000800017f2 <uxTaskPriorityGetFromISR>:
    800017f2:	7139                	addi	sp,sp,-64
    800017f4:	fc06                	sd	ra,56(sp)
    800017f6:	e42a                	sd	a0,8(sp)
    800017f8:	ce1fe0ef          	jal	800004d8 <vPortSetInterruptMask>
    800017fc:	87aa                	mv	a5,a0
    800017fe:	f43e                	sd	a5,40(sp)
    80001800:	67a2                	ld	a5,8(sp)
    80001802:	e799                	bnez	a5,80001810 <uxTaskPriorityGetFromISR+0x1e>
    80001804:	0001f797          	auipc	a5,0x1f
    80001808:	b3c78793          	addi	a5,a5,-1220 # 80020340 <pxCurrentTCB>
    8000180c:	639c                	ld	a5,0(a5)
    8000180e:	a011                	j	80001812 <uxTaskPriorityGetFromISR+0x20>
    80001810:	67a2                	ld	a5,8(sp)
    80001812:	f03e                	sd	a5,32(sp)
    80001814:	7782                	ld	a5,32(sp)
    80001816:	6fbc                	ld	a5,88(a5)
    80001818:	ec3e                	sd	a5,24(sp)
    8000181a:	77a2                	ld	a5,40(sp)
    8000181c:	2781                	sext.w	a5,a5
    8000181e:	853e                	mv	a0,a5
    80001820:	ca7fe0ef          	jal	800004c6 <vPortClearInterruptMask>
    80001824:	67e2                	ld	a5,24(sp)
    80001826:	853e                	mv	a0,a5
    80001828:	70e2                	ld	ra,56(sp)
    8000182a:	6121                	addi	sp,sp,64
    8000182c:	8082                	ret

000000008000182e <vTaskPrioritySet>:
    8000182e:	7139                	addi	sp,sp,-64
    80001830:	fc06                	sd	ra,56(sp)
    80001832:	e42a                	sd	a0,8(sp)
    80001834:	e02e                	sd	a1,0(sp)
    80001836:	f402                	sd	zero,40(sp)
    80001838:	6702                	ld	a4,0(sp)
    8000183a:	4791                	li	a5,4
    8000183c:	00e7f663          	bgeu	a5,a4,80001848 <vTaskPrioritySet+0x1a>
    80001840:	30047073          	csrci	mstatus,8
    80001844:	0001                	nop
    80001846:	bffd                	j	80001844 <vTaskPrioritySet+0x16>
    80001848:	6702                	ld	a4,0(sp)
    8000184a:	4791                	li	a5,4
    8000184c:	00e7f463          	bgeu	a5,a4,80001854 <vTaskPrioritySet+0x26>
    80001850:	4791                	li	a5,4
    80001852:	e03e                	sd	a5,0(sp)
    80001854:	5f8010ef          	jal	80002e4c <vTaskEnterCritical>
    80001858:	67a2                	ld	a5,8(sp)
    8000185a:	e799                	bnez	a5,80001868 <vTaskPrioritySet+0x3a>
    8000185c:	0001f797          	auipc	a5,0x1f
    80001860:	ae478793          	addi	a5,a5,-1308 # 80020340 <pxCurrentTCB>
    80001864:	639c                	ld	a5,0(a5)
    80001866:	a011                	j	8000186a <vTaskPrioritySet+0x3c>
    80001868:	67a2                	ld	a5,8(sp)
    8000186a:	f03e                	sd	a5,32(sp)
    8000186c:	7782                	ld	a5,32(sp)
    8000186e:	6bdc                	ld	a5,144(a5)
    80001870:	ec3e                	sd	a5,24(sp)
    80001872:	6762                	ld	a4,24(sp)
    80001874:	6782                	ld	a5,0(sp)
    80001876:	0ef70f63          	beq	a4,a5,80001974 <vTaskPrioritySet+0x146>
    8000187a:	6702                	ld	a4,0(sp)
    8000187c:	67e2                	ld	a5,24(sp)
    8000187e:	02e7f663          	bgeu	a5,a4,800018aa <vTaskPrioritySet+0x7c>
    80001882:	0001f797          	auipc	a5,0x1f
    80001886:	abe78793          	addi	a5,a5,-1346 # 80020340 <pxCurrentTCB>
    8000188a:	639c                	ld	a5,0(a5)
    8000188c:	7702                	ld	a4,32(sp)
    8000188e:	02f70863          	beq	a4,a5,800018be <vTaskPrioritySet+0x90>
    80001892:	0001f797          	auipc	a5,0x1f
    80001896:	aae78793          	addi	a5,a5,-1362 # 80020340 <pxCurrentTCB>
    8000189a:	639c                	ld	a5,0(a5)
    8000189c:	6fbc                	ld	a5,88(a5)
    8000189e:	6702                	ld	a4,0(sp)
    800018a0:	00f76f63          	bltu	a4,a5,800018be <vTaskPrioritySet+0x90>
    800018a4:	4785                	li	a5,1
    800018a6:	f43e                	sd	a5,40(sp)
    800018a8:	a819                	j	800018be <vTaskPrioritySet+0x90>
    800018aa:	0001f797          	auipc	a5,0x1f
    800018ae:	a9678793          	addi	a5,a5,-1386 # 80020340 <pxCurrentTCB>
    800018b2:	639c                	ld	a5,0(a5)
    800018b4:	7702                	ld	a4,32(sp)
    800018b6:	00f71463          	bne	a4,a5,800018be <vTaskPrioritySet+0x90>
    800018ba:	4785                	li	a5,1
    800018bc:	f43e                	sd	a5,40(sp)
    800018be:	7782                	ld	a5,32(sp)
    800018c0:	6fbc                	ld	a5,88(a5)
    800018c2:	e83e                	sd	a5,16(sp)
    800018c4:	7782                	ld	a5,32(sp)
    800018c6:	6bd8                	ld	a4,144(a5)
    800018c8:	7782                	ld	a5,32(sp)
    800018ca:	6fbc                	ld	a5,88(a5)
    800018cc:	00f71563          	bne	a4,a5,800018d6 <vTaskPrioritySet+0xa8>
    800018d0:	7782                	ld	a5,32(sp)
    800018d2:	6702                	ld	a4,0(sp)
    800018d4:	efb8                	sd	a4,88(a5)
    800018d6:	7782                	ld	a5,32(sp)
    800018d8:	6702                	ld	a4,0(sp)
    800018da:	ebd8                	sd	a4,144(a5)
    800018dc:	7782                	ld	a5,32(sp)
    800018de:	5b9c                	lw	a5,48(a5)
    800018e0:	2781                	sext.w	a5,a5
    800018e2:	0007cb63          	bltz	a5,800018f8 <vTaskPrioritySet+0xca>
    800018e6:	6782                	ld	a5,0(sp)
    800018e8:	2781                	sext.w	a5,a5
    800018ea:	4715                	li	a4,5
    800018ec:	40f707bb          	subw	a5,a4,a5
    800018f0:	0007871b          	sext.w	a4,a5
    800018f4:	7782                	ld	a5,32(sp)
    800018f6:	db98                	sw	a4,48(a5)
    800018f8:	7782                	ld	a5,32(sp)
    800018fa:	7794                	ld	a3,40(a5)
    800018fc:	6742                	ld	a4,16(sp)
    800018fe:	87ba                	mv	a5,a4
    80001900:	078a                	slli	a5,a5,0x2
    80001902:	97ba                	add	a5,a5,a4
    80001904:	078e                	slli	a5,a5,0x3
    80001906:	0001f717          	auipc	a4,0x1f
    8000190a:	c7270713          	addi	a4,a4,-910 # 80020578 <pxReadyTasksLists>
    8000190e:	97ba                	add	a5,a5,a4
    80001910:	00f69463          	bne	a3,a5,80001918 <vTaskPrioritySet+0xea>
    80001914:	4785                	li	a5,1
    80001916:	a011                	j	8000191a <vTaskPrioritySet+0xec>
    80001918:	4781                	li	a5,0
    8000191a:	c7b9                	beqz	a5,80001968 <vTaskPrioritySet+0x13a>
    8000191c:	7782                	ld	a5,32(sp)
    8000191e:	07a1                	addi	a5,a5,8
    80001920:	853e                	mv	a0,a5
    80001922:	d27fe0ef          	jal	80000648 <uxListRemove>
    80001926:	7782                	ld	a5,32(sp)
    80001928:	6fb8                	ld	a4,88(a5)
    8000192a:	0001f797          	auipc	a5,0x1f
    8000192e:	e0678793          	addi	a5,a5,-506 # 80020730 <uxTopReadyPriority>
    80001932:	639c                	ld	a5,0(a5)
    80001934:	00e7f963          	bgeu	a5,a4,80001946 <vTaskPrioritySet+0x118>
    80001938:	7782                	ld	a5,32(sp)
    8000193a:	6fb8                	ld	a4,88(a5)
    8000193c:	0001f797          	auipc	a5,0x1f
    80001940:	df478793          	addi	a5,a5,-524 # 80020730 <uxTopReadyPriority>
    80001944:	e398                	sd	a4,0(a5)
    80001946:	7782                	ld	a5,32(sp)
    80001948:	6fb8                	ld	a4,88(a5)
    8000194a:	87ba                	mv	a5,a4
    8000194c:	078a                	slli	a5,a5,0x2
    8000194e:	97ba                	add	a5,a5,a4
    80001950:	078e                	slli	a5,a5,0x3
    80001952:	0001f717          	auipc	a4,0x1f
    80001956:	c2670713          	addi	a4,a4,-986 # 80020578 <pxReadyTasksLists>
    8000195a:	973e                	add	a4,a4,a5
    8000195c:	7782                	ld	a5,32(sp)
    8000195e:	07a1                	addi	a5,a5,8
    80001960:	85be                	mv	a1,a5
    80001962:	853a                	mv	a0,a4
    80001964:	c35fe0ef          	jal	80000598 <vListInsertEnd>
    80001968:	7722                	ld	a4,40(sp)
    8000196a:	4785                	li	a5,1
    8000196c:	00f71463          	bne	a4,a5,80001974 <vTaskPrioritySet+0x146>
    80001970:	a37fe0ef          	jal	800003a6 <vPortYield>
    80001974:	506010ef          	jal	80002e7a <vTaskExitCritical>
    80001978:	0001                	nop
    8000197a:	70e2                	ld	ra,56(sp)
    8000197c:	6121                	addi	sp,sp,64
    8000197e:	8082                	ret

0000000080001980 <vTaskSuspend>:
    80001980:	7179                	addi	sp,sp,-48
    80001982:	f406                	sd	ra,40(sp)
    80001984:	e42a                	sd	a0,8(sp)
    80001986:	4c6010ef          	jal	80002e4c <vTaskEnterCritical>
    8000198a:	67a2                	ld	a5,8(sp)
    8000198c:	e799                	bnez	a5,8000199a <vTaskSuspend+0x1a>
    8000198e:	0001f797          	auipc	a5,0x1f
    80001992:	9b278793          	addi	a5,a5,-1614 # 80020340 <pxCurrentTCB>
    80001996:	639c                	ld	a5,0(a5)
    80001998:	a011                	j	8000199c <vTaskSuspend+0x1c>
    8000199a:	67a2                	ld	a5,8(sp)
    8000199c:	ec3e                	sd	a5,24(sp)
    8000199e:	67e2                	ld	a5,24(sp)
    800019a0:	07a1                	addi	a5,a5,8
    800019a2:	853e                	mv	a0,a5
    800019a4:	ca5fe0ef          	jal	80000648 <uxListRemove>
    800019a8:	67e2                	ld	a5,24(sp)
    800019aa:	6bbc                	ld	a5,80(a5)
    800019ac:	c799                	beqz	a5,800019ba <vTaskSuspend+0x3a>
    800019ae:	67e2                	ld	a5,24(sp)
    800019b0:	03078793          	addi	a5,a5,48
    800019b4:	853e                	mv	a0,a5
    800019b6:	c93fe0ef          	jal	80000648 <uxListRemove>
    800019ba:	67e2                	ld	a5,24(sp)
    800019bc:	07a1                	addi	a5,a5,8
    800019be:	85be                	mv	a1,a5
    800019c0:	0001f517          	auipc	a0,0x1f
    800019c4:	d3850513          	addi	a0,a0,-712 # 800206f8 <xSuspendedTaskList>
    800019c8:	bd1fe0ef          	jal	80000598 <vListInsertEnd>
    800019cc:	4ae010ef          	jal	80002e7a <vTaskExitCritical>
    800019d0:	0001f797          	auipc	a5,0x1f
    800019d4:	97078793          	addi	a5,a5,-1680 # 80020340 <pxCurrentTCB>
    800019d8:	639c                	ld	a5,0(a5)
    800019da:	6762                	ld	a4,24(sp)
    800019dc:	04f71b63          	bne	a4,a5,80001a32 <vTaskSuspend+0xb2>
    800019e0:	0001f797          	auipc	a5,0x1f
    800019e4:	d5878793          	addi	a5,a5,-680 # 80020738 <xSchedulerRunning>
    800019e8:	639c                	ld	a5,0(a5)
    800019ea:	cf91                	beqz	a5,80001a06 <vTaskSuspend+0x86>
    800019ec:	0001f797          	auipc	a5,0x1f
    800019f0:	d7c78793          	addi	a5,a5,-644 # 80020768 <uxSchedulerSuspended>
    800019f4:	639c                	ld	a5,0(a5)
    800019f6:	c789                	beqz	a5,80001a00 <vTaskSuspend+0x80>
    800019f8:	30047073          	csrci	mstatus,8
    800019fc:	0001                	nop
    800019fe:	bffd                	j	800019fc <vTaskSuspend+0x7c>
    80001a00:	9a7fe0ef          	jal	800003a6 <vPortYield>
    80001a04:	a099                	j	80001a4a <vTaskSuspend+0xca>
    80001a06:	0001f797          	auipc	a5,0x1f
    80001a0a:	cf278793          	addi	a5,a5,-782 # 800206f8 <xSuspendedTaskList>
    80001a0e:	6398                	ld	a4,0(a5)
    80001a10:	0001f797          	auipc	a5,0x1f
    80001a14:	d1078793          	addi	a5,a5,-752 # 80020720 <uxCurrentNumberOfTasks>
    80001a18:	639c                	ld	a5,0(a5)
    80001a1a:	00f71963          	bne	a4,a5,80001a2c <vTaskSuspend+0xac>
    80001a1e:	0001f797          	auipc	a5,0x1f
    80001a22:	92278793          	addi	a5,a5,-1758 # 80020340 <pxCurrentTCB>
    80001a26:	0007b023          	sd	zero,0(a5)
    80001a2a:	a005                	j	80001a4a <vTaskSuspend+0xca>
    80001a2c:	764000ef          	jal	80002190 <vTaskSwitchContext>
    80001a30:	a829                	j	80001a4a <vTaskSuspend+0xca>
    80001a32:	0001f797          	auipc	a5,0x1f
    80001a36:	d0678793          	addi	a5,a5,-762 # 80020738 <xSchedulerRunning>
    80001a3a:	639c                	ld	a5,0(a5)
    80001a3c:	c799                	beqz	a5,80001a4a <vTaskSuspend+0xca>
    80001a3e:	40e010ef          	jal	80002e4c <vTaskEnterCritical>
    80001a42:	1cc010ef          	jal	80002c0e <prvResetNextTaskUnblockTime>
    80001a46:	434010ef          	jal	80002e7a <vTaskExitCritical>
    80001a4a:	0001                	nop
    80001a4c:	70a2                	ld	ra,40(sp)
    80001a4e:	6145                	addi	sp,sp,48
    80001a50:	8082                	ret

0000000080001a52 <prvTaskIsTaskSuspended>:
    80001a52:	1101                	addi	sp,sp,-32
    80001a54:	e42a                	sd	a0,8(sp)
    80001a56:	ec02                	sd	zero,24(sp)
    80001a58:	67a2                	ld	a5,8(sp)
    80001a5a:	e83e                	sd	a5,16(sp)
    80001a5c:	67a2                	ld	a5,8(sp)
    80001a5e:	e789                	bnez	a5,80001a68 <prvTaskIsTaskSuspended+0x16>
    80001a60:	30047073          	csrci	mstatus,8
    80001a64:	0001                	nop
    80001a66:	bffd                	j	80001a64 <prvTaskIsTaskSuspended+0x12>
    80001a68:	67c2                	ld	a5,16(sp)
    80001a6a:	7798                	ld	a4,40(a5)
    80001a6c:	0001f797          	auipc	a5,0x1f
    80001a70:	c8c78793          	addi	a5,a5,-884 # 800206f8 <xSuspendedTaskList>
    80001a74:	00f71463          	bne	a4,a5,80001a7c <prvTaskIsTaskSuspended+0x2a>
    80001a78:	4785                	li	a5,1
    80001a7a:	a011                	j	80001a7e <prvTaskIsTaskSuspended+0x2c>
    80001a7c:	4781                	li	a5,0
    80001a7e:	c395                	beqz	a5,80001aa2 <prvTaskIsTaskSuspended+0x50>
    80001a80:	67c2                	ld	a5,16(sp)
    80001a82:	6bb8                	ld	a4,80(a5)
    80001a84:	0001f797          	auipc	a5,0x1f
    80001a88:	c1c78793          	addi	a5,a5,-996 # 800206a0 <xPendingReadyList>
    80001a8c:	00f70b63          	beq	a4,a5,80001aa2 <prvTaskIsTaskSuspended+0x50>
    80001a90:	67c2                	ld	a5,16(sp)
    80001a92:	6bbc                	ld	a5,80(a5)
    80001a94:	e399                	bnez	a5,80001a9a <prvTaskIsTaskSuspended+0x48>
    80001a96:	4785                	li	a5,1
    80001a98:	a011                	j	80001a9c <prvTaskIsTaskSuspended+0x4a>
    80001a9a:	4781                	li	a5,0
    80001a9c:	c399                	beqz	a5,80001aa2 <prvTaskIsTaskSuspended+0x50>
    80001a9e:	4785                	li	a5,1
    80001aa0:	ec3e                	sd	a5,24(sp)
    80001aa2:	67e2                	ld	a5,24(sp)
    80001aa4:	853e                	mv	a0,a5
    80001aa6:	6105                	addi	sp,sp,32
    80001aa8:	8082                	ret

0000000080001aaa <vTaskResume>:
    80001aaa:	7179                	addi	sp,sp,-48
    80001aac:	f406                	sd	ra,40(sp)
    80001aae:	e42a                	sd	a0,8(sp)
    80001ab0:	67a2                	ld	a5,8(sp)
    80001ab2:	ec3e                	sd	a5,24(sp)
    80001ab4:	67a2                	ld	a5,8(sp)
    80001ab6:	e789                	bnez	a5,80001ac0 <vTaskResume+0x16>
    80001ab8:	30047073          	csrci	mstatus,8
    80001abc:	0001                	nop
    80001abe:	bffd                	j	80001abc <vTaskResume+0x12>
    80001ac0:	67e2                	ld	a5,24(sp)
    80001ac2:	c7d1                	beqz	a5,80001b4e <vTaskResume+0xa4>
    80001ac4:	0001f797          	auipc	a5,0x1f
    80001ac8:	87c78793          	addi	a5,a5,-1924 # 80020340 <pxCurrentTCB>
    80001acc:	639c                	ld	a5,0(a5)
    80001ace:	6762                	ld	a4,24(sp)
    80001ad0:	06f70f63          	beq	a4,a5,80001b4e <vTaskResume+0xa4>
    80001ad4:	378010ef          	jal	80002e4c <vTaskEnterCritical>
    80001ad8:	6562                	ld	a0,24(sp)
    80001ada:	f79ff0ef          	jal	80001a52 <prvTaskIsTaskSuspended>
    80001ade:	872a                	mv	a4,a0
    80001ae0:	4785                	li	a5,1
    80001ae2:	06f71463          	bne	a4,a5,80001b4a <vTaskResume+0xa0>
    80001ae6:	67e2                	ld	a5,24(sp)
    80001ae8:	07a1                	addi	a5,a5,8
    80001aea:	853e                	mv	a0,a5
    80001aec:	b5dfe0ef          	jal	80000648 <uxListRemove>
    80001af0:	67e2                	ld	a5,24(sp)
    80001af2:	6fb8                	ld	a4,88(a5)
    80001af4:	0001f797          	auipc	a5,0x1f
    80001af8:	c3c78793          	addi	a5,a5,-964 # 80020730 <uxTopReadyPriority>
    80001afc:	639c                	ld	a5,0(a5)
    80001afe:	00e7f963          	bgeu	a5,a4,80001b10 <vTaskResume+0x66>
    80001b02:	67e2                	ld	a5,24(sp)
    80001b04:	6fb8                	ld	a4,88(a5)
    80001b06:	0001f797          	auipc	a5,0x1f
    80001b0a:	c2a78793          	addi	a5,a5,-982 # 80020730 <uxTopReadyPriority>
    80001b0e:	e398                	sd	a4,0(a5)
    80001b10:	67e2                	ld	a5,24(sp)
    80001b12:	6fb8                	ld	a4,88(a5)
    80001b14:	87ba                	mv	a5,a4
    80001b16:	078a                	slli	a5,a5,0x2
    80001b18:	97ba                	add	a5,a5,a4
    80001b1a:	078e                	slli	a5,a5,0x3
    80001b1c:	0001f717          	auipc	a4,0x1f
    80001b20:	a5c70713          	addi	a4,a4,-1444 # 80020578 <pxReadyTasksLists>
    80001b24:	973e                	add	a4,a4,a5
    80001b26:	67e2                	ld	a5,24(sp)
    80001b28:	07a1                	addi	a5,a5,8
    80001b2a:	85be                	mv	a1,a5
    80001b2c:	853a                	mv	a0,a4
    80001b2e:	a6bfe0ef          	jal	80000598 <vListInsertEnd>
    80001b32:	67e2                	ld	a5,24(sp)
    80001b34:	6fb8                	ld	a4,88(a5)
    80001b36:	0001f797          	auipc	a5,0x1f
    80001b3a:	80a78793          	addi	a5,a5,-2038 # 80020340 <pxCurrentTCB>
    80001b3e:	639c                	ld	a5,0(a5)
    80001b40:	6fbc                	ld	a5,88(a5)
    80001b42:	00f76463          	bltu	a4,a5,80001b4a <vTaskResume+0xa0>
    80001b46:	861fe0ef          	jal	800003a6 <vPortYield>
    80001b4a:	330010ef          	jal	80002e7a <vTaskExitCritical>
    80001b4e:	0001                	nop
    80001b50:	70a2                	ld	ra,40(sp)
    80001b52:	6145                	addi	sp,sp,48
    80001b54:	8082                	ret

0000000080001b56 <xTaskResumeFromISR>:
    80001b56:	7139                	addi	sp,sp,-64
    80001b58:	fc06                	sd	ra,56(sp)
    80001b5a:	e42a                	sd	a0,8(sp)
    80001b5c:	f402                	sd	zero,40(sp)
    80001b5e:	67a2                	ld	a5,8(sp)
    80001b60:	f03e                	sd	a5,32(sp)
    80001b62:	67a2                	ld	a5,8(sp)
    80001b64:	e789                	bnez	a5,80001b6e <xTaskResumeFromISR+0x18>
    80001b66:	30047073          	csrci	mstatus,8
    80001b6a:	0001                	nop
    80001b6c:	bffd                	j	80001b6a <xTaskResumeFromISR+0x14>
    80001b6e:	96bfe0ef          	jal	800004d8 <vPortSetInterruptMask>
    80001b72:	87aa                	mv	a5,a0
    80001b74:	ec3e                	sd	a5,24(sp)
    80001b76:	7502                	ld	a0,32(sp)
    80001b78:	edbff0ef          	jal	80001a52 <prvTaskIsTaskSuspended>
    80001b7c:	872a                	mv	a4,a0
    80001b7e:	4785                	li	a5,1
    80001b80:	08f71563          	bne	a4,a5,80001c0a <xTaskResumeFromISR+0xb4>
    80001b84:	0001f797          	auipc	a5,0x1f
    80001b88:	be478793          	addi	a5,a5,-1052 # 80020768 <uxSchedulerSuspended>
    80001b8c:	639c                	ld	a5,0(a5)
    80001b8e:	e7a5                	bnez	a5,80001bf6 <xTaskResumeFromISR+0xa0>
    80001b90:	7782                	ld	a5,32(sp)
    80001b92:	6fb8                	ld	a4,88(a5)
    80001b94:	0001e797          	auipc	a5,0x1e
    80001b98:	7ac78793          	addi	a5,a5,1964 # 80020340 <pxCurrentTCB>
    80001b9c:	639c                	ld	a5,0(a5)
    80001b9e:	6fbc                	ld	a5,88(a5)
    80001ba0:	00f76463          	bltu	a4,a5,80001ba8 <xTaskResumeFromISR+0x52>
    80001ba4:	4785                	li	a5,1
    80001ba6:	f43e                	sd	a5,40(sp)
    80001ba8:	7782                	ld	a5,32(sp)
    80001baa:	07a1                	addi	a5,a5,8
    80001bac:	853e                	mv	a0,a5
    80001bae:	a9bfe0ef          	jal	80000648 <uxListRemove>
    80001bb2:	7782                	ld	a5,32(sp)
    80001bb4:	6fb8                	ld	a4,88(a5)
    80001bb6:	0001f797          	auipc	a5,0x1f
    80001bba:	b7a78793          	addi	a5,a5,-1158 # 80020730 <uxTopReadyPriority>
    80001bbe:	639c                	ld	a5,0(a5)
    80001bc0:	00e7f963          	bgeu	a5,a4,80001bd2 <xTaskResumeFromISR+0x7c>
    80001bc4:	7782                	ld	a5,32(sp)
    80001bc6:	6fb8                	ld	a4,88(a5)
    80001bc8:	0001f797          	auipc	a5,0x1f
    80001bcc:	b6878793          	addi	a5,a5,-1176 # 80020730 <uxTopReadyPriority>
    80001bd0:	e398                	sd	a4,0(a5)
    80001bd2:	7782                	ld	a5,32(sp)
    80001bd4:	6fb8                	ld	a4,88(a5)
    80001bd6:	87ba                	mv	a5,a4
    80001bd8:	078a                	slli	a5,a5,0x2
    80001bda:	97ba                	add	a5,a5,a4
    80001bdc:	078e                	slli	a5,a5,0x3
    80001bde:	0001f717          	auipc	a4,0x1f
    80001be2:	99a70713          	addi	a4,a4,-1638 # 80020578 <pxReadyTasksLists>
    80001be6:	973e                	add	a4,a4,a5
    80001be8:	7782                	ld	a5,32(sp)
    80001bea:	07a1                	addi	a5,a5,8
    80001bec:	85be                	mv	a1,a5
    80001bee:	853a                	mv	a0,a4
    80001bf0:	9a9fe0ef          	jal	80000598 <vListInsertEnd>
    80001bf4:	a819                	j	80001c0a <xTaskResumeFromISR+0xb4>
    80001bf6:	7782                	ld	a5,32(sp)
    80001bf8:	03078793          	addi	a5,a5,48
    80001bfc:	85be                	mv	a1,a5
    80001bfe:	0001f517          	auipc	a0,0x1f
    80001c02:	aa250513          	addi	a0,a0,-1374 # 800206a0 <xPendingReadyList>
    80001c06:	993fe0ef          	jal	80000598 <vListInsertEnd>
    80001c0a:	67e2                	ld	a5,24(sp)
    80001c0c:	2781                	sext.w	a5,a5
    80001c0e:	853e                	mv	a0,a5
    80001c10:	8b7fe0ef          	jal	800004c6 <vPortClearInterruptMask>
    80001c14:	77a2                	ld	a5,40(sp)
    80001c16:	853e                	mv	a0,a5
    80001c18:	70e2                	ld	ra,56(sp)
    80001c1a:	6121                	addi	sp,sp,64
    80001c1c:	8082                	ret

0000000080001c1e <vTaskStartScheduler>:
    80001c1e:	1101                	addi	sp,sp,-32
    80001c20:	ec06                	sd	ra,24(sp)
    80001c22:	4881                	li	a7,0
    80001c24:	4801                	li	a6,0
    80001c26:	4781                	li	a5,0
    80001c28:	4701                	li	a4,0
    80001c2a:	4681                	li	a3,0
    80001c2c:	40000613          	li	a2,1024
    80001c30:	0001e597          	auipc	a1,0x1e
    80001c34:	3d058593          	addi	a1,a1,976 # 80020000 <__rodata_start>
    80001c38:	00001517          	auipc	a0,0x1
    80001c3c:	b1450513          	addi	a0,a0,-1260 # 8000274c <prvIdleTask>
    80001c40:	f1eff0ef          	jal	8000135e <xTaskGenericCreate>
    80001c44:	e42a                	sd	a0,8(sp)
    80001c46:	6722                	ld	a4,8(sp)
    80001c48:	4785                	li	a5,1
    80001c4a:	00f71563          	bne	a4,a5,80001c54 <vTaskStartScheduler+0x36>
    80001c4e:	13b010ef          	jal	80003588 <xTimerCreateTimerTask>
    80001c52:	e42a                	sd	a0,8(sp)
    80001c54:	6722                	ld	a4,8(sp)
    80001c56:	4785                	li	a5,1
    80001c58:	02f71963          	bne	a4,a5,80001c8a <vTaskStartScheduler+0x6c>
    80001c5c:	30047073          	csrci	mstatus,8
    80001c60:	0001f797          	auipc	a5,0x1f
    80001c64:	b0078793          	addi	a5,a5,-1280 # 80020760 <xNextTaskUnblockTime>
    80001c68:	577d                	li	a4,-1
    80001c6a:	c398                	sw	a4,0(a5)
    80001c6c:	0001f797          	auipc	a5,0x1f
    80001c70:	acc78793          	addi	a5,a5,-1332 # 80020738 <xSchedulerRunning>
    80001c74:	4705                	li	a4,1
    80001c76:	e398                	sd	a4,0(a5)
    80001c78:	0001f797          	auipc	a5,0x1f
    80001c7c:	ab078793          	addi	a5,a5,-1360 # 80020728 <xTickCount>
    80001c80:	0007a023          	sw	zero,0(a5)
    80001c84:	dbafe0ef          	jal	8000023e <xPortStartScheduler>
    80001c88:	a039                	j	80001c96 <vTaskStartScheduler+0x78>
    80001c8a:	67a2                	ld	a5,8(sp)
    80001c8c:	e789                	bnez	a5,80001c96 <vTaskStartScheduler+0x78>
    80001c8e:	30047073          	csrci	mstatus,8
    80001c92:	0001                	nop
    80001c94:	bffd                	j	80001c92 <vTaskStartScheduler+0x74>
    80001c96:	0001                	nop
    80001c98:	60e2                	ld	ra,24(sp)
    80001c9a:	6105                	addi	sp,sp,32
    80001c9c:	8082                	ret

0000000080001c9e <vTaskEndScheduler>:
    80001c9e:	1141                	addi	sp,sp,-16
    80001ca0:	e406                	sd	ra,8(sp)
    80001ca2:	30047073          	csrci	mstatus,8
    80001ca6:	0001f797          	auipc	a5,0x1f
    80001caa:	a9278793          	addi	a5,a5,-1390 # 80020738 <xSchedulerRunning>
    80001cae:	0007b023          	sd	zero,0(a5)
    80001cb2:	e6efe0ef          	jal	80000320 <vPortEndScheduler>
    80001cb6:	0001                	nop
    80001cb8:	60a2                	ld	ra,8(sp)
    80001cba:	0141                	addi	sp,sp,16
    80001cbc:	8082                	ret

0000000080001cbe <vTaskSuspendAll>:
    80001cbe:	0001f797          	auipc	a5,0x1f
    80001cc2:	aaa78793          	addi	a5,a5,-1366 # 80020768 <uxSchedulerSuspended>
    80001cc6:	639c                	ld	a5,0(a5)
    80001cc8:	00178713          	addi	a4,a5,1
    80001ccc:	0001f797          	auipc	a5,0x1f
    80001cd0:	a9c78793          	addi	a5,a5,-1380 # 80020768 <uxSchedulerSuspended>
    80001cd4:	e398                	sd	a4,0(a5)
    80001cd6:	0001                	nop
    80001cd8:	8082                	ret

0000000080001cda <xTaskResumeAll>:
    80001cda:	1101                	addi	sp,sp,-32
    80001cdc:	ec06                	sd	ra,24(sp)
    80001cde:	e402                	sd	zero,8(sp)
    80001ce0:	0001f797          	auipc	a5,0x1f
    80001ce4:	a8878793          	addi	a5,a5,-1400 # 80020768 <uxSchedulerSuspended>
    80001ce8:	639c                	ld	a5,0(a5)
    80001cea:	e789                	bnez	a5,80001cf4 <xTaskResumeAll+0x1a>
    80001cec:	30047073          	csrci	mstatus,8
    80001cf0:	0001                	nop
    80001cf2:	bffd                	j	80001cf0 <xTaskResumeAll+0x16>
    80001cf4:	158010ef          	jal	80002e4c <vTaskEnterCritical>
    80001cf8:	0001f797          	auipc	a5,0x1f
    80001cfc:	a7078793          	addi	a5,a5,-1424 # 80020768 <uxSchedulerSuspended>
    80001d00:	639c                	ld	a5,0(a5)
    80001d02:	fff78713          	addi	a4,a5,-1
    80001d06:	0001f797          	auipc	a5,0x1f
    80001d0a:	a6278793          	addi	a5,a5,-1438 # 80020768 <uxSchedulerSuspended>
    80001d0e:	e398                	sd	a4,0(a5)
    80001d10:	0001f797          	auipc	a5,0x1f
    80001d14:	a5878793          	addi	a5,a5,-1448 # 80020768 <uxSchedulerSuspended>
    80001d18:	639c                	ld	a5,0(a5)
    80001d1a:	10079263          	bnez	a5,80001e1e <xTaskResumeAll+0x144>
    80001d1e:	0001f797          	auipc	a5,0x1f
    80001d22:	a0278793          	addi	a5,a5,-1534 # 80020720 <uxCurrentNumberOfTasks>
    80001d26:	639c                	ld	a5,0(a5)
    80001d28:	0e078b63          	beqz	a5,80001e1e <xTaskResumeAll+0x144>
    80001d2c:	a061                	j	80001db4 <xTaskResumeAll+0xda>
    80001d2e:	0001f797          	auipc	a5,0x1f
    80001d32:	97278793          	addi	a5,a5,-1678 # 800206a0 <xPendingReadyList>
    80001d36:	6f9c                	ld	a5,24(a5)
    80001d38:	6f9c                	ld	a5,24(a5)
    80001d3a:	e03e                	sd	a5,0(sp)
    80001d3c:	6782                	ld	a5,0(sp)
    80001d3e:	03078793          	addi	a5,a5,48
    80001d42:	853e                	mv	a0,a5
    80001d44:	905fe0ef          	jal	80000648 <uxListRemove>
    80001d48:	6782                	ld	a5,0(sp)
    80001d4a:	07a1                	addi	a5,a5,8
    80001d4c:	853e                	mv	a0,a5
    80001d4e:	8fbfe0ef          	jal	80000648 <uxListRemove>
    80001d52:	6782                	ld	a5,0(sp)
    80001d54:	6fb8                	ld	a4,88(a5)
    80001d56:	0001f797          	auipc	a5,0x1f
    80001d5a:	9da78793          	addi	a5,a5,-1574 # 80020730 <uxTopReadyPriority>
    80001d5e:	639c                	ld	a5,0(a5)
    80001d60:	00e7f963          	bgeu	a5,a4,80001d72 <xTaskResumeAll+0x98>
    80001d64:	6782                	ld	a5,0(sp)
    80001d66:	6fb8                	ld	a4,88(a5)
    80001d68:	0001f797          	auipc	a5,0x1f
    80001d6c:	9c878793          	addi	a5,a5,-1592 # 80020730 <uxTopReadyPriority>
    80001d70:	e398                	sd	a4,0(a5)
    80001d72:	6782                	ld	a5,0(sp)
    80001d74:	6fb8                	ld	a4,88(a5)
    80001d76:	87ba                	mv	a5,a4
    80001d78:	078a                	slli	a5,a5,0x2
    80001d7a:	97ba                	add	a5,a5,a4
    80001d7c:	078e                	slli	a5,a5,0x3
    80001d7e:	0001e717          	auipc	a4,0x1e
    80001d82:	7fa70713          	addi	a4,a4,2042 # 80020578 <pxReadyTasksLists>
    80001d86:	973e                	add	a4,a4,a5
    80001d88:	6782                	ld	a5,0(sp)
    80001d8a:	07a1                	addi	a5,a5,8
    80001d8c:	85be                	mv	a1,a5
    80001d8e:	853a                	mv	a0,a4
    80001d90:	809fe0ef          	jal	80000598 <vListInsertEnd>
    80001d94:	6782                	ld	a5,0(sp)
    80001d96:	6fb8                	ld	a4,88(a5)
    80001d98:	0001e797          	auipc	a5,0x1e
    80001d9c:	5a878793          	addi	a5,a5,1448 # 80020340 <pxCurrentTCB>
    80001da0:	639c                	ld	a5,0(a5)
    80001da2:	6fbc                	ld	a5,88(a5)
    80001da4:	00f76863          	bltu	a4,a5,80001db4 <xTaskResumeAll+0xda>
    80001da8:	0001f797          	auipc	a5,0x1f
    80001dac:	9a078793          	addi	a5,a5,-1632 # 80020748 <xYieldPending>
    80001db0:	4705                	li	a4,1
    80001db2:	e398                	sd	a4,0(a5)
    80001db4:	0001f797          	auipc	a5,0x1f
    80001db8:	8ec78793          	addi	a5,a5,-1812 # 800206a0 <xPendingReadyList>
    80001dbc:	639c                	ld	a5,0(a5)
    80001dbe:	fba5                	bnez	a5,80001d2e <xTaskResumeAll+0x54>
    80001dc0:	0001f797          	auipc	a5,0x1f
    80001dc4:	98078793          	addi	a5,a5,-1664 # 80020740 <uxPendedTicks>
    80001dc8:	639c                	ld	a5,0(a5)
    80001dca:	cf95                	beqz	a5,80001e06 <xTaskResumeAll+0x12c>
    80001dcc:	a03d                	j	80001dfa <xTaskResumeAll+0x120>
    80001dce:	1e0000ef          	jal	80001fae <xTaskIncrementTick>
    80001dd2:	87aa                	mv	a5,a0
    80001dd4:	c799                	beqz	a5,80001de2 <xTaskResumeAll+0x108>
    80001dd6:	0001f797          	auipc	a5,0x1f
    80001dda:	97278793          	addi	a5,a5,-1678 # 80020748 <xYieldPending>
    80001dde:	4705                	li	a4,1
    80001de0:	e398                	sd	a4,0(a5)
    80001de2:	0001f797          	auipc	a5,0x1f
    80001de6:	95e78793          	addi	a5,a5,-1698 # 80020740 <uxPendedTicks>
    80001dea:	639c                	ld	a5,0(a5)
    80001dec:	fff78713          	addi	a4,a5,-1
    80001df0:	0001f797          	auipc	a5,0x1f
    80001df4:	95078793          	addi	a5,a5,-1712 # 80020740 <uxPendedTicks>
    80001df8:	e398                	sd	a4,0(a5)
    80001dfa:	0001f797          	auipc	a5,0x1f
    80001dfe:	94678793          	addi	a5,a5,-1722 # 80020740 <uxPendedTicks>
    80001e02:	639c                	ld	a5,0(a5)
    80001e04:	f7e9                	bnez	a5,80001dce <xTaskResumeAll+0xf4>
    80001e06:	0001f797          	auipc	a5,0x1f
    80001e0a:	94278793          	addi	a5,a5,-1726 # 80020748 <xYieldPending>
    80001e0e:	6398                	ld	a4,0(a5)
    80001e10:	4785                	li	a5,1
    80001e12:	00f71663          	bne	a4,a5,80001e1e <xTaskResumeAll+0x144>
    80001e16:	4785                	li	a5,1
    80001e18:	e43e                	sd	a5,8(sp)
    80001e1a:	d8cfe0ef          	jal	800003a6 <vPortYield>
    80001e1e:	05c010ef          	jal	80002e7a <vTaskExitCritical>
    80001e22:	67a2                	ld	a5,8(sp)
    80001e24:	853e                	mv	a0,a5
    80001e26:	60e2                	ld	ra,24(sp)
    80001e28:	6105                	addi	sp,sp,32
    80001e2a:	8082                	ret

0000000080001e2c <xTaskGetTickCount>:
    80001e2c:	1101                	addi	sp,sp,-32
    80001e2e:	ec06                	sd	ra,24(sp)
    80001e30:	01c010ef          	jal	80002e4c <vTaskEnterCritical>
    80001e34:	0001f797          	auipc	a5,0x1f
    80001e38:	8f478793          	addi	a5,a5,-1804 # 80020728 <xTickCount>
    80001e3c:	439c                	lw	a5,0(a5)
    80001e3e:	c63e                	sw	a5,12(sp)
    80001e40:	03a010ef          	jal	80002e7a <vTaskExitCritical>
    80001e44:	47b2                	lw	a5,12(sp)
    80001e46:	853e                	mv	a0,a5
    80001e48:	60e2                	ld	ra,24(sp)
    80001e4a:	6105                	addi	sp,sp,32
    80001e4c:	8082                	ret

0000000080001e4e <xTaskGetTickCountFromISR>:
    80001e4e:	1101                	addi	sp,sp,-32
    80001e50:	ec06                	sd	ra,24(sp)
    80001e52:	e86fe0ef          	jal	800004d8 <vPortSetInterruptMask>
    80001e56:	87aa                	mv	a5,a0
    80001e58:	e43e                	sd	a5,8(sp)
    80001e5a:	0001f797          	auipc	a5,0x1f
    80001e5e:	8ce78793          	addi	a5,a5,-1842 # 80020728 <xTickCount>
    80001e62:	439c                	lw	a5,0(a5)
    80001e64:	c23e                	sw	a5,4(sp)
    80001e66:	67a2                	ld	a5,8(sp)
    80001e68:	2781                	sext.w	a5,a5
    80001e6a:	853e                	mv	a0,a5
    80001e6c:	e5afe0ef          	jal	800004c6 <vPortClearInterruptMask>
    80001e70:	4792                	lw	a5,4(sp)
    80001e72:	853e                	mv	a0,a5
    80001e74:	60e2                	ld	ra,24(sp)
    80001e76:	6105                	addi	sp,sp,32
    80001e78:	8082                	ret

0000000080001e7a <uxTaskGetNumberOfTasks>:
    80001e7a:	0001f797          	auipc	a5,0x1f
    80001e7e:	8a678793          	addi	a5,a5,-1882 # 80020720 <uxCurrentNumberOfTasks>
    80001e82:	639c                	ld	a5,0(a5)
    80001e84:	853e                	mv	a0,a5
    80001e86:	8082                	ret

0000000080001e88 <uxTaskGetSystemState>:
    80001e88:	7139                	addi	sp,sp,-64
    80001e8a:	fc06                	sd	ra,56(sp)
    80001e8c:	ec2a                	sd	a0,24(sp)
    80001e8e:	e82e                	sd	a1,16(sp)
    80001e90:	e432                	sd	a2,8(sp)
    80001e92:	f402                	sd	zero,40(sp)
    80001e94:	4795                	li	a5,5
    80001e96:	f03e                	sd	a5,32(sp)
    80001e98:	e27ff0ef          	jal	80001cbe <vTaskSuspendAll>
    80001e9c:	0001f797          	auipc	a5,0x1f
    80001ea0:	88478793          	addi	a5,a5,-1916 # 80020720 <uxCurrentNumberOfTasks>
    80001ea4:	639c                	ld	a5,0(a5)
    80001ea6:	6742                	ld	a4,16(sp)
    80001ea8:	0ef76c63          	bltu	a4,a5,80001fa0 <uxTaskGetSystemState+0x118>
    80001eac:	7782                	ld	a5,32(sp)
    80001eae:	17fd                	addi	a5,a5,-1
    80001eb0:	f03e                	sd	a5,32(sp)
    80001eb2:	7722                	ld	a4,40(sp)
    80001eb4:	87ba                	mv	a5,a4
    80001eb6:	078e                	slli	a5,a5,0x3
    80001eb8:	8f99                	sub	a5,a5,a4
    80001eba:	078e                	slli	a5,a5,0x3
    80001ebc:	873e                	mv	a4,a5
    80001ebe:	67e2                	ld	a5,24(sp)
    80001ec0:	00e786b3          	add	a3,a5,a4
    80001ec4:	7702                	ld	a4,32(sp)
    80001ec6:	87ba                	mv	a5,a4
    80001ec8:	078a                	slli	a5,a5,0x2
    80001eca:	97ba                	add	a5,a5,a4
    80001ecc:	078e                	slli	a5,a5,0x3
    80001ece:	0001e717          	auipc	a4,0x1e
    80001ed2:	6aa70713          	addi	a4,a4,1706 # 80020578 <pxReadyTasksLists>
    80001ed6:	97ba                	add	a5,a5,a4
    80001ed8:	4605                	li	a2,1
    80001eda:	85be                	mv	a1,a5
    80001edc:	8536                	mv	a0,a3
    80001ede:	373000ef          	jal	80002a50 <prvListTaskWithinSingleList>
    80001ee2:	872a                	mv	a4,a0
    80001ee4:	77a2                	ld	a5,40(sp)
    80001ee6:	97ba                	add	a5,a5,a4
    80001ee8:	f43e                	sd	a5,40(sp)
    80001eea:	7782                	ld	a5,32(sp)
    80001eec:	f3e1                	bnez	a5,80001eac <uxTaskGetSystemState+0x24>
    80001eee:	7722                	ld	a4,40(sp)
    80001ef0:	87ba                	mv	a5,a4
    80001ef2:	078e                	slli	a5,a5,0x3
    80001ef4:	8f99                	sub	a5,a5,a4
    80001ef6:	078e                	slli	a5,a5,0x3
    80001ef8:	873e                	mv	a4,a5
    80001efa:	67e2                	ld	a5,24(sp)
    80001efc:	973e                	add	a4,a4,a5
    80001efe:	0001e797          	auipc	a5,0x1e
    80001f02:	79278793          	addi	a5,a5,1938 # 80020690 <pxDelayedTaskList>
    80001f06:	639c                	ld	a5,0(a5)
    80001f08:	4609                	li	a2,2
    80001f0a:	85be                	mv	a1,a5
    80001f0c:	853a                	mv	a0,a4
    80001f0e:	343000ef          	jal	80002a50 <prvListTaskWithinSingleList>
    80001f12:	872a                	mv	a4,a0
    80001f14:	77a2                	ld	a5,40(sp)
    80001f16:	97ba                	add	a5,a5,a4
    80001f18:	f43e                	sd	a5,40(sp)
    80001f1a:	7722                	ld	a4,40(sp)
    80001f1c:	87ba                	mv	a5,a4
    80001f1e:	078e                	slli	a5,a5,0x3
    80001f20:	8f99                	sub	a5,a5,a4
    80001f22:	078e                	slli	a5,a5,0x3
    80001f24:	873e                	mv	a4,a5
    80001f26:	67e2                	ld	a5,24(sp)
    80001f28:	973e                	add	a4,a4,a5
    80001f2a:	0001e797          	auipc	a5,0x1e
    80001f2e:	76e78793          	addi	a5,a5,1902 # 80020698 <pxOverflowDelayedTaskList>
    80001f32:	639c                	ld	a5,0(a5)
    80001f34:	4609                	li	a2,2
    80001f36:	85be                	mv	a1,a5
    80001f38:	853a                	mv	a0,a4
    80001f3a:	317000ef          	jal	80002a50 <prvListTaskWithinSingleList>
    80001f3e:	872a                	mv	a4,a0
    80001f40:	77a2                	ld	a5,40(sp)
    80001f42:	97ba                	add	a5,a5,a4
    80001f44:	f43e                	sd	a5,40(sp)
    80001f46:	7722                	ld	a4,40(sp)
    80001f48:	87ba                	mv	a5,a4
    80001f4a:	078e                	slli	a5,a5,0x3
    80001f4c:	8f99                	sub	a5,a5,a4
    80001f4e:	078e                	slli	a5,a5,0x3
    80001f50:	873e                	mv	a4,a5
    80001f52:	67e2                	ld	a5,24(sp)
    80001f54:	97ba                	add	a5,a5,a4
    80001f56:	4611                	li	a2,4
    80001f58:	0001e597          	auipc	a1,0x1e
    80001f5c:	77058593          	addi	a1,a1,1904 # 800206c8 <xTasksWaitingTermination>
    80001f60:	853e                	mv	a0,a5
    80001f62:	2ef000ef          	jal	80002a50 <prvListTaskWithinSingleList>
    80001f66:	872a                	mv	a4,a0
    80001f68:	77a2                	ld	a5,40(sp)
    80001f6a:	97ba                	add	a5,a5,a4
    80001f6c:	f43e                	sd	a5,40(sp)
    80001f6e:	7722                	ld	a4,40(sp)
    80001f70:	87ba                	mv	a5,a4
    80001f72:	078e                	slli	a5,a5,0x3
    80001f74:	8f99                	sub	a5,a5,a4
    80001f76:	078e                	slli	a5,a5,0x3
    80001f78:	873e                	mv	a4,a5
    80001f7a:	67e2                	ld	a5,24(sp)
    80001f7c:	97ba                	add	a5,a5,a4
    80001f7e:	460d                	li	a2,3
    80001f80:	0001e597          	auipc	a1,0x1e
    80001f84:	77858593          	addi	a1,a1,1912 # 800206f8 <xSuspendedTaskList>
    80001f88:	853e                	mv	a0,a5
    80001f8a:	2c7000ef          	jal	80002a50 <prvListTaskWithinSingleList>
    80001f8e:	872a                	mv	a4,a0
    80001f90:	77a2                	ld	a5,40(sp)
    80001f92:	97ba                	add	a5,a5,a4
    80001f94:	f43e                	sd	a5,40(sp)
    80001f96:	67a2                	ld	a5,8(sp)
    80001f98:	c781                	beqz	a5,80001fa0 <uxTaskGetSystemState+0x118>
    80001f9a:	67a2                	ld	a5,8(sp)
    80001f9c:	0007a023          	sw	zero,0(a5)
    80001fa0:	d3bff0ef          	jal	80001cda <xTaskResumeAll>
    80001fa4:	77a2                	ld	a5,40(sp)
    80001fa6:	853e                	mv	a0,a5
    80001fa8:	70e2                	ld	ra,56(sp)
    80001faa:	6121                	addi	sp,sp,64
    80001fac:	8082                	ret

0000000080001fae <xTaskIncrementTick>:
    80001fae:	7139                	addi	sp,sp,-64
    80001fb0:	fc06                	sd	ra,56(sp)
    80001fb2:	f402                	sd	zero,40(sp)
    80001fb4:	0001e797          	auipc	a5,0x1e
    80001fb8:	7b478793          	addi	a5,a5,1972 # 80020768 <uxSchedulerSuspended>
    80001fbc:	639c                	ld	a5,0(a5)
    80001fbe:	1a079063          	bnez	a5,8000215e <xTaskIncrementTick+0x1b0>
    80001fc2:	0001e797          	auipc	a5,0x1e
    80001fc6:	76678793          	addi	a5,a5,1894 # 80020728 <xTickCount>
    80001fca:	439c                	lw	a5,0(a5)
    80001fcc:	2781                	sext.w	a5,a5
    80001fce:	2785                	addiw	a5,a5,1
    80001fd0:	0007871b          	sext.w	a4,a5
    80001fd4:	0001e797          	auipc	a5,0x1e
    80001fd8:	75478793          	addi	a5,a5,1876 # 80020728 <xTickCount>
    80001fdc:	c398                	sw	a4,0(a5)
    80001fde:	0001e797          	auipc	a5,0x1e
    80001fe2:	74a78793          	addi	a5,a5,1866 # 80020728 <xTickCount>
    80001fe6:	439c                	lw	a5,0(a5)
    80001fe8:	d23e                	sw	a5,36(sp)
    80001fea:	5792                	lw	a5,36(sp)
    80001fec:	2781                	sext.w	a5,a5
    80001fee:	e3a5                	bnez	a5,8000204e <xTaskIncrementTick+0xa0>
    80001ff0:	0001e797          	auipc	a5,0x1e
    80001ff4:	6a078793          	addi	a5,a5,1696 # 80020690 <pxDelayedTaskList>
    80001ff8:	639c                	ld	a5,0(a5)
    80001ffa:	639c                	ld	a5,0(a5)
    80001ffc:	c789                	beqz	a5,80002006 <xTaskIncrementTick+0x58>
    80001ffe:	30047073          	csrci	mstatus,8
    80002002:	0001                	nop
    80002004:	bffd                	j	80002002 <xTaskIncrementTick+0x54>
    80002006:	0001e797          	auipc	a5,0x1e
    8000200a:	68a78793          	addi	a5,a5,1674 # 80020690 <pxDelayedTaskList>
    8000200e:	639c                	ld	a5,0(a5)
    80002010:	ec3e                	sd	a5,24(sp)
    80002012:	0001e797          	auipc	a5,0x1e
    80002016:	68678793          	addi	a5,a5,1670 # 80020698 <pxOverflowDelayedTaskList>
    8000201a:	6398                	ld	a4,0(a5)
    8000201c:	0001e797          	auipc	a5,0x1e
    80002020:	67478793          	addi	a5,a5,1652 # 80020690 <pxDelayedTaskList>
    80002024:	e398                	sd	a4,0(a5)
    80002026:	0001e797          	auipc	a5,0x1e
    8000202a:	67278793          	addi	a5,a5,1650 # 80020698 <pxOverflowDelayedTaskList>
    8000202e:	6762                	ld	a4,24(sp)
    80002030:	e398                	sd	a4,0(a5)
    80002032:	0001e797          	auipc	a5,0x1e
    80002036:	71e78793          	addi	a5,a5,1822 # 80020750 <xNumOfOverflows>
    8000203a:	639c                	ld	a5,0(a5)
    8000203c:	00178713          	addi	a4,a5,1
    80002040:	0001e797          	auipc	a5,0x1e
    80002044:	71078793          	addi	a5,a5,1808 # 80020750 <xNumOfOverflows>
    80002048:	e398                	sd	a4,0(a5)
    8000204a:	3c5000ef          	jal	80002c0e <prvResetNextTaskUnblockTime>
    8000204e:	0001e797          	auipc	a5,0x1e
    80002052:	71278793          	addi	a5,a5,1810 # 80020760 <xNextTaskUnblockTime>
    80002056:	439c                	lw	a5,0(a5)
    80002058:	0007871b          	sext.w	a4,a5
    8000205c:	5792                	lw	a5,36(sp)
    8000205e:	2781                	sext.w	a5,a5
    80002060:	0ce7e963          	bltu	a5,a4,80002132 <xTaskIncrementTick+0x184>
    80002064:	0001e797          	auipc	a5,0x1e
    80002068:	62c78793          	addi	a5,a5,1580 # 80020690 <pxDelayedTaskList>
    8000206c:	639c                	ld	a5,0(a5)
    8000206e:	639c                	ld	a5,0(a5)
    80002070:	e399                	bnez	a5,80002076 <xTaskIncrementTick+0xc8>
    80002072:	4785                	li	a5,1
    80002074:	a011                	j	80002078 <xTaskIncrementTick+0xca>
    80002076:	4781                	li	a5,0
    80002078:	cb81                	beqz	a5,80002088 <xTaskIncrementTick+0xda>
    8000207a:	0001e797          	auipc	a5,0x1e
    8000207e:	6e678793          	addi	a5,a5,1766 # 80020760 <xNextTaskUnblockTime>
    80002082:	577d                	li	a4,-1
    80002084:	c398                	sw	a4,0(a5)
    80002086:	a075                	j	80002132 <xTaskIncrementTick+0x184>
    80002088:	0001e797          	auipc	a5,0x1e
    8000208c:	60878793          	addi	a5,a5,1544 # 80020690 <pxDelayedTaskList>
    80002090:	639c                	ld	a5,0(a5)
    80002092:	6f9c                	ld	a5,24(a5)
    80002094:	6f9c                	ld	a5,24(a5)
    80002096:	e83e                	sd	a5,16(sp)
    80002098:	67c2                	ld	a5,16(sp)
    8000209a:	479c                	lw	a5,8(a5)
    8000209c:	c63e                	sw	a5,12(sp)
    8000209e:	5792                	lw	a5,36(sp)
    800020a0:	873e                	mv	a4,a5
    800020a2:	47b2                	lw	a5,12(sp)
    800020a4:	2701                	sext.w	a4,a4
    800020a6:	2781                	sext.w	a5,a5
    800020a8:	00f77963          	bgeu	a4,a5,800020ba <xTaskIncrementTick+0x10c>
    800020ac:	0001e797          	auipc	a5,0x1e
    800020b0:	6b478793          	addi	a5,a5,1716 # 80020760 <xNextTaskUnblockTime>
    800020b4:	4732                	lw	a4,12(sp)
    800020b6:	c398                	sw	a4,0(a5)
    800020b8:	a8ad                	j	80002132 <xTaskIncrementTick+0x184>
    800020ba:	67c2                	ld	a5,16(sp)
    800020bc:	07a1                	addi	a5,a5,8
    800020be:	853e                	mv	a0,a5
    800020c0:	d88fe0ef          	jal	80000648 <uxListRemove>
    800020c4:	67c2                	ld	a5,16(sp)
    800020c6:	6bbc                	ld	a5,80(a5)
    800020c8:	c799                	beqz	a5,800020d6 <xTaskIncrementTick+0x128>
    800020ca:	67c2                	ld	a5,16(sp)
    800020cc:	03078793          	addi	a5,a5,48
    800020d0:	853e                	mv	a0,a5
    800020d2:	d76fe0ef          	jal	80000648 <uxListRemove>
    800020d6:	67c2                	ld	a5,16(sp)
    800020d8:	6fb8                	ld	a4,88(a5)
    800020da:	0001e797          	auipc	a5,0x1e
    800020de:	65678793          	addi	a5,a5,1622 # 80020730 <uxTopReadyPriority>
    800020e2:	639c                	ld	a5,0(a5)
    800020e4:	00e7f963          	bgeu	a5,a4,800020f6 <xTaskIncrementTick+0x148>
    800020e8:	67c2                	ld	a5,16(sp)
    800020ea:	6fb8                	ld	a4,88(a5)
    800020ec:	0001e797          	auipc	a5,0x1e
    800020f0:	64478793          	addi	a5,a5,1604 # 80020730 <uxTopReadyPriority>
    800020f4:	e398                	sd	a4,0(a5)
    800020f6:	67c2                	ld	a5,16(sp)
    800020f8:	6fb8                	ld	a4,88(a5)
    800020fa:	87ba                	mv	a5,a4
    800020fc:	078a                	slli	a5,a5,0x2
    800020fe:	97ba                	add	a5,a5,a4
    80002100:	078e                	slli	a5,a5,0x3
    80002102:	0001e717          	auipc	a4,0x1e
    80002106:	47670713          	addi	a4,a4,1142 # 80020578 <pxReadyTasksLists>
    8000210a:	973e                	add	a4,a4,a5
    8000210c:	67c2                	ld	a5,16(sp)
    8000210e:	07a1                	addi	a5,a5,8
    80002110:	85be                	mv	a1,a5
    80002112:	853a                	mv	a0,a4
    80002114:	c84fe0ef          	jal	80000598 <vListInsertEnd>
    80002118:	67c2                	ld	a5,16(sp)
    8000211a:	6fb8                	ld	a4,88(a5)
    8000211c:	0001e797          	auipc	a5,0x1e
    80002120:	22478793          	addi	a5,a5,548 # 80020340 <pxCurrentTCB>
    80002124:	639c                	ld	a5,0(a5)
    80002126:	6fbc                	ld	a5,88(a5)
    80002128:	f2f76ee3          	bltu	a4,a5,80002064 <xTaskIncrementTick+0xb6>
    8000212c:	4785                	li	a5,1
    8000212e:	f43e                	sd	a5,40(sp)
    80002130:	bf15                	j	80002064 <xTaskIncrementTick+0xb6>
    80002132:	0001e797          	auipc	a5,0x1e
    80002136:	20e78793          	addi	a5,a5,526 # 80020340 <pxCurrentTCB>
    8000213a:	639c                	ld	a5,0(a5)
    8000213c:	6fb8                	ld	a4,88(a5)
    8000213e:	0001e697          	auipc	a3,0x1e
    80002142:	43a68693          	addi	a3,a3,1082 # 80020578 <pxReadyTasksLists>
    80002146:	87ba                	mv	a5,a4
    80002148:	078a                	slli	a5,a5,0x2
    8000214a:	97ba                	add	a5,a5,a4
    8000214c:	078e                	slli	a5,a5,0x3
    8000214e:	97b6                	add	a5,a5,a3
    80002150:	6398                	ld	a4,0(a5)
    80002152:	4785                	li	a5,1
    80002154:	02e7f163          	bgeu	a5,a4,80002176 <xTaskIncrementTick+0x1c8>
    80002158:	4785                	li	a5,1
    8000215a:	f43e                	sd	a5,40(sp)
    8000215c:	a829                	j	80002176 <xTaskIncrementTick+0x1c8>
    8000215e:	0001e797          	auipc	a5,0x1e
    80002162:	5e278793          	addi	a5,a5,1506 # 80020740 <uxPendedTicks>
    80002166:	639c                	ld	a5,0(a5)
    80002168:	00178713          	addi	a4,a5,1
    8000216c:	0001e797          	auipc	a5,0x1e
    80002170:	5d478793          	addi	a5,a5,1492 # 80020740 <uxPendedTicks>
    80002174:	e398                	sd	a4,0(a5)
    80002176:	0001e797          	auipc	a5,0x1e
    8000217a:	5d278793          	addi	a5,a5,1490 # 80020748 <xYieldPending>
    8000217e:	639c                	ld	a5,0(a5)
    80002180:	c399                	beqz	a5,80002186 <xTaskIncrementTick+0x1d8>
    80002182:	4785                	li	a5,1
    80002184:	f43e                	sd	a5,40(sp)
    80002186:	77a2                	ld	a5,40(sp)
    80002188:	853e                	mv	a0,a5
    8000218a:	70e2                	ld	ra,56(sp)
    8000218c:	6121                	addi	sp,sp,64
    8000218e:	8082                	ret

0000000080002190 <vTaskSwitchContext>:
    80002190:	7179                	addi	sp,sp,-48
    80002192:	f406                	sd	ra,40(sp)
    80002194:	0001e797          	auipc	a5,0x1e
    80002198:	5d478793          	addi	a5,a5,1492 # 80020768 <uxSchedulerSuspended>
    8000219c:	639c                	ld	a5,0(a5)
    8000219e:	cb81                	beqz	a5,800021ae <vTaskSwitchContext+0x1e>
    800021a0:	0001e797          	auipc	a5,0x1e
    800021a4:	5a878793          	addi	a5,a5,1448 # 80020748 <xYieldPending>
    800021a8:	4705                	li	a4,1
    800021aa:	e398                	sd	a4,0(a5)
    800021ac:	aa21                	j	800022c4 <vTaskSwitchContext+0x134>
    800021ae:	0001e797          	auipc	a5,0x1e
    800021b2:	59a78793          	addi	a5,a5,1434 # 80020748 <xYieldPending>
    800021b6:	0007b023          	sd	zero,0(a5)
    800021ba:	0001e797          	auipc	a5,0x1e
    800021be:	18678793          	addi	a5,a5,390 # 80020340 <pxCurrentTCB>
    800021c2:	639c                	ld	a5,0(a5)
    800021c4:	73bc                	ld	a5,96(a5)
    800021c6:	ec3e                	sd	a5,24(sp)
    800021c8:	a5a5a7b7          	lui	a5,0xa5a5a
    800021cc:	5a578793          	addi	a5,a5,1445 # ffffffffa5a5a5a5 <__stack+0xffffffff25a1ebfd>
    800021d0:	ca3e                	sw	a5,20(sp)
    800021d2:	67e2                	ld	a5,24(sp)
    800021d4:	4398                	lw	a4,0(a5)
    800021d6:	47d2                	lw	a5,20(sp)
    800021d8:	2781                	sext.w	a5,a5
    800021da:	02e79763          	bne	a5,a4,80002208 <vTaskSwitchContext+0x78>
    800021de:	67e2                	ld	a5,24(sp)
    800021e0:	0791                	addi	a5,a5,4
    800021e2:	4398                	lw	a4,0(a5)
    800021e4:	47d2                	lw	a5,20(sp)
    800021e6:	2781                	sext.w	a5,a5
    800021e8:	02e79063          	bne	a5,a4,80002208 <vTaskSwitchContext+0x78>
    800021ec:	67e2                	ld	a5,24(sp)
    800021ee:	07a1                	addi	a5,a5,8
    800021f0:	4398                	lw	a4,0(a5)
    800021f2:	47d2                	lw	a5,20(sp)
    800021f4:	2781                	sext.w	a5,a5
    800021f6:	00e79963          	bne	a5,a4,80002208 <vTaskSwitchContext+0x78>
    800021fa:	67e2                	ld	a5,24(sp)
    800021fc:	07b1                	addi	a5,a5,12
    800021fe:	4398                	lw	a4,0(a5)
    80002200:	47d2                	lw	a5,20(sp)
    80002202:	2781                	sext.w	a5,a5
    80002204:	04e78963          	beq	a5,a4,80002256 <vTaskSwitchContext+0xc6>
    80002208:	0001e797          	auipc	a5,0x1e
    8000220c:	13878793          	addi	a5,a5,312 # 80020340 <pxCurrentTCB>
    80002210:	6398                	ld	a4,0(a5)
    80002212:	0001e797          	auipc	a5,0x1e
    80002216:	12e78793          	addi	a5,a5,302 # 80020340 <pxCurrentTCB>
    8000221a:	639c                	ld	a5,0(a5)
    8000221c:	06878793          	addi	a5,a5,104
    80002220:	85be                	mv	a1,a5
    80002222:	853a                	mv	a0,a4
    80002224:	52f020ef          	jal	80004f52 <vApplicationStackOverflowHook>
    80002228:	a03d                	j	80002256 <vTaskSwitchContext+0xc6>
    8000222a:	0001e797          	auipc	a5,0x1e
    8000222e:	50678793          	addi	a5,a5,1286 # 80020730 <uxTopReadyPriority>
    80002232:	639c                	ld	a5,0(a5)
    80002234:	e789                	bnez	a5,8000223e <vTaskSwitchContext+0xae>
    80002236:	30047073          	csrci	mstatus,8
    8000223a:	0001                	nop
    8000223c:	bffd                	j	8000223a <vTaskSwitchContext+0xaa>
    8000223e:	0001e797          	auipc	a5,0x1e
    80002242:	4f278793          	addi	a5,a5,1266 # 80020730 <uxTopReadyPriority>
    80002246:	639c                	ld	a5,0(a5)
    80002248:	fff78713          	addi	a4,a5,-1
    8000224c:	0001e797          	auipc	a5,0x1e
    80002250:	4e478793          	addi	a5,a5,1252 # 80020730 <uxTopReadyPriority>
    80002254:	e398                	sd	a4,0(a5)
    80002256:	0001e797          	auipc	a5,0x1e
    8000225a:	4da78793          	addi	a5,a5,1242 # 80020730 <uxTopReadyPriority>
    8000225e:	6398                	ld	a4,0(a5)
    80002260:	0001e697          	auipc	a3,0x1e
    80002264:	31868693          	addi	a3,a3,792 # 80020578 <pxReadyTasksLists>
    80002268:	87ba                	mv	a5,a4
    8000226a:	078a                	slli	a5,a5,0x2
    8000226c:	97ba                	add	a5,a5,a4
    8000226e:	078e                	slli	a5,a5,0x3
    80002270:	97b6                	add	a5,a5,a3
    80002272:	639c                	ld	a5,0(a5)
    80002274:	dbdd                	beqz	a5,8000222a <vTaskSwitchContext+0x9a>
    80002276:	0001e797          	auipc	a5,0x1e
    8000227a:	4ba78793          	addi	a5,a5,1210 # 80020730 <uxTopReadyPriority>
    8000227e:	6398                	ld	a4,0(a5)
    80002280:	87ba                	mv	a5,a4
    80002282:	078a                	slli	a5,a5,0x2
    80002284:	97ba                	add	a5,a5,a4
    80002286:	078e                	slli	a5,a5,0x3
    80002288:	0001e717          	auipc	a4,0x1e
    8000228c:	2f070713          	addi	a4,a4,752 # 80020578 <pxReadyTasksLists>
    80002290:	97ba                	add	a5,a5,a4
    80002292:	e43e                	sd	a5,8(sp)
    80002294:	67a2                	ld	a5,8(sp)
    80002296:	679c                	ld	a5,8(a5)
    80002298:	6798                	ld	a4,8(a5)
    8000229a:	67a2                	ld	a5,8(sp)
    8000229c:	e798                	sd	a4,8(a5)
    8000229e:	67a2                	ld	a5,8(sp)
    800022a0:	6798                	ld	a4,8(a5)
    800022a2:	67a2                	ld	a5,8(sp)
    800022a4:	07c1                	addi	a5,a5,16
    800022a6:	00f71763          	bne	a4,a5,800022b4 <vTaskSwitchContext+0x124>
    800022aa:	67a2                	ld	a5,8(sp)
    800022ac:	679c                	ld	a5,8(a5)
    800022ae:	6798                	ld	a4,8(a5)
    800022b0:	67a2                	ld	a5,8(sp)
    800022b2:	e798                	sd	a4,8(a5)
    800022b4:	67a2                	ld	a5,8(sp)
    800022b6:	679c                	ld	a5,8(a5)
    800022b8:	6f98                	ld	a4,24(a5)
    800022ba:	0001e797          	auipc	a5,0x1e
    800022be:	08678793          	addi	a5,a5,134 # 80020340 <pxCurrentTCB>
    800022c2:	e398                	sd	a4,0(a5)
    800022c4:	0001                	nop
    800022c6:	70a2                	ld	ra,40(sp)
    800022c8:	6145                	addi	sp,sp,48
    800022ca:	8082                	ret

00000000800022cc <vTaskPlaceOnEventList>:
    800022cc:	7179                	addi	sp,sp,-48
    800022ce:	f406                	sd	ra,40(sp)
    800022d0:	e42a                	sd	a0,8(sp)
    800022d2:	87ae                	mv	a5,a1
    800022d4:	c23e                	sw	a5,4(sp)
    800022d6:	67a2                	ld	a5,8(sp)
    800022d8:	e789                	bnez	a5,800022e2 <vTaskPlaceOnEventList+0x16>
    800022da:	30047073          	csrci	mstatus,8
    800022de:	0001                	nop
    800022e0:	bffd                	j	800022de <vTaskPlaceOnEventList+0x12>
    800022e2:	0001e797          	auipc	a5,0x1e
    800022e6:	05e78793          	addi	a5,a5,94 # 80020340 <pxCurrentTCB>
    800022ea:	639c                	ld	a5,0(a5)
    800022ec:	03078793          	addi	a5,a5,48
    800022f0:	85be                	mv	a1,a5
    800022f2:	6522                	ld	a0,8(sp)
    800022f4:	ae4fe0ef          	jal	800005d8 <vListInsert>
    800022f8:	0001e797          	auipc	a5,0x1e
    800022fc:	04878793          	addi	a5,a5,72 # 80020340 <pxCurrentTCB>
    80002300:	639c                	ld	a5,0(a5)
    80002302:	07a1                	addi	a5,a5,8
    80002304:	853e                	mv	a0,a5
    80002306:	b42fe0ef          	jal	80000648 <uxListRemove>
    8000230a:	4792                	lw	a5,4(sp)
    8000230c:	0007871b          	sext.w	a4,a5
    80002310:	57fd                	li	a5,-1
    80002312:	02f71063          	bne	a4,a5,80002332 <vTaskPlaceOnEventList+0x66>
    80002316:	0001e797          	auipc	a5,0x1e
    8000231a:	02a78793          	addi	a5,a5,42 # 80020340 <pxCurrentTCB>
    8000231e:	639c                	ld	a5,0(a5)
    80002320:	07a1                	addi	a5,a5,8
    80002322:	85be                	mv	a1,a5
    80002324:	0001e517          	auipc	a0,0x1e
    80002328:	3d450513          	addi	a0,a0,980 # 800206f8 <xSuspendedTaskList>
    8000232c:	a6cfe0ef          	jal	80000598 <vListInsertEnd>
    80002330:	a831                	j	8000234c <vTaskPlaceOnEventList+0x80>
    80002332:	0001e797          	auipc	a5,0x1e
    80002336:	3f678793          	addi	a5,a5,1014 # 80020728 <xTickCount>
    8000233a:	439c                	lw	a5,0(a5)
    8000233c:	2781                	sext.w	a5,a5
    8000233e:	4712                	lw	a4,4(sp)
    80002340:	9fb9                	addw	a5,a5,a4
    80002342:	ce3e                	sw	a5,28(sp)
    80002344:	47f2                	lw	a5,28(sp)
    80002346:	853e                	mv	a0,a5
    80002348:	608000ef          	jal	80002950 <prvAddCurrentTaskToDelayedList>
    8000234c:	0001                	nop
    8000234e:	70a2                	ld	ra,40(sp)
    80002350:	6145                	addi	sp,sp,48
    80002352:	8082                	ret

0000000080002354 <vTaskPlaceOnUnorderedEventList>:
    80002354:	7179                	addi	sp,sp,-48
    80002356:	f406                	sd	ra,40(sp)
    80002358:	e42a                	sd	a0,8(sp)
    8000235a:	87ae                	mv	a5,a1
    8000235c:	8732                	mv	a4,a2
    8000235e:	c23e                	sw	a5,4(sp)
    80002360:	87ba                	mv	a5,a4
    80002362:	c03e                	sw	a5,0(sp)
    80002364:	67a2                	ld	a5,8(sp)
    80002366:	e789                	bnez	a5,80002370 <vTaskPlaceOnUnorderedEventList+0x1c>
    80002368:	30047073          	csrci	mstatus,8
    8000236c:	0001                	nop
    8000236e:	bffd                	j	8000236c <vTaskPlaceOnUnorderedEventList+0x18>
    80002370:	0001e797          	auipc	a5,0x1e
    80002374:	3f878793          	addi	a5,a5,1016 # 80020768 <uxSchedulerSuspended>
    80002378:	639c                	ld	a5,0(a5)
    8000237a:	e789                	bnez	a5,80002384 <vTaskPlaceOnUnorderedEventList+0x30>
    8000237c:	30047073          	csrci	mstatus,8
    80002380:	0001                	nop
    80002382:	bffd                	j	80002380 <vTaskPlaceOnUnorderedEventList+0x2c>
    80002384:	0001e797          	auipc	a5,0x1e
    80002388:	fbc78793          	addi	a5,a5,-68 # 80020340 <pxCurrentTCB>
    8000238c:	639c                	ld	a5,0(a5)
    8000238e:	4712                	lw	a4,4(sp)
    80002390:	86ba                	mv	a3,a4
    80002392:	80000737          	lui	a4,0x80000
    80002396:	8f55                	or	a4,a4,a3
    80002398:	2701                	sext.w	a4,a4
    8000239a:	db98                	sw	a4,48(a5)
    8000239c:	0001e797          	auipc	a5,0x1e
    800023a0:	fa478793          	addi	a5,a5,-92 # 80020340 <pxCurrentTCB>
    800023a4:	639c                	ld	a5,0(a5)
    800023a6:	03078793          	addi	a5,a5,48
    800023aa:	85be                	mv	a1,a5
    800023ac:	6522                	ld	a0,8(sp)
    800023ae:	9eafe0ef          	jal	80000598 <vListInsertEnd>
    800023b2:	0001e797          	auipc	a5,0x1e
    800023b6:	f8e78793          	addi	a5,a5,-114 # 80020340 <pxCurrentTCB>
    800023ba:	639c                	ld	a5,0(a5)
    800023bc:	07a1                	addi	a5,a5,8
    800023be:	853e                	mv	a0,a5
    800023c0:	a88fe0ef          	jal	80000648 <uxListRemove>
    800023c4:	4782                	lw	a5,0(sp)
    800023c6:	0007871b          	sext.w	a4,a5
    800023ca:	57fd                	li	a5,-1
    800023cc:	02f71063          	bne	a4,a5,800023ec <vTaskPlaceOnUnorderedEventList+0x98>
    800023d0:	0001e797          	auipc	a5,0x1e
    800023d4:	f7078793          	addi	a5,a5,-144 # 80020340 <pxCurrentTCB>
    800023d8:	639c                	ld	a5,0(a5)
    800023da:	07a1                	addi	a5,a5,8
    800023dc:	85be                	mv	a1,a5
    800023de:	0001e517          	auipc	a0,0x1e
    800023e2:	31a50513          	addi	a0,a0,794 # 800206f8 <xSuspendedTaskList>
    800023e6:	9b2fe0ef          	jal	80000598 <vListInsertEnd>
    800023ea:	a831                	j	80002406 <vTaskPlaceOnUnorderedEventList+0xb2>
    800023ec:	0001e797          	auipc	a5,0x1e
    800023f0:	33c78793          	addi	a5,a5,828 # 80020728 <xTickCount>
    800023f4:	439c                	lw	a5,0(a5)
    800023f6:	2781                	sext.w	a5,a5
    800023f8:	4702                	lw	a4,0(sp)
    800023fa:	9fb9                	addw	a5,a5,a4
    800023fc:	ce3e                	sw	a5,28(sp)
    800023fe:	47f2                	lw	a5,28(sp)
    80002400:	853e                	mv	a0,a5
    80002402:	54e000ef          	jal	80002950 <prvAddCurrentTaskToDelayedList>
    80002406:	0001                	nop
    80002408:	70a2                	ld	ra,40(sp)
    8000240a:	6145                	addi	sp,sp,48
    8000240c:	8082                	ret

000000008000240e <vTaskPlaceOnEventListRestricted>:
    8000240e:	7139                	addi	sp,sp,-64
    80002410:	fc06                	sd	ra,56(sp)
    80002412:	ec2a                	sd	a0,24(sp)
    80002414:	87ae                	mv	a5,a1
    80002416:	e432                	sd	a2,8(sp)
    80002418:	ca3e                	sw	a5,20(sp)
    8000241a:	67e2                	ld	a5,24(sp)
    8000241c:	e789                	bnez	a5,80002426 <vTaskPlaceOnEventListRestricted+0x18>
    8000241e:	30047073          	csrci	mstatus,8
    80002422:	0001                	nop
    80002424:	bffd                	j	80002422 <vTaskPlaceOnEventListRestricted+0x14>
    80002426:	0001e797          	auipc	a5,0x1e
    8000242a:	f1a78793          	addi	a5,a5,-230 # 80020340 <pxCurrentTCB>
    8000242e:	639c                	ld	a5,0(a5)
    80002430:	03078793          	addi	a5,a5,48
    80002434:	85be                	mv	a1,a5
    80002436:	6562                	ld	a0,24(sp)
    80002438:	960fe0ef          	jal	80000598 <vListInsertEnd>
    8000243c:	0001e797          	auipc	a5,0x1e
    80002440:	f0478793          	addi	a5,a5,-252 # 80020340 <pxCurrentTCB>
    80002444:	639c                	ld	a5,0(a5)
    80002446:	07a1                	addi	a5,a5,8
    80002448:	853e                	mv	a0,a5
    8000244a:	9fefe0ef          	jal	80000648 <uxListRemove>
    8000244e:	6722                	ld	a4,8(sp)
    80002450:	4785                	li	a5,1
    80002452:	02f71063          	bne	a4,a5,80002472 <vTaskPlaceOnEventListRestricted+0x64>
    80002456:	0001e797          	auipc	a5,0x1e
    8000245a:	eea78793          	addi	a5,a5,-278 # 80020340 <pxCurrentTCB>
    8000245e:	639c                	ld	a5,0(a5)
    80002460:	07a1                	addi	a5,a5,8
    80002462:	85be                	mv	a1,a5
    80002464:	0001e517          	auipc	a0,0x1e
    80002468:	29450513          	addi	a0,a0,660 # 800206f8 <xSuspendedTaskList>
    8000246c:	92cfe0ef          	jal	80000598 <vListInsertEnd>
    80002470:	a831                	j	8000248c <vTaskPlaceOnEventListRestricted+0x7e>
    80002472:	0001e797          	auipc	a5,0x1e
    80002476:	2b678793          	addi	a5,a5,694 # 80020728 <xTickCount>
    8000247a:	439c                	lw	a5,0(a5)
    8000247c:	2781                	sext.w	a5,a5
    8000247e:	4752                	lw	a4,20(sp)
    80002480:	9fb9                	addw	a5,a5,a4
    80002482:	d63e                	sw	a5,44(sp)
    80002484:	57b2                	lw	a5,44(sp)
    80002486:	853e                	mv	a0,a5
    80002488:	4c8000ef          	jal	80002950 <prvAddCurrentTaskToDelayedList>
    8000248c:	0001                	nop
    8000248e:	70e2                	ld	ra,56(sp)
    80002490:	6121                	addi	sp,sp,64
    80002492:	8082                	ret

0000000080002494 <xTaskRemoveFromEventList>:
    80002494:	7179                	addi	sp,sp,-48
    80002496:	f406                	sd	ra,40(sp)
    80002498:	e42a                	sd	a0,8(sp)
    8000249a:	67a2                	ld	a5,8(sp)
    8000249c:	6f9c                	ld	a5,24(a5)
    8000249e:	6f9c                	ld	a5,24(a5)
    800024a0:	e83e                	sd	a5,16(sp)
    800024a2:	67c2                	ld	a5,16(sp)
    800024a4:	e789                	bnez	a5,800024ae <xTaskRemoveFromEventList+0x1a>
    800024a6:	30047073          	csrci	mstatus,8
    800024aa:	0001                	nop
    800024ac:	bffd                	j	800024aa <xTaskRemoveFromEventList+0x16>
    800024ae:	67c2                	ld	a5,16(sp)
    800024b0:	03078793          	addi	a5,a5,48
    800024b4:	853e                	mv	a0,a5
    800024b6:	992fe0ef          	jal	80000648 <uxListRemove>
    800024ba:	0001e797          	auipc	a5,0x1e
    800024be:	2ae78793          	addi	a5,a5,686 # 80020768 <uxSchedulerSuspended>
    800024c2:	639c                	ld	a5,0(a5)
    800024c4:	eba1                	bnez	a5,80002514 <xTaskRemoveFromEventList+0x80>
    800024c6:	67c2                	ld	a5,16(sp)
    800024c8:	07a1                	addi	a5,a5,8
    800024ca:	853e                	mv	a0,a5
    800024cc:	97cfe0ef          	jal	80000648 <uxListRemove>
    800024d0:	67c2                	ld	a5,16(sp)
    800024d2:	6fb8                	ld	a4,88(a5)
    800024d4:	0001e797          	auipc	a5,0x1e
    800024d8:	25c78793          	addi	a5,a5,604 # 80020730 <uxTopReadyPriority>
    800024dc:	639c                	ld	a5,0(a5)
    800024de:	00e7f963          	bgeu	a5,a4,800024f0 <xTaskRemoveFromEventList+0x5c>
    800024e2:	67c2                	ld	a5,16(sp)
    800024e4:	6fb8                	ld	a4,88(a5)
    800024e6:	0001e797          	auipc	a5,0x1e
    800024ea:	24a78793          	addi	a5,a5,586 # 80020730 <uxTopReadyPriority>
    800024ee:	e398                	sd	a4,0(a5)
    800024f0:	67c2                	ld	a5,16(sp)
    800024f2:	6fb8                	ld	a4,88(a5)
    800024f4:	87ba                	mv	a5,a4
    800024f6:	078a                	slli	a5,a5,0x2
    800024f8:	97ba                	add	a5,a5,a4
    800024fa:	078e                	slli	a5,a5,0x3
    800024fc:	0001e717          	auipc	a4,0x1e
    80002500:	07c70713          	addi	a4,a4,124 # 80020578 <pxReadyTasksLists>
    80002504:	973e                	add	a4,a4,a5
    80002506:	67c2                	ld	a5,16(sp)
    80002508:	07a1                	addi	a5,a5,8
    8000250a:	85be                	mv	a1,a5
    8000250c:	853a                	mv	a0,a4
    8000250e:	88afe0ef          	jal	80000598 <vListInsertEnd>
    80002512:	a819                	j	80002528 <xTaskRemoveFromEventList+0x94>
    80002514:	67c2                	ld	a5,16(sp)
    80002516:	03078793          	addi	a5,a5,48
    8000251a:	85be                	mv	a1,a5
    8000251c:	0001e517          	auipc	a0,0x1e
    80002520:	18450513          	addi	a0,a0,388 # 800206a0 <xPendingReadyList>
    80002524:	874fe0ef          	jal	80000598 <vListInsertEnd>
    80002528:	67c2                	ld	a5,16(sp)
    8000252a:	6fb8                	ld	a4,88(a5)
    8000252c:	0001e797          	auipc	a5,0x1e
    80002530:	e1478793          	addi	a5,a5,-492 # 80020340 <pxCurrentTCB>
    80002534:	639c                	ld	a5,0(a5)
    80002536:	6fbc                	ld	a5,88(a5)
    80002538:	00e7fb63          	bgeu	a5,a4,8000254e <xTaskRemoveFromEventList+0xba>
    8000253c:	4785                	li	a5,1
    8000253e:	ec3e                	sd	a5,24(sp)
    80002540:	0001e797          	auipc	a5,0x1e
    80002544:	20878793          	addi	a5,a5,520 # 80020748 <xYieldPending>
    80002548:	4705                	li	a4,1
    8000254a:	e398                	sd	a4,0(a5)
    8000254c:	a011                	j	80002550 <xTaskRemoveFromEventList+0xbc>
    8000254e:	ec02                	sd	zero,24(sp)
    80002550:	67e2                	ld	a5,24(sp)
    80002552:	853e                	mv	a0,a5
    80002554:	70a2                	ld	ra,40(sp)
    80002556:	6145                	addi	sp,sp,48
    80002558:	8082                	ret

000000008000255a <xTaskRemoveFromUnorderedEventList>:
    8000255a:	7179                	addi	sp,sp,-48
    8000255c:	f406                	sd	ra,40(sp)
    8000255e:	e42a                	sd	a0,8(sp)
    80002560:	87ae                	mv	a5,a1
    80002562:	c23e                	sw	a5,4(sp)
    80002564:	0001e797          	auipc	a5,0x1e
    80002568:	20478793          	addi	a5,a5,516 # 80020768 <uxSchedulerSuspended>
    8000256c:	639c                	ld	a5,0(a5)
    8000256e:	e789                	bnez	a5,80002578 <xTaskRemoveFromUnorderedEventList+0x1e>
    80002570:	30047073          	csrci	mstatus,8
    80002574:	0001                	nop
    80002576:	bffd                	j	80002574 <xTaskRemoveFromUnorderedEventList+0x1a>
    80002578:	4792                	lw	a5,4(sp)
    8000257a:	873e                	mv	a4,a5
    8000257c:	800007b7          	lui	a5,0x80000
    80002580:	8fd9                	or	a5,a5,a4
    80002582:	0007871b          	sext.w	a4,a5
    80002586:	67a2                	ld	a5,8(sp)
    80002588:	c398                	sw	a4,0(a5)
    8000258a:	67a2                	ld	a5,8(sp)
    8000258c:	6f9c                	ld	a5,24(a5)
    8000258e:	e83e                	sd	a5,16(sp)
    80002590:	67c2                	ld	a5,16(sp)
    80002592:	e789                	bnez	a5,8000259c <xTaskRemoveFromUnorderedEventList+0x42>
    80002594:	30047073          	csrci	mstatus,8
    80002598:	0001                	nop
    8000259a:	bffd                	j	80002598 <xTaskRemoveFromUnorderedEventList+0x3e>
    8000259c:	6522                	ld	a0,8(sp)
    8000259e:	8aafe0ef          	jal	80000648 <uxListRemove>
    800025a2:	67c2                	ld	a5,16(sp)
    800025a4:	07a1                	addi	a5,a5,8 # ffffffff80000008 <__stack+0xfffffffefffc4660>
    800025a6:	853e                	mv	a0,a5
    800025a8:	8a0fe0ef          	jal	80000648 <uxListRemove>
    800025ac:	67c2                	ld	a5,16(sp)
    800025ae:	6fb8                	ld	a4,88(a5)
    800025b0:	0001e797          	auipc	a5,0x1e
    800025b4:	18078793          	addi	a5,a5,384 # 80020730 <uxTopReadyPriority>
    800025b8:	639c                	ld	a5,0(a5)
    800025ba:	00e7f963          	bgeu	a5,a4,800025cc <xTaskRemoveFromUnorderedEventList+0x72>
    800025be:	67c2                	ld	a5,16(sp)
    800025c0:	6fb8                	ld	a4,88(a5)
    800025c2:	0001e797          	auipc	a5,0x1e
    800025c6:	16e78793          	addi	a5,a5,366 # 80020730 <uxTopReadyPriority>
    800025ca:	e398                	sd	a4,0(a5)
    800025cc:	67c2                	ld	a5,16(sp)
    800025ce:	6fb8                	ld	a4,88(a5)
    800025d0:	87ba                	mv	a5,a4
    800025d2:	078a                	slli	a5,a5,0x2
    800025d4:	97ba                	add	a5,a5,a4
    800025d6:	078e                	slli	a5,a5,0x3
    800025d8:	0001e717          	auipc	a4,0x1e
    800025dc:	fa070713          	addi	a4,a4,-96 # 80020578 <pxReadyTasksLists>
    800025e0:	973e                	add	a4,a4,a5
    800025e2:	67c2                	ld	a5,16(sp)
    800025e4:	07a1                	addi	a5,a5,8
    800025e6:	85be                	mv	a1,a5
    800025e8:	853a                	mv	a0,a4
    800025ea:	faffd0ef          	jal	80000598 <vListInsertEnd>
    800025ee:	67c2                	ld	a5,16(sp)
    800025f0:	6fb8                	ld	a4,88(a5)
    800025f2:	0001e797          	auipc	a5,0x1e
    800025f6:	d4e78793          	addi	a5,a5,-690 # 80020340 <pxCurrentTCB>
    800025fa:	639c                	ld	a5,0(a5)
    800025fc:	6fbc                	ld	a5,88(a5)
    800025fe:	00e7fb63          	bgeu	a5,a4,80002614 <xTaskRemoveFromUnorderedEventList+0xba>
    80002602:	4785                	li	a5,1
    80002604:	ec3e                	sd	a5,24(sp)
    80002606:	0001e797          	auipc	a5,0x1e
    8000260a:	14278793          	addi	a5,a5,322 # 80020748 <xYieldPending>
    8000260e:	4705                	li	a4,1
    80002610:	e398                	sd	a4,0(a5)
    80002612:	a011                	j	80002616 <xTaskRemoveFromUnorderedEventList+0xbc>
    80002614:	ec02                	sd	zero,24(sp)
    80002616:	67e2                	ld	a5,24(sp)
    80002618:	853e                	mv	a0,a5
    8000261a:	70a2                	ld	ra,40(sp)
    8000261c:	6145                	addi	sp,sp,48
    8000261e:	8082                	ret

0000000080002620 <vTaskSetTimeOutState>:
    80002620:	1141                	addi	sp,sp,-16
    80002622:	e42a                	sd	a0,8(sp)
    80002624:	67a2                	ld	a5,8(sp)
    80002626:	e789                	bnez	a5,80002630 <vTaskSetTimeOutState+0x10>
    80002628:	30047073          	csrci	mstatus,8
    8000262c:	0001                	nop
    8000262e:	bffd                	j	8000262c <vTaskSetTimeOutState+0xc>
    80002630:	0001e797          	auipc	a5,0x1e
    80002634:	12078793          	addi	a5,a5,288 # 80020750 <xNumOfOverflows>
    80002638:	6398                	ld	a4,0(a5)
    8000263a:	67a2                	ld	a5,8(sp)
    8000263c:	e398                	sd	a4,0(a5)
    8000263e:	0001e797          	auipc	a5,0x1e
    80002642:	0ea78793          	addi	a5,a5,234 # 80020728 <xTickCount>
    80002646:	439c                	lw	a5,0(a5)
    80002648:	0007871b          	sext.w	a4,a5
    8000264c:	67a2                	ld	a5,8(sp)
    8000264e:	c798                	sw	a4,8(a5)
    80002650:	0001                	nop
    80002652:	0141                	addi	sp,sp,16
    80002654:	8082                	ret

0000000080002656 <xTaskCheckForTimeOut>:
    80002656:	7179                	addi	sp,sp,-48
    80002658:	f406                	sd	ra,40(sp)
    8000265a:	e42a                	sd	a0,8(sp)
    8000265c:	e02e                	sd	a1,0(sp)
    8000265e:	67a2                	ld	a5,8(sp)
    80002660:	e789                	bnez	a5,8000266a <xTaskCheckForTimeOut+0x14>
    80002662:	30047073          	csrci	mstatus,8
    80002666:	0001                	nop
    80002668:	bffd                	j	80002666 <xTaskCheckForTimeOut+0x10>
    8000266a:	6782                	ld	a5,0(sp)
    8000266c:	e789                	bnez	a5,80002676 <xTaskCheckForTimeOut+0x20>
    8000266e:	30047073          	csrci	mstatus,8
    80002672:	0001                	nop
    80002674:	bffd                	j	80002672 <xTaskCheckForTimeOut+0x1c>
    80002676:	7d6000ef          	jal	80002e4c <vTaskEnterCritical>
    8000267a:	0001e797          	auipc	a5,0x1e
    8000267e:	0ae78793          	addi	a5,a5,174 # 80020728 <xTickCount>
    80002682:	439c                	lw	a5,0(a5)
    80002684:	ca3e                	sw	a5,20(sp)
    80002686:	6782                	ld	a5,0(sp)
    80002688:	439c                	lw	a5,0(a5)
    8000268a:	873e                	mv	a4,a5
    8000268c:	57fd                	li	a5,-1
    8000268e:	00f71463          	bne	a4,a5,80002696 <xTaskCheckForTimeOut+0x40>
    80002692:	ec02                	sd	zero,24(sp)
    80002694:	a08d                	j	800026f6 <xTaskCheckForTimeOut+0xa0>
    80002696:	67a2                	ld	a5,8(sp)
    80002698:	6398                	ld	a4,0(a5)
    8000269a:	0001e797          	auipc	a5,0x1e
    8000269e:	0b678793          	addi	a5,a5,182 # 80020750 <xNumOfOverflows>
    800026a2:	639c                	ld	a5,0(a5)
    800026a4:	00f70b63          	beq	a4,a5,800026ba <xTaskCheckForTimeOut+0x64>
    800026a8:	67a2                	ld	a5,8(sp)
    800026aa:	4798                	lw	a4,8(a5)
    800026ac:	47d2                	lw	a5,20(sp)
    800026ae:	2781                	sext.w	a5,a5
    800026b0:	00e7e563          	bltu	a5,a4,800026ba <xTaskCheckForTimeOut+0x64>
    800026b4:	4785                	li	a5,1
    800026b6:	ec3e                	sd	a5,24(sp)
    800026b8:	a83d                	j	800026f6 <xTaskCheckForTimeOut+0xa0>
    800026ba:	67a2                	ld	a5,8(sp)
    800026bc:	479c                	lw	a5,8(a5)
    800026be:	4752                	lw	a4,20(sp)
    800026c0:	40f707bb          	subw	a5,a4,a5
    800026c4:	0007871b          	sext.w	a4,a5
    800026c8:	6782                	ld	a5,0(sp)
    800026ca:	439c                	lw	a5,0(a5)
    800026cc:	02f77363          	bgeu	a4,a5,800026f2 <xTaskCheckForTimeOut+0x9c>
    800026d0:	6782                	ld	a5,0(sp)
    800026d2:	4398                	lw	a4,0(a5)
    800026d4:	67a2                	ld	a5,8(sp)
    800026d6:	479c                	lw	a5,8(a5)
    800026d8:	46d2                	lw	a3,20(sp)
    800026da:	9f95                	subw	a5,a5,a3
    800026dc:	2781                	sext.w	a5,a5
    800026de:	9fb9                	addw	a5,a5,a4
    800026e0:	0007871b          	sext.w	a4,a5
    800026e4:	6782                	ld	a5,0(sp)
    800026e6:	c398                	sw	a4,0(a5)
    800026e8:	6522                	ld	a0,8(sp)
    800026ea:	f37ff0ef          	jal	80002620 <vTaskSetTimeOutState>
    800026ee:	ec02                	sd	zero,24(sp)
    800026f0:	a019                	j	800026f6 <xTaskCheckForTimeOut+0xa0>
    800026f2:	4785                	li	a5,1
    800026f4:	ec3e                	sd	a5,24(sp)
    800026f6:	784000ef          	jal	80002e7a <vTaskExitCritical>
    800026fa:	67e2                	ld	a5,24(sp)
    800026fc:	853e                	mv	a0,a5
    800026fe:	70a2                	ld	ra,40(sp)
    80002700:	6145                	addi	sp,sp,48
    80002702:	8082                	ret

0000000080002704 <vTaskMissedYield>:
    80002704:	0001e797          	auipc	a5,0x1e
    80002708:	04478793          	addi	a5,a5,68 # 80020748 <xYieldPending>
    8000270c:	4705                	li	a4,1
    8000270e:	e398                	sd	a4,0(a5)
    80002710:	0001                	nop
    80002712:	8082                	ret

0000000080002714 <uxTaskGetTaskNumber>:
    80002714:	1101                	addi	sp,sp,-32
    80002716:	e42a                	sd	a0,8(sp)
    80002718:	67a2                	ld	a5,8(sp)
    8000271a:	c799                	beqz	a5,80002728 <uxTaskGetTaskNumber+0x14>
    8000271c:	67a2                	ld	a5,8(sp)
    8000271e:	e83e                	sd	a5,16(sp)
    80002720:	67c2                	ld	a5,16(sp)
    80002722:	67dc                	ld	a5,136(a5)
    80002724:	ec3e                	sd	a5,24(sp)
    80002726:	a011                	j	8000272a <uxTaskGetTaskNumber+0x16>
    80002728:	ec02                	sd	zero,24(sp)
    8000272a:	67e2                	ld	a5,24(sp)
    8000272c:	853e                	mv	a0,a5
    8000272e:	6105                	addi	sp,sp,32
    80002730:	8082                	ret

0000000080002732 <vTaskSetTaskNumber>:
    80002732:	1101                	addi	sp,sp,-32
    80002734:	e42a                	sd	a0,8(sp)
    80002736:	e02e                	sd	a1,0(sp)
    80002738:	67a2                	ld	a5,8(sp)
    8000273a:	c791                	beqz	a5,80002746 <vTaskSetTaskNumber+0x14>
    8000273c:	67a2                	ld	a5,8(sp)
    8000273e:	ec3e                	sd	a5,24(sp)
    80002740:	67e2                	ld	a5,24(sp)
    80002742:	6702                	ld	a4,0(sp)
    80002744:	e7d8                	sd	a4,136(a5)
    80002746:	0001                	nop
    80002748:	6105                	addi	sp,sp,32
    8000274a:	8082                	ret

000000008000274c <prvIdleTask>:
    8000274c:	1101                	addi	sp,sp,-32
    8000274e:	ec06                	sd	ra,24(sp)
    80002750:	e42a                	sd	a0,8(sp)
    80002752:	16c000ef          	jal	800028be <prvCheckTasksWaitingTermination>
    80002756:	0001e797          	auipc	a5,0x1e
    8000275a:	e2278793          	addi	a5,a5,-478 # 80020578 <pxReadyTasksLists>
    8000275e:	6398                	ld	a4,0(a5)
    80002760:	4785                	li	a5,1
    80002762:	fee7f8e3          	bgeu	a5,a4,80002752 <prvIdleTask+0x6>
    80002766:	c41fd0ef          	jal	800003a6 <vPortYield>
    8000276a:	b7e5                	j	80002752 <prvIdleTask+0x6>

000000008000276c <prvInitialiseTCBVariables>:
    8000276c:	715d                	addi	sp,sp,-80
    8000276e:	e486                	sd	ra,72(sp)
    80002770:	f42a                	sd	a0,40(sp)
    80002772:	f02e                	sd	a1,32(sp)
    80002774:	ec32                	sd	a2,24(sp)
    80002776:	e836                	sd	a3,16(sp)
    80002778:	87ba                	mv	a5,a4
    8000277a:	00f11723          	sh	a5,14(sp)
    8000277e:	fc02                	sd	zero,56(sp)
    80002780:	a025                	j	800027a8 <prvInitialiseTCBVariables+0x3c>
    80002782:	7702                	ld	a4,32(sp)
    80002784:	77e2                	ld	a5,56(sp)
    80002786:	97ba                	add	a5,a5,a4
    80002788:	0007c703          	lbu	a4,0(a5)
    8000278c:	76a2                	ld	a3,40(sp)
    8000278e:	77e2                	ld	a5,56(sp)
    80002790:	97b6                	add	a5,a5,a3
    80002792:	06e78423          	sb	a4,104(a5)
    80002796:	7702                	ld	a4,32(sp)
    80002798:	77e2                	ld	a5,56(sp)
    8000279a:	97ba                	add	a5,a5,a4
    8000279c:	0007c783          	lbu	a5,0(a5)
    800027a0:	cb89                	beqz	a5,800027b2 <prvInitialiseTCBVariables+0x46>
    800027a2:	77e2                	ld	a5,56(sp)
    800027a4:	0785                	addi	a5,a5,1
    800027a6:	fc3e                	sd	a5,56(sp)
    800027a8:	7762                	ld	a4,56(sp)
    800027aa:	47bd                	li	a5,15
    800027ac:	fce7fbe3          	bgeu	a5,a4,80002782 <prvInitialiseTCBVariables+0x16>
    800027b0:	a011                	j	800027b4 <prvInitialiseTCBVariables+0x48>
    800027b2:	0001                	nop
    800027b4:	77a2                	ld	a5,40(sp)
    800027b6:	06078ba3          	sb	zero,119(a5)
    800027ba:	6762                	ld	a4,24(sp)
    800027bc:	4791                	li	a5,4
    800027be:	00e7f463          	bgeu	a5,a4,800027c6 <prvInitialiseTCBVariables+0x5a>
    800027c2:	4791                	li	a5,4
    800027c4:	ec3e                	sd	a5,24(sp)
    800027c6:	77a2                	ld	a5,40(sp)
    800027c8:	6762                	ld	a4,24(sp)
    800027ca:	efb8                	sd	a4,88(a5)
    800027cc:	77a2                	ld	a5,40(sp)
    800027ce:	6762                	ld	a4,24(sp)
    800027d0:	ebd8                	sd	a4,144(a5)
    800027d2:	77a2                	ld	a5,40(sp)
    800027d4:	0807bc23          	sd	zero,152(a5)
    800027d8:	77a2                	ld	a5,40(sp)
    800027da:	07a1                	addi	a5,a5,8
    800027dc:	853e                	mv	a0,a5
    800027de:	dabfd0ef          	jal	80000588 <vListInitialiseItem>
    800027e2:	77a2                	ld	a5,40(sp)
    800027e4:	03078793          	addi	a5,a5,48
    800027e8:	853e                	mv	a0,a5
    800027ea:	d9ffd0ef          	jal	80000588 <vListInitialiseItem>
    800027ee:	77a2                	ld	a5,40(sp)
    800027f0:	7722                	ld	a4,40(sp)
    800027f2:	f398                	sd	a4,32(a5)
    800027f4:	67e2                	ld	a5,24(sp)
    800027f6:	2781                	sext.w	a5,a5
    800027f8:	4715                	li	a4,5
    800027fa:	40f707bb          	subw	a5,a4,a5
    800027fe:	0007871b          	sext.w	a4,a5
    80002802:	77a2                	ld	a5,40(sp)
    80002804:	db98                	sw	a4,48(a5)
    80002806:	77a2                	ld	a5,40(sp)
    80002808:	7722                	ld	a4,40(sp)
    8000280a:	e7b8                	sd	a4,72(a5)
    8000280c:	77a2                	ld	a5,40(sp)
    8000280e:	0607bc23          	sd	zero,120(a5)
    80002812:	77a2                	ld	a5,40(sp)
    80002814:	0a07a023          	sw	zero,160(a5)
    80002818:	77a2                	ld	a5,40(sp)
    8000281a:	0a07a223          	sw	zero,164(a5)
    8000281e:	0001                	nop
    80002820:	60a6                	ld	ra,72(sp)
    80002822:	6161                	addi	sp,sp,80
    80002824:	8082                	ret

0000000080002826 <prvInitialiseTaskLists>:
    80002826:	1101                	addi	sp,sp,-32
    80002828:	ec06                	sd	ra,24(sp)
    8000282a:	e402                	sd	zero,8(sp)
    8000282c:	a00d                	j	8000284e <prvInitialiseTaskLists+0x28>
    8000282e:	6722                	ld	a4,8(sp)
    80002830:	87ba                	mv	a5,a4
    80002832:	078a                	slli	a5,a5,0x2
    80002834:	97ba                	add	a5,a5,a4
    80002836:	078e                	slli	a5,a5,0x3
    80002838:	0001e717          	auipc	a4,0x1e
    8000283c:	d4070713          	addi	a4,a4,-704 # 80020578 <pxReadyTasksLists>
    80002840:	97ba                	add	a5,a5,a4
    80002842:	853e                	mv	a0,a5
    80002844:	d11fd0ef          	jal	80000554 <vListInitialise>
    80002848:	67a2                	ld	a5,8(sp)
    8000284a:	0785                	addi	a5,a5,1
    8000284c:	e43e                	sd	a5,8(sp)
    8000284e:	6722                	ld	a4,8(sp)
    80002850:	4791                	li	a5,4
    80002852:	fce7fee3          	bgeu	a5,a4,8000282e <prvInitialiseTaskLists+0x8>
    80002856:	0001e517          	auipc	a0,0x1e
    8000285a:	dea50513          	addi	a0,a0,-534 # 80020640 <xDelayedTaskList1>
    8000285e:	cf7fd0ef          	jal	80000554 <vListInitialise>
    80002862:	0001e517          	auipc	a0,0x1e
    80002866:	e0650513          	addi	a0,a0,-506 # 80020668 <xDelayedTaskList2>
    8000286a:	cebfd0ef          	jal	80000554 <vListInitialise>
    8000286e:	0001e517          	auipc	a0,0x1e
    80002872:	e3250513          	addi	a0,a0,-462 # 800206a0 <xPendingReadyList>
    80002876:	cdffd0ef          	jal	80000554 <vListInitialise>
    8000287a:	0001e517          	auipc	a0,0x1e
    8000287e:	e4e50513          	addi	a0,a0,-434 # 800206c8 <xTasksWaitingTermination>
    80002882:	cd3fd0ef          	jal	80000554 <vListInitialise>
    80002886:	0001e517          	auipc	a0,0x1e
    8000288a:	e7250513          	addi	a0,a0,-398 # 800206f8 <xSuspendedTaskList>
    8000288e:	cc7fd0ef          	jal	80000554 <vListInitialise>
    80002892:	0001e797          	auipc	a5,0x1e
    80002896:	dfe78793          	addi	a5,a5,-514 # 80020690 <pxDelayedTaskList>
    8000289a:	0001e717          	auipc	a4,0x1e
    8000289e:	da670713          	addi	a4,a4,-602 # 80020640 <xDelayedTaskList1>
    800028a2:	e398                	sd	a4,0(a5)
    800028a4:	0001e797          	auipc	a5,0x1e
    800028a8:	df478793          	addi	a5,a5,-524 # 80020698 <pxOverflowDelayedTaskList>
    800028ac:	0001e717          	auipc	a4,0x1e
    800028b0:	dbc70713          	addi	a4,a4,-580 # 80020668 <xDelayedTaskList2>
    800028b4:	e398                	sd	a4,0(a5)
    800028b6:	0001                	nop
    800028b8:	60e2                	ld	ra,24(sp)
    800028ba:	6105                	addi	sp,sp,32
    800028bc:	8082                	ret

00000000800028be <prvCheckTasksWaitingTermination>:
    800028be:	1101                	addi	sp,sp,-32
    800028c0:	ec06                	sd	ra,24(sp)
    800028c2:	a8a5                	j	8000293a <prvCheckTasksWaitingTermination+0x7c>
    800028c4:	bfaff0ef          	jal	80001cbe <vTaskSuspendAll>
    800028c8:	0001e797          	auipc	a5,0x1e
    800028cc:	e0078793          	addi	a5,a5,-512 # 800206c8 <xTasksWaitingTermination>
    800028d0:	639c                	ld	a5,0(a5)
    800028d2:	0017b793          	seqz	a5,a5
    800028d6:	0ff7f793          	zext.b	a5,a5
    800028da:	e43e                	sd	a5,8(sp)
    800028dc:	bfeff0ef          	jal	80001cda <xTaskResumeAll>
    800028e0:	67a2                	ld	a5,8(sp)
    800028e2:	efa1                	bnez	a5,8000293a <prvCheckTasksWaitingTermination+0x7c>
    800028e4:	568000ef          	jal	80002e4c <vTaskEnterCritical>
    800028e8:	0001e797          	auipc	a5,0x1e
    800028ec:	de078793          	addi	a5,a5,-544 # 800206c8 <xTasksWaitingTermination>
    800028f0:	6f9c                	ld	a5,24(a5)
    800028f2:	6f9c                	ld	a5,24(a5)
    800028f4:	e03e                	sd	a5,0(sp)
    800028f6:	6782                	ld	a5,0(sp)
    800028f8:	07a1                	addi	a5,a5,8
    800028fa:	853e                	mv	a0,a5
    800028fc:	d4dfd0ef          	jal	80000648 <uxListRemove>
    80002900:	0001e797          	auipc	a5,0x1e
    80002904:	e2078793          	addi	a5,a5,-480 # 80020720 <uxCurrentNumberOfTasks>
    80002908:	639c                	ld	a5,0(a5)
    8000290a:	fff78713          	addi	a4,a5,-1
    8000290e:	0001e797          	auipc	a5,0x1e
    80002912:	e1278793          	addi	a5,a5,-494 # 80020720 <uxCurrentNumberOfTasks>
    80002916:	e398                	sd	a4,0(a5)
    80002918:	0001e797          	auipc	a5,0x1e
    8000291c:	dd878793          	addi	a5,a5,-552 # 800206f0 <uxTasksDeleted>
    80002920:	639c                	ld	a5,0(a5)
    80002922:	fff78713          	addi	a4,a5,-1
    80002926:	0001e797          	auipc	a5,0x1e
    8000292a:	dca78793          	addi	a5,a5,-566 # 800206f0 <uxTasksDeleted>
    8000292e:	e398                	sd	a4,0(a5)
    80002930:	54a000ef          	jal	80002e7a <vTaskExitCritical>
    80002934:	6502                	ld	a0,0(sp)
    80002936:	2ba000ef          	jal	80002bf0 <prvDeleteTCB>
    8000293a:	0001e797          	auipc	a5,0x1e
    8000293e:	db678793          	addi	a5,a5,-586 # 800206f0 <uxTasksDeleted>
    80002942:	639c                	ld	a5,0(a5)
    80002944:	f3c1                	bnez	a5,800028c4 <prvCheckTasksWaitingTermination+0x6>
    80002946:	0001                	nop
    80002948:	0001                	nop
    8000294a:	60e2                	ld	ra,24(sp)
    8000294c:	6105                	addi	sp,sp,32
    8000294e:	8082                	ret

0000000080002950 <prvAddCurrentTaskToDelayedList>:
    80002950:	1101                	addi	sp,sp,-32
    80002952:	ec06                	sd	ra,24(sp)
    80002954:	87aa                	mv	a5,a0
    80002956:	c63e                	sw	a5,12(sp)
    80002958:	0001e797          	auipc	a5,0x1e
    8000295c:	9e878793          	addi	a5,a5,-1560 # 80020340 <pxCurrentTCB>
    80002960:	639c                	ld	a5,0(a5)
    80002962:	4732                	lw	a4,12(sp)
    80002964:	c798                	sw	a4,8(a5)
    80002966:	0001e797          	auipc	a5,0x1e
    8000296a:	dc278793          	addi	a5,a5,-574 # 80020728 <xTickCount>
    8000296e:	439c                	lw	a5,0(a5)
    80002970:	0007871b          	sext.w	a4,a5
    80002974:	47b2                	lw	a5,12(sp)
    80002976:	2781                	sext.w	a5,a5
    80002978:	02e7f263          	bgeu	a5,a4,8000299c <prvAddCurrentTaskToDelayedList+0x4c>
    8000297c:	0001e797          	auipc	a5,0x1e
    80002980:	d1c78793          	addi	a5,a5,-740 # 80020698 <pxOverflowDelayedTaskList>
    80002984:	6398                	ld	a4,0(a5)
    80002986:	0001e797          	auipc	a5,0x1e
    8000298a:	9ba78793          	addi	a5,a5,-1606 # 80020340 <pxCurrentTCB>
    8000298e:	639c                	ld	a5,0(a5)
    80002990:	07a1                	addi	a5,a5,8
    80002992:	85be                	mv	a1,a5
    80002994:	853a                	mv	a0,a4
    80002996:	c43fd0ef          	jal	800005d8 <vListInsert>
    8000299a:	a089                	j	800029dc <prvAddCurrentTaskToDelayedList+0x8c>
    8000299c:	0001e797          	auipc	a5,0x1e
    800029a0:	cf478793          	addi	a5,a5,-780 # 80020690 <pxDelayedTaskList>
    800029a4:	6398                	ld	a4,0(a5)
    800029a6:	0001e797          	auipc	a5,0x1e
    800029aa:	99a78793          	addi	a5,a5,-1638 # 80020340 <pxCurrentTCB>
    800029ae:	639c                	ld	a5,0(a5)
    800029b0:	07a1                	addi	a5,a5,8
    800029b2:	85be                	mv	a1,a5
    800029b4:	853a                	mv	a0,a4
    800029b6:	c23fd0ef          	jal	800005d8 <vListInsert>
    800029ba:	0001e797          	auipc	a5,0x1e
    800029be:	da678793          	addi	a5,a5,-602 # 80020760 <xNextTaskUnblockTime>
    800029c2:	439c                	lw	a5,0(a5)
    800029c4:	0007871b          	sext.w	a4,a5
    800029c8:	47b2                	lw	a5,12(sp)
    800029ca:	2781                	sext.w	a5,a5
    800029cc:	00e7f863          	bgeu	a5,a4,800029dc <prvAddCurrentTaskToDelayedList+0x8c>
    800029d0:	0001e797          	auipc	a5,0x1e
    800029d4:	d9078793          	addi	a5,a5,-624 # 80020760 <xNextTaskUnblockTime>
    800029d8:	4732                	lw	a4,12(sp)
    800029da:	c398                	sw	a4,0(a5)
    800029dc:	0001                	nop
    800029de:	60e2                	ld	ra,24(sp)
    800029e0:	6105                	addi	sp,sp,32
    800029e2:	8082                	ret

00000000800029e4 <prvAllocateTCBAndStack>:
    800029e4:	7179                	addi	sp,sp,-48
    800029e6:	f406                	sd	ra,40(sp)
    800029e8:	87aa                	mv	a5,a0
    800029ea:	e02e                	sd	a1,0(sp)
    800029ec:	00f11723          	sh	a5,14(sp)
    800029f0:	6782                	ld	a5,0(sp)
    800029f2:	eb89                	bnez	a5,80002a04 <prvAllocateTCBAndStack+0x20>
    800029f4:	00e15783          	lhu	a5,14(sp)
    800029f8:	078e                	slli	a5,a5,0x3
    800029fa:	853e                	mv	a0,a5
    800029fc:	029010ef          	jal	80004224 <pvPortMalloc>
    80002a00:	87aa                	mv	a5,a0
    80002a02:	a011                	j	80002a06 <prvAllocateTCBAndStack+0x22>
    80002a04:	6782                	ld	a5,0(sp)
    80002a06:	e83e                	sd	a5,16(sp)
    80002a08:	67c2                	ld	a5,16(sp)
    80002a0a:	c385                	beqz	a5,80002a2a <prvAllocateTCBAndStack+0x46>
    80002a0c:	0a800513          	li	a0,168
    80002a10:	015010ef          	jal	80004224 <pvPortMalloc>
    80002a14:	ec2a                	sd	a0,24(sp)
    80002a16:	67e2                	ld	a5,24(sp)
    80002a18:	c789                	beqz	a5,80002a22 <prvAllocateTCBAndStack+0x3e>
    80002a1a:	67e2                	ld	a5,24(sp)
    80002a1c:	6742                	ld	a4,16(sp)
    80002a1e:	f3b8                	sd	a4,96(a5)
    80002a20:	a031                	j	80002a2c <prvAllocateTCBAndStack+0x48>
    80002a22:	6542                	ld	a0,16(sp)
    80002a24:	139010ef          	jal	8000435c <vPortFree>
    80002a28:	a011                	j	80002a2c <prvAllocateTCBAndStack+0x48>
    80002a2a:	ec02                	sd	zero,24(sp)
    80002a2c:	67e2                	ld	a5,24(sp)
    80002a2e:	cf81                	beqz	a5,80002a46 <prvAllocateTCBAndStack+0x62>
    80002a30:	67e2                	ld	a5,24(sp)
    80002a32:	73b8                	ld	a4,96(a5)
    80002a34:	00e15783          	lhu	a5,14(sp)
    80002a38:	078e                	slli	a5,a5,0x3
    80002a3a:	863e                	mv	a2,a5
    80002a3c:	0a500593          	li	a1,165
    80002a40:	853a                	mv	a0,a4
    80002a42:	271010ef          	jal	800044b2 <memset>
    80002a46:	67e2                	ld	a5,24(sp)
    80002a48:	853e                	mv	a0,a5
    80002a4a:	70a2                	ld	ra,40(sp)
    80002a4c:	6145                	addi	sp,sp,48
    80002a4e:	8082                	ret

0000000080002a50 <prvListTaskWithinSingleList>:
    80002a50:	711d                	addi	sp,sp,-96
    80002a52:	ec86                	sd	ra,88(sp)
    80002a54:	e8a2                	sd	s0,80(sp)
    80002a56:	ec2a                	sd	a0,24(sp)
    80002a58:	e82e                	sd	a1,16(sp)
    80002a5a:	87b2                	mv	a5,a2
    80002a5c:	c63e                	sw	a5,12(sp)
    80002a5e:	e482                	sd	zero,72(sp)
    80002a60:	67c2                	ld	a5,16(sp)
    80002a62:	639c                	ld	a5,0(a5)
    80002a64:	14078463          	beqz	a5,80002bac <prvListTaskWithinSingleList+0x15c>
    80002a68:	67c2                	ld	a5,16(sp)
    80002a6a:	e0be                	sd	a5,64(sp)
    80002a6c:	6786                	ld	a5,64(sp)
    80002a6e:	679c                	ld	a5,8(a5)
    80002a70:	6798                	ld	a4,8(a5)
    80002a72:	6786                	ld	a5,64(sp)
    80002a74:	e798                	sd	a4,8(a5)
    80002a76:	6786                	ld	a5,64(sp)
    80002a78:	6798                	ld	a4,8(a5)
    80002a7a:	6786                	ld	a5,64(sp)
    80002a7c:	07c1                	addi	a5,a5,16
    80002a7e:	00f71763          	bne	a4,a5,80002a8c <prvListTaskWithinSingleList+0x3c>
    80002a82:	6786                	ld	a5,64(sp)
    80002a84:	679c                	ld	a5,8(a5)
    80002a86:	6798                	ld	a4,8(a5)
    80002a88:	6786                	ld	a5,64(sp)
    80002a8a:	e798                	sd	a4,8(a5)
    80002a8c:	6786                	ld	a5,64(sp)
    80002a8e:	679c                	ld	a5,8(a5)
    80002a90:	6f9c                	ld	a5,24(a5)
    80002a92:	fc3e                	sd	a5,56(sp)
    80002a94:	67c2                	ld	a5,16(sp)
    80002a96:	f83e                	sd	a5,48(sp)
    80002a98:	77c2                	ld	a5,48(sp)
    80002a9a:	679c                	ld	a5,8(a5)
    80002a9c:	6798                	ld	a4,8(a5)
    80002a9e:	77c2                	ld	a5,48(sp)
    80002aa0:	e798                	sd	a4,8(a5)
    80002aa2:	77c2                	ld	a5,48(sp)
    80002aa4:	6798                	ld	a4,8(a5)
    80002aa6:	77c2                	ld	a5,48(sp)
    80002aa8:	07c1                	addi	a5,a5,16
    80002aaa:	00f71763          	bne	a4,a5,80002ab8 <prvListTaskWithinSingleList+0x68>
    80002aae:	77c2                	ld	a5,48(sp)
    80002ab0:	679c                	ld	a5,8(a5)
    80002ab2:	6798                	ld	a4,8(a5)
    80002ab4:	77c2                	ld	a5,48(sp)
    80002ab6:	e798                	sd	a4,8(a5)
    80002ab8:	77c2                	ld	a5,48(sp)
    80002aba:	679c                	ld	a5,8(a5)
    80002abc:	6f9c                	ld	a5,24(a5)
    80002abe:	f43e                	sd	a5,40(sp)
    80002ac0:	6726                	ld	a4,72(sp)
    80002ac2:	87ba                	mv	a5,a4
    80002ac4:	078e                	slli	a5,a5,0x3
    80002ac6:	8f99                	sub	a5,a5,a4
    80002ac8:	078e                	slli	a5,a5,0x3
    80002aca:	873e                	mv	a4,a5
    80002acc:	67e2                	ld	a5,24(sp)
    80002ace:	97ba                	add	a5,a5,a4
    80002ad0:	7722                	ld	a4,40(sp)
    80002ad2:	e398                	sd	a4,0(a5)
    80002ad4:	6726                	ld	a4,72(sp)
    80002ad6:	87ba                	mv	a5,a4
    80002ad8:	078e                	slli	a5,a5,0x3
    80002ada:	8f99                	sub	a5,a5,a4
    80002adc:	078e                	slli	a5,a5,0x3
    80002ade:	873e                	mv	a4,a5
    80002ae0:	67e2                	ld	a5,24(sp)
    80002ae2:	97ba                	add	a5,a5,a4
    80002ae4:	7722                	ld	a4,40(sp)
    80002ae6:	06870713          	addi	a4,a4,104
    80002aea:	e798                	sd	a4,8(a5)
    80002aec:	6726                	ld	a4,72(sp)
    80002aee:	87ba                	mv	a5,a4
    80002af0:	078e                	slli	a5,a5,0x3
    80002af2:	8f99                	sub	a5,a5,a4
    80002af4:	078e                	slli	a5,a5,0x3
    80002af6:	873e                	mv	a4,a5
    80002af8:	67e2                	ld	a5,24(sp)
    80002afa:	97ba                	add	a5,a5,a4
    80002afc:	7722                	ld	a4,40(sp)
    80002afe:	6358                	ld	a4,128(a4)
    80002b00:	eb98                	sd	a4,16(a5)
    80002b02:	6726                	ld	a4,72(sp)
    80002b04:	87ba                	mv	a5,a4
    80002b06:	078e                	slli	a5,a5,0x3
    80002b08:	8f99                	sub	a5,a5,a4
    80002b0a:	078e                	slli	a5,a5,0x3
    80002b0c:	873e                	mv	a4,a5
    80002b0e:	67e2                	ld	a5,24(sp)
    80002b10:	97ba                	add	a5,a5,a4
    80002b12:	4732                	lw	a4,12(sp)
    80002b14:	cf98                	sw	a4,24(a5)
    80002b16:	6726                	ld	a4,72(sp)
    80002b18:	87ba                	mv	a5,a4
    80002b1a:	078e                	slli	a5,a5,0x3
    80002b1c:	8f99                	sub	a5,a5,a4
    80002b1e:	078e                	slli	a5,a5,0x3
    80002b20:	873e                	mv	a4,a5
    80002b22:	67e2                	ld	a5,24(sp)
    80002b24:	97ba                	add	a5,a5,a4
    80002b26:	7722                	ld	a4,40(sp)
    80002b28:	6f38                	ld	a4,88(a4)
    80002b2a:	f398                	sd	a4,32(a5)
    80002b2c:	47b2                	lw	a5,12(sp)
    80002b2e:	0007871b          	sext.w	a4,a5
    80002b32:	478d                	li	a5,3
    80002b34:	00f71f63          	bne	a4,a5,80002b52 <prvListTaskWithinSingleList+0x102>
    80002b38:	77a2                	ld	a5,40(sp)
    80002b3a:	6bbc                	ld	a5,80(a5)
    80002b3c:	cb99                	beqz	a5,80002b52 <prvListTaskWithinSingleList+0x102>
    80002b3e:	6726                	ld	a4,72(sp)
    80002b40:	87ba                	mv	a5,a4
    80002b42:	078e                	slli	a5,a5,0x3
    80002b44:	8f99                	sub	a5,a5,a4
    80002b46:	078e                	slli	a5,a5,0x3
    80002b48:	873e                	mv	a4,a5
    80002b4a:	67e2                	ld	a5,24(sp)
    80002b4c:	97ba                	add	a5,a5,a4
    80002b4e:	4709                	li	a4,2
    80002b50:	cf98                	sw	a4,24(a5)
    80002b52:	6726                	ld	a4,72(sp)
    80002b54:	87ba                	mv	a5,a4
    80002b56:	078e                	slli	a5,a5,0x3
    80002b58:	8f99                	sub	a5,a5,a4
    80002b5a:	078e                	slli	a5,a5,0x3
    80002b5c:	873e                	mv	a4,a5
    80002b5e:	67e2                	ld	a5,24(sp)
    80002b60:	97ba                	add	a5,a5,a4
    80002b62:	7722                	ld	a4,40(sp)
    80002b64:	6b58                	ld	a4,144(a4)
    80002b66:	f798                	sd	a4,40(a5)
    80002b68:	6726                	ld	a4,72(sp)
    80002b6a:	87ba                	mv	a5,a4
    80002b6c:	078e                	slli	a5,a5,0x3
    80002b6e:	8f99                	sub	a5,a5,a4
    80002b70:	078e                	slli	a5,a5,0x3
    80002b72:	873e                	mv	a4,a5
    80002b74:	67e2                	ld	a5,24(sp)
    80002b76:	97ba                	add	a5,a5,a4
    80002b78:	0207a823          	sw	zero,48(a5)
    80002b7c:	77a2                	ld	a5,40(sp)
    80002b7e:	73b4                	ld	a3,96(a5)
    80002b80:	6726                	ld	a4,72(sp)
    80002b82:	87ba                	mv	a5,a4
    80002b84:	078e                	slli	a5,a5,0x3
    80002b86:	8f99                	sub	a5,a5,a4
    80002b88:	078e                	slli	a5,a5,0x3
    80002b8a:	873e                	mv	a4,a5
    80002b8c:	67e2                	ld	a5,24(sp)
    80002b8e:	00e78433          	add	s0,a5,a4
    80002b92:	8536                	mv	a0,a3
    80002b94:	024000ef          	jal	80002bb8 <prvTaskCheckFreeStackSpace>
    80002b98:	87aa                	mv	a5,a0
    80002b9a:	02f41a23          	sh	a5,52(s0)
    80002b9e:	67a6                	ld	a5,72(sp)
    80002ba0:	0785                	addi	a5,a5,1
    80002ba2:	e4be                	sd	a5,72(sp)
    80002ba4:	7722                	ld	a4,40(sp)
    80002ba6:	77e2                	ld	a5,56(sp)
    80002ba8:	eef716e3          	bne	a4,a5,80002a94 <prvListTaskWithinSingleList+0x44>
    80002bac:	67a6                	ld	a5,72(sp)
    80002bae:	853e                	mv	a0,a5
    80002bb0:	60e6                	ld	ra,88(sp)
    80002bb2:	6446                	ld	s0,80(sp)
    80002bb4:	6125                	addi	sp,sp,96
    80002bb6:	8082                	ret

0000000080002bb8 <prvTaskCheckFreeStackSpace>:
    80002bb8:	1101                	addi	sp,sp,-32
    80002bba:	e42a                	sd	a0,8(sp)
    80002bbc:	ce02                	sw	zero,28(sp)
    80002bbe:	a039                	j	80002bcc <prvTaskCheckFreeStackSpace+0x14>
    80002bc0:	67a2                	ld	a5,8(sp)
    80002bc2:	0785                	addi	a5,a5,1
    80002bc4:	e43e                	sd	a5,8(sp)
    80002bc6:	47f2                	lw	a5,28(sp)
    80002bc8:	2785                	addiw	a5,a5,1
    80002bca:	ce3e                	sw	a5,28(sp)
    80002bcc:	67a2                	ld	a5,8(sp)
    80002bce:	0007c783          	lbu	a5,0(a5)
    80002bd2:	873e                	mv	a4,a5
    80002bd4:	0a500793          	li	a5,165
    80002bd8:	fef704e3          	beq	a4,a5,80002bc0 <prvTaskCheckFreeStackSpace+0x8>
    80002bdc:	47f2                	lw	a5,28(sp)
    80002bde:	0037d79b          	srliw	a5,a5,0x3
    80002be2:	ce3e                	sw	a5,28(sp)
    80002be4:	47f2                	lw	a5,28(sp)
    80002be6:	17c2                	slli	a5,a5,0x30
    80002be8:	93c1                	srli	a5,a5,0x30
    80002bea:	853e                	mv	a0,a5
    80002bec:	6105                	addi	sp,sp,32
    80002bee:	8082                	ret

0000000080002bf0 <prvDeleteTCB>:
    80002bf0:	1101                	addi	sp,sp,-32
    80002bf2:	ec06                	sd	ra,24(sp)
    80002bf4:	e42a                	sd	a0,8(sp)
    80002bf6:	67a2                	ld	a5,8(sp)
    80002bf8:	73bc                	ld	a5,96(a5)
    80002bfa:	853e                	mv	a0,a5
    80002bfc:	760010ef          	jal	8000435c <vPortFree>
    80002c00:	6522                	ld	a0,8(sp)
    80002c02:	75a010ef          	jal	8000435c <vPortFree>
    80002c06:	0001                	nop
    80002c08:	60e2                	ld	ra,24(sp)
    80002c0a:	6105                	addi	sp,sp,32
    80002c0c:	8082                	ret

0000000080002c0e <prvResetNextTaskUnblockTime>:
    80002c0e:	1141                	addi	sp,sp,-16
    80002c10:	0001e797          	auipc	a5,0x1e
    80002c14:	a8078793          	addi	a5,a5,-1408 # 80020690 <pxDelayedTaskList>
    80002c18:	639c                	ld	a5,0(a5)
    80002c1a:	639c                	ld	a5,0(a5)
    80002c1c:	e399                	bnez	a5,80002c22 <prvResetNextTaskUnblockTime+0x14>
    80002c1e:	4785                	li	a5,1
    80002c20:	a011                	j	80002c24 <prvResetNextTaskUnblockTime+0x16>
    80002c22:	4781                	li	a5,0
    80002c24:	cb81                	beqz	a5,80002c34 <prvResetNextTaskUnblockTime+0x26>
    80002c26:	0001e797          	auipc	a5,0x1e
    80002c2a:	b3a78793          	addi	a5,a5,-1222 # 80020760 <xNextTaskUnblockTime>
    80002c2e:	577d                	li	a4,-1
    80002c30:	c398                	sw	a4,0(a5)
    80002c32:	a005                	j	80002c52 <prvResetNextTaskUnblockTime+0x44>
    80002c34:	0001e797          	auipc	a5,0x1e
    80002c38:	a5c78793          	addi	a5,a5,-1444 # 80020690 <pxDelayedTaskList>
    80002c3c:	639c                	ld	a5,0(a5)
    80002c3e:	6f9c                	ld	a5,24(a5)
    80002c40:	6f9c                	ld	a5,24(a5)
    80002c42:	e43e                	sd	a5,8(sp)
    80002c44:	67a2                	ld	a5,8(sp)
    80002c46:	4798                	lw	a4,8(a5)
    80002c48:	0001e797          	auipc	a5,0x1e
    80002c4c:	b1878793          	addi	a5,a5,-1256 # 80020760 <xNextTaskUnblockTime>
    80002c50:	c398                	sw	a4,0(a5)
    80002c52:	0001                	nop
    80002c54:	0141                	addi	sp,sp,16
    80002c56:	8082                	ret

0000000080002c58 <xTaskGetCurrentTaskHandle>:
    80002c58:	1141                	addi	sp,sp,-16
    80002c5a:	0001d797          	auipc	a5,0x1d
    80002c5e:	6e678793          	addi	a5,a5,1766 # 80020340 <pxCurrentTCB>
    80002c62:	639c                	ld	a5,0(a5)
    80002c64:	e43e                	sd	a5,8(sp)
    80002c66:	67a2                	ld	a5,8(sp)
    80002c68:	853e                	mv	a0,a5
    80002c6a:	0141                	addi	sp,sp,16
    80002c6c:	8082                	ret

0000000080002c6e <xTaskGetSchedulerState>:
    80002c6e:	1141                	addi	sp,sp,-16
    80002c70:	0001e797          	auipc	a5,0x1e
    80002c74:	ac878793          	addi	a5,a5,-1336 # 80020738 <xSchedulerRunning>
    80002c78:	639c                	ld	a5,0(a5)
    80002c7a:	e781                	bnez	a5,80002c82 <xTaskGetSchedulerState+0x14>
    80002c7c:	4785                	li	a5,1
    80002c7e:	e43e                	sd	a5,8(sp)
    80002c80:	a819                	j	80002c96 <xTaskGetSchedulerState+0x28>
    80002c82:	0001e797          	auipc	a5,0x1e
    80002c86:	ae678793          	addi	a5,a5,-1306 # 80020768 <uxSchedulerSuspended>
    80002c8a:	639c                	ld	a5,0(a5)
    80002c8c:	e781                	bnez	a5,80002c94 <xTaskGetSchedulerState+0x26>
    80002c8e:	4789                	li	a5,2
    80002c90:	e43e                	sd	a5,8(sp)
    80002c92:	a011                	j	80002c96 <xTaskGetSchedulerState+0x28>
    80002c94:	e402                	sd	zero,8(sp)
    80002c96:	67a2                	ld	a5,8(sp)
    80002c98:	853e                	mv	a0,a5
    80002c9a:	0141                	addi	sp,sp,16
    80002c9c:	8082                	ret

0000000080002c9e <vTaskPriorityInherit>:
    80002c9e:	7179                	addi	sp,sp,-48
    80002ca0:	f406                	sd	ra,40(sp)
    80002ca2:	e42a                	sd	a0,8(sp)
    80002ca4:	67a2                	ld	a5,8(sp)
    80002ca6:	ec3e                	sd	a5,24(sp)
    80002ca8:	67a2                	ld	a5,8(sp)
    80002caa:	cbe1                	beqz	a5,80002d7a <vTaskPriorityInherit+0xdc>
    80002cac:	67e2                	ld	a5,24(sp)
    80002cae:	6fb8                	ld	a4,88(a5)
    80002cb0:	0001d797          	auipc	a5,0x1d
    80002cb4:	69078793          	addi	a5,a5,1680 # 80020340 <pxCurrentTCB>
    80002cb8:	639c                	ld	a5,0(a5)
    80002cba:	6fbc                	ld	a5,88(a5)
    80002cbc:	0af77f63          	bgeu	a4,a5,80002d7a <vTaskPriorityInherit+0xdc>
    80002cc0:	67e2                	ld	a5,24(sp)
    80002cc2:	5b9c                	lw	a5,48(a5)
    80002cc4:	2781                	sext.w	a5,a5
    80002cc6:	0207c063          	bltz	a5,80002ce6 <vTaskPriorityInherit+0x48>
    80002cca:	0001d797          	auipc	a5,0x1d
    80002cce:	67678793          	addi	a5,a5,1654 # 80020340 <pxCurrentTCB>
    80002cd2:	639c                	ld	a5,0(a5)
    80002cd4:	6fbc                	ld	a5,88(a5)
    80002cd6:	2781                	sext.w	a5,a5
    80002cd8:	4715                	li	a4,5
    80002cda:	40f707bb          	subw	a5,a4,a5
    80002cde:	0007871b          	sext.w	a4,a5
    80002ce2:	67e2                	ld	a5,24(sp)
    80002ce4:	db98                	sw	a4,48(a5)
    80002ce6:	67e2                	ld	a5,24(sp)
    80002ce8:	7794                	ld	a3,40(a5)
    80002cea:	67e2                	ld	a5,24(sp)
    80002cec:	6fb8                	ld	a4,88(a5)
    80002cee:	87ba                	mv	a5,a4
    80002cf0:	078a                	slli	a5,a5,0x2
    80002cf2:	97ba                	add	a5,a5,a4
    80002cf4:	078e                	slli	a5,a5,0x3
    80002cf6:	0001e717          	auipc	a4,0x1e
    80002cfa:	88270713          	addi	a4,a4,-1918 # 80020578 <pxReadyTasksLists>
    80002cfe:	97ba                	add	a5,a5,a4
    80002d00:	00f69463          	bne	a3,a5,80002d08 <vTaskPriorityInherit+0x6a>
    80002d04:	4785                	li	a5,1
    80002d06:	a011                	j	80002d0a <vTaskPriorityInherit+0x6c>
    80002d08:	4781                	li	a5,0
    80002d0a:	c3a5                	beqz	a5,80002d6a <vTaskPriorityInherit+0xcc>
    80002d0c:	67e2                	ld	a5,24(sp)
    80002d0e:	07a1                	addi	a5,a5,8
    80002d10:	853e                	mv	a0,a5
    80002d12:	937fd0ef          	jal	80000648 <uxListRemove>
    80002d16:	0001d797          	auipc	a5,0x1d
    80002d1a:	62a78793          	addi	a5,a5,1578 # 80020340 <pxCurrentTCB>
    80002d1e:	639c                	ld	a5,0(a5)
    80002d20:	6fb8                	ld	a4,88(a5)
    80002d22:	67e2                	ld	a5,24(sp)
    80002d24:	efb8                	sd	a4,88(a5)
    80002d26:	67e2                	ld	a5,24(sp)
    80002d28:	6fb8                	ld	a4,88(a5)
    80002d2a:	0001e797          	auipc	a5,0x1e
    80002d2e:	a0678793          	addi	a5,a5,-1530 # 80020730 <uxTopReadyPriority>
    80002d32:	639c                	ld	a5,0(a5)
    80002d34:	00e7f963          	bgeu	a5,a4,80002d46 <vTaskPriorityInherit+0xa8>
    80002d38:	67e2                	ld	a5,24(sp)
    80002d3a:	6fb8                	ld	a4,88(a5)
    80002d3c:	0001e797          	auipc	a5,0x1e
    80002d40:	9f478793          	addi	a5,a5,-1548 # 80020730 <uxTopReadyPriority>
    80002d44:	e398                	sd	a4,0(a5)
    80002d46:	67e2                	ld	a5,24(sp)
    80002d48:	6fb8                	ld	a4,88(a5)
    80002d4a:	87ba                	mv	a5,a4
    80002d4c:	078a                	slli	a5,a5,0x2
    80002d4e:	97ba                	add	a5,a5,a4
    80002d50:	078e                	slli	a5,a5,0x3
    80002d52:	0001e717          	auipc	a4,0x1e
    80002d56:	82670713          	addi	a4,a4,-2010 # 80020578 <pxReadyTasksLists>
    80002d5a:	973e                	add	a4,a4,a5
    80002d5c:	67e2                	ld	a5,24(sp)
    80002d5e:	07a1                	addi	a5,a5,8
    80002d60:	85be                	mv	a1,a5
    80002d62:	853a                	mv	a0,a4
    80002d64:	835fd0ef          	jal	80000598 <vListInsertEnd>
    80002d68:	a809                	j	80002d7a <vTaskPriorityInherit+0xdc>
    80002d6a:	0001d797          	auipc	a5,0x1d
    80002d6e:	5d678793          	addi	a5,a5,1494 # 80020340 <pxCurrentTCB>
    80002d72:	639c                	ld	a5,0(a5)
    80002d74:	6fb8                	ld	a4,88(a5)
    80002d76:	67e2                	ld	a5,24(sp)
    80002d78:	efb8                	sd	a4,88(a5)
    80002d7a:	0001                	nop
    80002d7c:	70a2                	ld	ra,40(sp)
    80002d7e:	6145                	addi	sp,sp,48
    80002d80:	8082                	ret

0000000080002d82 <xTaskPriorityDisinherit>:
    80002d82:	7179                	addi	sp,sp,-48
    80002d84:	f406                	sd	ra,40(sp)
    80002d86:	e42a                	sd	a0,8(sp)
    80002d88:	67a2                	ld	a5,8(sp)
    80002d8a:	e83e                	sd	a5,16(sp)
    80002d8c:	ec02                	sd	zero,24(sp)
    80002d8e:	67a2                	ld	a5,8(sp)
    80002d90:	cbcd                	beqz	a5,80002e42 <xTaskPriorityDisinherit+0xc0>
    80002d92:	0001d797          	auipc	a5,0x1d
    80002d96:	5ae78793          	addi	a5,a5,1454 # 80020340 <pxCurrentTCB>
    80002d9a:	639c                	ld	a5,0(a5)
    80002d9c:	6742                	ld	a4,16(sp)
    80002d9e:	00f70663          	beq	a4,a5,80002daa <xTaskPriorityDisinherit+0x28>
    80002da2:	30047073          	csrci	mstatus,8
    80002da6:	0001                	nop
    80002da8:	bffd                	j	80002da6 <xTaskPriorityDisinherit+0x24>
    80002daa:	67c2                	ld	a5,16(sp)
    80002dac:	6fdc                	ld	a5,152(a5)
    80002dae:	e789                	bnez	a5,80002db8 <xTaskPriorityDisinherit+0x36>
    80002db0:	30047073          	csrci	mstatus,8
    80002db4:	0001                	nop
    80002db6:	bffd                	j	80002db4 <xTaskPriorityDisinherit+0x32>
    80002db8:	67c2                	ld	a5,16(sp)
    80002dba:	6fdc                	ld	a5,152(a5)
    80002dbc:	fff78713          	addi	a4,a5,-1
    80002dc0:	67c2                	ld	a5,16(sp)
    80002dc2:	efd8                	sd	a4,152(a5)
    80002dc4:	67c2                	ld	a5,16(sp)
    80002dc6:	6fb8                	ld	a4,88(a5)
    80002dc8:	67c2                	ld	a5,16(sp)
    80002dca:	6bdc                	ld	a5,144(a5)
    80002dcc:	06f70b63          	beq	a4,a5,80002e42 <xTaskPriorityDisinherit+0xc0>
    80002dd0:	67c2                	ld	a5,16(sp)
    80002dd2:	6fdc                	ld	a5,152(a5)
    80002dd4:	e7bd                	bnez	a5,80002e42 <xTaskPriorityDisinherit+0xc0>
    80002dd6:	67c2                	ld	a5,16(sp)
    80002dd8:	07a1                	addi	a5,a5,8
    80002dda:	853e                	mv	a0,a5
    80002ddc:	86dfd0ef          	jal	80000648 <uxListRemove>
    80002de0:	67c2                	ld	a5,16(sp)
    80002de2:	6bd8                	ld	a4,144(a5)
    80002de4:	67c2                	ld	a5,16(sp)
    80002de6:	efb8                	sd	a4,88(a5)
    80002de8:	67c2                	ld	a5,16(sp)
    80002dea:	6fbc                	ld	a5,88(a5)
    80002dec:	2781                	sext.w	a5,a5
    80002dee:	4715                	li	a4,5
    80002df0:	40f707bb          	subw	a5,a4,a5
    80002df4:	0007871b          	sext.w	a4,a5
    80002df8:	67c2                	ld	a5,16(sp)
    80002dfa:	db98                	sw	a4,48(a5)
    80002dfc:	67c2                	ld	a5,16(sp)
    80002dfe:	6fb8                	ld	a4,88(a5)
    80002e00:	0001e797          	auipc	a5,0x1e
    80002e04:	93078793          	addi	a5,a5,-1744 # 80020730 <uxTopReadyPriority>
    80002e08:	639c                	ld	a5,0(a5)
    80002e0a:	00e7f963          	bgeu	a5,a4,80002e1c <xTaskPriorityDisinherit+0x9a>
    80002e0e:	67c2                	ld	a5,16(sp)
    80002e10:	6fb8                	ld	a4,88(a5)
    80002e12:	0001e797          	auipc	a5,0x1e
    80002e16:	91e78793          	addi	a5,a5,-1762 # 80020730 <uxTopReadyPriority>
    80002e1a:	e398                	sd	a4,0(a5)
    80002e1c:	67c2                	ld	a5,16(sp)
    80002e1e:	6fb8                	ld	a4,88(a5)
    80002e20:	87ba                	mv	a5,a4
    80002e22:	078a                	slli	a5,a5,0x2
    80002e24:	97ba                	add	a5,a5,a4
    80002e26:	078e                	slli	a5,a5,0x3
    80002e28:	0001d717          	auipc	a4,0x1d
    80002e2c:	75070713          	addi	a4,a4,1872 # 80020578 <pxReadyTasksLists>
    80002e30:	973e                	add	a4,a4,a5
    80002e32:	67c2                	ld	a5,16(sp)
    80002e34:	07a1                	addi	a5,a5,8
    80002e36:	85be                	mv	a1,a5
    80002e38:	853a                	mv	a0,a4
    80002e3a:	f5efd0ef          	jal	80000598 <vListInsertEnd>
    80002e3e:	4785                	li	a5,1
    80002e40:	ec3e                	sd	a5,24(sp)
    80002e42:	67e2                	ld	a5,24(sp)
    80002e44:	853e                	mv	a0,a5
    80002e46:	70a2                	ld	ra,40(sp)
    80002e48:	6145                	addi	sp,sp,48
    80002e4a:	8082                	ret

0000000080002e4c <vTaskEnterCritical>:
    80002e4c:	30047073          	csrci	mstatus,8
    80002e50:	0001e797          	auipc	a5,0x1e
    80002e54:	8e878793          	addi	a5,a5,-1816 # 80020738 <xSchedulerRunning>
    80002e58:	639c                	ld	a5,0(a5)
    80002e5a:	cf91                	beqz	a5,80002e76 <vTaskEnterCritical+0x2a>
    80002e5c:	0001d797          	auipc	a5,0x1d
    80002e60:	4e478793          	addi	a5,a5,1252 # 80020340 <pxCurrentTCB>
    80002e64:	639c                	ld	a5,0(a5)
    80002e66:	7fb8                	ld	a4,120(a5)
    80002e68:	0705                	addi	a4,a4,1
    80002e6a:	ffb8                	sd	a4,120(a5)
    80002e6c:	0001d797          	auipc	a5,0x1d
    80002e70:	4d478793          	addi	a5,a5,1236 # 80020340 <pxCurrentTCB>
    80002e74:	639c                	ld	a5,0(a5)
    80002e76:	0001                	nop
    80002e78:	8082                	ret

0000000080002e7a <vTaskExitCritical>:
    80002e7a:	0001e797          	auipc	a5,0x1e
    80002e7e:	8be78793          	addi	a5,a5,-1858 # 80020738 <xSchedulerRunning>
    80002e82:	639c                	ld	a5,0(a5)
    80002e84:	cb8d                	beqz	a5,80002eb6 <vTaskExitCritical+0x3c>
    80002e86:	0001d797          	auipc	a5,0x1d
    80002e8a:	4ba78793          	addi	a5,a5,1210 # 80020340 <pxCurrentTCB>
    80002e8e:	639c                	ld	a5,0(a5)
    80002e90:	7fbc                	ld	a5,120(a5)
    80002e92:	c395                	beqz	a5,80002eb6 <vTaskExitCritical+0x3c>
    80002e94:	0001d797          	auipc	a5,0x1d
    80002e98:	4ac78793          	addi	a5,a5,1196 # 80020340 <pxCurrentTCB>
    80002e9c:	639c                	ld	a5,0(a5)
    80002e9e:	7fb8                	ld	a4,120(a5)
    80002ea0:	177d                	addi	a4,a4,-1
    80002ea2:	ffb8                	sd	a4,120(a5)
    80002ea4:	0001d797          	auipc	a5,0x1d
    80002ea8:	49c78793          	addi	a5,a5,1180 # 80020340 <pxCurrentTCB>
    80002eac:	639c                	ld	a5,0(a5)
    80002eae:	7fbc                	ld	a5,120(a5)
    80002eb0:	e399                	bnez	a5,80002eb6 <vTaskExitCritical+0x3c>
    80002eb2:	30046073          	csrsi	mstatus,8
    80002eb6:	0001                	nop
    80002eb8:	8082                	ret

0000000080002eba <uxTaskResetEventItemValue>:
    80002eba:	1141                	addi	sp,sp,-16
    80002ebc:	0001d797          	auipc	a5,0x1d
    80002ec0:	48478793          	addi	a5,a5,1156 # 80020340 <pxCurrentTCB>
    80002ec4:	639c                	ld	a5,0(a5)
    80002ec6:	5b9c                	lw	a5,48(a5)
    80002ec8:	c63e                	sw	a5,12(sp)
    80002eca:	0001d797          	auipc	a5,0x1d
    80002ece:	47678793          	addi	a5,a5,1142 # 80020340 <pxCurrentTCB>
    80002ed2:	639c                	ld	a5,0(a5)
    80002ed4:	6fbc                	ld	a5,88(a5)
    80002ed6:	0007871b          	sext.w	a4,a5
    80002eda:	0001d797          	auipc	a5,0x1d
    80002ede:	46678793          	addi	a5,a5,1126 # 80020340 <pxCurrentTCB>
    80002ee2:	639c                	ld	a5,0(a5)
    80002ee4:	4695                	li	a3,5
    80002ee6:	40e6873b          	subw	a4,a3,a4
    80002eea:	2701                	sext.w	a4,a4
    80002eec:	db98                	sw	a4,48(a5)
    80002eee:	47b2                	lw	a5,12(sp)
    80002ef0:	853e                	mv	a0,a5
    80002ef2:	0141                	addi	sp,sp,16
    80002ef4:	8082                	ret

0000000080002ef6 <pvTaskIncrementMutexHeldCount>:
    80002ef6:	0001d797          	auipc	a5,0x1d
    80002efa:	44a78793          	addi	a5,a5,1098 # 80020340 <pxCurrentTCB>
    80002efe:	639c                	ld	a5,0(a5)
    80002f00:	cb89                	beqz	a5,80002f12 <pvTaskIncrementMutexHeldCount+0x1c>
    80002f02:	0001d797          	auipc	a5,0x1d
    80002f06:	43e78793          	addi	a5,a5,1086 # 80020340 <pxCurrentTCB>
    80002f0a:	639c                	ld	a5,0(a5)
    80002f0c:	6fd8                	ld	a4,152(a5)
    80002f0e:	0705                	addi	a4,a4,1
    80002f10:	efd8                	sd	a4,152(a5)
    80002f12:	0001d797          	auipc	a5,0x1d
    80002f16:	42e78793          	addi	a5,a5,1070 # 80020340 <pxCurrentTCB>
    80002f1a:	639c                	ld	a5,0(a5)
    80002f1c:	853e                	mv	a0,a5
    80002f1e:	8082                	ret

0000000080002f20 <ulTaskNotifyTake>:
    80002f20:	7179                	addi	sp,sp,-48
    80002f22:	f406                	sd	ra,40(sp)
    80002f24:	e42a                	sd	a0,8(sp)
    80002f26:	87ae                	mv	a5,a1
    80002f28:	c23e                	sw	a5,4(sp)
    80002f2a:	f23ff0ef          	jal	80002e4c <vTaskEnterCritical>
    80002f2e:	0001d797          	auipc	a5,0x1d
    80002f32:	41278793          	addi	a5,a5,1042 # 80020340 <pxCurrentTCB>
    80002f36:	639c                	ld	a5,0(a5)
    80002f38:	0a07a783          	lw	a5,160(a5)
    80002f3c:	2781                	sext.w	a5,a5
    80002f3e:	eba5                	bnez	a5,80002fae <ulTaskNotifyTake+0x8e>
    80002f40:	0001d797          	auipc	a5,0x1d
    80002f44:	40078793          	addi	a5,a5,1024 # 80020340 <pxCurrentTCB>
    80002f48:	639c                	ld	a5,0(a5)
    80002f4a:	4705                	li	a4,1
    80002f4c:	0ae7a223          	sw	a4,164(a5)
    80002f50:	4792                	lw	a5,4(sp)
    80002f52:	2781                	sext.w	a5,a5
    80002f54:	cfa9                	beqz	a5,80002fae <ulTaskNotifyTake+0x8e>
    80002f56:	0001d797          	auipc	a5,0x1d
    80002f5a:	3ea78793          	addi	a5,a5,1002 # 80020340 <pxCurrentTCB>
    80002f5e:	639c                	ld	a5,0(a5)
    80002f60:	07a1                	addi	a5,a5,8
    80002f62:	853e                	mv	a0,a5
    80002f64:	ee4fd0ef          	jal	80000648 <uxListRemove>
    80002f68:	4792                	lw	a5,4(sp)
    80002f6a:	0007871b          	sext.w	a4,a5
    80002f6e:	57fd                	li	a5,-1
    80002f70:	02f71063          	bne	a4,a5,80002f90 <ulTaskNotifyTake+0x70>
    80002f74:	0001d797          	auipc	a5,0x1d
    80002f78:	3cc78793          	addi	a5,a5,972 # 80020340 <pxCurrentTCB>
    80002f7c:	639c                	ld	a5,0(a5)
    80002f7e:	07a1                	addi	a5,a5,8
    80002f80:	85be                	mv	a1,a5
    80002f82:	0001d517          	auipc	a0,0x1d
    80002f86:	77650513          	addi	a0,a0,1910 # 800206f8 <xSuspendedTaskList>
    80002f8a:	e0efd0ef          	jal	80000598 <vListInsertEnd>
    80002f8e:	a831                	j	80002faa <ulTaskNotifyTake+0x8a>
    80002f90:	0001d797          	auipc	a5,0x1d
    80002f94:	79878793          	addi	a5,a5,1944 # 80020728 <xTickCount>
    80002f98:	439c                	lw	a5,0(a5)
    80002f9a:	2781                	sext.w	a5,a5
    80002f9c:	4712                	lw	a4,4(sp)
    80002f9e:	9fb9                	addw	a5,a5,a4
    80002fa0:	ce3e                	sw	a5,28(sp)
    80002fa2:	47f2                	lw	a5,28(sp)
    80002fa4:	853e                	mv	a0,a5
    80002fa6:	9abff0ef          	jal	80002950 <prvAddCurrentTaskToDelayedList>
    80002faa:	bfcfd0ef          	jal	800003a6 <vPortYield>
    80002fae:	ecdff0ef          	jal	80002e7a <vTaskExitCritical>
    80002fb2:	e9bff0ef          	jal	80002e4c <vTaskEnterCritical>
    80002fb6:	0001d797          	auipc	a5,0x1d
    80002fba:	38a78793          	addi	a5,a5,906 # 80020340 <pxCurrentTCB>
    80002fbe:	639c                	ld	a5,0(a5)
    80002fc0:	0a07a783          	lw	a5,160(a5)
    80002fc4:	cc3e                	sw	a5,24(sp)
    80002fc6:	47e2                	lw	a5,24(sp)
    80002fc8:	2781                	sext.w	a5,a5
    80002fca:	c79d                	beqz	a5,80002ff8 <ulTaskNotifyTake+0xd8>
    80002fcc:	67a2                	ld	a5,8(sp)
    80002fce:	cb89                	beqz	a5,80002fe0 <ulTaskNotifyTake+0xc0>
    80002fd0:	0001d797          	auipc	a5,0x1d
    80002fd4:	37078793          	addi	a5,a5,880 # 80020340 <pxCurrentTCB>
    80002fd8:	639c                	ld	a5,0(a5)
    80002fda:	0a07a023          	sw	zero,160(a5)
    80002fde:	a829                	j	80002ff8 <ulTaskNotifyTake+0xd8>
    80002fe0:	0001d797          	auipc	a5,0x1d
    80002fe4:	36078793          	addi	a5,a5,864 # 80020340 <pxCurrentTCB>
    80002fe8:	639c                	ld	a5,0(a5)
    80002fea:	0a07a703          	lw	a4,160(a5)
    80002fee:	2701                	sext.w	a4,a4
    80002ff0:	377d                	addiw	a4,a4,-1
    80002ff2:	2701                	sext.w	a4,a4
    80002ff4:	0ae7a023          	sw	a4,160(a5)
    80002ff8:	0001d797          	auipc	a5,0x1d
    80002ffc:	34878793          	addi	a5,a5,840 # 80020340 <pxCurrentTCB>
    80003000:	639c                	ld	a5,0(a5)
    80003002:	0a07a223          	sw	zero,164(a5)
    80003006:	e75ff0ef          	jal	80002e7a <vTaskExitCritical>
    8000300a:	47e2                	lw	a5,24(sp)
    8000300c:	853e                	mv	a0,a5
    8000300e:	70a2                	ld	ra,40(sp)
    80003010:	6145                	addi	sp,sp,48
    80003012:	8082                	ret

0000000080003014 <xTaskNotifyWait>:
    80003014:	7139                	addi	sp,sp,-64
    80003016:	fc06                	sd	ra,56(sp)
    80003018:	87aa                	mv	a5,a0
    8000301a:	e832                	sd	a2,16(sp)
    8000301c:	8736                	mv	a4,a3
    8000301e:	ce3e                	sw	a5,28(sp)
    80003020:	87ae                	mv	a5,a1
    80003022:	cc3e                	sw	a5,24(sp)
    80003024:	87ba                	mv	a5,a4
    80003026:	c63e                	sw	a5,12(sp)
    80003028:	e25ff0ef          	jal	80002e4c <vTaskEnterCritical>
    8000302c:	0001d797          	auipc	a5,0x1d
    80003030:	31478793          	addi	a5,a5,788 # 80020340 <pxCurrentTCB>
    80003034:	639c                	ld	a5,0(a5)
    80003036:	0a47a783          	lw	a5,164(a5)
    8000303a:	2781                	sext.w	a5,a5
    8000303c:	873e                	mv	a4,a5
    8000303e:	4789                	li	a5,2
    80003040:	08f70a63          	beq	a4,a5,800030d4 <xTaskNotifyWait+0xc0>
    80003044:	0001d797          	auipc	a5,0x1d
    80003048:	2fc78793          	addi	a5,a5,764 # 80020340 <pxCurrentTCB>
    8000304c:	639c                	ld	a5,0(a5)
    8000304e:	0a07a703          	lw	a4,160(a5)
    80003052:	0007069b          	sext.w	a3,a4
    80003056:	4772                	lw	a4,28(sp)
    80003058:	fff74713          	not	a4,a4
    8000305c:	2701                	sext.w	a4,a4
    8000305e:	8f75                	and	a4,a4,a3
    80003060:	2701                	sext.w	a4,a4
    80003062:	0ae7a023          	sw	a4,160(a5)
    80003066:	0001d797          	auipc	a5,0x1d
    8000306a:	2da78793          	addi	a5,a5,730 # 80020340 <pxCurrentTCB>
    8000306e:	639c                	ld	a5,0(a5)
    80003070:	4705                	li	a4,1
    80003072:	0ae7a223          	sw	a4,164(a5)
    80003076:	47b2                	lw	a5,12(sp)
    80003078:	2781                	sext.w	a5,a5
    8000307a:	cfa9                	beqz	a5,800030d4 <xTaskNotifyWait+0xc0>
    8000307c:	0001d797          	auipc	a5,0x1d
    80003080:	2c478793          	addi	a5,a5,708 # 80020340 <pxCurrentTCB>
    80003084:	639c                	ld	a5,0(a5)
    80003086:	07a1                	addi	a5,a5,8
    80003088:	853e                	mv	a0,a5
    8000308a:	dbefd0ef          	jal	80000648 <uxListRemove>
    8000308e:	47b2                	lw	a5,12(sp)
    80003090:	0007871b          	sext.w	a4,a5
    80003094:	57fd                	li	a5,-1
    80003096:	02f71063          	bne	a4,a5,800030b6 <xTaskNotifyWait+0xa2>
    8000309a:	0001d797          	auipc	a5,0x1d
    8000309e:	2a678793          	addi	a5,a5,678 # 80020340 <pxCurrentTCB>
    800030a2:	639c                	ld	a5,0(a5)
    800030a4:	07a1                	addi	a5,a5,8
    800030a6:	85be                	mv	a1,a5
    800030a8:	0001d517          	auipc	a0,0x1d
    800030ac:	65050513          	addi	a0,a0,1616 # 800206f8 <xSuspendedTaskList>
    800030b0:	ce8fd0ef          	jal	80000598 <vListInsertEnd>
    800030b4:	a831                	j	800030d0 <xTaskNotifyWait+0xbc>
    800030b6:	0001d797          	auipc	a5,0x1d
    800030ba:	67278793          	addi	a5,a5,1650 # 80020728 <xTickCount>
    800030be:	439c                	lw	a5,0(a5)
    800030c0:	2781                	sext.w	a5,a5
    800030c2:	4732                	lw	a4,12(sp)
    800030c4:	9fb9                	addw	a5,a5,a4
    800030c6:	d23e                	sw	a5,36(sp)
    800030c8:	5792                	lw	a5,36(sp)
    800030ca:	853e                	mv	a0,a5
    800030cc:	885ff0ef          	jal	80002950 <prvAddCurrentTaskToDelayedList>
    800030d0:	ad6fd0ef          	jal	800003a6 <vPortYield>
    800030d4:	da7ff0ef          	jal	80002e7a <vTaskExitCritical>
    800030d8:	d75ff0ef          	jal	80002e4c <vTaskEnterCritical>
    800030dc:	67c2                	ld	a5,16(sp)
    800030de:	cf81                	beqz	a5,800030f6 <xTaskNotifyWait+0xe2>
    800030e0:	0001d797          	auipc	a5,0x1d
    800030e4:	26078793          	addi	a5,a5,608 # 80020340 <pxCurrentTCB>
    800030e8:	639c                	ld	a5,0(a5)
    800030ea:	0a07a783          	lw	a5,160(a5)
    800030ee:	0007871b          	sext.w	a4,a5
    800030f2:	67c2                	ld	a5,16(sp)
    800030f4:	c398                	sw	a4,0(a5)
    800030f6:	0001d797          	auipc	a5,0x1d
    800030fa:	24a78793          	addi	a5,a5,586 # 80020340 <pxCurrentTCB>
    800030fe:	639c                	ld	a5,0(a5)
    80003100:	0a47a783          	lw	a5,164(a5)
    80003104:	2781                	sext.w	a5,a5
    80003106:	873e                	mv	a4,a5
    80003108:	4785                	li	a5,1
    8000310a:	00f71463          	bne	a4,a5,80003112 <xTaskNotifyWait+0xfe>
    8000310e:	f402                	sd	zero,40(sp)
    80003110:	a025                	j	80003138 <xTaskNotifyWait+0x124>
    80003112:	0001d797          	auipc	a5,0x1d
    80003116:	22e78793          	addi	a5,a5,558 # 80020340 <pxCurrentTCB>
    8000311a:	639c                	ld	a5,0(a5)
    8000311c:	0a07a703          	lw	a4,160(a5)
    80003120:	0007069b          	sext.w	a3,a4
    80003124:	4762                	lw	a4,24(sp)
    80003126:	fff74713          	not	a4,a4
    8000312a:	2701                	sext.w	a4,a4
    8000312c:	8f75                	and	a4,a4,a3
    8000312e:	2701                	sext.w	a4,a4
    80003130:	0ae7a023          	sw	a4,160(a5)
    80003134:	4785                	li	a5,1
    80003136:	f43e                	sd	a5,40(sp)
    80003138:	0001d797          	auipc	a5,0x1d
    8000313c:	20878793          	addi	a5,a5,520 # 80020340 <pxCurrentTCB>
    80003140:	639c                	ld	a5,0(a5)
    80003142:	0a07a223          	sw	zero,164(a5)
    80003146:	d35ff0ef          	jal	80002e7a <vTaskExitCritical>
    8000314a:	77a2                	ld	a5,40(sp)
    8000314c:	853e                	mv	a0,a5
    8000314e:	70e2                	ld	ra,56(sp)
    80003150:	6121                	addi	sp,sp,64
    80003152:	8082                	ret

0000000080003154 <xTaskGenericNotify>:
    80003154:	715d                	addi	sp,sp,-80
    80003156:	e486                	sd	ra,72(sp)
    80003158:	ec2a                	sd	a0,24(sp)
    8000315a:	87ae                	mv	a5,a1
    8000315c:	8732                	mv	a4,a2
    8000315e:	e436                	sd	a3,8(sp)
    80003160:	ca3e                	sw	a5,20(sp)
    80003162:	87ba                	mv	a5,a4
    80003164:	c83e                	sw	a5,16(sp)
    80003166:	4785                	li	a5,1
    80003168:	fc3e                	sd	a5,56(sp)
    8000316a:	67e2                	ld	a5,24(sp)
    8000316c:	e789                	bnez	a5,80003176 <xTaskGenericNotify+0x22>
    8000316e:	30047073          	csrci	mstatus,8
    80003172:	0001                	nop
    80003174:	bffd                	j	80003172 <xTaskGenericNotify+0x1e>
    80003176:	67e2                	ld	a5,24(sp)
    80003178:	f83e                	sd	a5,48(sp)
    8000317a:	cd3ff0ef          	jal	80002e4c <vTaskEnterCritical>
    8000317e:	67a2                	ld	a5,8(sp)
    80003180:	cb81                	beqz	a5,80003190 <xTaskGenericNotify+0x3c>
    80003182:	77c2                	ld	a5,48(sp)
    80003184:	0a07a783          	lw	a5,160(a5)
    80003188:	0007871b          	sext.w	a4,a5
    8000318c:	67a2                	ld	a5,8(sp)
    8000318e:	c398                	sw	a4,0(a5)
    80003190:	77c2                	ld	a5,48(sp)
    80003192:	0a47a783          	lw	a5,164(a5)
    80003196:	d63e                	sw	a5,44(sp)
    80003198:	77c2                	ld	a5,48(sp)
    8000319a:	4709                	li	a4,2
    8000319c:	0ae7a223          	sw	a4,164(a5)
    800031a0:	47c2                	lw	a5,16(sp)
    800031a2:	0007871b          	sext.w	a4,a5
    800031a6:	4791                	li	a5,4
    800031a8:	06e7ee63          	bltu	a5,a4,80003224 <xTaskGenericNotify+0xd0>
    800031ac:	01016783          	lwu	a5,16(sp)
    800031b0:	00279713          	slli	a4,a5,0x2
    800031b4:	0001d797          	auipc	a5,0x1d
    800031b8:	e5478793          	addi	a5,a5,-428 # 80020008 <__rodata_start+0x8>
    800031bc:	97ba                	add	a5,a5,a4
    800031be:	439c                	lw	a5,0(a5)
    800031c0:	0007871b          	sext.w	a4,a5
    800031c4:	0001d797          	auipc	a5,0x1d
    800031c8:	e4478793          	addi	a5,a5,-444 # 80020008 <__rodata_start+0x8>
    800031cc:	97ba                	add	a5,a5,a4
    800031ce:	8782                	jr	a5
    800031d0:	77c2                	ld	a5,48(sp)
    800031d2:	0a07a783          	lw	a5,160(a5)
    800031d6:	2781                	sext.w	a5,a5
    800031d8:	4752                	lw	a4,20(sp)
    800031da:	8fd9                	or	a5,a5,a4
    800031dc:	0007871b          	sext.w	a4,a5
    800031e0:	77c2                	ld	a5,48(sp)
    800031e2:	0ae7a023          	sw	a4,160(a5)
    800031e6:	a83d                	j	80003224 <xTaskGenericNotify+0xd0>
    800031e8:	77c2                	ld	a5,48(sp)
    800031ea:	0a07a783          	lw	a5,160(a5)
    800031ee:	2781                	sext.w	a5,a5
    800031f0:	2785                	addiw	a5,a5,1
    800031f2:	0007871b          	sext.w	a4,a5
    800031f6:	77c2                	ld	a5,48(sp)
    800031f8:	0ae7a023          	sw	a4,160(a5)
    800031fc:	a025                	j	80003224 <xTaskGenericNotify+0xd0>
    800031fe:	77c2                	ld	a5,48(sp)
    80003200:	4752                	lw	a4,20(sp)
    80003202:	0ae7a023          	sw	a4,160(a5)
    80003206:	a839                	j	80003224 <xTaskGenericNotify+0xd0>
    80003208:	57b2                	lw	a5,44(sp)
    8000320a:	0007871b          	sext.w	a4,a5
    8000320e:	4789                	li	a5,2
    80003210:	00f70763          	beq	a4,a5,8000321e <xTaskGenericNotify+0xca>
    80003214:	77c2                	ld	a5,48(sp)
    80003216:	4752                	lw	a4,20(sp)
    80003218:	0ae7a023          	sw	a4,160(a5)
    8000321c:	a021                	j	80003224 <xTaskGenericNotify+0xd0>
    8000321e:	fc02                	sd	zero,56(sp)
    80003220:	a011                	j	80003224 <xTaskGenericNotify+0xd0>
    80003222:	0001                	nop
    80003224:	57b2                	lw	a5,44(sp)
    80003226:	0007871b          	sext.w	a4,a5
    8000322a:	4785                	li	a5,1
    8000322c:	06f71b63          	bne	a4,a5,800032a2 <xTaskGenericNotify+0x14e>
    80003230:	77c2                	ld	a5,48(sp)
    80003232:	07a1                	addi	a5,a5,8
    80003234:	853e                	mv	a0,a5
    80003236:	c12fd0ef          	jal	80000648 <uxListRemove>
    8000323a:	77c2                	ld	a5,48(sp)
    8000323c:	6fb8                	ld	a4,88(a5)
    8000323e:	0001d797          	auipc	a5,0x1d
    80003242:	4f278793          	addi	a5,a5,1266 # 80020730 <uxTopReadyPriority>
    80003246:	639c                	ld	a5,0(a5)
    80003248:	00e7f963          	bgeu	a5,a4,8000325a <xTaskGenericNotify+0x106>
    8000324c:	77c2                	ld	a5,48(sp)
    8000324e:	6fb8                	ld	a4,88(a5)
    80003250:	0001d797          	auipc	a5,0x1d
    80003254:	4e078793          	addi	a5,a5,1248 # 80020730 <uxTopReadyPriority>
    80003258:	e398                	sd	a4,0(a5)
    8000325a:	77c2                	ld	a5,48(sp)
    8000325c:	6fb8                	ld	a4,88(a5)
    8000325e:	87ba                	mv	a5,a4
    80003260:	078a                	slli	a5,a5,0x2
    80003262:	97ba                	add	a5,a5,a4
    80003264:	078e                	slli	a5,a5,0x3
    80003266:	0001d717          	auipc	a4,0x1d
    8000326a:	31270713          	addi	a4,a4,786 # 80020578 <pxReadyTasksLists>
    8000326e:	973e                	add	a4,a4,a5
    80003270:	77c2                	ld	a5,48(sp)
    80003272:	07a1                	addi	a5,a5,8
    80003274:	85be                	mv	a1,a5
    80003276:	853a                	mv	a0,a4
    80003278:	b20fd0ef          	jal	80000598 <vListInsertEnd>
    8000327c:	77c2                	ld	a5,48(sp)
    8000327e:	6bbc                	ld	a5,80(a5)
    80003280:	c789                	beqz	a5,8000328a <xTaskGenericNotify+0x136>
    80003282:	30047073          	csrci	mstatus,8
    80003286:	0001                	nop
    80003288:	bffd                	j	80003286 <xTaskGenericNotify+0x132>
    8000328a:	77c2                	ld	a5,48(sp)
    8000328c:	6fb8                	ld	a4,88(a5)
    8000328e:	0001d797          	auipc	a5,0x1d
    80003292:	0b278793          	addi	a5,a5,178 # 80020340 <pxCurrentTCB>
    80003296:	639c                	ld	a5,0(a5)
    80003298:	6fbc                	ld	a5,88(a5)
    8000329a:	00e7f463          	bgeu	a5,a4,800032a2 <xTaskGenericNotify+0x14e>
    8000329e:	908fd0ef          	jal	800003a6 <vPortYield>
    800032a2:	bd9ff0ef          	jal	80002e7a <vTaskExitCritical>
    800032a6:	77e2                	ld	a5,56(sp)
    800032a8:	853e                	mv	a0,a5
    800032aa:	60a6                	ld	ra,72(sp)
    800032ac:	6161                	addi	sp,sp,80
    800032ae:	8082                	ret

00000000800032b0 <xTaskGenericNotifyFromISR>:
    800032b0:	715d                	addi	sp,sp,-80
    800032b2:	e486                	sd	ra,72(sp)
    800032b4:	ec2a                	sd	a0,24(sp)
    800032b6:	87ae                	mv	a5,a1
    800032b8:	e436                	sd	a3,8(sp)
    800032ba:	e03a                	sd	a4,0(sp)
    800032bc:	ca3e                	sw	a5,20(sp)
    800032be:	87b2                	mv	a5,a2
    800032c0:	c83e                	sw	a5,16(sp)
    800032c2:	4785                	li	a5,1
    800032c4:	fc3e                	sd	a5,56(sp)
    800032c6:	67e2                	ld	a5,24(sp)
    800032c8:	e789                	bnez	a5,800032d2 <xTaskGenericNotifyFromISR+0x22>
    800032ca:	30047073          	csrci	mstatus,8
    800032ce:	0001                	nop
    800032d0:	bffd                	j	800032ce <xTaskGenericNotifyFromISR+0x1e>
    800032d2:	67e2                	ld	a5,24(sp)
    800032d4:	f83e                	sd	a5,48(sp)
    800032d6:	a02fd0ef          	jal	800004d8 <vPortSetInterruptMask>
    800032da:	87aa                	mv	a5,a0
    800032dc:	f43e                	sd	a5,40(sp)
    800032de:	67a2                	ld	a5,8(sp)
    800032e0:	cb81                	beqz	a5,800032f0 <xTaskGenericNotifyFromISR+0x40>
    800032e2:	77c2                	ld	a5,48(sp)
    800032e4:	0a07a783          	lw	a5,160(a5)
    800032e8:	0007871b          	sext.w	a4,a5
    800032ec:	67a2                	ld	a5,8(sp)
    800032ee:	c398                	sw	a4,0(a5)
    800032f0:	77c2                	ld	a5,48(sp)
    800032f2:	0a47a783          	lw	a5,164(a5)
    800032f6:	d23e                	sw	a5,36(sp)
    800032f8:	77c2                	ld	a5,48(sp)
    800032fa:	4709                	li	a4,2
    800032fc:	0ae7a223          	sw	a4,164(a5)
    80003300:	47c2                	lw	a5,16(sp)
    80003302:	0007871b          	sext.w	a4,a5
    80003306:	4791                	li	a5,4
    80003308:	06e7ee63          	bltu	a5,a4,80003384 <xTaskGenericNotifyFromISR+0xd4>
    8000330c:	01016783          	lwu	a5,16(sp)
    80003310:	00279713          	slli	a4,a5,0x2
    80003314:	0001d797          	auipc	a5,0x1d
    80003318:	d0878793          	addi	a5,a5,-760 # 8002001c <__rodata_start+0x1c>
    8000331c:	97ba                	add	a5,a5,a4
    8000331e:	439c                	lw	a5,0(a5)
    80003320:	0007871b          	sext.w	a4,a5
    80003324:	0001d797          	auipc	a5,0x1d
    80003328:	cf878793          	addi	a5,a5,-776 # 8002001c <__rodata_start+0x1c>
    8000332c:	97ba                	add	a5,a5,a4
    8000332e:	8782                	jr	a5
    80003330:	77c2                	ld	a5,48(sp)
    80003332:	0a07a783          	lw	a5,160(a5)
    80003336:	2781                	sext.w	a5,a5
    80003338:	4752                	lw	a4,20(sp)
    8000333a:	8fd9                	or	a5,a5,a4
    8000333c:	0007871b          	sext.w	a4,a5
    80003340:	77c2                	ld	a5,48(sp)
    80003342:	0ae7a023          	sw	a4,160(a5)
    80003346:	a83d                	j	80003384 <xTaskGenericNotifyFromISR+0xd4>
    80003348:	77c2                	ld	a5,48(sp)
    8000334a:	0a07a783          	lw	a5,160(a5)
    8000334e:	2781                	sext.w	a5,a5
    80003350:	2785                	addiw	a5,a5,1
    80003352:	0007871b          	sext.w	a4,a5
    80003356:	77c2                	ld	a5,48(sp)
    80003358:	0ae7a023          	sw	a4,160(a5)
    8000335c:	a025                	j	80003384 <xTaskGenericNotifyFromISR+0xd4>
    8000335e:	77c2                	ld	a5,48(sp)
    80003360:	4752                	lw	a4,20(sp)
    80003362:	0ae7a023          	sw	a4,160(a5)
    80003366:	a839                	j	80003384 <xTaskGenericNotifyFromISR+0xd4>
    80003368:	5792                	lw	a5,36(sp)
    8000336a:	0007871b          	sext.w	a4,a5
    8000336e:	4789                	li	a5,2
    80003370:	00f70763          	beq	a4,a5,8000337e <xTaskGenericNotifyFromISR+0xce>
    80003374:	77c2                	ld	a5,48(sp)
    80003376:	4752                	lw	a4,20(sp)
    80003378:	0ae7a023          	sw	a4,160(a5)
    8000337c:	a021                	j	80003384 <xTaskGenericNotifyFromISR+0xd4>
    8000337e:	fc02                	sd	zero,56(sp)
    80003380:	a011                	j	80003384 <xTaskGenericNotifyFromISR+0xd4>
    80003382:	0001                	nop
    80003384:	5792                	lw	a5,36(sp)
    80003386:	0007871b          	sext.w	a4,a5
    8000338a:	4785                	li	a5,1
    8000338c:	08f71f63          	bne	a4,a5,8000342a <xTaskGenericNotifyFromISR+0x17a>
    80003390:	77c2                	ld	a5,48(sp)
    80003392:	6bbc                	ld	a5,80(a5)
    80003394:	c789                	beqz	a5,8000339e <xTaskGenericNotifyFromISR+0xee>
    80003396:	30047073          	csrci	mstatus,8
    8000339a:	0001                	nop
    8000339c:	bffd                	j	8000339a <xTaskGenericNotifyFromISR+0xea>
    8000339e:	0001d797          	auipc	a5,0x1d
    800033a2:	3ca78793          	addi	a5,a5,970 # 80020768 <uxSchedulerSuspended>
    800033a6:	639c                	ld	a5,0(a5)
    800033a8:	eba1                	bnez	a5,800033f8 <xTaskGenericNotifyFromISR+0x148>
    800033aa:	77c2                	ld	a5,48(sp)
    800033ac:	07a1                	addi	a5,a5,8
    800033ae:	853e                	mv	a0,a5
    800033b0:	a98fd0ef          	jal	80000648 <uxListRemove>
    800033b4:	77c2                	ld	a5,48(sp)
    800033b6:	6fb8                	ld	a4,88(a5)
    800033b8:	0001d797          	auipc	a5,0x1d
    800033bc:	37878793          	addi	a5,a5,888 # 80020730 <uxTopReadyPriority>
    800033c0:	639c                	ld	a5,0(a5)
    800033c2:	00e7f963          	bgeu	a5,a4,800033d4 <xTaskGenericNotifyFromISR+0x124>
    800033c6:	77c2                	ld	a5,48(sp)
    800033c8:	6fb8                	ld	a4,88(a5)
    800033ca:	0001d797          	auipc	a5,0x1d
    800033ce:	36678793          	addi	a5,a5,870 # 80020730 <uxTopReadyPriority>
    800033d2:	e398                	sd	a4,0(a5)
    800033d4:	77c2                	ld	a5,48(sp)
    800033d6:	6fb8                	ld	a4,88(a5)
    800033d8:	87ba                	mv	a5,a4
    800033da:	078a                	slli	a5,a5,0x2
    800033dc:	97ba                	add	a5,a5,a4
    800033de:	078e                	slli	a5,a5,0x3
    800033e0:	0001d717          	auipc	a4,0x1d
    800033e4:	19870713          	addi	a4,a4,408 # 80020578 <pxReadyTasksLists>
    800033e8:	973e                	add	a4,a4,a5
    800033ea:	77c2                	ld	a5,48(sp)
    800033ec:	07a1                	addi	a5,a5,8
    800033ee:	85be                	mv	a1,a5
    800033f0:	853a                	mv	a0,a4
    800033f2:	9a6fd0ef          	jal	80000598 <vListInsertEnd>
    800033f6:	a819                	j	8000340c <xTaskGenericNotifyFromISR+0x15c>
    800033f8:	77c2                	ld	a5,48(sp)
    800033fa:	03078793          	addi	a5,a5,48
    800033fe:	85be                	mv	a1,a5
    80003400:	0001d517          	auipc	a0,0x1d
    80003404:	2a050513          	addi	a0,a0,672 # 800206a0 <xPendingReadyList>
    80003408:	990fd0ef          	jal	80000598 <vListInsertEnd>
    8000340c:	77c2                	ld	a5,48(sp)
    8000340e:	6fb8                	ld	a4,88(a5)
    80003410:	0001d797          	auipc	a5,0x1d
    80003414:	f3078793          	addi	a5,a5,-208 # 80020340 <pxCurrentTCB>
    80003418:	639c                	ld	a5,0(a5)
    8000341a:	6fbc                	ld	a5,88(a5)
    8000341c:	00e7f763          	bgeu	a5,a4,8000342a <xTaskGenericNotifyFromISR+0x17a>
    80003420:	6782                	ld	a5,0(sp)
    80003422:	c781                	beqz	a5,8000342a <xTaskGenericNotifyFromISR+0x17a>
    80003424:	6782                	ld	a5,0(sp)
    80003426:	4705                	li	a4,1
    80003428:	e398                	sd	a4,0(a5)
    8000342a:	77a2                	ld	a5,40(sp)
    8000342c:	2781                	sext.w	a5,a5
    8000342e:	853e                	mv	a0,a5
    80003430:	896fd0ef          	jal	800004c6 <vPortClearInterruptMask>
    80003434:	77e2                	ld	a5,56(sp)
    80003436:	853e                	mv	a0,a5
    80003438:	60a6                	ld	ra,72(sp)
    8000343a:	6161                	addi	sp,sp,80
    8000343c:	8082                	ret

000000008000343e <vTaskNotifyGiveFromISR>:
    8000343e:	7139                	addi	sp,sp,-64
    80003440:	fc06                	sd	ra,56(sp)
    80003442:	e42a                	sd	a0,8(sp)
    80003444:	e02e                	sd	a1,0(sp)
    80003446:	67a2                	ld	a5,8(sp)
    80003448:	e789                	bnez	a5,80003452 <vTaskNotifyGiveFromISR+0x14>
    8000344a:	30047073          	csrci	mstatus,8
    8000344e:	0001                	nop
    80003450:	bffd                	j	8000344e <vTaskNotifyGiveFromISR+0x10>
    80003452:	67a2                	ld	a5,8(sp)
    80003454:	f43e                	sd	a5,40(sp)
    80003456:	882fd0ef          	jal	800004d8 <vPortSetInterruptMask>
    8000345a:	87aa                	mv	a5,a0
    8000345c:	f03e                	sd	a5,32(sp)
    8000345e:	77a2                	ld	a5,40(sp)
    80003460:	0a47a783          	lw	a5,164(a5)
    80003464:	ce3e                	sw	a5,28(sp)
    80003466:	77a2                	ld	a5,40(sp)
    80003468:	4709                	li	a4,2
    8000346a:	0ae7a223          	sw	a4,164(a5)
    8000346e:	77a2                	ld	a5,40(sp)
    80003470:	0a07a783          	lw	a5,160(a5)
    80003474:	2781                	sext.w	a5,a5
    80003476:	2785                	addiw	a5,a5,1
    80003478:	0007871b          	sext.w	a4,a5
    8000347c:	77a2                	ld	a5,40(sp)
    8000347e:	0ae7a023          	sw	a4,160(a5)
    80003482:	47f2                	lw	a5,28(sp)
    80003484:	0007871b          	sext.w	a4,a5
    80003488:	4785                	li	a5,1
    8000348a:	08f71f63          	bne	a4,a5,80003528 <vTaskNotifyGiveFromISR+0xea>
    8000348e:	77a2                	ld	a5,40(sp)
    80003490:	6bbc                	ld	a5,80(a5)
    80003492:	c789                	beqz	a5,8000349c <vTaskNotifyGiveFromISR+0x5e>
    80003494:	30047073          	csrci	mstatus,8
    80003498:	0001                	nop
    8000349a:	bffd                	j	80003498 <vTaskNotifyGiveFromISR+0x5a>
    8000349c:	0001d797          	auipc	a5,0x1d
    800034a0:	2cc78793          	addi	a5,a5,716 # 80020768 <uxSchedulerSuspended>
    800034a4:	639c                	ld	a5,0(a5)
    800034a6:	eba1                	bnez	a5,800034f6 <vTaskNotifyGiveFromISR+0xb8>
    800034a8:	77a2                	ld	a5,40(sp)
    800034aa:	07a1                	addi	a5,a5,8
    800034ac:	853e                	mv	a0,a5
    800034ae:	99afd0ef          	jal	80000648 <uxListRemove>
    800034b2:	77a2                	ld	a5,40(sp)
    800034b4:	6fb8                	ld	a4,88(a5)
    800034b6:	0001d797          	auipc	a5,0x1d
    800034ba:	27a78793          	addi	a5,a5,634 # 80020730 <uxTopReadyPriority>
    800034be:	639c                	ld	a5,0(a5)
    800034c0:	00e7f963          	bgeu	a5,a4,800034d2 <vTaskNotifyGiveFromISR+0x94>
    800034c4:	77a2                	ld	a5,40(sp)
    800034c6:	6fb8                	ld	a4,88(a5)
    800034c8:	0001d797          	auipc	a5,0x1d
    800034cc:	26878793          	addi	a5,a5,616 # 80020730 <uxTopReadyPriority>
    800034d0:	e398                	sd	a4,0(a5)
    800034d2:	77a2                	ld	a5,40(sp)
    800034d4:	6fb8                	ld	a4,88(a5)
    800034d6:	87ba                	mv	a5,a4
    800034d8:	078a                	slli	a5,a5,0x2
    800034da:	97ba                	add	a5,a5,a4
    800034dc:	078e                	slli	a5,a5,0x3
    800034de:	0001d717          	auipc	a4,0x1d
    800034e2:	09a70713          	addi	a4,a4,154 # 80020578 <pxReadyTasksLists>
    800034e6:	973e                	add	a4,a4,a5
    800034e8:	77a2                	ld	a5,40(sp)
    800034ea:	07a1                	addi	a5,a5,8
    800034ec:	85be                	mv	a1,a5
    800034ee:	853a                	mv	a0,a4
    800034f0:	8a8fd0ef          	jal	80000598 <vListInsertEnd>
    800034f4:	a819                	j	8000350a <vTaskNotifyGiveFromISR+0xcc>
    800034f6:	77a2                	ld	a5,40(sp)
    800034f8:	03078793          	addi	a5,a5,48
    800034fc:	85be                	mv	a1,a5
    800034fe:	0001d517          	auipc	a0,0x1d
    80003502:	1a250513          	addi	a0,a0,418 # 800206a0 <xPendingReadyList>
    80003506:	892fd0ef          	jal	80000598 <vListInsertEnd>
    8000350a:	77a2                	ld	a5,40(sp)
    8000350c:	6fb8                	ld	a4,88(a5)
    8000350e:	0001d797          	auipc	a5,0x1d
    80003512:	e3278793          	addi	a5,a5,-462 # 80020340 <pxCurrentTCB>
    80003516:	639c                	ld	a5,0(a5)
    80003518:	6fbc                	ld	a5,88(a5)
    8000351a:	00e7f763          	bgeu	a5,a4,80003528 <vTaskNotifyGiveFromISR+0xea>
    8000351e:	6782                	ld	a5,0(sp)
    80003520:	c781                	beqz	a5,80003528 <vTaskNotifyGiveFromISR+0xea>
    80003522:	6782                	ld	a5,0(sp)
    80003524:	4705                	li	a4,1
    80003526:	e398                	sd	a4,0(a5)
    80003528:	7782                	ld	a5,32(sp)
    8000352a:	2781                	sext.w	a5,a5
    8000352c:	853e                	mv	a0,a5
    8000352e:	f99fc0ef          	jal	800004c6 <vPortClearInterruptMask>
    80003532:	0001                	nop
    80003534:	70e2                	ld	ra,56(sp)
    80003536:	6121                	addi	sp,sp,64
    80003538:	8082                	ret

000000008000353a <xTaskNotifyStateClear>:
    8000353a:	7179                	addi	sp,sp,-48
    8000353c:	f406                	sd	ra,40(sp)
    8000353e:	e42a                	sd	a0,8(sp)
    80003540:	67a2                	ld	a5,8(sp)
    80003542:	e83e                	sd	a5,16(sp)
    80003544:	67c2                	ld	a5,16(sp)
    80003546:	e799                	bnez	a5,80003554 <xTaskNotifyStateClear+0x1a>
    80003548:	0001d797          	auipc	a5,0x1d
    8000354c:	df878793          	addi	a5,a5,-520 # 80020340 <pxCurrentTCB>
    80003550:	639c                	ld	a5,0(a5)
    80003552:	a011                	j	80003556 <xTaskNotifyStateClear+0x1c>
    80003554:	67c2                	ld	a5,16(sp)
    80003556:	e83e                	sd	a5,16(sp)
    80003558:	8f5ff0ef          	jal	80002e4c <vTaskEnterCritical>
    8000355c:	67c2                	ld	a5,16(sp)
    8000355e:	0a47a783          	lw	a5,164(a5)
    80003562:	2781                	sext.w	a5,a5
    80003564:	873e                	mv	a4,a5
    80003566:	4789                	li	a5,2
    80003568:	00f71863          	bne	a4,a5,80003578 <xTaskNotifyStateClear+0x3e>
    8000356c:	67c2                	ld	a5,16(sp)
    8000356e:	0a07a223          	sw	zero,164(a5)
    80003572:	4785                	li	a5,1
    80003574:	ec3e                	sd	a5,24(sp)
    80003576:	a011                	j	8000357a <xTaskNotifyStateClear+0x40>
    80003578:	ec02                	sd	zero,24(sp)
    8000357a:	901ff0ef          	jal	80002e7a <vTaskExitCritical>
    8000357e:	67e2                	ld	a5,24(sp)
    80003580:	853e                	mv	a0,a5
    80003582:	70a2                	ld	ra,40(sp)
    80003584:	6145                	addi	sp,sp,48
    80003586:	8082                	ret

0000000080003588 <xTimerCreateTimerTask>:
    80003588:	1101                	addi	sp,sp,-32
    8000358a:	ec06                	sd	ra,24(sp)
    8000358c:	e402                	sd	zero,8(sp)
    8000358e:	5d8000ef          	jal	80003b66 <prvCheckForValidListAndQueue>
    80003592:	0001d797          	auipc	a5,0x1d
    80003596:	23e78793          	addi	a5,a5,574 # 800207d0 <xTimerQueue>
    8000359a:	639c                	ld	a5,0(a5)
    8000359c:	c39d                	beqz	a5,800035c2 <xTimerCreateTimerTask+0x3a>
    8000359e:	4881                	li	a7,0
    800035a0:	4801                	li	a6,0
    800035a2:	4781                	li	a5,0
    800035a4:	4709                	li	a4,2
    800035a6:	4681                	li	a3,0
    800035a8:	40000613          	li	a2,1024
    800035ac:	0001d597          	auipc	a1,0x1d
    800035b0:	a8458593          	addi	a1,a1,-1404 # 80020030 <__rodata_start+0x30>
    800035b4:	00000517          	auipc	a0,0x0
    800035b8:	1d650513          	addi	a0,a0,470 # 8000378a <prvTimerTask>
    800035bc:	da3fd0ef          	jal	8000135e <xTaskGenericCreate>
    800035c0:	e42a                	sd	a0,8(sp)
    800035c2:	67a2                	ld	a5,8(sp)
    800035c4:	e789                	bnez	a5,800035ce <xTimerCreateTimerTask+0x46>
    800035c6:	30047073          	csrci	mstatus,8
    800035ca:	0001                	nop
    800035cc:	bffd                	j	800035ca <xTimerCreateTimerTask+0x42>
    800035ce:	67a2                	ld	a5,8(sp)
    800035d0:	853e                	mv	a0,a5
    800035d2:	60e2                	ld	ra,24(sp)
    800035d4:	6105                	addi	sp,sp,32
    800035d6:	8082                	ret

00000000800035d8 <xTimerCreate>:
    800035d8:	715d                	addi	sp,sp,-80
    800035da:	e486                	sd	ra,72(sp)
    800035dc:	f42a                	sd	a0,40(sp)
    800035de:	87ae                	mv	a5,a1
    800035e0:	ec32                	sd	a2,24(sp)
    800035e2:	e836                	sd	a3,16(sp)
    800035e4:	e43a                	sd	a4,8(sp)
    800035e6:	d23e                	sw	a5,36(sp)
    800035e8:	5792                	lw	a5,36(sp)
    800035ea:	2781                	sext.w	a5,a5
    800035ec:	e399                	bnez	a5,800035f2 <xTimerCreate+0x1a>
    800035ee:	fc02                	sd	zero,56(sp)
    800035f0:	a835                	j	8000362c <xTimerCreate+0x54>
    800035f2:	05800513          	li	a0,88
    800035f6:	42f000ef          	jal	80004224 <pvPortMalloc>
    800035fa:	fc2a                	sd	a0,56(sp)
    800035fc:	77e2                	ld	a5,56(sp)
    800035fe:	c79d                	beqz	a5,8000362c <xTimerCreate+0x54>
    80003600:	566000ef          	jal	80003b66 <prvCheckForValidListAndQueue>
    80003604:	77e2                	ld	a5,56(sp)
    80003606:	7722                	ld	a4,40(sp)
    80003608:	e398                	sd	a4,0(a5)
    8000360a:	77e2                	ld	a5,56(sp)
    8000360c:	5712                	lw	a4,36(sp)
    8000360e:	db98                	sw	a4,48(a5)
    80003610:	77e2                	ld	a5,56(sp)
    80003612:	6762                	ld	a4,24(sp)
    80003614:	ff98                	sd	a4,56(a5)
    80003616:	77e2                	ld	a5,56(sp)
    80003618:	6742                	ld	a4,16(sp)
    8000361a:	e3b8                	sd	a4,64(a5)
    8000361c:	77e2                	ld	a5,56(sp)
    8000361e:	6722                	ld	a4,8(sp)
    80003620:	e7b8                	sd	a4,72(a5)
    80003622:	77e2                	ld	a5,56(sp)
    80003624:	07a1                	addi	a5,a5,8
    80003626:	853e                	mv	a0,a5
    80003628:	f61fc0ef          	jal	80000588 <vListInitialiseItem>
    8000362c:	5792                	lw	a5,36(sp)
    8000362e:	2781                	sext.w	a5,a5
    80003630:	e789                	bnez	a5,8000363a <xTimerCreate+0x62>
    80003632:	30047073          	csrci	mstatus,8
    80003636:	0001                	nop
    80003638:	bffd                	j	80003636 <xTimerCreate+0x5e>
    8000363a:	77e2                	ld	a5,56(sp)
    8000363c:	853e                	mv	a0,a5
    8000363e:	60a6                	ld	ra,72(sp)
    80003640:	6161                	addi	sp,sp,80
    80003642:	8082                	ret

0000000080003644 <xTimerGenericCommand>:
    80003644:	715d                	addi	sp,sp,-80
    80003646:	e486                	sd	ra,72(sp)
    80003648:	ec2a                	sd	a0,24(sp)
    8000364a:	e82e                	sd	a1,16(sp)
    8000364c:	87b2                	mv	a5,a2
    8000364e:	e036                	sd	a3,0(sp)
    80003650:	c63e                	sw	a5,12(sp)
    80003652:	87ba                	mv	a5,a4
    80003654:	c43e                	sw	a5,8(sp)
    80003656:	fc02                	sd	zero,56(sp)
    80003658:	67e2                	ld	a5,24(sp)
    8000365a:	e789                	bnez	a5,80003664 <xTimerGenericCommand+0x20>
    8000365c:	30047073          	csrci	mstatus,8
    80003660:	0001                	nop
    80003662:	bffd                	j	80003660 <xTimerGenericCommand+0x1c>
    80003664:	0001d797          	auipc	a5,0x1d
    80003668:	16c78793          	addi	a5,a5,364 # 800207d0 <xTimerQueue>
    8000366c:	639c                	ld	a5,0(a5)
    8000366e:	cbb5                	beqz	a5,800036e2 <xTimerGenericCommand+0x9e>
    80003670:	67c2                	ld	a5,16(sp)
    80003672:	f03e                	sd	a5,32(sp)
    80003674:	47b2                	lw	a5,12(sp)
    80003676:	d43e                	sw	a5,40(sp)
    80003678:	67e2                	ld	a5,24(sp)
    8000367a:	f83e                	sd	a5,48(sp)
    8000367c:	6742                	ld	a4,16(sp)
    8000367e:	4795                	li	a5,5
    80003680:	04e7c463          	blt	a5,a4,800036c8 <xTimerGenericCommand+0x84>
    80003684:	deaff0ef          	jal	80002c6e <xTaskGetSchedulerState>
    80003688:	872a                	mv	a4,a0
    8000368a:	4789                	li	a5,2
    8000368c:	02f71063          	bne	a4,a5,800036ac <xTimerGenericCommand+0x68>
    80003690:	0001d797          	auipc	a5,0x1d
    80003694:	14078793          	addi	a5,a5,320 # 800207d0 <xTimerQueue>
    80003698:	639c                	ld	a5,0(a5)
    8000369a:	4622                	lw	a2,8(sp)
    8000369c:	1018                	addi	a4,sp,32
    8000369e:	4681                	li	a3,0
    800036a0:	85ba                	mv	a1,a4
    800036a2:	853e                	mv	a0,a5
    800036a4:	acafd0ef          	jal	8000096e <xQueueGenericSend>
    800036a8:	fc2a                	sd	a0,56(sp)
    800036aa:	a825                	j	800036e2 <xTimerGenericCommand+0x9e>
    800036ac:	0001d797          	auipc	a5,0x1d
    800036b0:	12478793          	addi	a5,a5,292 # 800207d0 <xTimerQueue>
    800036b4:	639c                	ld	a5,0(a5)
    800036b6:	1018                	addi	a4,sp,32
    800036b8:	4681                	li	a3,0
    800036ba:	4601                	li	a2,0
    800036bc:	85ba                	mv	a1,a4
    800036be:	853e                	mv	a0,a5
    800036c0:	aaefd0ef          	jal	8000096e <xQueueGenericSend>
    800036c4:	fc2a                	sd	a0,56(sp)
    800036c6:	a831                	j	800036e2 <xTimerGenericCommand+0x9e>
    800036c8:	0001d797          	auipc	a5,0x1d
    800036cc:	10878793          	addi	a5,a5,264 # 800207d0 <xTimerQueue>
    800036d0:	639c                	ld	a5,0(a5)
    800036d2:	1018                	addi	a4,sp,32
    800036d4:	4681                	li	a3,0
    800036d6:	6602                	ld	a2,0(sp)
    800036d8:	85ba                	mv	a1,a4
    800036da:	853e                	mv	a0,a5
    800036dc:	c0afd0ef          	jal	80000ae6 <xQueueGenericSendFromISR>
    800036e0:	fc2a                	sd	a0,56(sp)
    800036e2:	77e2                	ld	a5,56(sp)
    800036e4:	853e                	mv	a0,a5
    800036e6:	60a6                	ld	ra,72(sp)
    800036e8:	6161                	addi	sp,sp,80
    800036ea:	8082                	ret

00000000800036ec <pcTimerGetTimerName>:
    800036ec:	1101                	addi	sp,sp,-32
    800036ee:	e42a                	sd	a0,8(sp)
    800036f0:	67a2                	ld	a5,8(sp)
    800036f2:	ec3e                	sd	a5,24(sp)
    800036f4:	67a2                	ld	a5,8(sp)
    800036f6:	e789                	bnez	a5,80003700 <pcTimerGetTimerName+0x14>
    800036f8:	30047073          	csrci	mstatus,8
    800036fc:	0001                	nop
    800036fe:	bffd                	j	800036fc <pcTimerGetTimerName+0x10>
    80003700:	67e2                	ld	a5,24(sp)
    80003702:	639c                	ld	a5,0(a5)
    80003704:	853e                	mv	a0,a5
    80003706:	6105                	addi	sp,sp,32
    80003708:	8082                	ret

000000008000370a <prvProcessExpiredTimer>:
    8000370a:	7179                	addi	sp,sp,-48
    8000370c:	f406                	sd	ra,40(sp)
    8000370e:	87aa                	mv	a5,a0
    80003710:	872e                	mv	a4,a1
    80003712:	c63e                	sw	a5,12(sp)
    80003714:	87ba                	mv	a5,a4
    80003716:	c43e                	sw	a5,8(sp)
    80003718:	0001d797          	auipc	a5,0x1d
    8000371c:	0a878793          	addi	a5,a5,168 # 800207c0 <pxCurrentTimerList>
    80003720:	639c                	ld	a5,0(a5)
    80003722:	6f9c                	ld	a5,24(a5)
    80003724:	6f9c                	ld	a5,24(a5)
    80003726:	ec3e                	sd	a5,24(sp)
    80003728:	67e2                	ld	a5,24(sp)
    8000372a:	07a1                	addi	a5,a5,8
    8000372c:	853e                	mv	a0,a5
    8000372e:	f1bfc0ef          	jal	80000648 <uxListRemove>
    80003732:	67e2                	ld	a5,24(sp)
    80003734:	7f98                	ld	a4,56(a5)
    80003736:	4785                	li	a5,1
    80003738:	04f71163          	bne	a4,a5,8000377a <prvProcessExpiredTimer+0x70>
    8000373c:	67e2                	ld	a5,24(sp)
    8000373e:	5b9c                	lw	a5,48(a5)
    80003740:	4732                	lw	a4,12(sp)
    80003742:	9fb9                	addw	a5,a5,a4
    80003744:	2781                	sext.w	a5,a5
    80003746:	46b2                	lw	a3,12(sp)
    80003748:	4722                	lw	a4,8(sp)
    8000374a:	863a                	mv	a2,a4
    8000374c:	85be                	mv	a1,a5
    8000374e:	6562                	ld	a0,24(sp)
    80003750:	17e000ef          	jal	800038ce <prvInsertTimerInActiveList>
    80003754:	872a                	mv	a4,a0
    80003756:	4785                	li	a5,1
    80003758:	02f71163          	bne	a4,a5,8000377a <prvProcessExpiredTimer+0x70>
    8000375c:	47b2                	lw	a5,12(sp)
    8000375e:	4701                	li	a4,0
    80003760:	4681                	li	a3,0
    80003762:	863e                	mv	a2,a5
    80003764:	4581                	li	a1,0
    80003766:	6562                	ld	a0,24(sp)
    80003768:	eddff0ef          	jal	80003644 <xTimerGenericCommand>
    8000376c:	e82a                	sd	a0,16(sp)
    8000376e:	67c2                	ld	a5,16(sp)
    80003770:	e789                	bnez	a5,8000377a <prvProcessExpiredTimer+0x70>
    80003772:	30047073          	csrci	mstatus,8
    80003776:	0001                	nop
    80003778:	bffd                	j	80003776 <prvProcessExpiredTimer+0x6c>
    8000377a:	67e2                	ld	a5,24(sp)
    8000377c:	67bc                	ld	a5,72(a5)
    8000377e:	6562                	ld	a0,24(sp)
    80003780:	9782                	jalr	a5
    80003782:	0001                	nop
    80003784:	70a2                	ld	ra,40(sp)
    80003786:	6145                	addi	sp,sp,48
    80003788:	8082                	ret

000000008000378a <prvTimerTask>:
    8000378a:	7179                	addi	sp,sp,-48
    8000378c:	f406                	sd	ra,40(sp)
    8000378e:	e42a                	sd	a0,8(sp)
    80003790:	081c                	addi	a5,sp,16
    80003792:	853e                	mv	a0,a5
    80003794:	0b2000ef          	jal	80003846 <prvGetNextExpireTime>
    80003798:	87aa                	mv	a5,a0
    8000379a:	ce3e                	sw	a5,28(sp)
    8000379c:	6742                	ld	a4,16(sp)
    8000379e:	47f2                	lw	a5,28(sp)
    800037a0:	85ba                	mv	a1,a4
    800037a2:	853e                	mv	a0,a5
    800037a4:	00c000ef          	jal	800037b0 <prvProcessTimerOrBlockTask>
    800037a8:	1cc000ef          	jal	80003974 <prvProcessReceivedCommands>
    800037ac:	0001                	nop
    800037ae:	b7cd                	j	80003790 <prvTimerTask+0x6>

00000000800037b0 <prvProcessTimerOrBlockTask>:
    800037b0:	7179                	addi	sp,sp,-48
    800037b2:	f406                	sd	ra,40(sp)
    800037b4:	87aa                	mv	a5,a0
    800037b6:	e02e                	sd	a1,0(sp)
    800037b8:	c63e                	sw	a5,12(sp)
    800037ba:	d04fe0ef          	jal	80001cbe <vTaskSuspendAll>
    800037be:	081c                	addi	a5,sp,16
    800037c0:	853e                	mv	a0,a5
    800037c2:	0c4000ef          	jal	80003886 <prvSampleTimeNow>
    800037c6:	87aa                	mv	a5,a0
    800037c8:	ce3e                	sw	a5,28(sp)
    800037ca:	67c2                	ld	a5,16(sp)
    800037cc:	e7bd                	bnez	a5,8000383a <prvProcessTimerOrBlockTask+0x8a>
    800037ce:	6782                	ld	a5,0(sp)
    800037d0:	e38d                	bnez	a5,800037f2 <prvProcessTimerOrBlockTask+0x42>
    800037d2:	47b2                	lw	a5,12(sp)
    800037d4:	873e                	mv	a4,a5
    800037d6:	47f2                	lw	a5,28(sp)
    800037d8:	2701                	sext.w	a4,a4
    800037da:	2781                	sext.w	a5,a5
    800037dc:	00e7eb63          	bltu	a5,a4,800037f2 <prvProcessTimerOrBlockTask+0x42>
    800037e0:	cfafe0ef          	jal	80001cda <xTaskResumeAll>
    800037e4:	4772                	lw	a4,28(sp)
    800037e6:	47b2                	lw	a5,12(sp)
    800037e8:	85ba                	mv	a1,a4
    800037ea:	853e                	mv	a0,a5
    800037ec:	f1fff0ef          	jal	8000370a <prvProcessExpiredTimer>
    800037f0:	a0b9                	j	8000383e <prvProcessTimerOrBlockTask+0x8e>
    800037f2:	6782                	ld	a5,0(sp)
    800037f4:	cf81                	beqz	a5,8000380c <prvProcessTimerOrBlockTask+0x5c>
    800037f6:	0001d797          	auipc	a5,0x1d
    800037fa:	fd278793          	addi	a5,a5,-46 # 800207c8 <pxOverflowTimerList>
    800037fe:	639c                	ld	a5,0(a5)
    80003800:	639c                	ld	a5,0(a5)
    80003802:	0017b793          	seqz	a5,a5
    80003806:	0ff7f793          	zext.b	a5,a5
    8000380a:	e03e                	sd	a5,0(sp)
    8000380c:	0001d797          	auipc	a5,0x1d
    80003810:	fc478793          	addi	a5,a5,-60 # 800207d0 <xTimerQueue>
    80003814:	639c                	ld	a5,0(a5)
    80003816:	4732                	lw	a4,12(sp)
    80003818:	86ba                	mv	a3,a4
    8000381a:	4772                	lw	a4,28(sp)
    8000381c:	40e6873b          	subw	a4,a3,a4
    80003820:	2701                	sext.w	a4,a4
    80003822:	6602                	ld	a2,0(sp)
    80003824:	85ba                	mv	a1,a4
    80003826:	853e                	mv	a0,a5
    80003828:	ad9fd0ef          	jal	80001300 <vQueueWaitForMessageRestricted>
    8000382c:	caefe0ef          	jal	80001cda <xTaskResumeAll>
    80003830:	87aa                	mv	a5,a0
    80003832:	e791                	bnez	a5,8000383e <prvProcessTimerOrBlockTask+0x8e>
    80003834:	b73fc0ef          	jal	800003a6 <vPortYield>
    80003838:	a019                	j	8000383e <prvProcessTimerOrBlockTask+0x8e>
    8000383a:	ca0fe0ef          	jal	80001cda <xTaskResumeAll>
    8000383e:	0001                	nop
    80003840:	70a2                	ld	ra,40(sp)
    80003842:	6145                	addi	sp,sp,48
    80003844:	8082                	ret

0000000080003846 <prvGetNextExpireTime>:
    80003846:	1101                	addi	sp,sp,-32
    80003848:	e42a                	sd	a0,8(sp)
    8000384a:	0001d797          	auipc	a5,0x1d
    8000384e:	f7678793          	addi	a5,a5,-138 # 800207c0 <pxCurrentTimerList>
    80003852:	639c                	ld	a5,0(a5)
    80003854:	639c                	ld	a5,0(a5)
    80003856:	0017b793          	seqz	a5,a5
    8000385a:	0ff7f793          	zext.b	a5,a5
    8000385e:	873e                	mv	a4,a5
    80003860:	67a2                	ld	a5,8(sp)
    80003862:	e398                	sd	a4,0(a5)
    80003864:	67a2                	ld	a5,8(sp)
    80003866:	639c                	ld	a5,0(a5)
    80003868:	eb91                	bnez	a5,8000387c <prvGetNextExpireTime+0x36>
    8000386a:	0001d797          	auipc	a5,0x1d
    8000386e:	f5678793          	addi	a5,a5,-170 # 800207c0 <pxCurrentTimerList>
    80003872:	639c                	ld	a5,0(a5)
    80003874:	6f9c                	ld	a5,24(a5)
    80003876:	439c                	lw	a5,0(a5)
    80003878:	ce3e                	sw	a5,28(sp)
    8000387a:	a011                	j	8000387e <prvGetNextExpireTime+0x38>
    8000387c:	ce02                	sw	zero,28(sp)
    8000387e:	47f2                	lw	a5,28(sp)
    80003880:	853e                	mv	a0,a5
    80003882:	6105                	addi	sp,sp,32
    80003884:	8082                	ret

0000000080003886 <prvSampleTimeNow>:
    80003886:	7179                	addi	sp,sp,-48
    80003888:	f406                	sd	ra,40(sp)
    8000388a:	e42a                	sd	a0,8(sp)
    8000388c:	da0fe0ef          	jal	80001e2c <xTaskGetTickCount>
    80003890:	87aa                	mv	a5,a0
    80003892:	ce3e                	sw	a5,28(sp)
    80003894:	0001d797          	auipc	a5,0x1d
    80003898:	f4478793          	addi	a5,a5,-188 # 800207d8 <xLastTime.0>
    8000389c:	4398                	lw	a4,0(a5)
    8000389e:	47f2                	lw	a5,28(sp)
    800038a0:	2781                	sext.w	a5,a5
    800038a2:	00e7f863          	bgeu	a5,a4,800038b2 <prvSampleTimeNow+0x2c>
    800038a6:	1e2000ef          	jal	80003a88 <prvSwitchTimerLists>
    800038aa:	67a2                	ld	a5,8(sp)
    800038ac:	4705                	li	a4,1
    800038ae:	e398                	sd	a4,0(a5)
    800038b0:	a021                	j	800038b8 <prvSampleTimeNow+0x32>
    800038b2:	67a2                	ld	a5,8(sp)
    800038b4:	0007b023          	sd	zero,0(a5)
    800038b8:	0001d797          	auipc	a5,0x1d
    800038bc:	f2078793          	addi	a5,a5,-224 # 800207d8 <xLastTime.0>
    800038c0:	4772                	lw	a4,28(sp)
    800038c2:	c398                	sw	a4,0(a5)
    800038c4:	47f2                	lw	a5,28(sp)
    800038c6:	853e                	mv	a0,a5
    800038c8:	70a2                	ld	ra,40(sp)
    800038ca:	6145                	addi	sp,sp,48
    800038cc:	8082                	ret

00000000800038ce <prvInsertTimerInActiveList>:
    800038ce:	7139                	addi	sp,sp,-64
    800038d0:	fc06                	sd	ra,56(sp)
    800038d2:	ec2a                	sd	a0,24(sp)
    800038d4:	87ae                	mv	a5,a1
    800038d6:	8736                	mv	a4,a3
    800038d8:	ca3e                	sw	a5,20(sp)
    800038da:	87b2                	mv	a5,a2
    800038dc:	c83e                	sw	a5,16(sp)
    800038de:	87ba                	mv	a5,a4
    800038e0:	c63e                	sw	a5,12(sp)
    800038e2:	f402                	sd	zero,40(sp)
    800038e4:	67e2                	ld	a5,24(sp)
    800038e6:	4752                	lw	a4,20(sp)
    800038e8:	c798                	sw	a4,8(a5)
    800038ea:	67e2                	ld	a5,24(sp)
    800038ec:	6762                	ld	a4,24(sp)
    800038ee:	f398                	sd	a4,32(a5)
    800038f0:	47d2                	lw	a5,20(sp)
    800038f2:	873e                	mv	a4,a5
    800038f4:	47c2                	lw	a5,16(sp)
    800038f6:	2701                	sext.w	a4,a4
    800038f8:	2781                	sext.w	a5,a5
    800038fa:	02e7ec63          	bltu	a5,a4,80003932 <prvInsertTimerInActiveList+0x64>
    800038fe:	47c2                	lw	a5,16(sp)
    80003900:	873e                	mv	a4,a5
    80003902:	47b2                	lw	a5,12(sp)
    80003904:	40f707bb          	subw	a5,a4,a5
    80003908:	0007871b          	sext.w	a4,a5
    8000390c:	67e2                	ld	a5,24(sp)
    8000390e:	5b9c                	lw	a5,48(a5)
    80003910:	00f76563          	bltu	a4,a5,8000391a <prvInsertTimerInActiveList+0x4c>
    80003914:	4785                	li	a5,1
    80003916:	f43e                	sd	a5,40(sp)
    80003918:	a889                	j	8000396a <prvInsertTimerInActiveList+0x9c>
    8000391a:	0001d797          	auipc	a5,0x1d
    8000391e:	eae78793          	addi	a5,a5,-338 # 800207c8 <pxOverflowTimerList>
    80003922:	6398                	ld	a4,0(a5)
    80003924:	67e2                	ld	a5,24(sp)
    80003926:	07a1                	addi	a5,a5,8
    80003928:	85be                	mv	a1,a5
    8000392a:	853a                	mv	a0,a4
    8000392c:	cadfc0ef          	jal	800005d8 <vListInsert>
    80003930:	a82d                	j	8000396a <prvInsertTimerInActiveList+0x9c>
    80003932:	47c2                	lw	a5,16(sp)
    80003934:	873e                	mv	a4,a5
    80003936:	47b2                	lw	a5,12(sp)
    80003938:	2701                	sext.w	a4,a4
    8000393a:	2781                	sext.w	a5,a5
    8000393c:	00f77c63          	bgeu	a4,a5,80003954 <prvInsertTimerInActiveList+0x86>
    80003940:	47d2                	lw	a5,20(sp)
    80003942:	873e                	mv	a4,a5
    80003944:	47b2                	lw	a5,12(sp)
    80003946:	2701                	sext.w	a4,a4
    80003948:	2781                	sext.w	a5,a5
    8000394a:	00f76563          	bltu	a4,a5,80003954 <prvInsertTimerInActiveList+0x86>
    8000394e:	4785                	li	a5,1
    80003950:	f43e                	sd	a5,40(sp)
    80003952:	a821                	j	8000396a <prvInsertTimerInActiveList+0x9c>
    80003954:	0001d797          	auipc	a5,0x1d
    80003958:	e6c78793          	addi	a5,a5,-404 # 800207c0 <pxCurrentTimerList>
    8000395c:	6398                	ld	a4,0(a5)
    8000395e:	67e2                	ld	a5,24(sp)
    80003960:	07a1                	addi	a5,a5,8
    80003962:	85be                	mv	a1,a5
    80003964:	853a                	mv	a0,a4
    80003966:	c73fc0ef          	jal	800005d8 <vListInsert>
    8000396a:	77a2                	ld	a5,40(sp)
    8000396c:	853e                	mv	a0,a5
    8000396e:	70e2                	ld	ra,56(sp)
    80003970:	6121                	addi	sp,sp,64
    80003972:	8082                	ret

0000000080003974 <prvProcessReceivedCommands>:
    80003974:	715d                	addi	sp,sp,-80
    80003976:	e486                	sd	ra,72(sp)
    80003978:	a0e5                	j	80003a60 <prvProcessReceivedCommands+0xec>
    8000397a:	67c2                	ld	a5,16(sp)
    8000397c:	0e07c263          	bltz	a5,80003a60 <prvProcessReceivedCommands+0xec>
    80003980:	7782                	ld	a5,32(sp)
    80003982:	fc3e                	sd	a5,56(sp)
    80003984:	77e2                	ld	a5,56(sp)
    80003986:	779c                	ld	a5,40(a5)
    80003988:	c791                	beqz	a5,80003994 <prvProcessReceivedCommands+0x20>
    8000398a:	77e2                	ld	a5,56(sp)
    8000398c:	07a1                	addi	a5,a5,8
    8000398e:	853e                	mv	a0,a5
    80003990:	cb9fc0ef          	jal	80000648 <uxListRemove>
    80003994:	003c                	addi	a5,sp,8
    80003996:	853e                	mv	a0,a5
    80003998:	eefff0ef          	jal	80003886 <prvSampleTimeNow>
    8000399c:	87aa                	mv	a5,a0
    8000399e:	da3e                	sw	a5,52(sp)
    800039a0:	67c2                	ld	a5,16(sp)
    800039a2:	4725                	li	a4,9
    800039a4:	0af76963          	bltu	a4,a5,80003a56 <prvProcessReceivedCommands+0xe2>
    800039a8:	00279713          	slli	a4,a5,0x2
    800039ac:	0001c797          	auipc	a5,0x1c
    800039b0:	68c78793          	addi	a5,a5,1676 # 80020038 <__rodata_start+0x38>
    800039b4:	97ba                	add	a5,a5,a4
    800039b6:	439c                	lw	a5,0(a5)
    800039b8:	0007871b          	sext.w	a4,a5
    800039bc:	0001c797          	auipc	a5,0x1c
    800039c0:	67c78793          	addi	a5,a5,1660 # 80020038 <__rodata_start+0x38>
    800039c4:	97ba                	add	a5,a5,a4
    800039c6:	8782                	jr	a5
    800039c8:	4762                	lw	a4,24(sp)
    800039ca:	77e2                	ld	a5,56(sp)
    800039cc:	5b9c                	lw	a5,48(a5)
    800039ce:	9fb9                	addw	a5,a5,a4
    800039d0:	2781                	sext.w	a5,a5
    800039d2:	46e2                	lw	a3,24(sp)
    800039d4:	5752                	lw	a4,52(sp)
    800039d6:	863a                	mv	a2,a4
    800039d8:	85be                	mv	a1,a5
    800039da:	7562                	ld	a0,56(sp)
    800039dc:	ef3ff0ef          	jal	800038ce <prvInsertTimerInActiveList>
    800039e0:	872a                	mv	a4,a0
    800039e2:	4785                	li	a5,1
    800039e4:	06f71d63          	bne	a4,a5,80003a5e <prvProcessReceivedCommands+0xea>
    800039e8:	77e2                	ld	a5,56(sp)
    800039ea:	67bc                	ld	a5,72(a5)
    800039ec:	7562                	ld	a0,56(sp)
    800039ee:	9782                	jalr	a5
    800039f0:	77e2                	ld	a5,56(sp)
    800039f2:	7f98                	ld	a4,56(a5)
    800039f4:	4785                	li	a5,1
    800039f6:	06f71463          	bne	a4,a5,80003a5e <prvProcessReceivedCommands+0xea>
    800039fa:	4762                	lw	a4,24(sp)
    800039fc:	77e2                	ld	a5,56(sp)
    800039fe:	5b9c                	lw	a5,48(a5)
    80003a00:	9fb9                	addw	a5,a5,a4
    80003a02:	2781                	sext.w	a5,a5
    80003a04:	4701                	li	a4,0
    80003a06:	4681                	li	a3,0
    80003a08:	863e                	mv	a2,a5
    80003a0a:	4581                	li	a1,0
    80003a0c:	7562                	ld	a0,56(sp)
    80003a0e:	c37ff0ef          	jal	80003644 <xTimerGenericCommand>
    80003a12:	f42a                	sd	a0,40(sp)
    80003a14:	77a2                	ld	a5,40(sp)
    80003a16:	e7a1                	bnez	a5,80003a5e <prvProcessReceivedCommands+0xea>
    80003a18:	30047073          	csrci	mstatus,8
    80003a1c:	0001                	nop
    80003a1e:	bffd                	j	80003a1c <prvProcessReceivedCommands+0xa8>
    80003a20:	4762                	lw	a4,24(sp)
    80003a22:	77e2                	ld	a5,56(sp)
    80003a24:	db98                	sw	a4,48(a5)
    80003a26:	77e2                	ld	a5,56(sp)
    80003a28:	5b9c                	lw	a5,48(a5)
    80003a2a:	e789                	bnez	a5,80003a34 <prvProcessReceivedCommands+0xc0>
    80003a2c:	30047073          	csrci	mstatus,8
    80003a30:	0001                	nop
    80003a32:	bffd                	j	80003a30 <prvProcessReceivedCommands+0xbc>
    80003a34:	77e2                	ld	a5,56(sp)
    80003a36:	5b9c                	lw	a5,48(a5)
    80003a38:	5752                	lw	a4,52(sp)
    80003a3a:	9fb9                	addw	a5,a5,a4
    80003a3c:	2781                	sext.w	a5,a5
    80003a3e:	56d2                	lw	a3,52(sp)
    80003a40:	5752                	lw	a4,52(sp)
    80003a42:	863a                	mv	a2,a4
    80003a44:	85be                	mv	a1,a5
    80003a46:	7562                	ld	a0,56(sp)
    80003a48:	e87ff0ef          	jal	800038ce <prvInsertTimerInActiveList>
    80003a4c:	a811                	j	80003a60 <prvProcessReceivedCommands+0xec>
    80003a4e:	7562                	ld	a0,56(sp)
    80003a50:	10d000ef          	jal	8000435c <vPortFree>
    80003a54:	a031                	j	80003a60 <prvProcessReceivedCommands+0xec>
    80003a56:	0001                	nop
    80003a58:	a021                	j	80003a60 <prvProcessReceivedCommands+0xec>
    80003a5a:	0001                	nop
    80003a5c:	a011                	j	80003a60 <prvProcessReceivedCommands+0xec>
    80003a5e:	0001                	nop
    80003a60:	0001d797          	auipc	a5,0x1d
    80003a64:	d7078793          	addi	a5,a5,-656 # 800207d0 <xTimerQueue>
    80003a68:	639c                	ld	a5,0(a5)
    80003a6a:	0818                	addi	a4,sp,16
    80003a6c:	4681                	li	a3,0
    80003a6e:	4601                	li	a2,0
    80003a70:	85ba                	mv	a1,a4
    80003a72:	853e                	mv	a0,a5
    80003a74:	9fafd0ef          	jal	80000c6e <xQueueGenericReceive>
    80003a78:	87aa                	mv	a5,a0
    80003a7a:	f00790e3          	bnez	a5,8000397a <prvProcessReceivedCommands+0x6>
    80003a7e:	0001                	nop
    80003a80:	0001                	nop
    80003a82:	60a6                	ld	ra,72(sp)
    80003a84:	6161                	addi	sp,sp,80
    80003a86:	8082                	ret

0000000080003a88 <prvSwitchTimerLists>:
    80003a88:	7139                	addi	sp,sp,-64
    80003a8a:	fc06                	sd	ra,56(sp)
    80003a8c:	a861                	j	80003b24 <prvSwitchTimerLists+0x9c>
    80003a8e:	0001d797          	auipc	a5,0x1d
    80003a92:	d3278793          	addi	a5,a5,-718 # 800207c0 <pxCurrentTimerList>
    80003a96:	639c                	ld	a5,0(a5)
    80003a98:	6f9c                	ld	a5,24(a5)
    80003a9a:	439c                	lw	a5,0(a5)
    80003a9c:	d23e                	sw	a5,36(sp)
    80003a9e:	0001d797          	auipc	a5,0x1d
    80003aa2:	d2278793          	addi	a5,a5,-734 # 800207c0 <pxCurrentTimerList>
    80003aa6:	639c                	ld	a5,0(a5)
    80003aa8:	6f9c                	ld	a5,24(a5)
    80003aaa:	6f9c                	ld	a5,24(a5)
    80003aac:	ec3e                	sd	a5,24(sp)
    80003aae:	67e2                	ld	a5,24(sp)
    80003ab0:	07a1                	addi	a5,a5,8
    80003ab2:	853e                	mv	a0,a5
    80003ab4:	b95fc0ef          	jal	80000648 <uxListRemove>
    80003ab8:	67e2                	ld	a5,24(sp)
    80003aba:	67bc                	ld	a5,72(a5)
    80003abc:	6562                	ld	a0,24(sp)
    80003abe:	9782                	jalr	a5
    80003ac0:	67e2                	ld	a5,24(sp)
    80003ac2:	7f98                	ld	a4,56(a5)
    80003ac4:	4785                	li	a5,1
    80003ac6:	04f71f63          	bne	a4,a5,80003b24 <prvSwitchTimerLists+0x9c>
    80003aca:	67e2                	ld	a5,24(sp)
    80003acc:	5b9c                	lw	a5,48(a5)
    80003ace:	5712                	lw	a4,36(sp)
    80003ad0:	9fb9                	addw	a5,a5,a4
    80003ad2:	ca3e                	sw	a5,20(sp)
    80003ad4:	47d2                	lw	a5,20(sp)
    80003ad6:	873e                	mv	a4,a5
    80003ad8:	5792                	lw	a5,36(sp)
    80003ada:	2701                	sext.w	a4,a4
    80003adc:	2781                	sext.w	a5,a5
    80003ade:	02e7f463          	bgeu	a5,a4,80003b06 <prvSwitchTimerLists+0x7e>
    80003ae2:	67e2                	ld	a5,24(sp)
    80003ae4:	4752                	lw	a4,20(sp)
    80003ae6:	c798                	sw	a4,8(a5)
    80003ae8:	67e2                	ld	a5,24(sp)
    80003aea:	6762                	ld	a4,24(sp)
    80003aec:	f398                	sd	a4,32(a5)
    80003aee:	0001d797          	auipc	a5,0x1d
    80003af2:	cd278793          	addi	a5,a5,-814 # 800207c0 <pxCurrentTimerList>
    80003af6:	6398                	ld	a4,0(a5)
    80003af8:	67e2                	ld	a5,24(sp)
    80003afa:	07a1                	addi	a5,a5,8
    80003afc:	85be                	mv	a1,a5
    80003afe:	853a                	mv	a0,a4
    80003b00:	ad9fc0ef          	jal	800005d8 <vListInsert>
    80003b04:	a005                	j	80003b24 <prvSwitchTimerLists+0x9c>
    80003b06:	5792                	lw	a5,36(sp)
    80003b08:	4701                	li	a4,0
    80003b0a:	4681                	li	a3,0
    80003b0c:	863e                	mv	a2,a5
    80003b0e:	4581                	li	a1,0
    80003b10:	6562                	ld	a0,24(sp)
    80003b12:	b33ff0ef          	jal	80003644 <xTimerGenericCommand>
    80003b16:	e42a                	sd	a0,8(sp)
    80003b18:	67a2                	ld	a5,8(sp)
    80003b1a:	e789                	bnez	a5,80003b24 <prvSwitchTimerLists+0x9c>
    80003b1c:	30047073          	csrci	mstatus,8
    80003b20:	0001                	nop
    80003b22:	bffd                	j	80003b20 <prvSwitchTimerLists+0x98>
    80003b24:	0001d797          	auipc	a5,0x1d
    80003b28:	c9c78793          	addi	a5,a5,-868 # 800207c0 <pxCurrentTimerList>
    80003b2c:	639c                	ld	a5,0(a5)
    80003b2e:	639c                	ld	a5,0(a5)
    80003b30:	ffb9                	bnez	a5,80003a8e <prvSwitchTimerLists+0x6>
    80003b32:	0001d797          	auipc	a5,0x1d
    80003b36:	c8e78793          	addi	a5,a5,-882 # 800207c0 <pxCurrentTimerList>
    80003b3a:	639c                	ld	a5,0(a5)
    80003b3c:	f43e                	sd	a5,40(sp)
    80003b3e:	0001d797          	auipc	a5,0x1d
    80003b42:	c8a78793          	addi	a5,a5,-886 # 800207c8 <pxOverflowTimerList>
    80003b46:	6398                	ld	a4,0(a5)
    80003b48:	0001d797          	auipc	a5,0x1d
    80003b4c:	c7878793          	addi	a5,a5,-904 # 800207c0 <pxCurrentTimerList>
    80003b50:	e398                	sd	a4,0(a5)
    80003b52:	0001d797          	auipc	a5,0x1d
    80003b56:	c7678793          	addi	a5,a5,-906 # 800207c8 <pxOverflowTimerList>
    80003b5a:	7722                	ld	a4,40(sp)
    80003b5c:	e398                	sd	a4,0(a5)
    80003b5e:	0001                	nop
    80003b60:	70e2                	ld	ra,56(sp)
    80003b62:	6121                	addi	sp,sp,64
    80003b64:	8082                	ret

0000000080003b66 <prvCheckForValidListAndQueue>:
    80003b66:	1141                	addi	sp,sp,-16
    80003b68:	e406                	sd	ra,8(sp)
    80003b6a:	ae2ff0ef          	jal	80002e4c <vTaskEnterCritical>
    80003b6e:	0001d797          	auipc	a5,0x1d
    80003b72:	c6278793          	addi	a5,a5,-926 # 800207d0 <xTimerQueue>
    80003b76:	639c                	ld	a5,0(a5)
    80003b78:	e7d1                	bnez	a5,80003c04 <prvCheckForValidListAndQueue+0x9e>
    80003b7a:	0001d517          	auipc	a0,0x1d
    80003b7e:	bf650513          	addi	a0,a0,-1034 # 80020770 <xActiveTimerList1>
    80003b82:	9d3fc0ef          	jal	80000554 <vListInitialise>
    80003b86:	0001d517          	auipc	a0,0x1d
    80003b8a:	c1250513          	addi	a0,a0,-1006 # 80020798 <xActiveTimerList2>
    80003b8e:	9c7fc0ef          	jal	80000554 <vListInitialise>
    80003b92:	0001d797          	auipc	a5,0x1d
    80003b96:	c2e78793          	addi	a5,a5,-978 # 800207c0 <pxCurrentTimerList>
    80003b9a:	0001d717          	auipc	a4,0x1d
    80003b9e:	bd670713          	addi	a4,a4,-1066 # 80020770 <xActiveTimerList1>
    80003ba2:	e398                	sd	a4,0(a5)
    80003ba4:	0001d797          	auipc	a5,0x1d
    80003ba8:	c2478793          	addi	a5,a5,-988 # 800207c8 <pxOverflowTimerList>
    80003bac:	0001d717          	auipc	a4,0x1d
    80003bb0:	bec70713          	addi	a4,a4,-1044 # 80020798 <xActiveTimerList2>
    80003bb4:	e398                	sd	a4,0(a5)
    80003bb6:	4601                	li	a2,0
    80003bb8:	45e1                	li	a1,24
    80003bba:	4509                	li	a0,2
    80003bbc:	b89fc0ef          	jal	80000744 <xQueueGenericCreate>
    80003bc0:	872a                	mv	a4,a0
    80003bc2:	0001d797          	auipc	a5,0x1d
    80003bc6:	c0e78793          	addi	a5,a5,-1010 # 800207d0 <xTimerQueue>
    80003bca:	e398                	sd	a4,0(a5)
    80003bcc:	0001d797          	auipc	a5,0x1d
    80003bd0:	c0478793          	addi	a5,a5,-1020 # 800207d0 <xTimerQueue>
    80003bd4:	639c                	ld	a5,0(a5)
    80003bd6:	e789                	bnez	a5,80003be0 <prvCheckForValidListAndQueue+0x7a>
    80003bd8:	30047073          	csrci	mstatus,8
    80003bdc:	0001                	nop
    80003bde:	bffd                	j	80003bdc <prvCheckForValidListAndQueue+0x76>
    80003be0:	0001d797          	auipc	a5,0x1d
    80003be4:	bf078793          	addi	a5,a5,-1040 # 800207d0 <xTimerQueue>
    80003be8:	639c                	ld	a5,0(a5)
    80003bea:	cf89                	beqz	a5,80003c04 <prvCheckForValidListAndQueue+0x9e>
    80003bec:	0001d797          	auipc	a5,0x1d
    80003bf0:	be478793          	addi	a5,a5,-1052 # 800207d0 <xTimerQueue>
    80003bf4:	639c                	ld	a5,0(a5)
    80003bf6:	0001c597          	auipc	a1,0x1c
    80003bfa:	46a58593          	addi	a1,a1,1130 # 80020060 <__rodata_start+0x60>
    80003bfe:	853e                	mv	a0,a5
    80003c00:	e60fd0ef          	jal	80001260 <vQueueAddToRegistry>
    80003c04:	a76ff0ef          	jal	80002e7a <vTaskExitCritical>
    80003c08:	0001                	nop
    80003c0a:	60a2                	ld	ra,8(sp)
    80003c0c:	0141                	addi	sp,sp,16
    80003c0e:	8082                	ret

0000000080003c10 <xTimerIsTimerActive>:
    80003c10:	7179                	addi	sp,sp,-48
    80003c12:	f406                	sd	ra,40(sp)
    80003c14:	e42a                	sd	a0,8(sp)
    80003c16:	67a2                	ld	a5,8(sp)
    80003c18:	ec3e                	sd	a5,24(sp)
    80003c1a:	67a2                	ld	a5,8(sp)
    80003c1c:	e789                	bnez	a5,80003c26 <xTimerIsTimerActive+0x16>
    80003c1e:	30047073          	csrci	mstatus,8
    80003c22:	0001                	nop
    80003c24:	bffd                	j	80003c22 <xTimerIsTimerActive+0x12>
    80003c26:	a26ff0ef          	jal	80002e4c <vTaskEnterCritical>
    80003c2a:	67e2                	ld	a5,24(sp)
    80003c2c:	779c                	ld	a5,40(a5)
    80003c2e:	00f037b3          	snez	a5,a5
    80003c32:	0ff7f793          	zext.b	a5,a5
    80003c36:	e83e                	sd	a5,16(sp)
    80003c38:	a42ff0ef          	jal	80002e7a <vTaskExitCritical>
    80003c3c:	67c2                	ld	a5,16(sp)
    80003c3e:	853e                	mv	a0,a5
    80003c40:	70a2                	ld	ra,40(sp)
    80003c42:	6145                	addi	sp,sp,48
    80003c44:	8082                	ret

0000000080003c46 <pvTimerGetTimerID>:
    80003c46:	7179                	addi	sp,sp,-48
    80003c48:	f406                	sd	ra,40(sp)
    80003c4a:	e42a                	sd	a0,8(sp)
    80003c4c:	67a2                	ld	a5,8(sp)
    80003c4e:	ec3e                	sd	a5,24(sp)
    80003c50:	67a2                	ld	a5,8(sp)
    80003c52:	e789                	bnez	a5,80003c5c <pvTimerGetTimerID+0x16>
    80003c54:	30047073          	csrci	mstatus,8
    80003c58:	0001                	nop
    80003c5a:	bffd                	j	80003c58 <pvTimerGetTimerID+0x12>
    80003c5c:	9f0ff0ef          	jal	80002e4c <vTaskEnterCritical>
    80003c60:	67e2                	ld	a5,24(sp)
    80003c62:	63bc                	ld	a5,64(a5)
    80003c64:	e83e                	sd	a5,16(sp)
    80003c66:	a14ff0ef          	jal	80002e7a <vTaskExitCritical>
    80003c6a:	67c2                	ld	a5,16(sp)
    80003c6c:	853e                	mv	a0,a5
    80003c6e:	70a2                	ld	ra,40(sp)
    80003c70:	6145                	addi	sp,sp,48
    80003c72:	8082                	ret

0000000080003c74 <vTimerSetTimerID>:
    80003c74:	7179                	addi	sp,sp,-48
    80003c76:	f406                	sd	ra,40(sp)
    80003c78:	e42a                	sd	a0,8(sp)
    80003c7a:	e02e                	sd	a1,0(sp)
    80003c7c:	67a2                	ld	a5,8(sp)
    80003c7e:	ec3e                	sd	a5,24(sp)
    80003c80:	67a2                	ld	a5,8(sp)
    80003c82:	e789                	bnez	a5,80003c8c <vTimerSetTimerID+0x18>
    80003c84:	30047073          	csrci	mstatus,8
    80003c88:	0001                	nop
    80003c8a:	bffd                	j	80003c88 <vTimerSetTimerID+0x14>
    80003c8c:	9c0ff0ef          	jal	80002e4c <vTaskEnterCritical>
    80003c90:	67e2                	ld	a5,24(sp)
    80003c92:	6702                	ld	a4,0(sp)
    80003c94:	e3b8                	sd	a4,64(a5)
    80003c96:	9e4ff0ef          	jal	80002e7a <vTaskExitCritical>
    80003c9a:	0001                	nop
    80003c9c:	70a2                	ld	ra,40(sp)
    80003c9e:	6145                	addi	sp,sp,48
    80003ca0:	8082                	ret

0000000080003ca2 <xEventGroupCreate>:
    80003ca2:	1101                	addi	sp,sp,-32
    80003ca4:	ec06                	sd	ra,24(sp)
    80003ca6:	03800513          	li	a0,56
    80003caa:	57a000ef          	jal	80004224 <pvPortMalloc>
    80003cae:	e42a                	sd	a0,8(sp)
    80003cb0:	67a2                	ld	a5,8(sp)
    80003cb2:	cb89                	beqz	a5,80003cc4 <xEventGroupCreate+0x22>
    80003cb4:	67a2                	ld	a5,8(sp)
    80003cb6:	0007a023          	sw	zero,0(a5)
    80003cba:	67a2                	ld	a5,8(sp)
    80003cbc:	07a1                	addi	a5,a5,8
    80003cbe:	853e                	mv	a0,a5
    80003cc0:	895fc0ef          	jal	80000554 <vListInitialise>
    80003cc4:	67a2                	ld	a5,8(sp)
    80003cc6:	853e                	mv	a0,a5
    80003cc8:	60e2                	ld	ra,24(sp)
    80003cca:	6105                	addi	sp,sp,32
    80003ccc:	8082                	ret

0000000080003cce <xEventGroupSync>:
    80003cce:	711d                	addi	sp,sp,-96
    80003cd0:	ec86                	sd	ra,88(sp)
    80003cd2:	ec2a                	sd	a0,24(sp)
    80003cd4:	87ae                	mv	a5,a1
    80003cd6:	8736                	mv	a4,a3
    80003cd8:	ca3e                	sw	a5,20(sp)
    80003cda:	87b2                	mv	a5,a2
    80003cdc:	c83e                	sw	a5,16(sp)
    80003cde:	87ba                	mv	a5,a4
    80003ce0:	c63e                	sw	a5,12(sp)
    80003ce2:	67e2                	ld	a5,24(sp)
    80003ce4:	e0be                	sd	a5,64(sp)
    80003ce6:	fc02                	sd	zero,56(sp)
    80003ce8:	01016703          	lwu	a4,16(sp)
    80003cec:	0ff00793          	li	a5,255
    80003cf0:	07e2                	slli	a5,a5,0x18
    80003cf2:	8ff9                	and	a5,a5,a4
    80003cf4:	c789                	beqz	a5,80003cfe <xEventGroupSync+0x30>
    80003cf6:	30047073          	csrci	mstatus,8
    80003cfa:	0001                	nop
    80003cfc:	bffd                	j	80003cfa <xEventGroupSync+0x2c>
    80003cfe:	47c2                	lw	a5,16(sp)
    80003d00:	2781                	sext.w	a5,a5
    80003d02:	e789                	bnez	a5,80003d0c <xEventGroupSync+0x3e>
    80003d04:	30047073          	csrci	mstatus,8
    80003d08:	0001                	nop
    80003d0a:	bffd                	j	80003d08 <xEventGroupSync+0x3a>
    80003d0c:	f63fe0ef          	jal	80002c6e <xTaskGetSchedulerState>
    80003d10:	87aa                	mv	a5,a0
    80003d12:	e781                	bnez	a5,80003d1a <xEventGroupSync+0x4c>
    80003d14:	47b2                	lw	a5,12(sp)
    80003d16:	2781                	sext.w	a5,a5
    80003d18:	e399                	bnez	a5,80003d1e <xEventGroupSync+0x50>
    80003d1a:	4785                	li	a5,1
    80003d1c:	a011                	j	80003d20 <xEventGroupSync+0x52>
    80003d1e:	4781                	li	a5,0
    80003d20:	e789                	bnez	a5,80003d2a <xEventGroupSync+0x5c>
    80003d22:	30047073          	csrci	mstatus,8
    80003d26:	0001                	nop
    80003d28:	bffd                	j	80003d26 <xEventGroupSync+0x58>
    80003d2a:	f95fd0ef          	jal	80001cbe <vTaskSuspendAll>
    80003d2e:	6786                	ld	a5,64(sp)
    80003d30:	439c                	lw	a5,0(a5)
    80003d32:	da3e                	sw	a5,52(sp)
    80003d34:	47d2                	lw	a5,20(sp)
    80003d36:	85be                	mv	a1,a5
    80003d38:	6562                	ld	a0,24(sp)
    80003d3a:	2e2000ef          	jal	8000401c <xEventGroupSetBits>
    80003d3e:	57d2                	lw	a5,52(sp)
    80003d40:	873e                	mv	a4,a5
    80003d42:	47d2                	lw	a5,20(sp)
    80003d44:	8fd9                	or	a5,a5,a4
    80003d46:	2781                	sext.w	a5,a5
    80003d48:	4742                	lw	a4,16(sp)
    80003d4a:	8ff9                	and	a5,a5,a4
    80003d4c:	0007871b          	sext.w	a4,a5
    80003d50:	47c2                	lw	a5,16(sp)
    80003d52:	2781                	sext.w	a5,a5
    80003d54:	02e79463          	bne	a5,a4,80003d7c <xEventGroupSync+0xae>
    80003d58:	57d2                	lw	a5,52(sp)
    80003d5a:	873e                	mv	a4,a5
    80003d5c:	47d2                	lw	a5,20(sp)
    80003d5e:	8fd9                	or	a5,a5,a4
    80003d60:	c6be                	sw	a5,76(sp)
    80003d62:	6786                	ld	a5,64(sp)
    80003d64:	4398                	lw	a4,0(a5)
    80003d66:	47c2                	lw	a5,16(sp)
    80003d68:	fff7c793          	not	a5,a5
    80003d6c:	2781                	sext.w	a5,a5
    80003d6e:	8ff9                	and	a5,a5,a4
    80003d70:	0007871b          	sext.w	a4,a5
    80003d74:	6786                	ld	a5,64(sp)
    80003d76:	c398                	sw	a4,0(a5)
    80003d78:	c602                	sw	zero,12(sp)
    80003d7a:	a805                	j	80003daa <xEventGroupSync+0xdc>
    80003d7c:	47b2                	lw	a5,12(sp)
    80003d7e:	2781                	sext.w	a5,a5
    80003d80:	c395                	beqz	a5,80003da4 <xEventGroupSync+0xd6>
    80003d82:	6786                	ld	a5,64(sp)
    80003d84:	00878713          	addi	a4,a5,8
    80003d88:	47c2                	lw	a5,16(sp)
    80003d8a:	86be                	mv	a3,a5
    80003d8c:	050007b7          	lui	a5,0x5000
    80003d90:	8fd5                	or	a5,a5,a3
    80003d92:	2781                	sext.w	a5,a5
    80003d94:	46b2                	lw	a3,12(sp)
    80003d96:	8636                	mv	a2,a3
    80003d98:	85be                	mv	a1,a5
    80003d9a:	853a                	mv	a0,a4
    80003d9c:	db8fe0ef          	jal	80002354 <vTaskPlaceOnUnorderedEventList>
    80003da0:	c682                	sw	zero,76(sp)
    80003da2:	a021                	j	80003daa <xEventGroupSync+0xdc>
    80003da4:	6786                	ld	a5,64(sp)
    80003da6:	439c                	lw	a5,0(a5)
    80003da8:	c6be                	sw	a5,76(sp)
    80003daa:	f31fd0ef          	jal	80001cda <xTaskResumeAll>
    80003dae:	f42a                	sd	a0,40(sp)
    80003db0:	47b2                	lw	a5,12(sp)
    80003db2:	2781                	sext.w	a5,a5
    80003db4:	c7a5                	beqz	a5,80003e1c <xEventGroupSync+0x14e>
    80003db6:	77a2                	ld	a5,40(sp)
    80003db8:	e399                	bnez	a5,80003dbe <xEventGroupSync+0xf0>
    80003dba:	decfc0ef          	jal	800003a6 <vPortYield>
    80003dbe:	8fcff0ef          	jal	80002eba <uxTaskResetEventItemValue>
    80003dc2:	87aa                	mv	a5,a0
    80003dc4:	c6be                	sw	a5,76(sp)
    80003dc6:	04c16703          	lwu	a4,76(sp)
    80003dca:	020007b7          	lui	a5,0x2000
    80003dce:	8ff9                	and	a5,a5,a4
    80003dd0:	ef9d                	bnez	a5,80003e0e <xEventGroupSync+0x140>
    80003dd2:	87aff0ef          	jal	80002e4c <vTaskEnterCritical>
    80003dd6:	6786                	ld	a5,64(sp)
    80003dd8:	439c                	lw	a5,0(a5)
    80003dda:	c6be                	sw	a5,76(sp)
    80003ddc:	47b6                	lw	a5,76(sp)
    80003dde:	873e                	mv	a4,a5
    80003de0:	47c2                	lw	a5,16(sp)
    80003de2:	8ff9                	and	a5,a5,a4
    80003de4:	0007871b          	sext.w	a4,a5
    80003de8:	47c2                	lw	a5,16(sp)
    80003dea:	2781                	sext.w	a5,a5
    80003dec:	00e79d63          	bne	a5,a4,80003e06 <xEventGroupSync+0x138>
    80003df0:	6786                	ld	a5,64(sp)
    80003df2:	4398                	lw	a4,0(a5)
    80003df4:	47c2                	lw	a5,16(sp)
    80003df6:	fff7c793          	not	a5,a5
    80003dfa:	2781                	sext.w	a5,a5
    80003dfc:	8ff9                	and	a5,a5,a4
    80003dfe:	0007871b          	sext.w	a4,a5
    80003e02:	6786                	ld	a5,64(sp)
    80003e04:	c398                	sw	a4,0(a5)
    80003e06:	874ff0ef          	jal	80002e7a <vTaskExitCritical>
    80003e0a:	4785                	li	a5,1
    80003e0c:	fc3e                	sd	a5,56(sp)
    80003e0e:	47b6                	lw	a5,76(sp)
    80003e10:	873e                	mv	a4,a5
    80003e12:	010007b7          	lui	a5,0x1000
    80003e16:	17fd                	addi	a5,a5,-1 # ffffff <_HEAP_SIZE+0xffefff>
    80003e18:	8ff9                	and	a5,a5,a4
    80003e1a:	c6be                	sw	a5,76(sp)
    80003e1c:	47b6                	lw	a5,76(sp)
    80003e1e:	853e                	mv	a0,a5
    80003e20:	60e6                	ld	ra,88(sp)
    80003e22:	6125                	addi	sp,sp,96
    80003e24:	8082                	ret

0000000080003e26 <xEventGroupWaitBits>:
    80003e26:	711d                	addi	sp,sp,-96
    80003e28:	ec86                	sd	ra,88(sp)
    80003e2a:	ec2a                	sd	a0,24(sp)
    80003e2c:	87ae                	mv	a5,a1
    80003e2e:	e432                	sd	a2,8(sp)
    80003e30:	e036                	sd	a3,0(sp)
    80003e32:	ca3e                	sw	a5,20(sp)
    80003e34:	87ba                	mv	a5,a4
    80003e36:	c83e                	sw	a5,16(sp)
    80003e38:	67e2                	ld	a5,24(sp)
    80003e3a:	e0be                	sd	a5,64(sp)
    80003e3c:	c482                	sw	zero,72(sp)
    80003e3e:	fc02                	sd	zero,56(sp)
    80003e40:	67e2                	ld	a5,24(sp)
    80003e42:	e789                	bnez	a5,80003e4c <xEventGroupWaitBits+0x26>
    80003e44:	30047073          	csrci	mstatus,8
    80003e48:	0001                	nop
    80003e4a:	bffd                	j	80003e48 <xEventGroupWaitBits+0x22>
    80003e4c:	01416703          	lwu	a4,20(sp)
    80003e50:	0ff00793          	li	a5,255
    80003e54:	07e2                	slli	a5,a5,0x18
    80003e56:	8ff9                	and	a5,a5,a4
    80003e58:	c789                	beqz	a5,80003e62 <xEventGroupWaitBits+0x3c>
    80003e5a:	30047073          	csrci	mstatus,8
    80003e5e:	0001                	nop
    80003e60:	bffd                	j	80003e5e <xEventGroupWaitBits+0x38>
    80003e62:	47d2                	lw	a5,20(sp)
    80003e64:	2781                	sext.w	a5,a5
    80003e66:	e789                	bnez	a5,80003e70 <xEventGroupWaitBits+0x4a>
    80003e68:	30047073          	csrci	mstatus,8
    80003e6c:	0001                	nop
    80003e6e:	bffd                	j	80003e6c <xEventGroupWaitBits+0x46>
    80003e70:	dfffe0ef          	jal	80002c6e <xTaskGetSchedulerState>
    80003e74:	87aa                	mv	a5,a0
    80003e76:	e781                	bnez	a5,80003e7e <xEventGroupWaitBits+0x58>
    80003e78:	47c2                	lw	a5,16(sp)
    80003e7a:	2781                	sext.w	a5,a5
    80003e7c:	e399                	bnez	a5,80003e82 <xEventGroupWaitBits+0x5c>
    80003e7e:	4785                	li	a5,1
    80003e80:	a011                	j	80003e84 <xEventGroupWaitBits+0x5e>
    80003e82:	4781                	li	a5,0
    80003e84:	e789                	bnez	a5,80003e8e <xEventGroupWaitBits+0x68>
    80003e86:	30047073          	csrci	mstatus,8
    80003e8a:	0001                	nop
    80003e8c:	bffd                	j	80003e8a <xEventGroupWaitBits+0x64>
    80003e8e:	e31fd0ef          	jal	80001cbe <vTaskSuspendAll>
    80003e92:	6786                	ld	a5,64(sp)
    80003e94:	439c                	lw	a5,0(a5)
    80003e96:	da3e                	sw	a5,52(sp)
    80003e98:	4752                	lw	a4,20(sp)
    80003e9a:	57d2                	lw	a5,52(sp)
    80003e9c:	6602                	ld	a2,0(sp)
    80003e9e:	85ba                	mv	a1,a4
    80003ea0:	853e                	mv	a0,a5
    80003ea2:	31e000ef          	jal	800041c0 <prvTestWaitCondition>
    80003ea6:	f42a                	sd	a0,40(sp)
    80003ea8:	77a2                	ld	a5,40(sp)
    80003eaa:	c395                	beqz	a5,80003ece <xEventGroupWaitBits+0xa8>
    80003eac:	57d2                	lw	a5,52(sp)
    80003eae:	c6be                	sw	a5,76(sp)
    80003eb0:	c802                	sw	zero,16(sp)
    80003eb2:	67a2                	ld	a5,8(sp)
    80003eb4:	c3ad                	beqz	a5,80003f16 <xEventGroupWaitBits+0xf0>
    80003eb6:	6786                	ld	a5,64(sp)
    80003eb8:	4398                	lw	a4,0(a5)
    80003eba:	47d2                	lw	a5,20(sp)
    80003ebc:	fff7c793          	not	a5,a5
    80003ec0:	2781                	sext.w	a5,a5
    80003ec2:	8ff9                	and	a5,a5,a4
    80003ec4:	0007871b          	sext.w	a4,a5
    80003ec8:	6786                	ld	a5,64(sp)
    80003eca:	c398                	sw	a4,0(a5)
    80003ecc:	a0a9                	j	80003f16 <xEventGroupWaitBits+0xf0>
    80003ece:	47c2                	lw	a5,16(sp)
    80003ed0:	2781                	sext.w	a5,a5
    80003ed2:	e781                	bnez	a5,80003eda <xEventGroupWaitBits+0xb4>
    80003ed4:	57d2                	lw	a5,52(sp)
    80003ed6:	c6be                	sw	a5,76(sp)
    80003ed8:	a83d                	j	80003f16 <xEventGroupWaitBits+0xf0>
    80003eda:	67a2                	ld	a5,8(sp)
    80003edc:	c799                	beqz	a5,80003eea <xEventGroupWaitBits+0xc4>
    80003ede:	47a6                	lw	a5,72(sp)
    80003ee0:	873e                	mv	a4,a5
    80003ee2:	010007b7          	lui	a5,0x1000
    80003ee6:	8fd9                	or	a5,a5,a4
    80003ee8:	c4be                	sw	a5,72(sp)
    80003eea:	6782                	ld	a5,0(sp)
    80003eec:	c799                	beqz	a5,80003efa <xEventGroupWaitBits+0xd4>
    80003eee:	47a6                	lw	a5,72(sp)
    80003ef0:	873e                	mv	a4,a5
    80003ef2:	040007b7          	lui	a5,0x4000
    80003ef6:	8fd9                	or	a5,a5,a4
    80003ef8:	c4be                	sw	a5,72(sp)
    80003efa:	6786                	ld	a5,64(sp)
    80003efc:	07a1                	addi	a5,a5,8 # 4000008 <_HEAP_SIZE+0x3fff008>
    80003efe:	4752                	lw	a4,20(sp)
    80003f00:	86ba                	mv	a3,a4
    80003f02:	4726                	lw	a4,72(sp)
    80003f04:	8f55                	or	a4,a4,a3
    80003f06:	2701                	sext.w	a4,a4
    80003f08:	46c2                	lw	a3,16(sp)
    80003f0a:	8636                	mv	a2,a3
    80003f0c:	85ba                	mv	a1,a4
    80003f0e:	853e                	mv	a0,a5
    80003f10:	c44fe0ef          	jal	80002354 <vTaskPlaceOnUnorderedEventList>
    80003f14:	c682                	sw	zero,76(sp)
    80003f16:	dc5fd0ef          	jal	80001cda <xTaskResumeAll>
    80003f1a:	f02a                	sd	a0,32(sp)
    80003f1c:	47c2                	lw	a5,16(sp)
    80003f1e:	2781                	sext.w	a5,a5
    80003f20:	c7a5                	beqz	a5,80003f88 <xEventGroupWaitBits+0x162>
    80003f22:	7782                	ld	a5,32(sp)
    80003f24:	e399                	bnez	a5,80003f2a <xEventGroupWaitBits+0x104>
    80003f26:	c80fc0ef          	jal	800003a6 <vPortYield>
    80003f2a:	f91fe0ef          	jal	80002eba <uxTaskResetEventItemValue>
    80003f2e:	87aa                	mv	a5,a0
    80003f30:	c6be                	sw	a5,76(sp)
    80003f32:	04c16703          	lwu	a4,76(sp)
    80003f36:	020007b7          	lui	a5,0x2000
    80003f3a:	8ff9                	and	a5,a5,a4
    80003f3c:	ef9d                	bnez	a5,80003f7a <xEventGroupWaitBits+0x154>
    80003f3e:	f0ffe0ef          	jal	80002e4c <vTaskEnterCritical>
    80003f42:	6786                	ld	a5,64(sp)
    80003f44:	439c                	lw	a5,0(a5)
    80003f46:	c6be                	sw	a5,76(sp)
    80003f48:	4752                	lw	a4,20(sp)
    80003f4a:	47b6                	lw	a5,76(sp)
    80003f4c:	6602                	ld	a2,0(sp)
    80003f4e:	85ba                	mv	a1,a4
    80003f50:	853e                	mv	a0,a5
    80003f52:	26e000ef          	jal	800041c0 <prvTestWaitCondition>
    80003f56:	87aa                	mv	a5,a0
    80003f58:	cf91                	beqz	a5,80003f74 <xEventGroupWaitBits+0x14e>
    80003f5a:	67a2                	ld	a5,8(sp)
    80003f5c:	cf81                	beqz	a5,80003f74 <xEventGroupWaitBits+0x14e>
    80003f5e:	6786                	ld	a5,64(sp)
    80003f60:	4398                	lw	a4,0(a5)
    80003f62:	47d2                	lw	a5,20(sp)
    80003f64:	fff7c793          	not	a5,a5
    80003f68:	2781                	sext.w	a5,a5
    80003f6a:	8ff9                	and	a5,a5,a4
    80003f6c:	0007871b          	sext.w	a4,a5
    80003f70:	6786                	ld	a5,64(sp)
    80003f72:	c398                	sw	a4,0(a5)
    80003f74:	f07fe0ef          	jal	80002e7a <vTaskExitCritical>
    80003f78:	fc02                	sd	zero,56(sp)
    80003f7a:	47b6                	lw	a5,76(sp)
    80003f7c:	873e                	mv	a4,a5
    80003f7e:	010007b7          	lui	a5,0x1000
    80003f82:	17fd                	addi	a5,a5,-1 # ffffff <_HEAP_SIZE+0xffefff>
    80003f84:	8ff9                	and	a5,a5,a4
    80003f86:	c6be                	sw	a5,76(sp)
    80003f88:	47b6                	lw	a5,76(sp)
    80003f8a:	853e                	mv	a0,a5
    80003f8c:	60e6                	ld	ra,88(sp)
    80003f8e:	6125                	addi	sp,sp,96
    80003f90:	8082                	ret

0000000080003f92 <xEventGroupClearBits>:
    80003f92:	7179                	addi	sp,sp,-48
    80003f94:	f406                	sd	ra,40(sp)
    80003f96:	e42a                	sd	a0,8(sp)
    80003f98:	87ae                	mv	a5,a1
    80003f9a:	c23e                	sw	a5,4(sp)
    80003f9c:	67a2                	ld	a5,8(sp)
    80003f9e:	ec3e                	sd	a5,24(sp)
    80003fa0:	67a2                	ld	a5,8(sp)
    80003fa2:	e789                	bnez	a5,80003fac <xEventGroupClearBits+0x1a>
    80003fa4:	30047073          	csrci	mstatus,8
    80003fa8:	0001                	nop
    80003faa:	bffd                	j	80003fa8 <xEventGroupClearBits+0x16>
    80003fac:	00416703          	lwu	a4,4(sp)
    80003fb0:	0ff00793          	li	a5,255
    80003fb4:	07e2                	slli	a5,a5,0x18
    80003fb6:	8ff9                	and	a5,a5,a4
    80003fb8:	c789                	beqz	a5,80003fc2 <xEventGroupClearBits+0x30>
    80003fba:	30047073          	csrci	mstatus,8
    80003fbe:	0001                	nop
    80003fc0:	bffd                	j	80003fbe <xEventGroupClearBits+0x2c>
    80003fc2:	e8bfe0ef          	jal	80002e4c <vTaskEnterCritical>
    80003fc6:	67e2                	ld	a5,24(sp)
    80003fc8:	439c                	lw	a5,0(a5)
    80003fca:	ca3e                	sw	a5,20(sp)
    80003fcc:	67e2                	ld	a5,24(sp)
    80003fce:	4398                	lw	a4,0(a5)
    80003fd0:	4792                	lw	a5,4(sp)
    80003fd2:	fff7c793          	not	a5,a5
    80003fd6:	2781                	sext.w	a5,a5
    80003fd8:	8ff9                	and	a5,a5,a4
    80003fda:	0007871b          	sext.w	a4,a5
    80003fde:	67e2                	ld	a5,24(sp)
    80003fe0:	c398                	sw	a4,0(a5)
    80003fe2:	e99fe0ef          	jal	80002e7a <vTaskExitCritical>
    80003fe6:	47d2                	lw	a5,20(sp)
    80003fe8:	853e                	mv	a0,a5
    80003fea:	70a2                	ld	ra,40(sp)
    80003fec:	6145                	addi	sp,sp,48
    80003fee:	8082                	ret

0000000080003ff0 <xEventGroupGetBitsFromISR>:
    80003ff0:	7139                	addi	sp,sp,-64
    80003ff2:	fc06                	sd	ra,56(sp)
    80003ff4:	e42a                	sd	a0,8(sp)
    80003ff6:	67a2                	ld	a5,8(sp)
    80003ff8:	f43e                	sd	a5,40(sp)
    80003ffa:	cdefc0ef          	jal	800004d8 <vPortSetInterruptMask>
    80003ffe:	87aa                	mv	a5,a0
    80004000:	f03e                	sd	a5,32(sp)
    80004002:	77a2                	ld	a5,40(sp)
    80004004:	439c                	lw	a5,0(a5)
    80004006:	ce3e                	sw	a5,28(sp)
    80004008:	7782                	ld	a5,32(sp)
    8000400a:	2781                	sext.w	a5,a5
    8000400c:	853e                	mv	a0,a5
    8000400e:	cb8fc0ef          	jal	800004c6 <vPortClearInterruptMask>
    80004012:	47f2                	lw	a5,28(sp)
    80004014:	853e                	mv	a0,a5
    80004016:	70e2                	ld	ra,56(sp)
    80004018:	6121                	addi	sp,sp,64
    8000401a:	8082                	ret

000000008000401c <xEventGroupSetBits>:
    8000401c:	711d                	addi	sp,sp,-96
    8000401e:	ec86                	sd	ra,88(sp)
    80004020:	e42a                	sd	a0,8(sp)
    80004022:	87ae                	mv	a5,a1
    80004024:	c23e                	sw	a5,4(sp)
    80004026:	c282                	sw	zero,68(sp)
    80004028:	67a2                	ld	a5,8(sp)
    8000402a:	f83e                	sd	a5,48(sp)
    8000402c:	fc02                	sd	zero,56(sp)
    8000402e:	67a2                	ld	a5,8(sp)
    80004030:	e789                	bnez	a5,8000403a <xEventGroupSetBits+0x1e>
    80004032:	30047073          	csrci	mstatus,8
    80004036:	0001                	nop
    80004038:	bffd                	j	80004036 <xEventGroupSetBits+0x1a>
    8000403a:	00416703          	lwu	a4,4(sp)
    8000403e:	0ff00793          	li	a5,255
    80004042:	07e2                	slli	a5,a5,0x18
    80004044:	8ff9                	and	a5,a5,a4
    80004046:	c789                	beqz	a5,80004050 <xEventGroupSetBits+0x34>
    80004048:	30047073          	csrci	mstatus,8
    8000404c:	0001                	nop
    8000404e:	bffd                	j	8000404c <xEventGroupSetBits+0x30>
    80004050:	77c2                	ld	a5,48(sp)
    80004052:	07a1                	addi	a5,a5,8
    80004054:	f43e                	sd	a5,40(sp)
    80004056:	77a2                	ld	a5,40(sp)
    80004058:	07c1                	addi	a5,a5,16
    8000405a:	f03e                	sd	a5,32(sp)
    8000405c:	c63fd0ef          	jal	80001cbe <vTaskSuspendAll>
    80004060:	77a2                	ld	a5,40(sp)
    80004062:	6f9c                	ld	a5,24(a5)
    80004064:	e4be                	sd	a5,72(sp)
    80004066:	77c2                	ld	a5,48(sp)
    80004068:	439c                	lw	a5,0(a5)
    8000406a:	4712                	lw	a4,4(sp)
    8000406c:	8fd9                	or	a5,a5,a4
    8000406e:	0007871b          	sext.w	a4,a5
    80004072:	77c2                	ld	a5,48(sp)
    80004074:	c398                	sw	a4,0(a5)
    80004076:	a851                	j	8000410a <xEventGroupSetBits+0xee>
    80004078:	67a6                	ld	a5,72(sp)
    8000407a:	679c                	ld	a5,8(a5)
    8000407c:	ec3e                	sd	a5,24(sp)
    8000407e:	67a6                	ld	a5,72(sp)
    80004080:	439c                	lw	a5,0(a5)
    80004082:	ca3e                	sw	a5,20(sp)
    80004084:	fc02                	sd	zero,56(sp)
    80004086:	47d2                	lw	a5,20(sp)
    80004088:	873e                	mv	a4,a5
    8000408a:	ff0007b7          	lui	a5,0xff000
    8000408e:	8ff9                	and	a5,a5,a4
    80004090:	c83e                	sw	a5,16(sp)
    80004092:	47d2                	lw	a5,20(sp)
    80004094:	873e                	mv	a4,a5
    80004096:	010007b7          	lui	a5,0x1000
    8000409a:	17fd                	addi	a5,a5,-1 # ffffff <_HEAP_SIZE+0xffefff>
    8000409c:	8ff9                	and	a5,a5,a4
    8000409e:	ca3e                	sw	a5,20(sp)
    800040a0:	01016703          	lwu	a4,16(sp)
    800040a4:	040007b7          	lui	a5,0x4000
    800040a8:	8ff9                	and	a5,a5,a4
    800040aa:	eb91                	bnez	a5,800040be <xEventGroupSetBits+0xa2>
    800040ac:	77c2                	ld	a5,48(sp)
    800040ae:	439c                	lw	a5,0(a5)
    800040b0:	4752                	lw	a4,20(sp)
    800040b2:	8ff9                	and	a5,a5,a4
    800040b4:	2781                	sext.w	a5,a5
    800040b6:	c385                	beqz	a5,800040d6 <xEventGroupSetBits+0xba>
    800040b8:	4785                	li	a5,1
    800040ba:	fc3e                	sd	a5,56(sp)
    800040bc:	a829                	j	800040d6 <xEventGroupSetBits+0xba>
    800040be:	77c2                	ld	a5,48(sp)
    800040c0:	439c                	lw	a5,0(a5)
    800040c2:	4752                	lw	a4,20(sp)
    800040c4:	8ff9                	and	a5,a5,a4
    800040c6:	0007871b          	sext.w	a4,a5
    800040ca:	47d2                	lw	a5,20(sp)
    800040cc:	2781                	sext.w	a5,a5
    800040ce:	00e79463          	bne	a5,a4,800040d6 <xEventGroupSetBits+0xba>
    800040d2:	4785                	li	a5,1
    800040d4:	fc3e                	sd	a5,56(sp)
    800040d6:	77e2                	ld	a5,56(sp)
    800040d8:	c79d                	beqz	a5,80004106 <xEventGroupSetBits+0xea>
    800040da:	01016703          	lwu	a4,16(sp)
    800040de:	010007b7          	lui	a5,0x1000
    800040e2:	8ff9                	and	a5,a5,a4
    800040e4:	c791                	beqz	a5,800040f0 <xEventGroupSetBits+0xd4>
    800040e6:	4796                	lw	a5,68(sp)
    800040e8:	873e                	mv	a4,a5
    800040ea:	47d2                	lw	a5,20(sp)
    800040ec:	8fd9                	or	a5,a5,a4
    800040ee:	c2be                	sw	a5,68(sp)
    800040f0:	77c2                	ld	a5,48(sp)
    800040f2:	439c                	lw	a5,0(a5)
    800040f4:	873e                	mv	a4,a5
    800040f6:	020007b7          	lui	a5,0x2000
    800040fa:	8fd9                	or	a5,a5,a4
    800040fc:	2781                	sext.w	a5,a5
    800040fe:	85be                	mv	a1,a5
    80004100:	6526                	ld	a0,72(sp)
    80004102:	c58fe0ef          	jal	8000255a <xTaskRemoveFromUnorderedEventList>
    80004106:	67e2                	ld	a5,24(sp)
    80004108:	e4be                	sd	a5,72(sp)
    8000410a:	6726                	ld	a4,72(sp)
    8000410c:	7782                	ld	a5,32(sp)
    8000410e:	f6f715e3          	bne	a4,a5,80004078 <xEventGroupSetBits+0x5c>
    80004112:	77c2                	ld	a5,48(sp)
    80004114:	4398                	lw	a4,0(a5)
    80004116:	4796                	lw	a5,68(sp)
    80004118:	fff7c793          	not	a5,a5
    8000411c:	2781                	sext.w	a5,a5
    8000411e:	8ff9                	and	a5,a5,a4
    80004120:	0007871b          	sext.w	a4,a5
    80004124:	77c2                	ld	a5,48(sp)
    80004126:	c398                	sw	a4,0(a5)
    80004128:	bb3fd0ef          	jal	80001cda <xTaskResumeAll>
    8000412c:	77c2                	ld	a5,48(sp)
    8000412e:	439c                	lw	a5,0(a5)
    80004130:	853e                	mv	a0,a5
    80004132:	60e6                	ld	ra,88(sp)
    80004134:	6125                	addi	sp,sp,96
    80004136:	8082                	ret

0000000080004138 <vEventGroupDelete>:
    80004138:	7179                	addi	sp,sp,-48
    8000413a:	f406                	sd	ra,40(sp)
    8000413c:	e42a                	sd	a0,8(sp)
    8000413e:	67a2                	ld	a5,8(sp)
    80004140:	ec3e                	sd	a5,24(sp)
    80004142:	67e2                	ld	a5,24(sp)
    80004144:	07a1                	addi	a5,a5,8 # 2000008 <_HEAP_SIZE+0x1fff008>
    80004146:	e83e                	sd	a5,16(sp)
    80004148:	b77fd0ef          	jal	80001cbe <vTaskSuspendAll>
    8000414c:	a015                	j	80004170 <vEventGroupDelete+0x38>
    8000414e:	67c2                	ld	a5,16(sp)
    80004150:	6f98                	ld	a4,24(a5)
    80004152:	67c2                	ld	a5,16(sp)
    80004154:	07c1                	addi	a5,a5,16
    80004156:	00f71663          	bne	a4,a5,80004162 <vEventGroupDelete+0x2a>
    8000415a:	30047073          	csrci	mstatus,8
    8000415e:	0001                	nop
    80004160:	bffd                	j	8000415e <vEventGroupDelete+0x26>
    80004162:	67c2                	ld	a5,16(sp)
    80004164:	6f9c                	ld	a5,24(a5)
    80004166:	020005b7          	lui	a1,0x2000
    8000416a:	853e                	mv	a0,a5
    8000416c:	beefe0ef          	jal	8000255a <xTaskRemoveFromUnorderedEventList>
    80004170:	67c2                	ld	a5,16(sp)
    80004172:	639c                	ld	a5,0(a5)
    80004174:	ffe9                	bnez	a5,8000414e <vEventGroupDelete+0x16>
    80004176:	6562                	ld	a0,24(sp)
    80004178:	1e4000ef          	jal	8000435c <vPortFree>
    8000417c:	b5ffd0ef          	jal	80001cda <xTaskResumeAll>
    80004180:	0001                	nop
    80004182:	70a2                	ld	ra,40(sp)
    80004184:	6145                	addi	sp,sp,48
    80004186:	8082                	ret

0000000080004188 <vEventGroupSetBitsCallback>:
    80004188:	1101                	addi	sp,sp,-32
    8000418a:	ec06                	sd	ra,24(sp)
    8000418c:	e42a                	sd	a0,8(sp)
    8000418e:	87ae                	mv	a5,a1
    80004190:	c23e                	sw	a5,4(sp)
    80004192:	4792                	lw	a5,4(sp)
    80004194:	85be                	mv	a1,a5
    80004196:	6522                	ld	a0,8(sp)
    80004198:	e85ff0ef          	jal	8000401c <xEventGroupSetBits>
    8000419c:	0001                	nop
    8000419e:	60e2                	ld	ra,24(sp)
    800041a0:	6105                	addi	sp,sp,32
    800041a2:	8082                	ret

00000000800041a4 <vEventGroupClearBitsCallback>:
    800041a4:	1101                	addi	sp,sp,-32
    800041a6:	ec06                	sd	ra,24(sp)
    800041a8:	e42a                	sd	a0,8(sp)
    800041aa:	87ae                	mv	a5,a1
    800041ac:	c23e                	sw	a5,4(sp)
    800041ae:	4792                	lw	a5,4(sp)
    800041b0:	85be                	mv	a1,a5
    800041b2:	6522                	ld	a0,8(sp)
    800041b4:	ddfff0ef          	jal	80003f92 <xEventGroupClearBits>
    800041b8:	0001                	nop
    800041ba:	60e2                	ld	ra,24(sp)
    800041bc:	6105                	addi	sp,sp,32
    800041be:	8082                	ret

00000000800041c0 <prvTestWaitCondition>:
    800041c0:	1101                	addi	sp,sp,-32
    800041c2:	87aa                	mv	a5,a0
    800041c4:	872e                	mv	a4,a1
    800041c6:	e032                	sd	a2,0(sp)
    800041c8:	c63e                	sw	a5,12(sp)
    800041ca:	87ba                	mv	a5,a4
    800041cc:	c43e                	sw	a5,8(sp)
    800041ce:	ec02                	sd	zero,24(sp)
    800041d0:	6782                	ld	a5,0(sp)
    800041d2:	eb91                	bnez	a5,800041e6 <prvTestWaitCondition+0x26>
    800041d4:	47b2                	lw	a5,12(sp)
    800041d6:	873e                	mv	a4,a5
    800041d8:	47a2                	lw	a5,8(sp)
    800041da:	8ff9                	and	a5,a5,a4
    800041dc:	2781                	sext.w	a5,a5
    800041de:	c385                	beqz	a5,800041fe <prvTestWaitCondition+0x3e>
    800041e0:	4785                	li	a5,1
    800041e2:	ec3e                	sd	a5,24(sp)
    800041e4:	a829                	j	800041fe <prvTestWaitCondition+0x3e>
    800041e6:	47b2                	lw	a5,12(sp)
    800041e8:	873e                	mv	a4,a5
    800041ea:	47a2                	lw	a5,8(sp)
    800041ec:	8ff9                	and	a5,a5,a4
    800041ee:	0007871b          	sext.w	a4,a5
    800041f2:	47a2                	lw	a5,8(sp)
    800041f4:	2781                	sext.w	a5,a5
    800041f6:	00e79463          	bne	a5,a4,800041fe <prvTestWaitCondition+0x3e>
    800041fa:	4785                	li	a5,1
    800041fc:	ec3e                	sd	a5,24(sp)
    800041fe:	67e2                	ld	a5,24(sp)
    80004200:	853e                	mv	a0,a5
    80004202:	6105                	addi	sp,sp,32
    80004204:	8082                	ret

0000000080004206 <uxEventGroupGetNumber>:
    80004206:	1101                	addi	sp,sp,-32
    80004208:	e42a                	sd	a0,8(sp)
    8000420a:	67a2                	ld	a5,8(sp)
    8000420c:	e83e                	sd	a5,16(sp)
    8000420e:	67a2                	ld	a5,8(sp)
    80004210:	e399                	bnez	a5,80004216 <uxEventGroupGetNumber+0x10>
    80004212:	ec02                	sd	zero,24(sp)
    80004214:	a021                	j	8000421c <uxEventGroupGetNumber+0x16>
    80004216:	67c2                	ld	a5,16(sp)
    80004218:	7b9c                	ld	a5,48(a5)
    8000421a:	ec3e                	sd	a5,24(sp)
    8000421c:	67e2                	ld	a5,24(sp)
    8000421e:	853e                	mv	a0,a5
    80004220:	6105                	addi	sp,sp,32
    80004222:	8082                	ret

0000000080004224 <pvPortMalloc>:
    80004224:	715d                	addi	sp,sp,-80
    80004226:	e486                	sd	ra,72(sp)
    80004228:	e42a                	sd	a0,8(sp)
    8000422a:	f402                	sd	zero,40(sp)
    8000422c:	a93fd0ef          	jal	80001cbe <vTaskSuspendAll>
    80004230:	00035797          	auipc	a5,0x35
    80004234:	5d078793          	addi	a5,a5,1488 # 80039800 <xHeapHasBeenInitialised.0>
    80004238:	639c                	ld	a5,0(a5)
    8000423a:	eb89                	bnez	a5,8000424c <pvPortMalloc+0x28>
    8000423c:	1ac000ef          	jal	800043e8 <prvHeapInit>
    80004240:	00035797          	auipc	a5,0x35
    80004244:	5c078793          	addi	a5,a5,1472 # 80039800 <xHeapHasBeenInitialised.0>
    80004248:	4705                	li	a4,1
    8000424a:	e398                	sd	a4,0(a5)
    8000424c:	67a2                	ld	a5,8(sp)
    8000424e:	cf89                	beqz	a5,80004268 <pvPortMalloc+0x44>
    80004250:	47c1                	li	a5,16
    80004252:	873e                	mv	a4,a5
    80004254:	67a2                	ld	a5,8(sp)
    80004256:	97ba                	add	a5,a5,a4
    80004258:	e43e                	sd	a5,8(sp)
    8000425a:	67a2                	ld	a5,8(sp)
    8000425c:	8b9d                	andi	a5,a5,7
    8000425e:	c789                	beqz	a5,80004268 <pvPortMalloc+0x44>
    80004260:	67a2                	ld	a5,8(sp)
    80004262:	9be1                	andi	a5,a5,-8
    80004264:	07a1                	addi	a5,a5,8
    80004266:	e43e                	sd	a5,8(sp)
    80004268:	67a2                	ld	a5,8(sp)
    8000426a:	cff1                	beqz	a5,80004346 <pvPortMalloc+0x122>
    8000426c:	6722                	ld	a4,8(sp)
    8000426e:	67e5                	lui	a5,0x19
    80004270:	17dd                	addi	a5,a5,-9 # 18ff7 <_HEAP_SIZE+0x17ff7>
    80004272:	0ce7ea63          	bltu	a5,a4,80004346 <pvPortMalloc+0x122>
    80004276:	00035797          	auipc	a5,0x35
    8000427a:	56a78793          	addi	a5,a5,1386 # 800397e0 <xStart>
    8000427e:	f83e                	sd	a5,48(sp)
    80004280:	00035797          	auipc	a5,0x35
    80004284:	56078793          	addi	a5,a5,1376 # 800397e0 <xStart>
    80004288:	639c                	ld	a5,0(a5)
    8000428a:	fc3e                	sd	a5,56(sp)
    8000428c:	a031                	j	80004298 <pvPortMalloc+0x74>
    8000428e:	77e2                	ld	a5,56(sp)
    80004290:	f83e                	sd	a5,48(sp)
    80004292:	77e2                	ld	a5,56(sp)
    80004294:	639c                	ld	a5,0(a5)
    80004296:	fc3e                	sd	a5,56(sp)
    80004298:	77e2                	ld	a5,56(sp)
    8000429a:	679c                	ld	a5,8(a5)
    8000429c:	6722                	ld	a4,8(sp)
    8000429e:	00e7f563          	bgeu	a5,a4,800042a8 <pvPortMalloc+0x84>
    800042a2:	77e2                	ld	a5,56(sp)
    800042a4:	639c                	ld	a5,0(a5)
    800042a6:	f7e5                	bnez	a5,8000428e <pvPortMalloc+0x6a>
    800042a8:	7762                	ld	a4,56(sp)
    800042aa:	00035797          	auipc	a5,0x35
    800042ae:	54678793          	addi	a5,a5,1350 # 800397f0 <xEnd>
    800042b2:	08f70a63          	beq	a4,a5,80004346 <pvPortMalloc+0x122>
    800042b6:	77c2                	ld	a5,48(sp)
    800042b8:	639c                	ld	a5,0(a5)
    800042ba:	4741                	li	a4,16
    800042bc:	97ba                	add	a5,a5,a4
    800042be:	f43e                	sd	a5,40(sp)
    800042c0:	77e2                	ld	a5,56(sp)
    800042c2:	6398                	ld	a4,0(a5)
    800042c4:	77c2                	ld	a5,48(sp)
    800042c6:	e398                	sd	a4,0(a5)
    800042c8:	77e2                	ld	a5,56(sp)
    800042ca:	6798                	ld	a4,8(a5)
    800042cc:	67a2                	ld	a5,8(sp)
    800042ce:	40f707b3          	sub	a5,a4,a5
    800042d2:	4741                	li	a4,16
    800042d4:	2701                	sext.w	a4,a4
    800042d6:	0017171b          	slliw	a4,a4,0x1
    800042da:	2701                	sext.w	a4,a4
    800042dc:	04f77863          	bgeu	a4,a5,8000432c <pvPortMalloc+0x108>
    800042e0:	7762                	ld	a4,56(sp)
    800042e2:	67a2                	ld	a5,8(sp)
    800042e4:	97ba                	add	a5,a5,a4
    800042e6:	ec3e                	sd	a5,24(sp)
    800042e8:	77e2                	ld	a5,56(sp)
    800042ea:	6798                	ld	a4,8(a5)
    800042ec:	67a2                	ld	a5,8(sp)
    800042ee:	8f1d                	sub	a4,a4,a5
    800042f0:	67e2                	ld	a5,24(sp)
    800042f2:	e798                	sd	a4,8(a5)
    800042f4:	77e2                	ld	a5,56(sp)
    800042f6:	6722                	ld	a4,8(sp)
    800042f8:	e798                	sd	a4,8(a5)
    800042fa:	67e2                	ld	a5,24(sp)
    800042fc:	679c                	ld	a5,8(a5)
    800042fe:	e83e                	sd	a5,16(sp)
    80004300:	00035797          	auipc	a5,0x35
    80004304:	4e078793          	addi	a5,a5,1248 # 800397e0 <xStart>
    80004308:	f03e                	sd	a5,32(sp)
    8000430a:	a021                	j	80004312 <pvPortMalloc+0xee>
    8000430c:	7782                	ld	a5,32(sp)
    8000430e:	639c                	ld	a5,0(a5)
    80004310:	f03e                	sd	a5,32(sp)
    80004312:	7782                	ld	a5,32(sp)
    80004314:	639c                	ld	a5,0(a5)
    80004316:	679c                	ld	a5,8(a5)
    80004318:	6742                	ld	a4,16(sp)
    8000431a:	fee7e9e3          	bltu	a5,a4,8000430c <pvPortMalloc+0xe8>
    8000431e:	7782                	ld	a5,32(sp)
    80004320:	6398                	ld	a4,0(a5)
    80004322:	67e2                	ld	a5,24(sp)
    80004324:	e398                	sd	a4,0(a5)
    80004326:	7782                	ld	a5,32(sp)
    80004328:	6762                	ld	a4,24(sp)
    8000432a:	e398                	sd	a4,0(a5)
    8000432c:	0001c797          	auipc	a5,0x1c
    80004330:	0bc78793          	addi	a5,a5,188 # 800203e8 <xFreeBytesRemaining>
    80004334:	6398                	ld	a4,0(a5)
    80004336:	77e2                	ld	a5,56(sp)
    80004338:	679c                	ld	a5,8(a5)
    8000433a:	8f1d                	sub	a4,a4,a5
    8000433c:	0001c797          	auipc	a5,0x1c
    80004340:	0ac78793          	addi	a5,a5,172 # 800203e8 <xFreeBytesRemaining>
    80004344:	e398                	sd	a4,0(a5)
    80004346:	995fd0ef          	jal	80001cda <xTaskResumeAll>
    8000434a:	77a2                	ld	a5,40(sp)
    8000434c:	e399                	bnez	a5,80004352 <pvPortMalloc+0x12e>
    8000434e:	3f9000ef          	jal	80004f46 <vApplicationMallocFailedHook>
    80004352:	77a2                	ld	a5,40(sp)
    80004354:	853e                	mv	a0,a5
    80004356:	60a6                	ld	ra,72(sp)
    80004358:	6161                	addi	sp,sp,80
    8000435a:	8082                	ret

000000008000435c <vPortFree>:
    8000435c:	7139                	addi	sp,sp,-64
    8000435e:	fc06                	sd	ra,56(sp)
    80004360:	e42a                	sd	a0,8(sp)
    80004362:	67a2                	ld	a5,8(sp)
    80004364:	f03e                	sd	a5,32(sp)
    80004366:	67a2                	ld	a5,8(sp)
    80004368:	c3bd                	beqz	a5,800043ce <vPortFree+0x72>
    8000436a:	47c1                	li	a5,16
    8000436c:	40f007b3          	neg	a5,a5
    80004370:	7702                	ld	a4,32(sp)
    80004372:	97ba                	add	a5,a5,a4
    80004374:	f03e                	sd	a5,32(sp)
    80004376:	7782                	ld	a5,32(sp)
    80004378:	ec3e                	sd	a5,24(sp)
    8000437a:	945fd0ef          	jal	80001cbe <vTaskSuspendAll>
    8000437e:	67e2                	ld	a5,24(sp)
    80004380:	679c                	ld	a5,8(a5)
    80004382:	e83e                	sd	a5,16(sp)
    80004384:	00035797          	auipc	a5,0x35
    80004388:	45c78793          	addi	a5,a5,1116 # 800397e0 <xStart>
    8000438c:	f43e                	sd	a5,40(sp)
    8000438e:	a021                	j	80004396 <vPortFree+0x3a>
    80004390:	77a2                	ld	a5,40(sp)
    80004392:	639c                	ld	a5,0(a5)
    80004394:	f43e                	sd	a5,40(sp)
    80004396:	77a2                	ld	a5,40(sp)
    80004398:	639c                	ld	a5,0(a5)
    8000439a:	679c                	ld	a5,8(a5)
    8000439c:	6742                	ld	a4,16(sp)
    8000439e:	fee7e9e3          	bltu	a5,a4,80004390 <vPortFree+0x34>
    800043a2:	77a2                	ld	a5,40(sp)
    800043a4:	6398                	ld	a4,0(a5)
    800043a6:	67e2                	ld	a5,24(sp)
    800043a8:	e398                	sd	a4,0(a5)
    800043aa:	77a2                	ld	a5,40(sp)
    800043ac:	6762                	ld	a4,24(sp)
    800043ae:	e398                	sd	a4,0(a5)
    800043b0:	67e2                	ld	a5,24(sp)
    800043b2:	6798                	ld	a4,8(a5)
    800043b4:	0001c797          	auipc	a5,0x1c
    800043b8:	03478793          	addi	a5,a5,52 # 800203e8 <xFreeBytesRemaining>
    800043bc:	639c                	ld	a5,0(a5)
    800043be:	973e                	add	a4,a4,a5
    800043c0:	0001c797          	auipc	a5,0x1c
    800043c4:	02878793          	addi	a5,a5,40 # 800203e8 <xFreeBytesRemaining>
    800043c8:	e398                	sd	a4,0(a5)
    800043ca:	911fd0ef          	jal	80001cda <xTaskResumeAll>
    800043ce:	0001                	nop
    800043d0:	70e2                	ld	ra,56(sp)
    800043d2:	6121                	addi	sp,sp,64
    800043d4:	8082                	ret

00000000800043d6 <xPortGetFreeHeapSize>:
    800043d6:	0001c797          	auipc	a5,0x1c
    800043da:	01278793          	addi	a5,a5,18 # 800203e8 <xFreeBytesRemaining>
    800043de:	639c                	ld	a5,0(a5)
    800043e0:	853e                	mv	a0,a5
    800043e2:	8082                	ret

00000000800043e4 <vPortInitialiseBlocks>:
    800043e4:	0001                	nop
    800043e6:	8082                	ret

00000000800043e8 <prvHeapInit>:
    800043e8:	1141                	addi	sp,sp,-16
    800043ea:	0001c797          	auipc	a5,0x1c
    800043ee:	3fe78793          	addi	a5,a5,1022 # 800207e8 <ucHeap+0x8>
    800043f2:	9be1                	andi	a5,a5,-8
    800043f4:	e43e                	sd	a5,8(sp)
    800043f6:	00035797          	auipc	a5,0x35
    800043fa:	3ea78793          	addi	a5,a5,1002 # 800397e0 <xStart>
    800043fe:	6722                	ld	a4,8(sp)
    80004400:	e398                	sd	a4,0(a5)
    80004402:	00035797          	auipc	a5,0x35
    80004406:	3de78793          	addi	a5,a5,990 # 800397e0 <xStart>
    8000440a:	0007b423          	sd	zero,8(a5)
    8000440e:	00035797          	auipc	a5,0x35
    80004412:	3e278793          	addi	a5,a5,994 # 800397f0 <xEnd>
    80004416:	6765                	lui	a4,0x19
    80004418:	1761                	addi	a4,a4,-8 # 18ff8 <_HEAP_SIZE+0x17ff8>
    8000441a:	e798                	sd	a4,8(a5)
    8000441c:	00035797          	auipc	a5,0x35
    80004420:	3d478793          	addi	a5,a5,980 # 800397f0 <xEnd>
    80004424:	0007b023          	sd	zero,0(a5)
    80004428:	67a2                	ld	a5,8(sp)
    8000442a:	e03e                	sd	a5,0(sp)
    8000442c:	6782                	ld	a5,0(sp)
    8000442e:	6765                	lui	a4,0x19
    80004430:	1761                	addi	a4,a4,-8 # 18ff8 <_HEAP_SIZE+0x17ff8>
    80004432:	e798                	sd	a4,8(a5)
    80004434:	6782                	ld	a5,0(sp)
    80004436:	00035717          	auipc	a4,0x35
    8000443a:	3ba70713          	addi	a4,a4,954 # 800397f0 <xEnd>
    8000443e:	e398                	sd	a4,0(a5)
    80004440:	0001                	nop
    80004442:	0141                	addi	sp,sp,16
    80004444:	8082                	ret

0000000080004446 <memcpy>:
    80004446:	7179                	addi	sp,sp,-48
    80004448:	ec2a                	sd	a0,24(sp)
    8000444a:	e82e                	sd	a1,16(sp)
    8000444c:	e432                	sd	a2,8(sp)
    8000444e:	67c2                	ld	a5,16(sp)
    80004450:	f43e                	sd	a5,40(sp)
    80004452:	67e2                	ld	a5,24(sp)
    80004454:	f03e                	sd	a5,32(sp)
    80004456:	6762                	ld	a4,24(sp)
    80004458:	67c2                	ld	a5,16(sp)
    8000445a:	8fd9                	or	a5,a5,a4
    8000445c:	8b9d                	andi	a5,a5,7
    8000445e:	e3a1                	bnez	a5,8000449e <memcpy+0x58>
    80004460:	a819                	j	80004476 <memcpy+0x30>
    80004462:	77a2                	ld	a5,40(sp)
    80004464:	6398                	ld	a4,0(a5)
    80004466:	7782                	ld	a5,32(sp)
    80004468:	e398                	sd	a4,0(a5)
    8000446a:	7782                	ld	a5,32(sp)
    8000446c:	07a1                	addi	a5,a5,8
    8000446e:	f03e                	sd	a5,32(sp)
    80004470:	77a2                	ld	a5,40(sp)
    80004472:	07a1                	addi	a5,a5,8
    80004474:	f43e                	sd	a5,40(sp)
    80004476:	67a2                	ld	a5,8(sp)
    80004478:	17e5                	addi	a5,a5,-7
    8000447a:	6762                	ld	a4,24(sp)
    8000447c:	97ba                	add	a5,a5,a4
    8000447e:	7702                	ld	a4,32(sp)
    80004480:	fef761e3          	bltu	a4,a5,80004462 <memcpy+0x1c>
    80004484:	a829                	j	8000449e <memcpy+0x58>
    80004486:	7722                	ld	a4,40(sp)
    80004488:	00170793          	addi	a5,a4,1
    8000448c:	f43e                	sd	a5,40(sp)
    8000448e:	7782                	ld	a5,32(sp)
    80004490:	00178693          	addi	a3,a5,1
    80004494:	f036                	sd	a3,32(sp)
    80004496:	00074703          	lbu	a4,0(a4)
    8000449a:	00e78023          	sb	a4,0(a5)
    8000449e:	6762                	ld	a4,24(sp)
    800044a0:	67a2                	ld	a5,8(sp)
    800044a2:	97ba                	add	a5,a5,a4
    800044a4:	7702                	ld	a4,32(sp)
    800044a6:	fef760e3          	bltu	a4,a5,80004486 <memcpy+0x40>
    800044aa:	67e2                	ld	a5,24(sp)
    800044ac:	853e                	mv	a0,a5
    800044ae:	6145                	addi	sp,sp,48
    800044b0:	8082                	ret

00000000800044b2 <memset>:
    800044b2:	7139                	addi	sp,sp,-64
    800044b4:	ec2a                	sd	a0,24(sp)
    800044b6:	87ae                	mv	a5,a1
    800044b8:	e432                	sd	a2,8(sp)
    800044ba:	ca3e                	sw	a5,20(sp)
    800044bc:	6762                	ld	a4,24(sp)
    800044be:	67a2                	ld	a5,8(sp)
    800044c0:	8fd9                	or	a5,a5,a4
    800044c2:	8b9d                	andi	a5,a5,7
    800044c4:	e7a1                	bnez	a5,8000450c <memset+0x5a>
    800044c6:	47d2                	lw	a5,20(sp)
    800044c8:	0ff7f793          	zext.b	a5,a5
    800044cc:	f43e                	sd	a5,40(sp)
    800044ce:	77a2                	ld	a5,40(sp)
    800044d0:	07a2                	slli	a5,a5,0x8
    800044d2:	7722                	ld	a4,40(sp)
    800044d4:	8fd9                	or	a5,a5,a4
    800044d6:	f43e                	sd	a5,40(sp)
    800044d8:	77a2                	ld	a5,40(sp)
    800044da:	07c2                	slli	a5,a5,0x10
    800044dc:	7722                	ld	a4,40(sp)
    800044de:	8fd9                	or	a5,a5,a4
    800044e0:	f43e                	sd	a5,40(sp)
    800044e2:	77a2                	ld	a5,40(sp)
    800044e4:	1782                	slli	a5,a5,0x20
    800044e6:	7722                	ld	a4,40(sp)
    800044e8:	8fd9                	or	a5,a5,a4
    800044ea:	f43e                	sd	a5,40(sp)
    800044ec:	67e2                	ld	a5,24(sp)
    800044ee:	fc3e                	sd	a5,56(sp)
    800044f0:	a039                	j	800044fe <memset+0x4c>
    800044f2:	77e2                	ld	a5,56(sp)
    800044f4:	00878713          	addi	a4,a5,8
    800044f8:	fc3a                	sd	a4,56(sp)
    800044fa:	7722                	ld	a4,40(sp)
    800044fc:	e398                	sd	a4,0(a5)
    800044fe:	6762                	ld	a4,24(sp)
    80004500:	67a2                	ld	a5,8(sp)
    80004502:	97ba                	add	a5,a5,a4
    80004504:	7762                	ld	a4,56(sp)
    80004506:	fef766e3          	bltu	a4,a5,800044f2 <memset+0x40>
    8000450a:	a01d                	j	80004530 <memset+0x7e>
    8000450c:	67e2                	ld	a5,24(sp)
    8000450e:	f83e                	sd	a5,48(sp)
    80004510:	a811                	j	80004524 <memset+0x72>
    80004512:	77c2                	ld	a5,48(sp)
    80004514:	00178713          	addi	a4,a5,1
    80004518:	f83a                	sd	a4,48(sp)
    8000451a:	4752                	lw	a4,20(sp)
    8000451c:	0ff77713          	zext.b	a4,a4
    80004520:	00e78023          	sb	a4,0(a5)
    80004524:	6762                	ld	a4,24(sp)
    80004526:	67a2                	ld	a5,8(sp)
    80004528:	97ba                	add	a5,a5,a4
    8000452a:	7742                	ld	a4,48(sp)
    8000452c:	fef763e3          	bltu	a4,a5,80004512 <memset+0x60>
    80004530:	67e2                	ld	a5,24(sp)
    80004532:	853e                	mv	a0,a5
    80004534:	6121                	addi	sp,sp,64
    80004536:	8082                	ret

0000000080004538 <strlen>:
    80004538:	1101                	addi	sp,sp,-32
    8000453a:	e42a                	sd	a0,8(sp)
    8000453c:	67a2                	ld	a5,8(sp)
    8000453e:	ec3e                	sd	a5,24(sp)
    80004540:	a021                	j	80004548 <strlen+0x10>
    80004542:	67e2                	ld	a5,24(sp)
    80004544:	0785                	addi	a5,a5,1
    80004546:	ec3e                	sd	a5,24(sp)
    80004548:	67e2                	ld	a5,24(sp)
    8000454a:	0007c783          	lbu	a5,0(a5)
    8000454e:	fbf5                	bnez	a5,80004542 <strlen+0xa>
    80004550:	6762                	ld	a4,24(sp)
    80004552:	67a2                	ld	a5,8(sp)
    80004554:	40f707b3          	sub	a5,a4,a5
    80004558:	853e                	mv	a0,a5
    8000455a:	6105                	addi	sp,sp,32
    8000455c:	8082                	ret

000000008000455e <strcmp>:
    8000455e:	1101                	addi	sp,sp,-32
    80004560:	e42a                	sd	a0,8(sp)
    80004562:	e02e                	sd	a1,0(sp)
    80004564:	67a2                	ld	a5,8(sp)
    80004566:	00178713          	addi	a4,a5,1
    8000456a:	e43a                	sd	a4,8(sp)
    8000456c:	0007c783          	lbu	a5,0(a5)
    80004570:	00f10fa3          	sb	a5,31(sp)
    80004574:	6782                	ld	a5,0(sp)
    80004576:	00178713          	addi	a4,a5,1
    8000457a:	e03a                	sd	a4,0(sp)
    8000457c:	0007c783          	lbu	a5,0(a5)
    80004580:	00f10f23          	sb	a5,30(sp)
    80004584:	01f14783          	lbu	a5,31(sp)
    80004588:	0ff7f793          	zext.b	a5,a5
    8000458c:	cf81                	beqz	a5,800045a4 <strcmp+0x46>
    8000458e:	01f14783          	lbu	a5,31(sp)
    80004592:	873e                	mv	a4,a5
    80004594:	01e14783          	lbu	a5,30(sp)
    80004598:	0ff77713          	zext.b	a4,a4
    8000459c:	0ff7f793          	zext.b	a5,a5
    800045a0:	fcf702e3          	beq	a4,a5,80004564 <strcmp+0x6>
    800045a4:	01f14783          	lbu	a5,31(sp)
    800045a8:	0007871b          	sext.w	a4,a5
    800045ac:	01e14783          	lbu	a5,30(sp)
    800045b0:	2781                	sext.w	a5,a5
    800045b2:	40f707bb          	subw	a5,a4,a5
    800045b6:	2781                	sext.w	a5,a5
    800045b8:	853e                	mv	a0,a5
    800045ba:	6105                	addi	sp,sp,32
    800045bc:	8082                	ret

00000000800045be <strcpy>:
    800045be:	1101                	addi	sp,sp,-32
    800045c0:	e42a                	sd	a0,8(sp)
    800045c2:	e02e                	sd	a1,0(sp)
    800045c4:	67a2                	ld	a5,8(sp)
    800045c6:	ec3e                	sd	a5,24(sp)
    800045c8:	0001                	nop
    800045ca:	6702                	ld	a4,0(sp)
    800045cc:	00170793          	addi	a5,a4,1
    800045d0:	e03e                	sd	a5,0(sp)
    800045d2:	67e2                	ld	a5,24(sp)
    800045d4:	00178693          	addi	a3,a5,1
    800045d8:	ec36                	sd	a3,24(sp)
    800045da:	00074703          	lbu	a4,0(a4)
    800045de:	00e78023          	sb	a4,0(a5)
    800045e2:	0007c783          	lbu	a5,0(a5)
    800045e6:	f3f5                	bnez	a5,800045ca <strcpy+0xc>
    800045e8:	67a2                	ld	a5,8(sp)
    800045ea:	853e                	mv	a0,a5
    800045ec:	6105                	addi	sp,sp,32
    800045ee:	8082                	ret

00000000800045f0 <atol>:
    800045f0:	1101                	addi	sp,sp,-32
    800045f2:	e42a                	sd	a0,8(sp)
    800045f4:	ec02                	sd	zero,24(sp)
    800045f6:	ca02                	sw	zero,20(sp)
    800045f8:	a021                	j	80004600 <atol+0x10>
    800045fa:	67a2                	ld	a5,8(sp)
    800045fc:	0785                	addi	a5,a5,1
    800045fe:	e43e                	sd	a5,8(sp)
    80004600:	67a2                	ld	a5,8(sp)
    80004602:	0007c783          	lbu	a5,0(a5)
    80004606:	873e                	mv	a4,a5
    80004608:	02000793          	li	a5,32
    8000460c:	fef707e3          	beq	a4,a5,800045fa <atol+0xa>
    80004610:	67a2                	ld	a5,8(sp)
    80004612:	0007c783          	lbu	a5,0(a5)
    80004616:	873e                	mv	a4,a5
    80004618:	02d00793          	li	a5,45
    8000461c:	00f70a63          	beq	a4,a5,80004630 <atol+0x40>
    80004620:	67a2                	ld	a5,8(sp)
    80004622:	0007c783          	lbu	a5,0(a5)
    80004626:	873e                	mv	a4,a5
    80004628:	02b00793          	li	a5,43
    8000462c:	04f71863          	bne	a4,a5,8000467c <atol+0x8c>
    80004630:	67a2                	ld	a5,8(sp)
    80004632:	0007c783          	lbu	a5,0(a5)
    80004636:	0007871b          	sext.w	a4,a5
    8000463a:	02d00793          	li	a5,45
    8000463e:	40f707b3          	sub	a5,a4,a5
    80004642:	0017b793          	seqz	a5,a5
    80004646:	0ff7f793          	zext.b	a5,a5
    8000464a:	ca3e                	sw	a5,20(sp)
    8000464c:	67a2                	ld	a5,8(sp)
    8000464e:	0785                	addi	a5,a5,1
    80004650:	e43e                	sd	a5,8(sp)
    80004652:	a02d                	j	8000467c <atol+0x8c>
    80004654:	6762                	ld	a4,24(sp)
    80004656:	87ba                	mv	a5,a4
    80004658:	078a                	slli	a5,a5,0x2
    8000465a:	97ba                	add	a5,a5,a4
    8000465c:	0786                	slli	a5,a5,0x1
    8000465e:	ec3e                	sd	a5,24(sp)
    80004660:	67a2                	ld	a5,8(sp)
    80004662:	00178713          	addi	a4,a5,1
    80004666:	e43a                	sd	a4,8(sp)
    80004668:	0007c783          	lbu	a5,0(a5)
    8000466c:	2781                	sext.w	a5,a5
    8000466e:	fd07879b          	addiw	a5,a5,-48
    80004672:	2781                	sext.w	a5,a5
    80004674:	873e                	mv	a4,a5
    80004676:	67e2                	ld	a5,24(sp)
    80004678:	97ba                	add	a5,a5,a4
    8000467a:	ec3e                	sd	a5,24(sp)
    8000467c:	67a2                	ld	a5,8(sp)
    8000467e:	0007c783          	lbu	a5,0(a5)
    80004682:	fbe9                	bnez	a5,80004654 <atol+0x64>
    80004684:	47d2                	lw	a5,20(sp)
    80004686:	2781                	sext.w	a5,a5
    80004688:	c789                	beqz	a5,80004692 <atol+0xa2>
    8000468a:	67e2                	ld	a5,24(sp)
    8000468c:	40f007b3          	neg	a5,a5
    80004690:	a011                	j	80004694 <atol+0xa4>
    80004692:	67e2                	ld	a5,24(sp)
    80004694:	853e                	mv	a0,a5
    80004696:	6105                	addi	sp,sp,32
    80004698:	8082                	ret

000000008000469a <zeroExtend>:
    8000469a:	1101                	addi	sp,sp,-32
    8000469c:	e42a                	sd	a0,8(sp)
    8000469e:	67a2                	ld	a5,8(sp)
    800046a0:	ec3e                	sd	a5,24(sp)
    800046a2:	67e2                	ld	a5,24(sp)
    800046a4:	853e                	mv	a0,a5
    800046a6:	6105                	addi	sp,sp,32
    800046a8:	8082                	ret

00000000800046aa <prvSyscallToHost>:
    800046aa:	7131                	addi	sp,sp,-192
    800046ac:	fd06                	sd	ra,184(sp)
    800046ae:	f922                	sd	s0,176(sp)
    800046b0:	f42a                	sd	a0,40(sp)
    800046b2:	f02e                	sd	a1,32(sp)
    800046b4:	ec32                	sd	a2,24(sp)
    800046b6:	e836                	sd	a3,16(sp)
    800046b8:	191c                	addi	a5,sp,176
    800046ba:	e43e                	sd	a5,8(sp)
    800046bc:	67a2                	ld	a5,8(sp)
    800046be:	f8078793          	addi	a5,a5,-128
    800046c2:	03f78793          	addi	a5,a5,63
    800046c6:	8399                	srli	a5,a5,0x6
    800046c8:	00679413          	slli	s0,a5,0x6
    800046cc:	7522                	ld	a0,40(sp)
    800046ce:	fcdff0ef          	jal	8000469a <zeroExtend>
    800046d2:	87aa                	mv	a5,a0
    800046d4:	e01c                	sd	a5,0(s0)
    800046d6:	7502                	ld	a0,32(sp)
    800046d8:	fc3ff0ef          	jal	8000469a <zeroExtend>
    800046dc:	87aa                	mv	a5,a0
    800046de:	e41c                	sd	a5,8(s0)
    800046e0:	6562                	ld	a0,24(sp)
    800046e2:	fb9ff0ef          	jal	8000469a <zeroExtend>
    800046e6:	87aa                	mv	a5,a0
    800046e8:	e81c                	sd	a5,16(s0)
    800046ea:	6542                	ld	a0,16(sp)
    800046ec:	fafff0ef          	jal	8000469a <zeroExtend>
    800046f0:	87aa                	mv	a5,a0
    800046f2:	ec1c                	sd	a5,24(s0)
    800046f4:	0ff0000f          	fence
    800046f8:	87a2                	mv	a5,s0
    800046fa:	853e                	mv	a0,a5
    800046fc:	f9fff0ef          	jal	8000469a <zeroExtend>
    80004700:	872a                	mv	a4,a0
    80004702:	0001c797          	auipc	a5,0x1c
    80004706:	c7e78793          	addi	a5,a5,-898 # 80020380 <tohost>
    8000470a:	e398                	sd	a4,0(a5)
    8000470c:	601c                	ld	a5,0(s0)
    8000470e:	853e                	mv	a0,a5
    80004710:	70ea                	ld	ra,184(sp)
    80004712:	744a                	ld	s0,176(sp)
    80004714:	6129                	addi	sp,sp,192
    80004716:	8082                	ret

0000000080004718 <prvSyscallExit>:
    80004718:	7179                	addi	sp,sp,-48
    8000471a:	f406                	sd	ra,40(sp)
    8000471c:	e42a                	sd	a0,8(sp)
    8000471e:	6522                	ld	a0,8(sp)
    80004720:	f7bff0ef          	jal	8000469a <zeroExtend>
    80004724:	ec2a                	sd	a0,24(sp)
    80004726:	67e2                	ld	a5,24(sp)
    80004728:	0786                	slli	a5,a5,0x1
    8000472a:	0017e713          	ori	a4,a5,1
    8000472e:	0001c797          	auipc	a5,0x1c
    80004732:	c5278793          	addi	a5,a5,-942 # 80020380 <tohost>
    80004736:	e398                	sd	a4,0(a5)
    80004738:	0001                	nop
    8000473a:	bffd                	j	80004738 <prvSyscallExit+0x20>

000000008000473c <printstr>:
    8000473c:	1101                	addi	sp,sp,-32
    8000473e:	ec06                	sd	ra,24(sp)
    80004740:	e822                	sd	s0,16(sp)
    80004742:	e42a                	sd	a0,8(sp)
    80004744:	6422                	ld	s0,8(sp)
    80004746:	6522                	ld	a0,8(sp)
    80004748:	df1ff0ef          	jal	80004538 <strlen>
    8000474c:	87aa                	mv	a5,a0
    8000474e:	86be                	mv	a3,a5
    80004750:	8622                	mv	a2,s0
    80004752:	4585                	li	a1,1
    80004754:	04000513          	li	a0,64
    80004758:	00e000ef          	jal	80004766 <syscall>
    8000475c:	0001                	nop
    8000475e:	60e2                	ld	ra,24(sp)
    80004760:	6442                	ld	s0,16(sp)
    80004762:	6105                	addi	sp,sp,32
    80004764:	8082                	ret

0000000080004766 <syscall>:
    80004766:	1101                	addi	sp,sp,-32
    80004768:	ec2a                	sd	a0,24(sp)
    8000476a:	e82e                	sd	a1,16(sp)
    8000476c:	e432                	sd	a2,8(sp)
    8000476e:	e036                	sd	a3,0(sp)
    80004770:	68e2                	ld	a7,24(sp)
    80004772:	6542                	ld	a0,16(sp)
    80004774:	65a2                	ld	a1,8(sp)
    80004776:	6602                	ld	a2,0(sp)
    80004778:	00000073          	ecall
    8000477c:	87aa                	mv	a5,a0
    8000477e:	853e                	mv	a0,a5
    80004780:	6105                	addi	sp,sp,32
    80004782:	8082                	ret
    80004784:	1101                	addi	sp,sp,-32
    80004786:	ec06                	sd	ra,24(sp)
    80004788:	87aa                	mv	a5,a0
    8000478a:	e02e                	sd	a1,0(sp)
    8000478c:	c63e                	sw	a5,12(sp)
    8000478e:	0001c517          	auipc	a0,0x1c
    80004792:	8da50513          	addi	a0,a0,-1830 # 80020068 <__rodata_start+0x68>
    80004796:	fa7ff0ef          	jal	8000473c <printstr>
    8000479a:	57fd                	li	a5,-1
    8000479c:	853e                	mv	a0,a5
    8000479e:	60e2                	ld	ra,24(sp)
    800047a0:	6105                	addi	sp,sp,32
    800047a2:	8082                	ret

00000000800047a4 <vSyscallInit>:
    800047a4:	1101                	addi	sp,sp,-32
    800047a6:	ec06                	sd	ra,24(sp)
    800047a8:	4581                	li	a1,0
    800047aa:	4501                	li	a0,0
    800047ac:	652000ef          	jal	80004dfe <main>
    800047b0:	87aa                	mv	a5,a0
    800047b2:	c63e                	sw	a5,12(sp)
    800047b4:	47b2                	lw	a5,12(sp)
    800047b6:	853e                	mv	a0,a5
    800047b8:	530000ef          	jal	80004ce8 <exit>
    800047bc:	0001                	nop
    800047be:	60e2                	ld	ra,24(sp)
    800047c0:	6105                	addi	sp,sp,32
    800047c2:	8082                	ret

00000000800047c4 <ulSyscallTrap>:
    800047c4:	7139                	addi	sp,sp,-64
    800047c6:	fc06                	sd	ra,56(sp)
    800047c8:	ec2a                	sd	a0,24(sp)
    800047ca:	e82e                	sd	a1,16(sp)
    800047cc:	e432                	sd	a2,8(sp)
    800047ce:	f402                	sd	zero,40(sp)
    800047d0:	6762                	ld	a4,24(sp)
    800047d2:	47ad                	li	a5,11
    800047d4:	00f70663          	beq	a4,a5,800047e0 <ulSyscallTrap+0x1c>
    800047d8:	6562                	ld	a0,24(sp)
    800047da:	f3fff0ef          	jal	80004718 <prvSyscallExit>
    800047de:	a0b9                	j	8000482c <ulSyscallTrap+0x68>
    800047e0:	67a2                	ld	a5,8(sp)
    800047e2:	08878793          	addi	a5,a5,136
    800047e6:	6398                	ld	a4,0(a5)
    800047e8:	05d00793          	li	a5,93
    800047ec:	00f71a63          	bne	a4,a5,80004800 <ulSyscallTrap+0x3c>
    800047f0:	67a2                	ld	a5,8(sp)
    800047f2:	05078793          	addi	a5,a5,80
    800047f6:	639c                	ld	a5,0(a5)
    800047f8:	853e                	mv	a0,a5
    800047fa:	f1fff0ef          	jal	80004718 <prvSyscallExit>
    800047fe:	a03d                	j	8000482c <ulSyscallTrap+0x68>
    80004800:	67a2                	ld	a5,8(sp)
    80004802:	08878793          	addi	a5,a5,136
    80004806:	6398                	ld	a4,0(a5)
    80004808:	67a2                	ld	a5,8(sp)
    8000480a:	05078793          	addi	a5,a5,80
    8000480e:	638c                	ld	a1,0(a5)
    80004810:	67a2                	ld	a5,8(sp)
    80004812:	05878793          	addi	a5,a5,88
    80004816:	6390                	ld	a2,0(a5)
    80004818:	67a2                	ld	a5,8(sp)
    8000481a:	06078793          	addi	a5,a5,96
    8000481e:	639c                	ld	a5,0(a5)
    80004820:	86be                	mv	a3,a5
    80004822:	853a                	mv	a0,a4
    80004824:	e87ff0ef          	jal	800046aa <prvSyscallToHost>
    80004828:	87aa                	mv	a5,a0
    8000482a:	f43e                	sd	a5,40(sp)
    8000482c:	67a2                	ld	a5,8(sp)
    8000482e:	05078793          	addi	a5,a5,80
    80004832:	7722                	ld	a4,40(sp)
    80004834:	e398                	sd	a4,0(a5)
    80004836:	67c2                	ld	a5,16(sp)
    80004838:	0791                	addi	a5,a5,4
    8000483a:	853e                	mv	a0,a5
    8000483c:	70e2                	ld	ra,56(sp)
    8000483e:	6121                	addi	sp,sp,64
    80004840:	8082                	ret

0000000080004842 <putchar>:
    80004842:	1101                	addi	sp,sp,-32
    80004844:	ec06                	sd	ra,24(sp)
    80004846:	87aa                	mv	a5,a0
    80004848:	c63e                	sw	a5,12(sp)
    8000484a:	00035797          	auipc	a5,0x35
    8000484e:	ff678793          	addi	a5,a5,-10 # 80039840 <buflen.2>
    80004852:	439c                	lw	a5,0(a5)
    80004854:	0017871b          	addiw	a4,a5,1
    80004858:	0007069b          	sext.w	a3,a4
    8000485c:	00035717          	auipc	a4,0x35
    80004860:	fe470713          	addi	a4,a4,-28 # 80039840 <buflen.2>
    80004864:	c314                	sw	a3,0(a4)
    80004866:	4732                	lw	a4,12(sp)
    80004868:	0ff77713          	zext.b	a4,a4
    8000486c:	00035697          	auipc	a3,0x35
    80004870:	01468693          	addi	a3,a3,20 # 80039880 <buf.1>
    80004874:	97b6                	add	a5,a5,a3
    80004876:	00e78023          	sb	a4,0(a5)
    8000487a:	47b2                	lw	a5,12(sp)
    8000487c:	0007871b          	sext.w	a4,a5
    80004880:	47a9                	li	a5,10
    80004882:	00f70c63          	beq	a4,a5,8000489a <putchar+0x58>
    80004886:	00035797          	auipc	a5,0x35
    8000488a:	fba78793          	addi	a5,a5,-70 # 80039840 <buflen.2>
    8000488e:	439c                	lw	a5,0(a5)
    80004890:	873e                	mv	a4,a5
    80004892:	04000793          	li	a5,64
    80004896:	02f71863          	bne	a4,a5,800048c6 <putchar+0x84>
    8000489a:	00035717          	auipc	a4,0x35
    8000489e:	fe670713          	addi	a4,a4,-26 # 80039880 <buf.1>
    800048a2:	00035797          	auipc	a5,0x35
    800048a6:	f9e78793          	addi	a5,a5,-98 # 80039840 <buflen.2>
    800048aa:	439c                	lw	a5,0(a5)
    800048ac:	86be                	mv	a3,a5
    800048ae:	863a                	mv	a2,a4
    800048b0:	4585                	li	a1,1
    800048b2:	04000513          	li	a0,64
    800048b6:	eb1ff0ef          	jal	80004766 <syscall>
    800048ba:	00035797          	auipc	a5,0x35
    800048be:	f8678793          	addi	a5,a5,-122 # 80039840 <buflen.2>
    800048c2:	0007a023          	sw	zero,0(a5)
    800048c6:	4781                	li	a5,0
    800048c8:	853e                	mv	a0,a5
    800048ca:	60e2                	ld	ra,24(sp)
    800048cc:	6105                	addi	sp,sp,32
    800048ce:	8082                	ret

00000000800048d0 <printnum>:
    800048d0:	714d                	addi	sp,sp,-336
    800048d2:	e686                	sd	ra,328(sp)
    800048d4:	f42a                	sd	a0,40(sp)
    800048d6:	f02e                	sd	a1,32(sp)
    800048d8:	ec32                	sd	a2,24(sp)
    800048da:	8636                	mv	a2,a3
    800048dc:	86ba                	mv	a3,a4
    800048de:	873e                	mv	a4,a5
    800048e0:	87b2                	mv	a5,a2
    800048e2:	ca3e                	sw	a5,20(sp)
    800048e4:	87b6                	mv	a5,a3
    800048e6:	c83e                	sw	a5,16(sp)
    800048e8:	87ba                	mv	a5,a4
    800048ea:	c63e                	sw	a5,12(sp)
    800048ec:	12012e23          	sw	zero,316(sp)
    800048f0:	01416783          	lwu	a5,20(sp)
    800048f4:	6762                	ld	a4,24(sp)
    800048f6:	02f776b3          	remu	a3,a4,a5
    800048fa:	13c12783          	lw	a5,316(sp)
    800048fe:	0017871b          	addiw	a4,a5,1
    80004902:	12e12e23          	sw	a4,316(sp)
    80004906:	0006871b          	sext.w	a4,a3
    8000490a:	078a                	slli	a5,a5,0x2
    8000490c:	14078793          	addi	a5,a5,320
    80004910:	978a                	add	a5,a5,sp
    80004912:	eee7ac23          	sw	a4,-264(a5)
    80004916:	01416783          	lwu	a5,20(sp)
    8000491a:	6762                	ld	a4,24(sp)
    8000491c:	00f76963          	bltu	a4,a5,8000492e <printnum+0x5e>
    80004920:	01416783          	lwu	a5,20(sp)
    80004924:	6762                	ld	a4,24(sp)
    80004926:	02f757b3          	divu	a5,a4,a5
    8000492a:	ec3e                	sd	a5,24(sp)
    8000492c:	b7d1                	j	800048f0 <printnum+0x20>
    8000492e:	0001                	nop
    80004930:	a031                	j	8000493c <printnum+0x6c>
    80004932:	4732                	lw	a4,12(sp)
    80004934:	77a2                	ld	a5,40(sp)
    80004936:	7582                	ld	a1,32(sp)
    80004938:	853a                	mv	a0,a4
    8000493a:	9782                	jalr	a5
    8000493c:	47c2                	lw	a5,16(sp)
    8000493e:	fff7871b          	addiw	a4,a5,-1
    80004942:	c83a                	sw	a4,16(sp)
    80004944:	13c12703          	lw	a4,316(sp)
    80004948:	2701                	sext.w	a4,a4
    8000494a:	fef744e3          	blt	a4,a5,80004932 <printnum+0x62>
    8000494e:	a091                	j	80004992 <printnum+0xc2>
    80004950:	13c12783          	lw	a5,316(sp)
    80004954:	078a                	slli	a5,a5,0x2
    80004956:	14078793          	addi	a5,a5,320
    8000495a:	978a                	add	a5,a5,sp
    8000495c:	ef87a703          	lw	a4,-264(a5)
    80004960:	13c12783          	lw	a5,316(sp)
    80004964:	078a                	slli	a5,a5,0x2
    80004966:	14078793          	addi	a5,a5,320
    8000496a:	978a                	add	a5,a5,sp
    8000496c:	ef87a783          	lw	a5,-264(a5)
    80004970:	86be                	mv	a3,a5
    80004972:	47a5                	li	a5,9
    80004974:	00d7f563          	bgeu	a5,a3,8000497e <printnum+0xae>
    80004978:	05700793          	li	a5,87
    8000497c:	a019                	j	80004982 <printnum+0xb2>
    8000497e:	03000793          	li	a5,48
    80004982:	9fb9                	addw	a5,a5,a4
    80004984:	2781                	sext.w	a5,a5
    80004986:	0007871b          	sext.w	a4,a5
    8000498a:	77a2                	ld	a5,40(sp)
    8000498c:	7582                	ld	a1,32(sp)
    8000498e:	853a                	mv	a0,a4
    80004990:	9782                	jalr	a5
    80004992:	13c12783          	lw	a5,316(sp)
    80004996:	fff7871b          	addiw	a4,a5,-1
    8000499a:	12e12e23          	sw	a4,316(sp)
    8000499e:	faf049e3          	bgtz	a5,80004950 <printnum+0x80>
    800049a2:	0001                	nop
    800049a4:	0001                	nop
    800049a6:	60b6                	ld	ra,328(sp)
    800049a8:	6171                	addi	sp,sp,336
    800049aa:	8082                	ret

00000000800049ac <getuint>:
    800049ac:	1141                	addi	sp,sp,-16
    800049ae:	e42a                	sd	a0,8(sp)
    800049b0:	87ae                	mv	a5,a1
    800049b2:	c23e                	sw	a5,4(sp)
    800049b4:	4792                	lw	a5,4(sp)
    800049b6:	0007871b          	sext.w	a4,a5
    800049ba:	4785                	li	a5,1
    800049bc:	00e7da63          	bge	a5,a4,800049d0 <getuint+0x24>
    800049c0:	67a2                	ld	a5,8(sp)
    800049c2:	639c                	ld	a5,0(a5)
    800049c4:	00878693          	addi	a3,a5,8
    800049c8:	6722                	ld	a4,8(sp)
    800049ca:	e314                	sd	a3,0(a4)
    800049cc:	639c                	ld	a5,0(a5)
    800049ce:	a02d                	j	800049f8 <getuint+0x4c>
    800049d0:	4792                	lw	a5,4(sp)
    800049d2:	2781                	sext.w	a5,a5
    800049d4:	cb89                	beqz	a5,800049e6 <getuint+0x3a>
    800049d6:	67a2                	ld	a5,8(sp)
    800049d8:	639c                	ld	a5,0(a5)
    800049da:	00878693          	addi	a3,a5,8
    800049de:	6722                	ld	a4,8(sp)
    800049e0:	e314                	sd	a3,0(a4)
    800049e2:	639c                	ld	a5,0(a5)
    800049e4:	a811                	j	800049f8 <getuint+0x4c>
    800049e6:	67a2                	ld	a5,8(sp)
    800049e8:	639c                	ld	a5,0(a5)
    800049ea:	00878693          	addi	a3,a5,8
    800049ee:	6722                	ld	a4,8(sp)
    800049f0:	e314                	sd	a3,0(a4)
    800049f2:	439c                	lw	a5,0(a5)
    800049f4:	1782                	slli	a5,a5,0x20
    800049f6:	9381                	srli	a5,a5,0x20
    800049f8:	853e                	mv	a0,a5
    800049fa:	0141                	addi	sp,sp,16
    800049fc:	8082                	ret

00000000800049fe <getint>:
    800049fe:	1141                	addi	sp,sp,-16
    80004a00:	e42a                	sd	a0,8(sp)
    80004a02:	87ae                	mv	a5,a1
    80004a04:	c23e                	sw	a5,4(sp)
    80004a06:	4792                	lw	a5,4(sp)
    80004a08:	0007871b          	sext.w	a4,a5
    80004a0c:	4785                	li	a5,1
    80004a0e:	00e7da63          	bge	a5,a4,80004a22 <getint+0x24>
    80004a12:	67a2                	ld	a5,8(sp)
    80004a14:	639c                	ld	a5,0(a5)
    80004a16:	00878693          	addi	a3,a5,8
    80004a1a:	6722                	ld	a4,8(sp)
    80004a1c:	e314                	sd	a3,0(a4)
    80004a1e:	639c                	ld	a5,0(a5)
    80004a20:	a01d                	j	80004a46 <getint+0x48>
    80004a22:	4792                	lw	a5,4(sp)
    80004a24:	2781                	sext.w	a5,a5
    80004a26:	cb89                	beqz	a5,80004a38 <getint+0x3a>
    80004a28:	67a2                	ld	a5,8(sp)
    80004a2a:	639c                	ld	a5,0(a5)
    80004a2c:	00878693          	addi	a3,a5,8
    80004a30:	6722                	ld	a4,8(sp)
    80004a32:	e314                	sd	a3,0(a4)
    80004a34:	639c                	ld	a5,0(a5)
    80004a36:	a801                	j	80004a46 <getint+0x48>
    80004a38:	67a2                	ld	a5,8(sp)
    80004a3a:	639c                	ld	a5,0(a5)
    80004a3c:	00878693          	addi	a3,a5,8
    80004a40:	6722                	ld	a4,8(sp)
    80004a42:	e314                	sd	a3,0(a4)
    80004a44:	439c                	lw	a5,0(a5)
    80004a46:	853e                	mv	a0,a5
    80004a48:	0141                	addi	sp,sp,16
    80004a4a:	8082                	ret

0000000080004a4c <vFormatPrintString>:
    80004a4c:	7159                	addi	sp,sp,-112
    80004a4e:	f486                	sd	ra,104(sp)
    80004a50:	f0a2                	sd	s0,96(sp)
    80004a52:	eca6                	sd	s1,88(sp)
    80004a54:	ec2a                	sd	a0,24(sp)
    80004a56:	e82e                	sd	a1,16(sp)
    80004a58:	e432                	sd	a2,8(sp)
    80004a5a:	e036                	sd	a3,0(sp)
    80004a5c:	a811                	j	80004a70 <vFormatPrintString+0x24>
    80004a5e:	26040f63          	beqz	s0,80004cdc <vFormatPrintString+0x290>
    80004a62:	67a2                	ld	a5,8(sp)
    80004a64:	0785                	addi	a5,a5,1
    80004a66:	e43e                	sd	a5,8(sp)
    80004a68:	67e2                	ld	a5,24(sp)
    80004a6a:	65c2                	ld	a1,16(sp)
    80004a6c:	8522                	mv	a0,s0
    80004a6e:	9782                	jalr	a5
    80004a70:	67a2                	ld	a5,8(sp)
    80004a72:	0007c783          	lbu	a5,0(a5)
    80004a76:	0007841b          	sext.w	s0,a5
    80004a7a:	8722                	mv	a4,s0
    80004a7c:	02500793          	li	a5,37
    80004a80:	fcf71fe3          	bne	a4,a5,80004a5e <vFormatPrintString+0x12>
    80004a84:	67a2                	ld	a5,8(sp)
    80004a86:	0785                	addi	a5,a5,1
    80004a88:	e43e                	sd	a5,8(sp)
    80004a8a:	67a2                	ld	a5,8(sp)
    80004a8c:	f43e                	sd	a5,40(sp)
    80004a8e:	02000793          	li	a5,32
    80004a92:	02f10ba3          	sb	a5,55(sp)
    80004a96:	57fd                	li	a5,-1
    80004a98:	de3e                	sw	a5,60(sp)
    80004a9a:	57fd                	li	a5,-1
    80004a9c:	dc3e                	sw	a5,56(sp)
    80004a9e:	c082                	sw	zero,64(sp)
    80004aa0:	a031                	j	80004aac <vFormatPrintString+0x60>
    80004aa2:	0001                	nop
    80004aa4:	a021                	j	80004aac <vFormatPrintString+0x60>
    80004aa6:	0001                	nop
    80004aa8:	a011                	j	80004aac <vFormatPrintString+0x60>
    80004aaa:	0001                	nop
    80004aac:	67a2                	ld	a5,8(sp)
    80004aae:	00178713          	addi	a4,a5,1
    80004ab2:	e43a                	sd	a4,8(sp)
    80004ab4:	0007c783          	lbu	a5,0(a5)
    80004ab8:	0007841b          	sext.w	s0,a5
    80004abc:	fdd4069b          	addiw	a3,s0,-35
    80004ac0:	0006871b          	sext.w	a4,a3
    80004ac4:	05500793          	li	a5,85
    80004ac8:	20e7e163          	bltu	a5,a4,80004cca <vFormatPrintString+0x27e>
    80004acc:	02069793          	slli	a5,a3,0x20
    80004ad0:	9381                	srli	a5,a5,0x20
    80004ad2:	00279713          	slli	a4,a5,0x2
    80004ad6:	0001b797          	auipc	a5,0x1b
    80004ada:	5ba78793          	addi	a5,a5,1466 # 80020090 <__rodata_start+0x90>
    80004ade:	97ba                	add	a5,a5,a4
    80004ae0:	439c                	lw	a5,0(a5)
    80004ae2:	0007871b          	sext.w	a4,a5
    80004ae6:	0001b797          	auipc	a5,0x1b
    80004aea:	5aa78793          	addi	a5,a5,1450 # 80020090 <__rodata_start+0x90>
    80004aee:	97ba                	add	a5,a5,a4
    80004af0:	8782                	jr	a5
    80004af2:	02d00793          	li	a5,45
    80004af6:	02f10ba3          	sb	a5,55(sp)
    80004afa:	bf4d                	j	80004aac <vFormatPrintString+0x60>
    80004afc:	03000793          	li	a5,48
    80004b00:	02f10ba3          	sb	a5,55(sp)
    80004b04:	b765                	j	80004aac <vFormatPrintString+0x60>
    80004b06:	dc02                	sw	zero,56(sp)
    80004b08:	57e2                	lw	a5,56(sp)
    80004b0a:	873e                	mv	a4,a5
    80004b0c:	87ba                	mv	a5,a4
    80004b0e:	0027979b          	slliw	a5,a5,0x2
    80004b12:	9fb9                	addw	a5,a5,a4
    80004b14:	0017979b          	slliw	a5,a5,0x1
    80004b18:	2781                	sext.w	a5,a5
    80004b1a:	9fa1                	addw	a5,a5,s0
    80004b1c:	2781                	sext.w	a5,a5
    80004b1e:	fd07879b          	addiw	a5,a5,-48
    80004b22:	dc3e                	sw	a5,56(sp)
    80004b24:	67a2                	ld	a5,8(sp)
    80004b26:	0007c783          	lbu	a5,0(a5)
    80004b2a:	0007841b          	sext.w	s0,a5
    80004b2e:	8722                	mv	a4,s0
    80004b30:	02f00793          	li	a5,47
    80004b34:	02e7d863          	bge	a5,a4,80004b64 <vFormatPrintString+0x118>
    80004b38:	8722                	mv	a4,s0
    80004b3a:	03900793          	li	a5,57
    80004b3e:	02e7c363          	blt	a5,a4,80004b64 <vFormatPrintString+0x118>
    80004b42:	67a2                	ld	a5,8(sp)
    80004b44:	0785                	addi	a5,a5,1
    80004b46:	e43e                	sd	a5,8(sp)
    80004b48:	b7c1                	j	80004b08 <vFormatPrintString+0xbc>
    80004b4a:	6782                	ld	a5,0(sp)
    80004b4c:	00878713          	addi	a4,a5,8
    80004b50:	e03a                	sd	a4,0(sp)
    80004b52:	439c                	lw	a5,0(a5)
    80004b54:	dc3e                	sw	a5,56(sp)
    80004b56:	a801                	j	80004b66 <vFormatPrintString+0x11a>
    80004b58:	57f2                	lw	a5,60(sp)
    80004b5a:	2781                	sext.w	a5,a5
    80004b5c:	f407d5e3          	bgez	a5,80004aa6 <vFormatPrintString+0x5a>
    80004b60:	de02                	sw	zero,60(sp)
    80004b62:	b791                	j	80004aa6 <vFormatPrintString+0x5a>
    80004b64:	0001                	nop
    80004b66:	57f2                	lw	a5,60(sp)
    80004b68:	2781                	sext.w	a5,a5
    80004b6a:	f407d0e3          	bgez	a5,80004aaa <vFormatPrintString+0x5e>
    80004b6e:	57e2                	lw	a5,56(sp)
    80004b70:	de3e                	sw	a5,60(sp)
    80004b72:	57fd                	li	a5,-1
    80004b74:	dc3e                	sw	a5,56(sp)
    80004b76:	bf15                	j	80004aaa <vFormatPrintString+0x5e>
    80004b78:	4786                	lw	a5,64(sp)
    80004b7a:	2785                	addiw	a5,a5,1
    80004b7c:	c0be                	sw	a5,64(sp)
    80004b7e:	b73d                	j	80004aac <vFormatPrintString+0x60>
    80004b80:	6782                	ld	a5,0(sp)
    80004b82:	00878713          	addi	a4,a5,8
    80004b86:	e03a                	sd	a4,0(sp)
    80004b88:	4398                	lw	a4,0(a5)
    80004b8a:	67e2                	ld	a5,24(sp)
    80004b8c:	65c2                	ld	a1,16(sp)
    80004b8e:	853a                	mv	a0,a4
    80004b90:	9782                	jalr	a5
    80004b92:	a2a1                	j	80004cda <vFormatPrintString+0x28e>
    80004b94:	6782                	ld	a5,0(sp)
    80004b96:	00878713          	addi	a4,a5,8
    80004b9a:	e03a                	sd	a4,0(sp)
    80004b9c:	6384                	ld	s1,0(a5)
    80004b9e:	e489                	bnez	s1,80004ba8 <vFormatPrintString+0x15c>
    80004ba0:	0001b497          	auipc	s1,0x1b
    80004ba4:	4e848493          	addi	s1,s1,1256 # 80020088 <__rodata_start+0x88>
    80004ba8:	57f2                	lw	a5,60(sp)
    80004baa:	2781                	sext.w	a5,a5
    80004bac:	04f05f63          	blez	a5,80004c0a <vFormatPrintString+0x1be>
    80004bb0:	03714783          	lbu	a5,55(sp)
    80004bb4:	0ff7f713          	zext.b	a4,a5
    80004bb8:	02d00793          	li	a5,45
    80004bbc:	04f70763          	beq	a4,a5,80004c0a <vFormatPrintString+0x1be>
    80004bc0:	57e2                	lw	a5,56(sp)
    80004bc2:	85be                	mv	a1,a5
    80004bc4:	8526                	mv	a0,s1
    80004bc6:	238010ef          	jal	80005dfe <strnlen>
    80004bca:	87aa                	mv	a5,a0
    80004bcc:	5772                	lw	a4,60(sp)
    80004bce:	2781                	sext.w	a5,a5
    80004bd0:	40f707bb          	subw	a5,a4,a5
    80004bd4:	2781                	sext.w	a5,a5
    80004bd6:	de3e                	sw	a5,60(sp)
    80004bd8:	a821                	j	80004bf0 <vFormatPrintString+0x1a4>
    80004bda:	03714783          	lbu	a5,55(sp)
    80004bde:	0007871b          	sext.w	a4,a5
    80004be2:	67e2                	ld	a5,24(sp)
    80004be4:	65c2                	ld	a1,16(sp)
    80004be6:	853a                	mv	a0,a4
    80004be8:	9782                	jalr	a5
    80004bea:	57f2                	lw	a5,60(sp)
    80004bec:	37fd                	addiw	a5,a5,-1
    80004bee:	de3e                	sw	a5,60(sp)
    80004bf0:	57f2                	lw	a5,60(sp)
    80004bf2:	2781                	sext.w	a5,a5
    80004bf4:	fef043e3          	bgtz	a5,80004bda <vFormatPrintString+0x18e>
    80004bf8:	a809                	j	80004c0a <vFormatPrintString+0x1be>
    80004bfa:	67e2                	ld	a5,24(sp)
    80004bfc:	65c2                	ld	a1,16(sp)
    80004bfe:	8522                	mv	a0,s0
    80004c00:	9782                	jalr	a5
    80004c02:	0485                	addi	s1,s1,1
    80004c04:	57f2                	lw	a5,60(sp)
    80004c06:	37fd                	addiw	a5,a5,-1
    80004c08:	de3e                	sw	a5,60(sp)
    80004c0a:	0004c783          	lbu	a5,0(s1)
    80004c0e:	0007841b          	sext.w	s0,a5
    80004c12:	c40d                	beqz	s0,80004c3c <vFormatPrintString+0x1f0>
    80004c14:	57e2                	lw	a5,56(sp)
    80004c16:	2781                	sext.w	a5,a5
    80004c18:	fe07c1e3          	bltz	a5,80004bfa <vFormatPrintString+0x1ae>
    80004c1c:	57e2                	lw	a5,56(sp)
    80004c1e:	37fd                	addiw	a5,a5,-1
    80004c20:	dc3e                	sw	a5,56(sp)
    80004c22:	57e2                	lw	a5,56(sp)
    80004c24:	2781                	sext.w	a5,a5
    80004c26:	fc07dae3          	bgez	a5,80004bfa <vFormatPrintString+0x1ae>
    80004c2a:	a809                	j	80004c3c <vFormatPrintString+0x1f0>
    80004c2c:	67e2                	ld	a5,24(sp)
    80004c2e:	65c2                	ld	a1,16(sp)
    80004c30:	02000513          	li	a0,32
    80004c34:	9782                	jalr	a5
    80004c36:	57f2                	lw	a5,60(sp)
    80004c38:	37fd                	addiw	a5,a5,-1
    80004c3a:	de3e                	sw	a5,60(sp)
    80004c3c:	57f2                	lw	a5,60(sp)
    80004c3e:	2781                	sext.w	a5,a5
    80004c40:	fef046e3          	bgtz	a5,80004c2c <vFormatPrintString+0x1e0>
    80004c44:	a859                	j	80004cda <vFormatPrintString+0x28e>
    80004c46:	4706                	lw	a4,64(sp)
    80004c48:	878a                	mv	a5,sp
    80004c4a:	85ba                	mv	a1,a4
    80004c4c:	853e                	mv	a0,a5
    80004c4e:	db1ff0ef          	jal	800049fe <getint>
    80004c52:	87aa                	mv	a5,a0
    80004c54:	e4be                	sd	a5,72(sp)
    80004c56:	67a6                	ld	a5,72(sp)
    80004c58:	0007db63          	bgez	a5,80004c6e <vFormatPrintString+0x222>
    80004c5c:	67e2                	ld	a5,24(sp)
    80004c5e:	65c2                	ld	a1,16(sp)
    80004c60:	02d00513          	li	a0,45
    80004c64:	9782                	jalr	a5
    80004c66:	67a6                	ld	a5,72(sp)
    80004c68:	40f007b3          	neg	a5,a5
    80004c6c:	e4be                	sd	a5,72(sp)
    80004c6e:	47a9                	li	a5,10
    80004c70:	c2be                	sw	a5,68(sp)
    80004c72:	a825                	j	80004caa <vFormatPrintString+0x25e>
    80004c74:	47a9                	li	a5,10
    80004c76:	c2be                	sw	a5,68(sp)
    80004c78:	a015                	j	80004c9c <vFormatPrintString+0x250>
    80004c7a:	47a1                	li	a5,8
    80004c7c:	c2be                	sw	a5,68(sp)
    80004c7e:	a839                	j	80004c9c <vFormatPrintString+0x250>
    80004c80:	4785                	li	a5,1
    80004c82:	c0be                	sw	a5,64(sp)
    80004c84:	67e2                	ld	a5,24(sp)
    80004c86:	65c2                	ld	a1,16(sp)
    80004c88:	03000513          	li	a0,48
    80004c8c:	9782                	jalr	a5
    80004c8e:	67e2                	ld	a5,24(sp)
    80004c90:	65c2                	ld	a1,16(sp)
    80004c92:	07800513          	li	a0,120
    80004c96:	9782                	jalr	a5
    80004c98:	47c1                	li	a5,16
    80004c9a:	c2be                	sw	a5,68(sp)
    80004c9c:	4706                	lw	a4,64(sp)
    80004c9e:	878a                	mv	a5,sp
    80004ca0:	85ba                	mv	a1,a4
    80004ca2:	853e                	mv	a0,a5
    80004ca4:	d09ff0ef          	jal	800049ac <getuint>
    80004ca8:	e4aa                	sd	a0,72(sp)
    80004caa:	4696                	lw	a3,68(sp)
    80004cac:	03714783          	lbu	a5,55(sp)
    80004cb0:	2781                	sext.w	a5,a5
    80004cb2:	5772                	lw	a4,60(sp)
    80004cb4:	6626                	ld	a2,72(sp)
    80004cb6:	65c2                	ld	a1,16(sp)
    80004cb8:	6562                	ld	a0,24(sp)
    80004cba:	c17ff0ef          	jal	800048d0 <printnum>
    80004cbe:	a831                	j	80004cda <vFormatPrintString+0x28e>
    80004cc0:	67e2                	ld	a5,24(sp)
    80004cc2:	65c2                	ld	a1,16(sp)
    80004cc4:	8522                	mv	a0,s0
    80004cc6:	9782                	jalr	a5
    80004cc8:	a809                	j	80004cda <vFormatPrintString+0x28e>
    80004cca:	67e2                	ld	a5,24(sp)
    80004ccc:	65c2                	ld	a1,16(sp)
    80004cce:	02500513          	li	a0,37
    80004cd2:	9782                	jalr	a5
    80004cd4:	77a2                	ld	a5,40(sp)
    80004cd6:	e43e                	sd	a5,8(sp)
    80004cd8:	0001                	nop
    80004cda:	bb59                	j	80004a70 <vFormatPrintString+0x24>
    80004cdc:	0001                	nop
    80004cde:	70a6                	ld	ra,104(sp)
    80004ce0:	7406                	ld	s0,96(sp)
    80004ce2:	64e6                	ld	s1,88(sp)
    80004ce4:	6165                	addi	sp,sp,112
    80004ce6:	8082                	ret

0000000080004ce8 <exit>:
    80004ce8:	1101                	addi	sp,sp,-32
    80004cea:	ec06                	sd	ra,24(sp)
    80004cec:	87aa                	mv	a5,a0
    80004cee:	c63e                	sw	a5,12(sp)
    80004cf0:	47b2                	lw	a5,12(sp)
    80004cf2:	4681                	li	a3,0
    80004cf4:	4601                	li	a2,0
    80004cf6:	85be                	mv	a1,a5
    80004cf8:	05d00513          	li	a0,93
    80004cfc:	a6bff0ef          	jal	80004766 <syscall>
    80004d00:	0001                	nop
    80004d02:	bffd                	j	80004d00 <exit+0x18>

0000000080004d04 <printf>:
    80004d04:	7159                	addi	sp,sp,-112
    80004d06:	f406                	sd	ra,40(sp)
    80004d08:	e42a                	sd	a0,8(sp)
    80004d0a:	fc2e                	sd	a1,56(sp)
    80004d0c:	e0b2                	sd	a2,64(sp)
    80004d0e:	e4b6                	sd	a3,72(sp)
    80004d10:	e8ba                	sd	a4,80(sp)
    80004d12:	ecbe                	sd	a5,88(sp)
    80004d14:	f0c2                	sd	a6,96(sp)
    80004d16:	f4c6                	sd	a7,104(sp)
    80004d18:	189c                	addi	a5,sp,112
    80004d1a:	e03e                	sd	a5,0(sp)
    80004d1c:	6782                	ld	a5,0(sp)
    80004d1e:	fc878793          	addi	a5,a5,-56
    80004d22:	ec3e                	sd	a5,24(sp)
    80004d24:	67e2                	ld	a5,24(sp)
    80004d26:	86be                	mv	a3,a5
    80004d28:	6622                	ld	a2,8(sp)
    80004d2a:	4581                	li	a1,0
    80004d2c:	00000517          	auipc	a0,0x0
    80004d30:	b1650513          	addi	a0,a0,-1258 # 80004842 <putchar>
    80004d34:	d19ff0ef          	jal	80004a4c <vFormatPrintString>
    80004d38:	4781                	li	a5,0
    80004d3a:	853e                	mv	a0,a5
    80004d3c:	70a2                	ld	ra,40(sp)
    80004d3e:	6165                	addi	sp,sp,112
    80004d40:	8082                	ret

0000000080004d42 <sprintf_putch.0>:
    80004d42:	7179                	addi	sp,sp,-48
    80004d44:	87aa                	mv	a5,a0
    80004d46:	e82e                	sd	a1,16(sp)
    80004d48:	ce3e                	sw	a5,28(sp)
    80004d4a:	e41e                	sd	t2,8(sp)
    80004d4c:	67c2                	ld	a5,16(sp)
    80004d4e:	f43e                	sd	a5,40(sp)
    80004d50:	77a2                	ld	a5,40(sp)
    80004d52:	639c                	ld	a5,0(a5)
    80004d54:	4772                	lw	a4,28(sp)
    80004d56:	0ff77713          	zext.b	a4,a4
    80004d5a:	00e78023          	sb	a4,0(a5)
    80004d5e:	77a2                	ld	a5,40(sp)
    80004d60:	639c                	ld	a5,0(a5)
    80004d62:	00178713          	addi	a4,a5,1
    80004d66:	77a2                	ld	a5,40(sp)
    80004d68:	e398                	sd	a4,0(a5)
    80004d6a:	0001                	nop
    80004d6c:	6145                	addi	sp,sp,48
    80004d6e:	8082                	ret

0000000080004d70 <sprintf>:
    80004d70:	716d                	addi	sp,sp,-272
    80004d72:	ed86                	sd	ra,216(sp)
    80004d74:	ec2a                	sd	a0,24(sp)
    80004d76:	e82e                	sd	a1,16(sp)
    80004d78:	f1b2                	sd	a2,224(sp)
    80004d7a:	f5b6                	sd	a3,232(sp)
    80004d7c:	f9ba                	sd	a4,240(sp)
    80004d7e:	fdbe                	sd	a5,248(sp)
    80004d80:	e242                	sd	a6,256(sp)
    80004d82:	e646                	sd	a7,264(sp)
    80004d84:	0a1c                	addi	a5,sp,272
    80004d86:	e43e                	sd	a5,8(sp)
    80004d88:	67a2                	ld	a5,8(sp)
    80004d8a:	fd3e                	sd	a5,184(sp)
    80004d8c:	103c                	addi	a5,sp,40
    80004d8e:	1038                	addi	a4,sp,40
    80004d90:	39700693          	li	a3,919
    80004d94:	c394                	sw	a3,0(a5)
    80004d96:	0183b6b7          	lui	a3,0x183b
    80004d9a:	28368693          	addi	a3,a3,643 # 183b283 <_HEAP_SIZE+0x183a283>
    80004d9e:	c3d4                	sw	a3,4(a5)
    80004da0:	0103b6b7          	lui	a3,0x103b
    80004da4:	38368693          	addi	a3,a3,899 # 103b383 <_HEAP_SIZE+0x103a383>
    80004da8:	c794                	sw	a3,8(a5)
    80004daa:	000286b7          	lui	a3,0x28
    80004dae:	06768693          	addi	a3,a3,103 # 28067 <_HEAP_SIZE+0x27067>
    80004db2:	c7d4                	sw	a3,12(a5)
    80004db4:	eb98                	sd	a4,16(a5)
    80004db6:	00000717          	auipc	a4,0x0
    80004dba:	f8c70713          	addi	a4,a4,-116 # 80004d42 <sprintf_putch.0>
    80004dbe:	ef98                	sd	a4,24(a5)
    80004dc0:	0000100f          	fence.i
    80004dc4:	67e2                	ld	a5,24(sp)
    80004dc6:	e5be                	sd	a5,200(sp)
    80004dc8:	0a1c                	addi	a5,sp,272
    80004dca:	e43e                	sd	a5,8(sp)
    80004dcc:	67a2                	ld	a5,8(sp)
    80004dce:	fd078793          	addi	a5,a5,-48
    80004dd2:	e1be                	sd	a5,192(sp)
    80004dd4:	670e                	ld	a4,192(sp)
    80004dd6:	103c                	addi	a5,sp,40
    80004dd8:	853e                	mv	a0,a5
    80004dda:	083c                	addi	a5,sp,24
    80004ddc:	86ba                	mv	a3,a4
    80004dde:	6642                	ld	a2,16(sp)
    80004de0:	85be                	mv	a1,a5
    80004de2:	c6bff0ef          	jal	80004a4c <vFormatPrintString>
    80004de6:	67e2                	ld	a5,24(sp)
    80004de8:	00078023          	sb	zero,0(a5)
    80004dec:	6762                	ld	a4,24(sp)
    80004dee:	67ae                	ld	a5,200(sp)
    80004df0:	40f707b3          	sub	a5,a4,a5
    80004df4:	2781                	sext.w	a5,a5
    80004df6:	853e                	mv	a0,a5
    80004df8:	60ee                	ld	ra,216(sp)
    80004dfa:	6151                	addi	sp,sp,272
    80004dfc:	8082                	ret

0000000080004dfe <main>:
    80004dfe:	1101                	addi	sp,sp,-32
    80004e00:	ec06                	sd	ra,24(sp)
    80004e02:	e402                	sd	zero,8(sp)
    80004e04:	198000ef          	jal	80004f9c <vCreateBlockTimeTasks>
    80004e08:	00b000ef          	jal	80005612 <vStartCountingSemaphoreTasks>
    80004e0c:	315000ef          	jal	80005920 <vStartRecursiveMutexTasks>
    80004e10:	00000717          	auipc	a4,0x0
    80004e14:	08c70713          	addi	a4,a4,140 # 80004e9c <prvCheckTimerCallback>
    80004e18:	4681                	li	a3,0
    80004e1a:	4605                	li	a2,1
    80004e1c:	6785                	lui	a5,0x1
    80004e1e:	bb878593          	addi	a1,a5,-1096 # bb8 <_HEAP_SIZE-0x448>
    80004e22:	0001b517          	auipc	a0,0x1b
    80004e26:	3c650513          	addi	a0,a0,966 # 800201e8 <__rodata_start+0x1e8>
    80004e2a:	faefe0ef          	jal	800035d8 <xTimerCreate>
    80004e2e:	e42a                	sd	a0,8(sp)
    80004e30:	67a2                	ld	a5,8(sp)
    80004e32:	cf81                	beqz	a5,80004e4a <main+0x4c>
    80004e34:	ff9fc0ef          	jal	80001e2c <xTaskGetTickCount>
    80004e38:	87aa                	mv	a5,a0
    80004e3a:	2781                	sext.w	a5,a5
    80004e3c:	4701                	li	a4,0
    80004e3e:	4681                	li	a3,0
    80004e40:	863e                	mv	a2,a5
    80004e42:	4585                	li	a1,1
    80004e44:	6522                	ld	a0,8(sp)
    80004e46:	ffefe0ef          	jal	80003644 <xTimerGenericCommand>
    80004e4a:	4881                	li	a7,0
    80004e4c:	4801                	li	a6,0
    80004e4e:	4781                	li	a5,0
    80004e50:	4709                	li	a4,2
    80004e52:	4681                	li	a3,0
    80004e54:	3e800613          	li	a2,1000
    80004e58:	0001b597          	auipc	a1,0x1b
    80004e5c:	3a058593          	addi	a1,a1,928 # 800201f8 <__rodata_start+0x1f8>
    80004e60:	00000517          	auipc	a0,0x0
    80004e64:	10050513          	addi	a0,a0,256 # 80004f60 <vUartTestTask1>
    80004e68:	cf6fc0ef          	jal	8000135e <xTaskGenericCreate>
    80004e6c:	4881                	li	a7,0
    80004e6e:	4801                	li	a6,0
    80004e70:	4781                	li	a5,0
    80004e72:	4709                	li	a4,2
    80004e74:	4681                	li	a3,0
    80004e76:	3e800613          	li	a2,1000
    80004e7a:	0001b597          	auipc	a1,0x1b
    80004e7e:	38658593          	addi	a1,a1,902 # 80020200 <__rodata_start+0x200>
    80004e82:	00000517          	auipc	a0,0x0
    80004e86:	0fc50513          	addi	a0,a0,252 # 80004f7e <vUartTestTask2>
    80004e8a:	cd4fc0ef          	jal	8000135e <xTaskGenericCreate>
    80004e8e:	d91fc0ef          	jal	80001c1e <vTaskStartScheduler>
    80004e92:	4781                	li	a5,0
    80004e94:	853e                	mv	a0,a5
    80004e96:	60e2                	ld	ra,24(sp)
    80004e98:	6105                	addi	sp,sp,32
    80004e9a:	8082                	ret

0000000080004e9c <prvCheckTimerCallback>:
    80004e9c:	7179                	addi	sp,sp,-48
    80004e9e:	f406                	sd	ra,40(sp)
    80004ea0:	e42a                	sd	a0,8(sp)
    80004ea2:	ec02                	sd	zero,24(sp)
    80004ea4:	6f2000ef          	jal	80005596 <xAreBlockTimeTestTasksStillRunning>
    80004ea8:	872a                	mv	a4,a0
    80004eaa:	4785                	li	a5,1
    80004eac:	00f70c63          	beq	a4,a5,80004ec4 <prvCheckTimerCallback+0x28>
    80004eb0:	0001b517          	auipc	a0,0x1b
    80004eb4:	35850513          	addi	a0,a0,856 # 80020208 <__rodata_start+0x208>
    80004eb8:	e4dff0ef          	jal	80004d04 <printf>
    80004ebc:	67e2                	ld	a5,24(sp)
    80004ebe:	0027e793          	ori	a5,a5,2
    80004ec2:	ec3e                	sd	a5,24(sp)
    80004ec4:	1e1000ef          	jal	800058a4 <xAreCountingSemaphoreTasksStillRunning>
    80004ec8:	872a                	mv	a4,a0
    80004eca:	4785                	li	a5,1
    80004ecc:	00f70c63          	beq	a4,a5,80004ee4 <prvCheckTimerCallback+0x48>
    80004ed0:	0001b517          	auipc	a0,0x1b
    80004ed4:	36050513          	addi	a0,a0,864 # 80020230 <__rodata_start+0x230>
    80004ed8:	e2dff0ef          	jal	80004d04 <printf>
    80004edc:	67e2                	ld	a5,24(sp)
    80004ede:	0047e793          	ori	a5,a5,4
    80004ee2:	ec3e                	sd	a5,24(sp)
    80004ee4:	64b000ef          	jal	80005d2e <xAreRecursiveMutexTasksStillRunning>
    80004ee8:	872a                	mv	a4,a0
    80004eea:	4785                	li	a5,1
    80004eec:	00f70c63          	beq	a4,a5,80004f04 <prvCheckTimerCallback+0x68>
    80004ef0:	0001b517          	auipc	a0,0x1b
    80004ef4:	36850513          	addi	a0,a0,872 # 80020258 <__rodata_start+0x258>
    80004ef8:	e0dff0ef          	jal	80004d04 <printf>
    80004efc:	67e2                	ld	a5,24(sp)
    80004efe:	0087e793          	ori	a5,a5,8
    80004f02:	ec3e                	sd	a5,24(sp)
    80004f04:	67e2                	ld	a5,24(sp)
    80004f06:	cf99                	beqz	a5,80004f24 <prvCheckTimerCallback+0x88>
    80004f08:	0005ffb7          	lui	t6,0x5f
    80004f0c:	77ff8f9b          	addiw	t6,t6,1919 # 5f77f <_HEAP_SIZE+0x5e77f>
    80004f10:	0fb6                	slli	t6,t6,0xd
    80004f12:	eadf8f93          	addi	t6,t6,-339
    80004f16:	0001b517          	auipc	a0,0x1b
    80004f1a:	36a50513          	addi	a0,a0,874 # 80020280 <__rodata_start+0x280>
    80004f1e:	de7ff0ef          	jal	80004d04 <printf>
    80004f22:	a831                	j	80004f3e <prvCheckTimerCallback+0xa2>
    80004f24:	00038fb7          	lui	t6,0x38
    80004f28:	ab7f8f9b          	addiw	t6,t6,-1353 # 37ab7 <_HEAP_SIZE+0x36ab7>
    80004f2c:	0fba                	slli	t6,t6,0xe
    80004f2e:	eeff8f93          	addi	t6,t6,-273
    80004f32:	0001b517          	auipc	a0,0x1b
    80004f36:	35e50513          	addi	a0,a0,862 # 80020290 <__rodata_start+0x290>
    80004f3a:	dcbff0ef          	jal	80004d04 <printf>
    80004f3e:	0001                	nop
    80004f40:	70a2                	ld	ra,40(sp)
    80004f42:	6145                	addi	sp,sp,48
    80004f44:	8082                	ret

0000000080004f46 <vApplicationMallocFailedHook>:
    80004f46:	30047073          	csrci	mstatus,8
    80004f4a:	0001                	nop
    80004f4c:	bffd                	j	80004f4a <vApplicationMallocFailedHook+0x4>

0000000080004f4e <vApplicationIdleHook>:
    80004f4e:	0001                	nop
    80004f50:	8082                	ret

0000000080004f52 <vApplicationStackOverflowHook>:
    80004f52:	1141                	addi	sp,sp,-16
    80004f54:	e42a                	sd	a0,8(sp)
    80004f56:	e02e                	sd	a1,0(sp)
    80004f58:	30047073          	csrci	mstatus,8
    80004f5c:	0001                	nop
    80004f5e:	bffd                	j	80004f5c <vApplicationStackOverflowHook+0xa>

0000000080004f60 <vUartTestTask1>:
    80004f60:	1101                	addi	sp,sp,-32
    80004f62:	ec06                	sd	ra,24(sp)
    80004f64:	e42a                	sd	a0,8(sp)
    80004f66:	0001b517          	auipc	a0,0x1b
    80004f6a:	33a50513          	addi	a0,a0,826 # 800202a0 <__rodata_start+0x2a0>
    80004f6e:	d97ff0ef          	jal	80004d04 <printf>
    80004f72:	06400513          	li	a0,100
    80004f76:	f40fc0ef          	jal	800016b6 <vTaskDelay>
    80004f7a:	0001                	nop
    80004f7c:	b7ed                	j	80004f66 <vUartTestTask1+0x6>

0000000080004f7e <vUartTestTask2>:
    80004f7e:	1101                	addi	sp,sp,-32
    80004f80:	ec06                	sd	ra,24(sp)
    80004f82:	e42a                	sd	a0,8(sp)
    80004f84:	0001b517          	auipc	a0,0x1b
    80004f88:	32c50513          	addi	a0,a0,812 # 800202b0 <__rodata_start+0x2b0>
    80004f8c:	d79ff0ef          	jal	80004d04 <printf>
    80004f90:	03200513          	li	a0,50
    80004f94:	f22fc0ef          	jal	800016b6 <vTaskDelay>
    80004f98:	0001                	nop
    80004f9a:	b7ed                	j	80004f84 <vUartTestTask2+0x6>

0000000080004f9c <vCreateBlockTimeTasks>:
    80004f9c:	1141                	addi	sp,sp,-16
    80004f9e:	e406                	sd	ra,8(sp)
    80004fa0:	4601                	li	a2,0
    80004fa2:	45a1                	li	a1,8
    80004fa4:	4515                	li	a0,5
    80004fa6:	f9efb0ef          	jal	80000744 <xQueueGenericCreate>
    80004faa:	872a                	mv	a4,a0
    80004fac:	00035797          	auipc	a5,0x35
    80004fb0:	91478793          	addi	a5,a5,-1772 # 800398c0 <xTestQueue>
    80004fb4:	e398                	sd	a4,0(a5)
    80004fb6:	00035797          	auipc	a5,0x35
    80004fba:	90a78793          	addi	a5,a5,-1782 # 800398c0 <xTestQueue>
    80004fbe:	639c                	ld	a5,0(a5)
    80004fc0:	0001b597          	auipc	a1,0x1b
    80004fc4:	30058593          	addi	a1,a1,768 # 800202c0 <__rodata_start+0x2c0>
    80004fc8:	853e                	mv	a0,a5
    80004fca:	a96fc0ef          	jal	80001260 <vQueueAddToRegistry>
    80004fce:	4881                	li	a7,0
    80004fd0:	4801                	li	a6,0
    80004fd2:	4781                	li	a5,0
    80004fd4:	4709                	li	a4,2
    80004fd6:	4681                	li	a3,0
    80004fd8:	40000613          	li	a2,1024
    80004fdc:	0001b597          	auipc	a1,0x1b
    80004fe0:	2fc58593          	addi	a1,a1,764 # 800202d8 <__rodata_start+0x2d8>
    80004fe4:	00000517          	auipc	a0,0x0
    80004fe8:	03c50513          	addi	a0,a0,60 # 80005020 <vPrimaryBlockTimeTestTask>
    80004fec:	b72fc0ef          	jal	8000135e <xTaskGenericCreate>
    80004ff0:	4881                	li	a7,0
    80004ff2:	4801                	li	a6,0
    80004ff4:	00035797          	auipc	a5,0x35
    80004ff8:	8d478793          	addi	a5,a5,-1836 # 800398c8 <xSecondary>
    80004ffc:	4705                	li	a4,1
    80004ffe:	4681                	li	a3,0
    80005000:	40000613          	li	a2,1024
    80005004:	0001b597          	auipc	a1,0x1b
    80005008:	2dc58593          	addi	a1,a1,732 # 800202e0 <__rodata_start+0x2e0>
    8000500c:	00000517          	auipc	a0,0x0
    80005010:	43c50513          	addi	a0,a0,1084 # 80005448 <vSecondaryBlockTimeTestTask>
    80005014:	b4afc0ef          	jal	8000135e <xTaskGenericCreate>
    80005018:	0001                	nop
    8000501a:	60a2                	ld	ra,8(sp)
    8000501c:	0141                	addi	sp,sp,16
    8000501e:	8082                	ret

0000000080005020 <vPrimaryBlockTimeTestTask>:
    80005020:	7139                	addi	sp,sp,-64
    80005022:	fc06                	sd	ra,56(sp)
    80005024:	e42a                	sd	a0,8(sp)
    80005026:	ec02                	sd	zero,24(sp)
    80005028:	a069                	j	800050b2 <vPrimaryBlockTimeTestTask+0x92>
    8000502a:	67e2                	ld	a5,24(sp)
    8000502c:	2781                	sext.w	a5,a5
    8000502e:	4729                	li	a4,10
    80005030:	00f717bb          	sllw	a5,a4,a5
    80005034:	2781                	sext.w	a5,a5
    80005036:	d63e                	sw	a5,44(sp)
    80005038:	df5fc0ef          	jal	80001e2c <xTaskGetTickCount>
    8000503c:	87aa                	mv	a5,a0
    8000503e:	d43e                	sw	a5,40(sp)
    80005040:	00035797          	auipc	a5,0x35
    80005044:	88078793          	addi	a5,a5,-1920 # 800398c0 <xTestQueue>
    80005048:	639c                	ld	a5,0(a5)
    8000504a:	5632                	lw	a2,44(sp)
    8000504c:	0818                	addi	a4,sp,16
    8000504e:	4681                	li	a3,0
    80005050:	85ba                	mv	a1,a4
    80005052:	853e                	mv	a0,a5
    80005054:	c1bfb0ef          	jal	80000c6e <xQueueGenericReceive>
    80005058:	87aa                	mv	a5,a0
    8000505a:	c799                	beqz	a5,80005068 <vPrimaryBlockTimeTestTask+0x48>
    8000505c:	00035797          	auipc	a5,0x35
    80005060:	88478793          	addi	a5,a5,-1916 # 800398e0 <xErrorOccurred>
    80005064:	4705                	li	a4,1
    80005066:	e398                	sd	a4,0(a5)
    80005068:	dc5fc0ef          	jal	80001e2c <xTaskGetTickCount>
    8000506c:	87aa                	mv	a5,a0
    8000506e:	2781                	sext.w	a5,a5
    80005070:	5722                	lw	a4,40(sp)
    80005072:	9f99                	subw	a5,a5,a4
    80005074:	d23e                	sw	a5,36(sp)
    80005076:	5792                	lw	a5,36(sp)
    80005078:	873e                	mv	a4,a5
    8000507a:	57b2                	lw	a5,44(sp)
    8000507c:	2701                	sext.w	a4,a4
    8000507e:	2781                	sext.w	a5,a5
    80005080:	00f77863          	bgeu	a4,a5,80005090 <vPrimaryBlockTimeTestTask+0x70>
    80005084:	00035797          	auipc	a5,0x35
    80005088:	85c78793          	addi	a5,a5,-1956 # 800398e0 <xErrorOccurred>
    8000508c:	4705                	li	a4,1
    8000508e:	e398                	sd	a4,0(a5)
    80005090:	57b2                	lw	a5,44(sp)
    80005092:	27bd                	addiw	a5,a5,15
    80005094:	0007871b          	sext.w	a4,a5
    80005098:	5792                	lw	a5,36(sp)
    8000509a:	2781                	sext.w	a5,a5
    8000509c:	00f77863          	bgeu	a4,a5,800050ac <vPrimaryBlockTimeTestTask+0x8c>
    800050a0:	00035797          	auipc	a5,0x35
    800050a4:	84078793          	addi	a5,a5,-1984 # 800398e0 <xErrorOccurred>
    800050a8:	4705                	li	a4,1
    800050aa:	e398                	sd	a4,0(a5)
    800050ac:	67e2                	ld	a5,24(sp)
    800050ae:	0785                	addi	a5,a5,1
    800050b0:	ec3e                	sd	a5,24(sp)
    800050b2:	6762                	ld	a4,24(sp)
    800050b4:	4791                	li	a5,4
    800050b6:	f6e7dae3          	bge	a5,a4,8000502a <vPrimaryBlockTimeTestTask+0xa>
    800050ba:	ec02                	sd	zero,24(sp)
    800050bc:	a815                	j	800050f0 <vPrimaryBlockTimeTestTask+0xd0>
    800050be:	00035797          	auipc	a5,0x35
    800050c2:	80278793          	addi	a5,a5,-2046 # 800398c0 <xTestQueue>
    800050c6:	639c                	ld	a5,0(a5)
    800050c8:	0838                	addi	a4,sp,24
    800050ca:	4681                	li	a3,0
    800050cc:	4601                	li	a2,0
    800050ce:	85ba                	mv	a1,a4
    800050d0:	853e                	mv	a0,a5
    800050d2:	89dfb0ef          	jal	8000096e <xQueueGenericSend>
    800050d6:	872a                	mv	a4,a0
    800050d8:	4785                	li	a5,1
    800050da:	00f70863          	beq	a4,a5,800050ea <vPrimaryBlockTimeTestTask+0xca>
    800050de:	00035797          	auipc	a5,0x35
    800050e2:	80278793          	addi	a5,a5,-2046 # 800398e0 <xErrorOccurred>
    800050e6:	4705                	li	a4,1
    800050e8:	e398                	sd	a4,0(a5)
    800050ea:	67e2                	ld	a5,24(sp)
    800050ec:	0785                	addi	a5,a5,1
    800050ee:	ec3e                	sd	a5,24(sp)
    800050f0:	6762                	ld	a4,24(sp)
    800050f2:	4791                	li	a5,4
    800050f4:	fce7d5e3          	bge	a5,a4,800050be <vPrimaryBlockTimeTestTask+0x9e>
    800050f8:	ec02                	sd	zero,24(sp)
    800050fa:	a069                	j	80005184 <vPrimaryBlockTimeTestTask+0x164>
    800050fc:	67e2                	ld	a5,24(sp)
    800050fe:	2781                	sext.w	a5,a5
    80005100:	4729                	li	a4,10
    80005102:	00f717bb          	sllw	a5,a4,a5
    80005106:	2781                	sext.w	a5,a5
    80005108:	d63e                	sw	a5,44(sp)
    8000510a:	d23fc0ef          	jal	80001e2c <xTaskGetTickCount>
    8000510e:	87aa                	mv	a5,a0
    80005110:	d43e                	sw	a5,40(sp)
    80005112:	00034797          	auipc	a5,0x34
    80005116:	7ae78793          	addi	a5,a5,1966 # 800398c0 <xTestQueue>
    8000511a:	639c                	ld	a5,0(a5)
    8000511c:	5632                	lw	a2,44(sp)
    8000511e:	0838                	addi	a4,sp,24
    80005120:	4681                	li	a3,0
    80005122:	85ba                	mv	a1,a4
    80005124:	853e                	mv	a0,a5
    80005126:	849fb0ef          	jal	8000096e <xQueueGenericSend>
    8000512a:	87aa                	mv	a5,a0
    8000512c:	c799                	beqz	a5,8000513a <vPrimaryBlockTimeTestTask+0x11a>
    8000512e:	00034797          	auipc	a5,0x34
    80005132:	7b278793          	addi	a5,a5,1970 # 800398e0 <xErrorOccurred>
    80005136:	4705                	li	a4,1
    80005138:	e398                	sd	a4,0(a5)
    8000513a:	cf3fc0ef          	jal	80001e2c <xTaskGetTickCount>
    8000513e:	87aa                	mv	a5,a0
    80005140:	2781                	sext.w	a5,a5
    80005142:	5722                	lw	a4,40(sp)
    80005144:	9f99                	subw	a5,a5,a4
    80005146:	d23e                	sw	a5,36(sp)
    80005148:	5792                	lw	a5,36(sp)
    8000514a:	873e                	mv	a4,a5
    8000514c:	57b2                	lw	a5,44(sp)
    8000514e:	2701                	sext.w	a4,a4
    80005150:	2781                	sext.w	a5,a5
    80005152:	00f77863          	bgeu	a4,a5,80005162 <vPrimaryBlockTimeTestTask+0x142>
    80005156:	00034797          	auipc	a5,0x34
    8000515a:	78a78793          	addi	a5,a5,1930 # 800398e0 <xErrorOccurred>
    8000515e:	4705                	li	a4,1
    80005160:	e398                	sd	a4,0(a5)
    80005162:	57b2                	lw	a5,44(sp)
    80005164:	27bd                	addiw	a5,a5,15
    80005166:	0007871b          	sext.w	a4,a5
    8000516a:	5792                	lw	a5,36(sp)
    8000516c:	2781                	sext.w	a5,a5
    8000516e:	00f77863          	bgeu	a4,a5,8000517e <vPrimaryBlockTimeTestTask+0x15e>
    80005172:	00034797          	auipc	a5,0x34
    80005176:	76e78793          	addi	a5,a5,1902 # 800398e0 <xErrorOccurred>
    8000517a:	4705                	li	a4,1
    8000517c:	e398                	sd	a4,0(a5)
    8000517e:	67e2                	ld	a5,24(sp)
    80005180:	0785                	addi	a5,a5,1
    80005182:	ec3e                	sd	a5,24(sp)
    80005184:	6762                	ld	a4,24(sp)
    80005186:	4791                	li	a5,4
    80005188:	f6e7dae3          	bge	a5,a4,800050fc <vPrimaryBlockTimeTestTask+0xdc>
    8000518c:	00034797          	auipc	a5,0x34
    80005190:	75c78793          	addi	a5,a5,1884 # 800398e8 <xRunIndicator>
    80005194:	0007b023          	sd	zero,0(a5)
    80005198:	00034797          	auipc	a5,0x34
    8000519c:	73078793          	addi	a5,a5,1840 # 800398c8 <xSecondary>
    800051a0:	639c                	ld	a5,0(a5)
    800051a2:	853e                	mv	a0,a5
    800051a4:	907fc0ef          	jal	80001aaa <vTaskResume>
    800051a8:	a021                	j	800051b0 <vPrimaryBlockTimeTestTask+0x190>
    800051aa:	4551                	li	a0,20
    800051ac:	d0afc0ef          	jal	800016b6 <vTaskDelay>
    800051b0:	00034797          	auipc	a5,0x34
    800051b4:	73878793          	addi	a5,a5,1848 # 800398e8 <xRunIndicator>
    800051b8:	6398                	ld	a4,0(a5)
    800051ba:	05500793          	li	a5,85
    800051be:	fef716e3          	bne	a4,a5,800051aa <vPrimaryBlockTimeTestTask+0x18a>
    800051c2:	4551                	li	a0,20
    800051c4:	cf2fc0ef          	jal	800016b6 <vTaskDelay>
    800051c8:	00034797          	auipc	a5,0x34
    800051cc:	72078793          	addi	a5,a5,1824 # 800398e8 <xRunIndicator>
    800051d0:	0007b023          	sd	zero,0(a5)
    800051d4:	ec02                	sd	zero,24(sp)
    800051d6:	a0c1                	j	80005296 <vPrimaryBlockTimeTestTask+0x276>
    800051d8:	00034797          	auipc	a5,0x34
    800051dc:	6e878793          	addi	a5,a5,1768 # 800398c0 <xTestQueue>
    800051e0:	639c                	ld	a5,0(a5)
    800051e2:	0818                	addi	a4,sp,16
    800051e4:	4681                	li	a3,0
    800051e6:	4601                	li	a2,0
    800051e8:	85ba                	mv	a1,a4
    800051ea:	853e                	mv	a0,a5
    800051ec:	a83fb0ef          	jal	80000c6e <xQueueGenericReceive>
    800051f0:	872a                	mv	a4,a0
    800051f2:	4785                	li	a5,1
    800051f4:	00f70863          	beq	a4,a5,80005204 <vPrimaryBlockTimeTestTask+0x1e4>
    800051f8:	00034797          	auipc	a5,0x34
    800051fc:	6e878793          	addi	a5,a5,1768 # 800398e0 <xErrorOccurred>
    80005200:	4705                	li	a4,1
    80005202:	e398                	sd	a4,0(a5)
    80005204:	00034797          	auipc	a5,0x34
    80005208:	6bc78793          	addi	a5,a5,1724 # 800398c0 <xTestQueue>
    8000520c:	639c                	ld	a5,0(a5)
    8000520e:	0838                	addi	a4,sp,24
    80005210:	4681                	li	a3,0
    80005212:	4601                	li	a2,0
    80005214:	85ba                	mv	a1,a4
    80005216:	853e                	mv	a0,a5
    80005218:	f56fb0ef          	jal	8000096e <xQueueGenericSend>
    8000521c:	872a                	mv	a4,a0
    8000521e:	4785                	li	a5,1
    80005220:	00f70863          	beq	a4,a5,80005230 <vPrimaryBlockTimeTestTask+0x210>
    80005224:	00034797          	auipc	a5,0x34
    80005228:	6bc78793          	addi	a5,a5,1724 # 800398e0 <xErrorOccurred>
    8000522c:	4705                	li	a4,1
    8000522e:	e398                	sd	a4,0(a5)
    80005230:	00034797          	auipc	a5,0x34
    80005234:	6b878793          	addi	a5,a5,1720 # 800398e8 <xRunIndicator>
    80005238:	6398                	ld	a4,0(a5)
    8000523a:	05500793          	li	a5,85
    8000523e:	00f71863          	bne	a4,a5,8000524e <vPrimaryBlockTimeTestTask+0x22e>
    80005242:	00034797          	auipc	a5,0x34
    80005246:	69e78793          	addi	a5,a5,1694 # 800398e0 <xErrorOccurred>
    8000524a:	4705                	li	a4,1
    8000524c:	e398                	sd	a4,0(a5)
    8000524e:	00034797          	auipc	a5,0x34
    80005252:	67a78793          	addi	a5,a5,1658 # 800398c8 <xSecondary>
    80005256:	639c                	ld	a5,0(a5)
    80005258:	4591                	li	a1,4
    8000525a:	853e                	mv	a0,a5
    8000525c:	dd2fc0ef          	jal	8000182e <vTaskPrioritySet>
    80005260:	00034797          	auipc	a5,0x34
    80005264:	68878793          	addi	a5,a5,1672 # 800398e8 <xRunIndicator>
    80005268:	6398                	ld	a4,0(a5)
    8000526a:	05500793          	li	a5,85
    8000526e:	00f71863          	bne	a4,a5,8000527e <vPrimaryBlockTimeTestTask+0x25e>
    80005272:	00034797          	auipc	a5,0x34
    80005276:	66e78793          	addi	a5,a5,1646 # 800398e0 <xErrorOccurred>
    8000527a:	4705                	li	a4,1
    8000527c:	e398                	sd	a4,0(a5)
    8000527e:	00034797          	auipc	a5,0x34
    80005282:	64a78793          	addi	a5,a5,1610 # 800398c8 <xSecondary>
    80005286:	639c                	ld	a5,0(a5)
    80005288:	4585                	li	a1,1
    8000528a:	853e                	mv	a0,a5
    8000528c:	da2fc0ef          	jal	8000182e <vTaskPrioritySet>
    80005290:	67e2                	ld	a5,24(sp)
    80005292:	0785                	addi	a5,a5,1
    80005294:	ec3e                	sd	a5,24(sp)
    80005296:	6762                	ld	a4,24(sp)
    80005298:	4791                	li	a5,4
    8000529a:	f2e7dfe3          	bge	a5,a4,800051d8 <vPrimaryBlockTimeTestTask+0x1b8>
    8000529e:	a021                	j	800052a6 <vPrimaryBlockTimeTestTask+0x286>
    800052a0:	4551                	li	a0,20
    800052a2:	c14fc0ef          	jal	800016b6 <vTaskDelay>
    800052a6:	00034797          	auipc	a5,0x34
    800052aa:	64278793          	addi	a5,a5,1602 # 800398e8 <xRunIndicator>
    800052ae:	6398                	ld	a4,0(a5)
    800052b0:	05500793          	li	a5,85
    800052b4:	fef716e3          	bne	a4,a5,800052a0 <vPrimaryBlockTimeTestTask+0x280>
    800052b8:	4551                	li	a0,20
    800052ba:	bfcfc0ef          	jal	800016b6 <vTaskDelay>
    800052be:	00034797          	auipc	a5,0x34
    800052c2:	62a78793          	addi	a5,a5,1578 # 800398e8 <xRunIndicator>
    800052c6:	0007b023          	sd	zero,0(a5)
    800052ca:	ec02                	sd	zero,24(sp)
    800052cc:	a815                	j	80005300 <vPrimaryBlockTimeTestTask+0x2e0>
    800052ce:	00034797          	auipc	a5,0x34
    800052d2:	5f278793          	addi	a5,a5,1522 # 800398c0 <xTestQueue>
    800052d6:	639c                	ld	a5,0(a5)
    800052d8:	0818                	addi	a4,sp,16
    800052da:	4681                	li	a3,0
    800052dc:	4601                	li	a2,0
    800052de:	85ba                	mv	a1,a4
    800052e0:	853e                	mv	a0,a5
    800052e2:	98dfb0ef          	jal	80000c6e <xQueueGenericReceive>
    800052e6:	872a                	mv	a4,a0
    800052e8:	4785                	li	a5,1
    800052ea:	00f70863          	beq	a4,a5,800052fa <vPrimaryBlockTimeTestTask+0x2da>
    800052ee:	00034797          	auipc	a5,0x34
    800052f2:	5f278793          	addi	a5,a5,1522 # 800398e0 <xErrorOccurred>
    800052f6:	4705                	li	a4,1
    800052f8:	e398                	sd	a4,0(a5)
    800052fa:	67e2                	ld	a5,24(sp)
    800052fc:	0785                	addi	a5,a5,1
    800052fe:	ec3e                	sd	a5,24(sp)
    80005300:	6762                	ld	a4,24(sp)
    80005302:	4791                	li	a5,4
    80005304:	fce7d5e3          	bge	a5,a4,800052ce <vPrimaryBlockTimeTestTask+0x2ae>
    80005308:	00034797          	auipc	a5,0x34
    8000530c:	5c078793          	addi	a5,a5,1472 # 800398c8 <xSecondary>
    80005310:	639c                	ld	a5,0(a5)
    80005312:	853e                	mv	a0,a5
    80005314:	f96fc0ef          	jal	80001aaa <vTaskResume>
    80005318:	a021                	j	80005320 <vPrimaryBlockTimeTestTask+0x300>
    8000531a:	4551                	li	a0,20
    8000531c:	b9afc0ef          	jal	800016b6 <vTaskDelay>
    80005320:	00034797          	auipc	a5,0x34
    80005324:	5c878793          	addi	a5,a5,1480 # 800398e8 <xRunIndicator>
    80005328:	6398                	ld	a4,0(a5)
    8000532a:	05500793          	li	a5,85
    8000532e:	fef716e3          	bne	a4,a5,8000531a <vPrimaryBlockTimeTestTask+0x2fa>
    80005332:	4551                	li	a0,20
    80005334:	b82fc0ef          	jal	800016b6 <vTaskDelay>
    80005338:	00034797          	auipc	a5,0x34
    8000533c:	5b078793          	addi	a5,a5,1456 # 800398e8 <xRunIndicator>
    80005340:	0007b023          	sd	zero,0(a5)
    80005344:	ec02                	sd	zero,24(sp)
    80005346:	a0c1                	j	80005406 <vPrimaryBlockTimeTestTask+0x3e6>
    80005348:	00034797          	auipc	a5,0x34
    8000534c:	57878793          	addi	a5,a5,1400 # 800398c0 <xTestQueue>
    80005350:	639c                	ld	a5,0(a5)
    80005352:	0838                	addi	a4,sp,24
    80005354:	4681                	li	a3,0
    80005356:	4601                	li	a2,0
    80005358:	85ba                	mv	a1,a4
    8000535a:	853e                	mv	a0,a5
    8000535c:	e12fb0ef          	jal	8000096e <xQueueGenericSend>
    80005360:	872a                	mv	a4,a0
    80005362:	4785                	li	a5,1
    80005364:	00f70863          	beq	a4,a5,80005374 <vPrimaryBlockTimeTestTask+0x354>
    80005368:	00034797          	auipc	a5,0x34
    8000536c:	57878793          	addi	a5,a5,1400 # 800398e0 <xErrorOccurred>
    80005370:	4705                	li	a4,1
    80005372:	e398                	sd	a4,0(a5)
    80005374:	00034797          	auipc	a5,0x34
    80005378:	54c78793          	addi	a5,a5,1356 # 800398c0 <xTestQueue>
    8000537c:	639c                	ld	a5,0(a5)
    8000537e:	0818                	addi	a4,sp,16
    80005380:	4681                	li	a3,0
    80005382:	4601                	li	a2,0
    80005384:	85ba                	mv	a1,a4
    80005386:	853e                	mv	a0,a5
    80005388:	8e7fb0ef          	jal	80000c6e <xQueueGenericReceive>
    8000538c:	872a                	mv	a4,a0
    8000538e:	4785                	li	a5,1
    80005390:	00f70863          	beq	a4,a5,800053a0 <vPrimaryBlockTimeTestTask+0x380>
    80005394:	00034797          	auipc	a5,0x34
    80005398:	54c78793          	addi	a5,a5,1356 # 800398e0 <xErrorOccurred>
    8000539c:	4705                	li	a4,1
    8000539e:	e398                	sd	a4,0(a5)
    800053a0:	00034797          	auipc	a5,0x34
    800053a4:	54878793          	addi	a5,a5,1352 # 800398e8 <xRunIndicator>
    800053a8:	6398                	ld	a4,0(a5)
    800053aa:	05500793          	li	a5,85
    800053ae:	00f71863          	bne	a4,a5,800053be <vPrimaryBlockTimeTestTask+0x39e>
    800053b2:	00034797          	auipc	a5,0x34
    800053b6:	52e78793          	addi	a5,a5,1326 # 800398e0 <xErrorOccurred>
    800053ba:	4705                	li	a4,1
    800053bc:	e398                	sd	a4,0(a5)
    800053be:	00034797          	auipc	a5,0x34
    800053c2:	50a78793          	addi	a5,a5,1290 # 800398c8 <xSecondary>
    800053c6:	639c                	ld	a5,0(a5)
    800053c8:	4591                	li	a1,4
    800053ca:	853e                	mv	a0,a5
    800053cc:	c62fc0ef          	jal	8000182e <vTaskPrioritySet>
    800053d0:	00034797          	auipc	a5,0x34
    800053d4:	51878793          	addi	a5,a5,1304 # 800398e8 <xRunIndicator>
    800053d8:	6398                	ld	a4,0(a5)
    800053da:	05500793          	li	a5,85
    800053de:	00f71863          	bne	a4,a5,800053ee <vPrimaryBlockTimeTestTask+0x3ce>
    800053e2:	00034797          	auipc	a5,0x34
    800053e6:	4fe78793          	addi	a5,a5,1278 # 800398e0 <xErrorOccurred>
    800053ea:	4705                	li	a4,1
    800053ec:	e398                	sd	a4,0(a5)
    800053ee:	00034797          	auipc	a5,0x34
    800053f2:	4da78793          	addi	a5,a5,1242 # 800398c8 <xSecondary>
    800053f6:	639c                	ld	a5,0(a5)
    800053f8:	4585                	li	a1,1
    800053fa:	853e                	mv	a0,a5
    800053fc:	c32fc0ef          	jal	8000182e <vTaskPrioritySet>
    80005400:	67e2                	ld	a5,24(sp)
    80005402:	0785                	addi	a5,a5,1
    80005404:	ec3e                	sd	a5,24(sp)
    80005406:	6762                	ld	a4,24(sp)
    80005408:	4791                	li	a5,4
    8000540a:	f2e7dfe3          	bge	a5,a4,80005348 <vPrimaryBlockTimeTestTask+0x328>
    8000540e:	a021                	j	80005416 <vPrimaryBlockTimeTestTask+0x3f6>
    80005410:	4551                	li	a0,20
    80005412:	aa4fc0ef          	jal	800016b6 <vTaskDelay>
    80005416:	00034797          	auipc	a5,0x34
    8000541a:	4d278793          	addi	a5,a5,1234 # 800398e8 <xRunIndicator>
    8000541e:	6398                	ld	a4,0(a5)
    80005420:	05500793          	li	a5,85
    80005424:	fef716e3          	bne	a4,a5,80005410 <vPrimaryBlockTimeTestTask+0x3f0>
    80005428:	4551                	li	a0,20
    8000542a:	a8cfc0ef          	jal	800016b6 <vTaskDelay>
    8000542e:	00034797          	auipc	a5,0x34
    80005432:	4a278793          	addi	a5,a5,1186 # 800398d0 <xPrimaryCycles>
    80005436:	639c                	ld	a5,0(a5)
    80005438:	00178713          	addi	a4,a5,1
    8000543c:	00034797          	auipc	a5,0x34
    80005440:	49478793          	addi	a5,a5,1172 # 800398d0 <xPrimaryCycles>
    80005444:	e398                	sd	a4,0(a5)
    80005446:	b6c5                	j	80005026 <vPrimaryBlockTimeTestTask+0x6>

0000000080005448 <vSecondaryBlockTimeTestTask>:
    80005448:	7179                	addi	sp,sp,-48
    8000544a:	f406                	sd	ra,40(sp)
    8000544c:	e42a                	sd	a0,8(sp)
    8000544e:	4501                	li	a0,0
    80005450:	d30fc0ef          	jal	80001980 <vTaskSuspend>
    80005454:	9d9fc0ef          	jal	80001e2c <xTaskGetTickCount>
    80005458:	87aa                	mv	a5,a0
    8000545a:	ce3e                	sw	a5,28(sp)
    8000545c:	e802                	sd	zero,16(sp)
    8000545e:	00034797          	auipc	a5,0x34
    80005462:	48a78793          	addi	a5,a5,1162 # 800398e8 <xRunIndicator>
    80005466:	05500713          	li	a4,85
    8000546a:	e398                	sd	a4,0(a5)
    8000546c:	00034797          	auipc	a5,0x34
    80005470:	45478793          	addi	a5,a5,1108 # 800398c0 <xTestQueue>
    80005474:	639c                	ld	a5,0(a5)
    80005476:	0818                	addi	a4,sp,16
    80005478:	4681                	li	a3,0
    8000547a:	0af00613          	li	a2,175
    8000547e:	85ba                	mv	a1,a4
    80005480:	853e                	mv	a0,a5
    80005482:	cecfb0ef          	jal	8000096e <xQueueGenericSend>
    80005486:	87aa                	mv	a5,a0
    80005488:	c799                	beqz	a5,80005496 <vSecondaryBlockTimeTestTask+0x4e>
    8000548a:	00034797          	auipc	a5,0x34
    8000548e:	45678793          	addi	a5,a5,1110 # 800398e0 <xErrorOccurred>
    80005492:	4705                	li	a4,1
    80005494:	e398                	sd	a4,0(a5)
    80005496:	997fc0ef          	jal	80001e2c <xTaskGetTickCount>
    8000549a:	87aa                	mv	a5,a0
    8000549c:	2781                	sext.w	a5,a5
    8000549e:	4772                	lw	a4,28(sp)
    800054a0:	9f99                	subw	a5,a5,a4
    800054a2:	cc3e                	sw	a5,24(sp)
    800054a4:	47e2                	lw	a5,24(sp)
    800054a6:	0007871b          	sext.w	a4,a5
    800054aa:	0ae00793          	li	a5,174
    800054ae:	00e7e863          	bltu	a5,a4,800054be <vSecondaryBlockTimeTestTask+0x76>
    800054b2:	00034797          	auipc	a5,0x34
    800054b6:	42e78793          	addi	a5,a5,1070 # 800398e0 <xErrorOccurred>
    800054ba:	4705                	li	a4,1
    800054bc:	e398                	sd	a4,0(a5)
    800054be:	47e2                	lw	a5,24(sp)
    800054c0:	0007871b          	sext.w	a4,a5
    800054c4:	0be00793          	li	a5,190
    800054c8:	00e7f863          	bgeu	a5,a4,800054d8 <vSecondaryBlockTimeTestTask+0x90>
    800054cc:	00034797          	auipc	a5,0x34
    800054d0:	41478793          	addi	a5,a5,1044 # 800398e0 <xErrorOccurred>
    800054d4:	4705                	li	a4,1
    800054d6:	e398                	sd	a4,0(a5)
    800054d8:	00034797          	auipc	a5,0x34
    800054dc:	41078793          	addi	a5,a5,1040 # 800398e8 <xRunIndicator>
    800054e0:	05500713          	li	a4,85
    800054e4:	e398                	sd	a4,0(a5)
    800054e6:	4501                	li	a0,0
    800054e8:	c98fc0ef          	jal	80001980 <vTaskSuspend>
    800054ec:	941fc0ef          	jal	80001e2c <xTaskGetTickCount>
    800054f0:	87aa                	mv	a5,a0
    800054f2:	ce3e                	sw	a5,28(sp)
    800054f4:	00034797          	auipc	a5,0x34
    800054f8:	3f478793          	addi	a5,a5,1012 # 800398e8 <xRunIndicator>
    800054fc:	05500713          	li	a4,85
    80005500:	e398                	sd	a4,0(a5)
    80005502:	00034797          	auipc	a5,0x34
    80005506:	3be78793          	addi	a5,a5,958 # 800398c0 <xTestQueue>
    8000550a:	639c                	ld	a5,0(a5)
    8000550c:	0818                	addi	a4,sp,16
    8000550e:	4681                	li	a3,0
    80005510:	0af00613          	li	a2,175
    80005514:	85ba                	mv	a1,a4
    80005516:	853e                	mv	a0,a5
    80005518:	f56fb0ef          	jal	80000c6e <xQueueGenericReceive>
    8000551c:	87aa                	mv	a5,a0
    8000551e:	c799                	beqz	a5,8000552c <vSecondaryBlockTimeTestTask+0xe4>
    80005520:	00034797          	auipc	a5,0x34
    80005524:	3c078793          	addi	a5,a5,960 # 800398e0 <xErrorOccurred>
    80005528:	4705                	li	a4,1
    8000552a:	e398                	sd	a4,0(a5)
    8000552c:	901fc0ef          	jal	80001e2c <xTaskGetTickCount>
    80005530:	87aa                	mv	a5,a0
    80005532:	2781                	sext.w	a5,a5
    80005534:	4772                	lw	a4,28(sp)
    80005536:	9f99                	subw	a5,a5,a4
    80005538:	cc3e                	sw	a5,24(sp)
    8000553a:	47e2                	lw	a5,24(sp)
    8000553c:	0007871b          	sext.w	a4,a5
    80005540:	0ae00793          	li	a5,174
    80005544:	00e7e863          	bltu	a5,a4,80005554 <vSecondaryBlockTimeTestTask+0x10c>
    80005548:	00034797          	auipc	a5,0x34
    8000554c:	39878793          	addi	a5,a5,920 # 800398e0 <xErrorOccurred>
    80005550:	4705                	li	a4,1
    80005552:	e398                	sd	a4,0(a5)
    80005554:	47e2                	lw	a5,24(sp)
    80005556:	0007871b          	sext.w	a4,a5
    8000555a:	0be00793          	li	a5,190
    8000555e:	00e7f863          	bgeu	a5,a4,8000556e <vSecondaryBlockTimeTestTask+0x126>
    80005562:	00034797          	auipc	a5,0x34
    80005566:	37e78793          	addi	a5,a5,894 # 800398e0 <xErrorOccurred>
    8000556a:	4705                	li	a4,1
    8000556c:	e398                	sd	a4,0(a5)
    8000556e:	00034797          	auipc	a5,0x34
    80005572:	37a78793          	addi	a5,a5,890 # 800398e8 <xRunIndicator>
    80005576:	05500713          	li	a4,85
    8000557a:	e398                	sd	a4,0(a5)
    8000557c:	00034797          	auipc	a5,0x34
    80005580:	35c78793          	addi	a5,a5,860 # 800398d8 <xSecondaryCycles>
    80005584:	639c                	ld	a5,0(a5)
    80005586:	00178713          	addi	a4,a5,1
    8000558a:	00034797          	auipc	a5,0x34
    8000558e:	34e78793          	addi	a5,a5,846 # 800398d8 <xSecondaryCycles>
    80005592:	e398                	sd	a4,0(a5)
    80005594:	bd6d                	j	8000544e <vSecondaryBlockTimeTestTask+0x6>

0000000080005596 <xAreBlockTimeTestTasksStillRunning>:
    80005596:	1141                	addi	sp,sp,-16
    80005598:	4785                	li	a5,1
    8000559a:	e43e                	sd	a5,8(sp)
    8000559c:	00034797          	auipc	a5,0x34
    800055a0:	33478793          	addi	a5,a5,820 # 800398d0 <xPrimaryCycles>
    800055a4:	6398                	ld	a4,0(a5)
    800055a6:	00034797          	auipc	a5,0x34
    800055aa:	34a78793          	addi	a5,a5,842 # 800398f0 <xLastPrimaryCycleCount.1>
    800055ae:	639c                	ld	a5,0(a5)
    800055b0:	00f71363          	bne	a4,a5,800055b6 <xAreBlockTimeTestTasksStillRunning+0x20>
    800055b4:	e402                	sd	zero,8(sp)
    800055b6:	00034797          	auipc	a5,0x34
    800055ba:	32278793          	addi	a5,a5,802 # 800398d8 <xSecondaryCycles>
    800055be:	6398                	ld	a4,0(a5)
    800055c0:	00034797          	auipc	a5,0x34
    800055c4:	33878793          	addi	a5,a5,824 # 800398f8 <xLastSecondaryCycleCount.0>
    800055c8:	639c                	ld	a5,0(a5)
    800055ca:	00f71363          	bne	a4,a5,800055d0 <xAreBlockTimeTestTasksStillRunning+0x3a>
    800055ce:	e402                	sd	zero,8(sp)
    800055d0:	00034797          	auipc	a5,0x34
    800055d4:	31078793          	addi	a5,a5,784 # 800398e0 <xErrorOccurred>
    800055d8:	6398                	ld	a4,0(a5)
    800055da:	4785                	li	a5,1
    800055dc:	00f71363          	bne	a4,a5,800055e2 <xAreBlockTimeTestTasksStillRunning+0x4c>
    800055e0:	e402                	sd	zero,8(sp)
    800055e2:	00034797          	auipc	a5,0x34
    800055e6:	2f678793          	addi	a5,a5,758 # 800398d8 <xSecondaryCycles>
    800055ea:	6398                	ld	a4,0(a5)
    800055ec:	00034797          	auipc	a5,0x34
    800055f0:	30c78793          	addi	a5,a5,780 # 800398f8 <xLastSecondaryCycleCount.0>
    800055f4:	e398                	sd	a4,0(a5)
    800055f6:	00034797          	auipc	a5,0x34
    800055fa:	2da78793          	addi	a5,a5,730 # 800398d0 <xPrimaryCycles>
    800055fe:	6398                	ld	a4,0(a5)
    80005600:	00034797          	auipc	a5,0x34
    80005604:	2f078793          	addi	a5,a5,752 # 800398f0 <xLastPrimaryCycleCount.1>
    80005608:	e398                	sd	a4,0(a5)
    8000560a:	67a2                	ld	a5,8(sp)
    8000560c:	853e                	mv	a0,a5
    8000560e:	0141                	addi	sp,sp,16
    80005610:	8082                	ret

0000000080005612 <vStartCountingSemaphoreTasks>:
    80005612:	1141                	addi	sp,sp,-16
    80005614:	e406                	sd	ra,8(sp)
    80005616:	0c800593          	li	a1,200
    8000561a:	0c800513          	li	a0,200
    8000561e:	b00fb0ef          	jal	8000091e <xQueueCreateCountingSemaphore>
    80005622:	872a                	mv	a4,a0
    80005624:	00034797          	auipc	a5,0x34
    80005628:	2e478793          	addi	a5,a5,740 # 80039908 <xParameters>
    8000562c:	e398                	sd	a4,0(a5)
    8000562e:	00034797          	auipc	a5,0x34
    80005632:	2da78793          	addi	a5,a5,730 # 80039908 <xParameters>
    80005636:	0aa00713          	li	a4,170
    8000563a:	e798                	sd	a4,8(a5)
    8000563c:	00034797          	auipc	a5,0x34
    80005640:	2cc78793          	addi	a5,a5,716 # 80039908 <xParameters>
    80005644:	0007b823          	sd	zero,16(a5)
    80005648:	4581                	li	a1,0
    8000564a:	0c800513          	li	a0,200
    8000564e:	ad0fb0ef          	jal	8000091e <xQueueCreateCountingSemaphore>
    80005652:	872a                	mv	a4,a0
    80005654:	00034797          	auipc	a5,0x34
    80005658:	2b478793          	addi	a5,a5,692 # 80039908 <xParameters>
    8000565c:	ef98                	sd	a4,24(a5)
    8000565e:	00034797          	auipc	a5,0x34
    80005662:	2aa78793          	addi	a5,a5,682 # 80039908 <xParameters>
    80005666:	0207b023          	sd	zero,32(a5)
    8000566a:	00034797          	auipc	a5,0x34
    8000566e:	29e78793          	addi	a5,a5,670 # 80039908 <xParameters>
    80005672:	0207b423          	sd	zero,40(a5)
    80005676:	00034797          	auipc	a5,0x34
    8000567a:	29278793          	addi	a5,a5,658 # 80039908 <xParameters>
    8000567e:	639c                	ld	a5,0(a5)
    80005680:	0001b597          	auipc	a1,0x1b
    80005684:	c6858593          	addi	a1,a1,-920 # 800202e8 <__rodata_start+0x2e8>
    80005688:	853e                	mv	a0,a5
    8000568a:	bd7fb0ef          	jal	80001260 <vQueueAddToRegistry>
    8000568e:	00034797          	auipc	a5,0x34
    80005692:	27a78793          	addi	a5,a5,634 # 80039908 <xParameters>
    80005696:	6f9c                	ld	a5,24(a5)
    80005698:	0001b597          	auipc	a1,0x1b
    8000569c:	c6058593          	addi	a1,a1,-928 # 800202f8 <__rodata_start+0x2f8>
    800056a0:	853e                	mv	a0,a5
    800056a2:	bbffb0ef          	jal	80001260 <vQueueAddToRegistry>
    800056a6:	00034797          	auipc	a5,0x34
    800056aa:	26278793          	addi	a5,a5,610 # 80039908 <xParameters>
    800056ae:	639c                	ld	a5,0(a5)
    800056b0:	e799                	bnez	a5,800056be <vStartCountingSemaphoreTasks+0xac>
    800056b2:	00034797          	auipc	a5,0x34
    800056b6:	25678793          	addi	a5,a5,598 # 80039908 <xParameters>
    800056ba:	6f9c                	ld	a5,24(a5)
    800056bc:	cba9                	beqz	a5,8000570e <vStartCountingSemaphoreTasks+0xfc>
    800056be:	4881                	li	a7,0
    800056c0:	4801                	li	a6,0
    800056c2:	4781                	li	a5,0
    800056c4:	4701                	li	a4,0
    800056c6:	00034697          	auipc	a3,0x34
    800056ca:	24268693          	addi	a3,a3,578 # 80039908 <xParameters>
    800056ce:	40000613          	li	a2,1024
    800056d2:	0001b597          	auipc	a1,0x1b
    800056d6:	c3658593          	addi	a1,a1,-970 # 80020308 <__rodata_start+0x308>
    800056da:	00000517          	auipc	a0,0x0
    800056de:	15c50513          	addi	a0,a0,348 # 80005836 <prvCountingSemaphoreTask>
    800056e2:	c7dfb0ef          	jal	8000135e <xTaskGenericCreate>
    800056e6:	4881                	li	a7,0
    800056e8:	4801                	li	a6,0
    800056ea:	4781                	li	a5,0
    800056ec:	4701                	li	a4,0
    800056ee:	00034697          	auipc	a3,0x34
    800056f2:	23268693          	addi	a3,a3,562 # 80039920 <xParameters+0x18>
    800056f6:	40000613          	li	a2,1024
    800056fa:	0001b597          	auipc	a1,0x1b
    800056fe:	c1658593          	addi	a1,a1,-1002 # 80020310 <__rodata_start+0x310>
    80005702:	00000517          	auipc	a0,0x0
    80005706:	13450513          	addi	a0,a0,308 # 80005836 <prvCountingSemaphoreTask>
    8000570a:	c55fb0ef          	jal	8000135e <xTaskGenericCreate>
    8000570e:	0001                	nop
    80005710:	60a2                	ld	ra,8(sp)
    80005712:	0141                	addi	sp,sp,16
    80005714:	8082                	ret

0000000080005716 <prvDecrementSemaphoreCount>:
    80005716:	7179                	addi	sp,sp,-48
    80005718:	f406                	sd	ra,40(sp)
    8000571a:	e42a                	sd	a0,8(sp)
    8000571c:	e02e                	sd	a1,0(sp)
    8000571e:	4681                	li	a3,0
    80005720:	4601                	li	a2,0
    80005722:	4581                	li	a1,0
    80005724:	6522                	ld	a0,8(sp)
    80005726:	a48fb0ef          	jal	8000096e <xQueueGenericSend>
    8000572a:	872a                	mv	a4,a0
    8000572c:	4785                	li	a5,1
    8000572e:	00f71863          	bne	a4,a5,8000573e <prvDecrementSemaphoreCount+0x28>
    80005732:	00034797          	auipc	a5,0x34
    80005736:	1ce78793          	addi	a5,a5,462 # 80039900 <xErrorDetected>
    8000573a:	4705                	li	a4,1
    8000573c:	e398                	sd	a4,0(a5)
    8000573e:	ec02                	sd	zero,24(sp)
    80005740:	a815                	j	80005774 <prvDecrementSemaphoreCount+0x5e>
    80005742:	4681                	li	a3,0
    80005744:	4601                	li	a2,0
    80005746:	4581                	li	a1,0
    80005748:	6522                	ld	a0,8(sp)
    8000574a:	d24fb0ef          	jal	80000c6e <xQueueGenericReceive>
    8000574e:	872a                	mv	a4,a0
    80005750:	4785                	li	a5,1
    80005752:	00f70863          	beq	a4,a5,80005762 <prvDecrementSemaphoreCount+0x4c>
    80005756:	00034797          	auipc	a5,0x34
    8000575a:	1aa78793          	addi	a5,a5,426 # 80039900 <xErrorDetected>
    8000575e:	4705                	li	a4,1
    80005760:	e398                	sd	a4,0(a5)
    80005762:	6782                	ld	a5,0(sp)
    80005764:	639c                	ld	a5,0(a5)
    80005766:	00178713          	addi	a4,a5,1
    8000576a:	6782                	ld	a5,0(sp)
    8000576c:	e398                	sd	a4,0(a5)
    8000576e:	67e2                	ld	a5,24(sp)
    80005770:	0785                	addi	a5,a5,1
    80005772:	ec3e                	sd	a5,24(sp)
    80005774:	6762                	ld	a4,24(sp)
    80005776:	0c700793          	li	a5,199
    8000577a:	fce7f4e3          	bgeu	a5,a4,80005742 <prvDecrementSemaphoreCount+0x2c>
    8000577e:	4681                	li	a3,0
    80005780:	4601                	li	a2,0
    80005782:	4581                	li	a1,0
    80005784:	6522                	ld	a0,8(sp)
    80005786:	ce8fb0ef          	jal	80000c6e <xQueueGenericReceive>
    8000578a:	872a                	mv	a4,a0
    8000578c:	4785                	li	a5,1
    8000578e:	00f71863          	bne	a4,a5,8000579e <prvDecrementSemaphoreCount+0x88>
    80005792:	00034797          	auipc	a5,0x34
    80005796:	16e78793          	addi	a5,a5,366 # 80039900 <xErrorDetected>
    8000579a:	4705                	li	a4,1
    8000579c:	e398                	sd	a4,0(a5)
    8000579e:	0001                	nop
    800057a0:	70a2                	ld	ra,40(sp)
    800057a2:	6145                	addi	sp,sp,48
    800057a4:	8082                	ret

00000000800057a6 <prvIncrementSemaphoreCount>:
    800057a6:	7179                	addi	sp,sp,-48
    800057a8:	f406                	sd	ra,40(sp)
    800057aa:	e42a                	sd	a0,8(sp)
    800057ac:	e02e                	sd	a1,0(sp)
    800057ae:	4681                	li	a3,0
    800057b0:	4601                	li	a2,0
    800057b2:	4581                	li	a1,0
    800057b4:	6522                	ld	a0,8(sp)
    800057b6:	cb8fb0ef          	jal	80000c6e <xQueueGenericReceive>
    800057ba:	872a                	mv	a4,a0
    800057bc:	4785                	li	a5,1
    800057be:	00f71863          	bne	a4,a5,800057ce <prvIncrementSemaphoreCount+0x28>
    800057c2:	00034797          	auipc	a5,0x34
    800057c6:	13e78793          	addi	a5,a5,318 # 80039900 <xErrorDetected>
    800057ca:	4705                	li	a4,1
    800057cc:	e398                	sd	a4,0(a5)
    800057ce:	ec02                	sd	zero,24(sp)
    800057d0:	a815                	j	80005804 <prvIncrementSemaphoreCount+0x5e>
    800057d2:	4681                	li	a3,0
    800057d4:	4601                	li	a2,0
    800057d6:	4581                	li	a1,0
    800057d8:	6522                	ld	a0,8(sp)
    800057da:	994fb0ef          	jal	8000096e <xQueueGenericSend>
    800057de:	872a                	mv	a4,a0
    800057e0:	4785                	li	a5,1
    800057e2:	00f70863          	beq	a4,a5,800057f2 <prvIncrementSemaphoreCount+0x4c>
    800057e6:	00034797          	auipc	a5,0x34
    800057ea:	11a78793          	addi	a5,a5,282 # 80039900 <xErrorDetected>
    800057ee:	4705                	li	a4,1
    800057f0:	e398                	sd	a4,0(a5)
    800057f2:	6782                	ld	a5,0(sp)
    800057f4:	639c                	ld	a5,0(a5)
    800057f6:	00178713          	addi	a4,a5,1
    800057fa:	6782                	ld	a5,0(sp)
    800057fc:	e398                	sd	a4,0(a5)
    800057fe:	67e2                	ld	a5,24(sp)
    80005800:	0785                	addi	a5,a5,1
    80005802:	ec3e                	sd	a5,24(sp)
    80005804:	6762                	ld	a4,24(sp)
    80005806:	0c700793          	li	a5,199
    8000580a:	fce7f4e3          	bgeu	a5,a4,800057d2 <prvIncrementSemaphoreCount+0x2c>
    8000580e:	4681                	li	a3,0
    80005810:	4601                	li	a2,0
    80005812:	4581                	li	a1,0
    80005814:	6522                	ld	a0,8(sp)
    80005816:	958fb0ef          	jal	8000096e <xQueueGenericSend>
    8000581a:	872a                	mv	a4,a0
    8000581c:	4785                	li	a5,1
    8000581e:	00f71863          	bne	a4,a5,8000582e <prvIncrementSemaphoreCount+0x88>
    80005822:	00034797          	auipc	a5,0x34
    80005826:	0de78793          	addi	a5,a5,222 # 80039900 <xErrorDetected>
    8000582a:	4705                	li	a4,1
    8000582c:	e398                	sd	a4,0(a5)
    8000582e:	0001                	nop
    80005830:	70a2                	ld	ra,40(sp)
    80005832:	6145                	addi	sp,sp,48
    80005834:	8082                	ret

0000000080005836 <prvCountingSemaphoreTask>:
    80005836:	7179                	addi	sp,sp,-48
    80005838:	f406                	sd	ra,40(sp)
    8000583a:	e42a                	sd	a0,8(sp)
    8000583c:	67a2                	ld	a5,8(sp)
    8000583e:	ec3e                	sd	a5,24(sp)
    80005840:	67e2                	ld	a5,24(sp)
    80005842:	6798                	ld	a4,8(a5)
    80005844:	0aa00793          	li	a5,170
    80005848:	00f71a63          	bne	a4,a5,8000585c <prvCountingSemaphoreTask+0x26>
    8000584c:	67e2                	ld	a5,24(sp)
    8000584e:	6398                	ld	a4,0(a5)
    80005850:	67e2                	ld	a5,24(sp)
    80005852:	07c1                	addi	a5,a5,16
    80005854:	85be                	mv	a1,a5
    80005856:	853a                	mv	a0,a4
    80005858:	ebfff0ef          	jal	80005716 <prvDecrementSemaphoreCount>
    8000585c:	67e2                	ld	a5,24(sp)
    8000585e:	639c                	ld	a5,0(a5)
    80005860:	4681                	li	a3,0
    80005862:	4601                	li	a2,0
    80005864:	4581                	li	a1,0
    80005866:	853e                	mv	a0,a5
    80005868:	c06fb0ef          	jal	80000c6e <xQueueGenericReceive>
    8000586c:	872a                	mv	a4,a0
    8000586e:	4785                	li	a5,1
    80005870:	00f71863          	bne	a4,a5,80005880 <prvCountingSemaphoreTask+0x4a>
    80005874:	00034797          	auipc	a5,0x34
    80005878:	08c78793          	addi	a5,a5,140 # 80039900 <xErrorDetected>
    8000587c:	4705                	li	a4,1
    8000587e:	e398                	sd	a4,0(a5)
    80005880:	67e2                	ld	a5,24(sp)
    80005882:	6398                	ld	a4,0(a5)
    80005884:	67e2                	ld	a5,24(sp)
    80005886:	07c1                	addi	a5,a5,16
    80005888:	85be                	mv	a1,a5
    8000588a:	853a                	mv	a0,a4
    8000588c:	f1bff0ef          	jal	800057a6 <prvIncrementSemaphoreCount>
    80005890:	67e2                	ld	a5,24(sp)
    80005892:	6398                	ld	a4,0(a5)
    80005894:	67e2                	ld	a5,24(sp)
    80005896:	07c1                	addi	a5,a5,16
    80005898:	85be                	mv	a1,a5
    8000589a:	853a                	mv	a0,a4
    8000589c:	e7bff0ef          	jal	80005716 <prvDecrementSemaphoreCount>
    800058a0:	0001                	nop
    800058a2:	bff9                	j	80005880 <prvCountingSemaphoreTask+0x4a>

00000000800058a4 <xAreCountingSemaphoreTasksStillRunning>:
    800058a4:	1141                	addi	sp,sp,-16
    800058a6:	4785                	li	a5,1
    800058a8:	e43e                	sd	a5,8(sp)
    800058aa:	00034797          	auipc	a5,0x34
    800058ae:	05678793          	addi	a5,a5,86 # 80039900 <xErrorDetected>
    800058b2:	639c                	ld	a5,0(a5)
    800058b4:	c391                	beqz	a5,800058b8 <xAreCountingSemaphoreTasksStillRunning+0x14>
    800058b6:	e402                	sd	zero,8(sp)
    800058b8:	00034797          	auipc	a5,0x34
    800058bc:	05078793          	addi	a5,a5,80 # 80039908 <xParameters>
    800058c0:	6b98                	ld	a4,16(a5)
    800058c2:	00034797          	auipc	a5,0x34
    800058c6:	07678793          	addi	a5,a5,118 # 80039938 <uxLastCount0.1>
    800058ca:	639c                	ld	a5,0(a5)
    800058cc:	00f71463          	bne	a4,a5,800058d4 <xAreCountingSemaphoreTasksStillRunning+0x30>
    800058d0:	e402                	sd	zero,8(sp)
    800058d2:	a819                	j	800058e8 <xAreCountingSemaphoreTasksStillRunning+0x44>
    800058d4:	00034797          	auipc	a5,0x34
    800058d8:	03478793          	addi	a5,a5,52 # 80039908 <xParameters>
    800058dc:	6b98                	ld	a4,16(a5)
    800058de:	00034797          	auipc	a5,0x34
    800058e2:	05a78793          	addi	a5,a5,90 # 80039938 <uxLastCount0.1>
    800058e6:	e398                	sd	a4,0(a5)
    800058e8:	00034797          	auipc	a5,0x34
    800058ec:	02078793          	addi	a5,a5,32 # 80039908 <xParameters>
    800058f0:	7798                	ld	a4,40(a5)
    800058f2:	00034797          	auipc	a5,0x34
    800058f6:	04e78793          	addi	a5,a5,78 # 80039940 <uxLastCount1.0>
    800058fa:	639c                	ld	a5,0(a5)
    800058fc:	00f71463          	bne	a4,a5,80005904 <xAreCountingSemaphoreTasksStillRunning+0x60>
    80005900:	e402                	sd	zero,8(sp)
    80005902:	a819                	j	80005918 <xAreCountingSemaphoreTasksStillRunning+0x74>
    80005904:	00034797          	auipc	a5,0x34
    80005908:	00478793          	addi	a5,a5,4 # 80039908 <xParameters>
    8000590c:	7798                	ld	a4,40(a5)
    8000590e:	00034797          	auipc	a5,0x34
    80005912:	03278793          	addi	a5,a5,50 # 80039940 <uxLastCount1.0>
    80005916:	e398                	sd	a4,0(a5)
    80005918:	67a2                	ld	a5,8(sp)
    8000591a:	853e                	mv	a0,a5
    8000591c:	0141                	addi	sp,sp,16
    8000591e:	8082                	ret

0000000080005920 <vStartRecursiveMutexTasks>:
    80005920:	1141                	addi	sp,sp,-16
    80005922:	e406                	sd	ra,8(sp)
    80005924:	4511                	li	a0,4
    80005926:	eaffa0ef          	jal	800007d4 <xQueueCreateMutex>
    8000592a:	872a                	mv	a4,a0
    8000592c:	00034797          	auipc	a5,0x34
    80005930:	01c78793          	addi	a5,a5,28 # 80039948 <xMutex>
    80005934:	e398                	sd	a4,0(a5)
    80005936:	00034797          	auipc	a5,0x34
    8000593a:	01278793          	addi	a5,a5,18 # 80039948 <xMutex>
    8000593e:	639c                	ld	a5,0(a5)
    80005940:	0001b597          	auipc	a1,0x1b
    80005944:	9d858593          	addi	a1,a1,-1576 # 80020318 <__rodata_start+0x318>
    80005948:	853e                	mv	a0,a5
    8000594a:	917fb0ef          	jal	80001260 <vQueueAddToRegistry>
    8000594e:	00034797          	auipc	a5,0x34
    80005952:	ffa78793          	addi	a5,a5,-6 # 80039948 <xMutex>
    80005956:	639c                	ld	a5,0(a5)
    80005958:	cbb5                	beqz	a5,800059cc <vStartRecursiveMutexTasks+0xac>
    8000595a:	4881                	li	a7,0
    8000595c:	4801                	li	a6,0
    8000595e:	00034797          	auipc	a5,0x34
    80005962:	02278793          	addi	a5,a5,34 # 80039980 <xControllingTaskHandle>
    80005966:	4709                	li	a4,2
    80005968:	4681                	li	a3,0
    8000596a:	40000613          	li	a2,1024
    8000596e:	0001b597          	auipc	a1,0x1b
    80005972:	9ba58593          	addi	a1,a1,-1606 # 80020328 <__rodata_start+0x328>
    80005976:	00000517          	auipc	a0,0x0
    8000597a:	05e50513          	addi	a0,a0,94 # 800059d4 <prvRecursiveMutexControllingTask>
    8000597e:	9e1fb0ef          	jal	8000135e <xTaskGenericCreate>
    80005982:	4881                	li	a7,0
    80005984:	4801                	li	a6,0
    80005986:	00034797          	auipc	a5,0x34
    8000598a:	00278793          	addi	a5,a5,2 # 80039988 <xBlockingTaskHandle>
    8000598e:	4705                	li	a4,1
    80005990:	4681                	li	a3,0
    80005992:	40000613          	li	a2,1024
    80005996:	0001b597          	auipc	a1,0x1b
    8000599a:	99a58593          	addi	a1,a1,-1638 # 80020330 <__rodata_start+0x330>
    8000599e:	00000517          	auipc	a0,0x0
    800059a2:	13650513          	addi	a0,a0,310 # 80005ad4 <prvRecursiveMutexBlockingTask>
    800059a6:	9b9fb0ef          	jal	8000135e <xTaskGenericCreate>
    800059aa:	4881                	li	a7,0
    800059ac:	4801                	li	a6,0
    800059ae:	4781                	li	a5,0
    800059b0:	4701                	li	a4,0
    800059b2:	4681                	li	a3,0
    800059b4:	40000613          	li	a2,1024
    800059b8:	0001b597          	auipc	a1,0x1b
    800059bc:	98058593          	addi	a1,a1,-1664 # 80020338 <__rodata_start+0x338>
    800059c0:	00000517          	auipc	a0,0x0
    800059c4:	1e450513          	addi	a0,a0,484 # 80005ba4 <prvRecursiveMutexPollingTask>
    800059c8:	997fb0ef          	jal	8000135e <xTaskGenericCreate>
    800059cc:	0001                	nop
    800059ce:	60a2                	ld	ra,8(sp)
    800059d0:	0141                	addi	sp,sp,16
    800059d2:	8082                	ret

00000000800059d4 <prvRecursiveMutexControllingTask>:
    800059d4:	7179                	addi	sp,sp,-48
    800059d6:	f406                	sd	ra,40(sp)
    800059d8:	e42a                	sd	a0,8(sp)
    800059da:	00034797          	auipc	a5,0x34
    800059de:	f6e78793          	addi	a5,a5,-146 # 80039948 <xMutex>
    800059e2:	639c                	ld	a5,0(a5)
    800059e4:	853e                	mv	a0,a5
    800059e6:	e75fa0ef          	jal	8000085a <xQueueGiveMutexRecursive>
    800059ea:	872a                	mv	a4,a0
    800059ec:	4785                	li	a5,1
    800059ee:	00f71863          	bne	a4,a5,800059fe <prvRecursiveMutexControllingTask+0x2a>
    800059f2:	00034797          	auipc	a5,0x34
    800059f6:	f5e78793          	addi	a5,a5,-162 # 80039950 <xErrorOccurred>
    800059fa:	4705                	li	a4,1
    800059fc:	e398                	sd	a4,0(a5)
    800059fe:	ec02                	sd	zero,24(sp)
    80005a00:	a815                	j	80005a34 <prvRecursiveMutexControllingTask+0x60>
    80005a02:	00034797          	auipc	a5,0x34
    80005a06:	f4678793          	addi	a5,a5,-186 # 80039948 <xMutex>
    80005a0a:	639c                	ld	a5,0(a5)
    80005a0c:	45a1                	li	a1,8
    80005a0e:	853e                	mv	a0,a5
    80005a10:	ea3fa0ef          	jal	800008b2 <xQueueTakeMutexRecursive>
    80005a14:	872a                	mv	a4,a0
    80005a16:	4785                	li	a5,1
    80005a18:	00f70863          	beq	a4,a5,80005a28 <prvRecursiveMutexControllingTask+0x54>
    80005a1c:	00034797          	auipc	a5,0x34
    80005a20:	f3478793          	addi	a5,a5,-204 # 80039950 <xErrorOccurred>
    80005a24:	4705                	li	a4,1
    80005a26:	e398                	sd	a4,0(a5)
    80005a28:	4551                	li	a0,20
    80005a2a:	c8dfb0ef          	jal	800016b6 <vTaskDelay>
    80005a2e:	67e2                	ld	a5,24(sp)
    80005a30:	0785                	addi	a5,a5,1
    80005a32:	ec3e                	sd	a5,24(sp)
    80005a34:	6762                	ld	a4,24(sp)
    80005a36:	47a5                	li	a5,9
    80005a38:	fce7f5e3          	bgeu	a5,a4,80005a02 <prvRecursiveMutexControllingTask+0x2e>
    80005a3c:	ec02                	sd	zero,24(sp)
    80005a3e:	a80d                	j	80005a70 <prvRecursiveMutexControllingTask+0x9c>
    80005a40:	4551                	li	a0,20
    80005a42:	c75fb0ef          	jal	800016b6 <vTaskDelay>
    80005a46:	00034797          	auipc	a5,0x34
    80005a4a:	f0278793          	addi	a5,a5,-254 # 80039948 <xMutex>
    80005a4e:	639c                	ld	a5,0(a5)
    80005a50:	853e                	mv	a0,a5
    80005a52:	e09fa0ef          	jal	8000085a <xQueueGiveMutexRecursive>
    80005a56:	872a                	mv	a4,a0
    80005a58:	4785                	li	a5,1
    80005a5a:	00f70863          	beq	a4,a5,80005a6a <prvRecursiveMutexControllingTask+0x96>
    80005a5e:	00034797          	auipc	a5,0x34
    80005a62:	ef278793          	addi	a5,a5,-270 # 80039950 <xErrorOccurred>
    80005a66:	4705                	li	a4,1
    80005a68:	e398                	sd	a4,0(a5)
    80005a6a:	67e2                	ld	a5,24(sp)
    80005a6c:	0785                	addi	a5,a5,1
    80005a6e:	ec3e                	sd	a5,24(sp)
    80005a70:	6762                	ld	a4,24(sp)
    80005a72:	47a5                	li	a5,9
    80005a74:	fce7f6e3          	bgeu	a5,a4,80005a40 <prvRecursiveMutexControllingTask+0x6c>
    80005a78:	00034797          	auipc	a5,0x34
    80005a7c:	ed078793          	addi	a5,a5,-304 # 80039948 <xMutex>
    80005a80:	639c                	ld	a5,0(a5)
    80005a82:	853e                	mv	a0,a5
    80005a84:	dd7fa0ef          	jal	8000085a <xQueueGiveMutexRecursive>
    80005a88:	872a                	mv	a4,a0
    80005a8a:	4785                	li	a5,1
    80005a8c:	00f71863          	bne	a4,a5,80005a9c <prvRecursiveMutexControllingTask+0xc8>
    80005a90:	00034797          	auipc	a5,0x34
    80005a94:	ec078793          	addi	a5,a5,-320 # 80039950 <xErrorOccurred>
    80005a98:	4705                	li	a4,1
    80005a9a:	e398                	sd	a4,0(a5)
    80005a9c:	00034797          	auipc	a5,0x34
    80005aa0:	ecc78793          	addi	a5,a5,-308 # 80039968 <uxControllingCycles>
    80005aa4:	639c                	ld	a5,0(a5)
    80005aa6:	00178713          	addi	a4,a5,1
    80005aaa:	00034797          	auipc	a5,0x34
    80005aae:	ebe78793          	addi	a5,a5,-322 # 80039968 <uxControllingCycles>
    80005ab2:	e398                	sd	a4,0(a5)
    80005ab4:	00034797          	auipc	a5,0x34
    80005ab8:	ea478793          	addi	a5,a5,-348 # 80039958 <xControllingIsSuspended>
    80005abc:	4705                	li	a4,1
    80005abe:	e398                	sd	a4,0(a5)
    80005ac0:	4501                	li	a0,0
    80005ac2:	ebffb0ef          	jal	80001980 <vTaskSuspend>
    80005ac6:	00034797          	auipc	a5,0x34
    80005aca:	e9278793          	addi	a5,a5,-366 # 80039958 <xControllingIsSuspended>
    80005ace:	0007b023          	sd	zero,0(a5)
    80005ad2:	b721                	j	800059da <prvRecursiveMutexControllingTask+0x6>

0000000080005ad4 <prvRecursiveMutexBlockingTask>:
    80005ad4:	1101                	addi	sp,sp,-32
    80005ad6:	ec06                	sd	ra,24(sp)
    80005ad8:	e42a                	sd	a0,8(sp)
    80005ada:	00034797          	auipc	a5,0x34
    80005ade:	e6e78793          	addi	a5,a5,-402 # 80039948 <xMutex>
    80005ae2:	639c                	ld	a5,0(a5)
    80005ae4:	55f9                	li	a1,-2
    80005ae6:	853e                	mv	a0,a5
    80005ae8:	dcbfa0ef          	jal	800008b2 <xQueueTakeMutexRecursive>
    80005aec:	872a                	mv	a4,a0
    80005aee:	4785                	li	a5,1
    80005af0:	06f71363          	bne	a4,a5,80005b56 <prvRecursiveMutexBlockingTask+0x82>
    80005af4:	00034797          	auipc	a5,0x34
    80005af8:	e6478793          	addi	a5,a5,-412 # 80039958 <xControllingIsSuspended>
    80005afc:	6398                	ld	a4,0(a5)
    80005afe:	4785                	li	a5,1
    80005b00:	00f70963          	beq	a4,a5,80005b12 <prvRecursiveMutexBlockingTask+0x3e>
    80005b04:	00034797          	auipc	a5,0x34
    80005b08:	e4c78793          	addi	a5,a5,-436 # 80039950 <xErrorOccurred>
    80005b0c:	4705                	li	a4,1
    80005b0e:	e398                	sd	a4,0(a5)
    80005b10:	a889                	j	80005b62 <prvRecursiveMutexBlockingTask+0x8e>
    80005b12:	00034797          	auipc	a5,0x34
    80005b16:	e3678793          	addi	a5,a5,-458 # 80039948 <xMutex>
    80005b1a:	639c                	ld	a5,0(a5)
    80005b1c:	853e                	mv	a0,a5
    80005b1e:	d3dfa0ef          	jal	8000085a <xQueueGiveMutexRecursive>
    80005b22:	872a                	mv	a4,a0
    80005b24:	4785                	li	a5,1
    80005b26:	00f70863          	beq	a4,a5,80005b36 <prvRecursiveMutexBlockingTask+0x62>
    80005b2a:	00034797          	auipc	a5,0x34
    80005b2e:	e2678793          	addi	a5,a5,-474 # 80039950 <xErrorOccurred>
    80005b32:	4705                	li	a4,1
    80005b34:	e398                	sd	a4,0(a5)
    80005b36:	00034797          	auipc	a5,0x34
    80005b3a:	e2a78793          	addi	a5,a5,-470 # 80039960 <xBlockingIsSuspended>
    80005b3e:	4705                	li	a4,1
    80005b40:	e398                	sd	a4,0(a5)
    80005b42:	4501                	li	a0,0
    80005b44:	e3dfb0ef          	jal	80001980 <vTaskSuspend>
    80005b48:	00034797          	auipc	a5,0x34
    80005b4c:	e1878793          	addi	a5,a5,-488 # 80039960 <xBlockingIsSuspended>
    80005b50:	0007b023          	sd	zero,0(a5)
    80005b54:	a039                	j	80005b62 <prvRecursiveMutexBlockingTask+0x8e>
    80005b56:	00034797          	auipc	a5,0x34
    80005b5a:	dfa78793          	addi	a5,a5,-518 # 80039950 <xErrorOccurred>
    80005b5e:	4705                	li	a4,1
    80005b60:	e398                	sd	a4,0(a5)
    80005b62:	00034797          	auipc	a5,0x34
    80005b66:	e0e78793          	addi	a5,a5,-498 # 80039970 <uxBlockingCycles>
    80005b6a:	639c                	ld	a5,0(a5)
    80005b6c:	00178713          	addi	a4,a5,1
    80005b70:	00034797          	auipc	a5,0x34
    80005b74:	df878793          	addi	a5,a5,-520 # 80039968 <uxControllingCycles>
    80005b78:	639c                	ld	a5,0(a5)
    80005b7a:	00f70863          	beq	a4,a5,80005b8a <prvRecursiveMutexBlockingTask+0xb6>
    80005b7e:	00034797          	auipc	a5,0x34
    80005b82:	dd278793          	addi	a5,a5,-558 # 80039950 <xErrorOccurred>
    80005b86:	4705                	li	a4,1
    80005b88:	e398                	sd	a4,0(a5)
    80005b8a:	00034797          	auipc	a5,0x34
    80005b8e:	de678793          	addi	a5,a5,-538 # 80039970 <uxBlockingCycles>
    80005b92:	639c                	ld	a5,0(a5)
    80005b94:	00178713          	addi	a4,a5,1
    80005b98:	00034797          	auipc	a5,0x34
    80005b9c:	dd878793          	addi	a5,a5,-552 # 80039970 <uxBlockingCycles>
    80005ba0:	e398                	sd	a4,0(a5)
    80005ba2:	bf25                	j	80005ada <prvRecursiveMutexBlockingTask+0x6>

0000000080005ba4 <prvRecursiveMutexPollingTask>:
    80005ba4:	1101                	addi	sp,sp,-32
    80005ba6:	ec06                	sd	ra,24(sp)
    80005ba8:	e42a                	sd	a0,8(sp)
    80005baa:	00034797          	auipc	a5,0x34
    80005bae:	d9e78793          	addi	a5,a5,-610 # 80039948 <xMutex>
    80005bb2:	639c                	ld	a5,0(a5)
    80005bb4:	4581                	li	a1,0
    80005bb6:	853e                	mv	a0,a5
    80005bb8:	cfbfa0ef          	jal	800008b2 <xQueueTakeMutexRecursive>
    80005bbc:	872a                	mv	a4,a0
    80005bbe:	4785                	li	a5,1
    80005bc0:	fef715e3          	bne	a4,a5,80005baa <prvRecursiveMutexPollingTask+0x6>
    80005bc4:	00034797          	auipc	a5,0x34
    80005bc8:	dbc78793          	addi	a5,a5,-580 # 80039980 <xControllingTaskHandle>
    80005bcc:	639c                	ld	a5,0(a5)
    80005bce:	853e                	mv	a0,a5
    80005bd0:	b51fb0ef          	jal	80001720 <eTaskGetState>
    80005bd4:	87aa                	mv	a5,a0
    80005bd6:	873e                	mv	a4,a5
    80005bd8:	478d                	li	a5,3
    80005bda:	00f70663          	beq	a4,a5,80005be6 <prvRecursiveMutexPollingTask+0x42>
    80005bde:	30047073          	csrci	mstatus,8
    80005be2:	0001                	nop
    80005be4:	bffd                	j	80005be2 <prvRecursiveMutexPollingTask+0x3e>
    80005be6:	00034797          	auipc	a5,0x34
    80005bea:	da278793          	addi	a5,a5,-606 # 80039988 <xBlockingTaskHandle>
    80005bee:	639c                	ld	a5,0(a5)
    80005bf0:	853e                	mv	a0,a5
    80005bf2:	b2ffb0ef          	jal	80001720 <eTaskGetState>
    80005bf6:	87aa                	mv	a5,a0
    80005bf8:	873e                	mv	a4,a5
    80005bfa:	478d                	li	a5,3
    80005bfc:	00f70663          	beq	a4,a5,80005c08 <prvRecursiveMutexPollingTask+0x64>
    80005c00:	30047073          	csrci	mstatus,8
    80005c04:	0001                	nop
    80005c06:	bffd                	j	80005c04 <prvRecursiveMutexPollingTask+0x60>
    80005c08:	00034797          	auipc	a5,0x34
    80005c0c:	d5878793          	addi	a5,a5,-680 # 80039960 <xBlockingIsSuspended>
    80005c10:	6398                	ld	a4,0(a5)
    80005c12:	4785                	li	a5,1
    80005c14:	00f71a63          	bne	a4,a5,80005c28 <prvRecursiveMutexPollingTask+0x84>
    80005c18:	00034797          	auipc	a5,0x34
    80005c1c:	d4078793          	addi	a5,a5,-704 # 80039958 <xControllingIsSuspended>
    80005c20:	6398                	ld	a4,0(a5)
    80005c22:	4785                	li	a5,1
    80005c24:	00f70963          	beq	a4,a5,80005c36 <prvRecursiveMutexPollingTask+0x92>
    80005c28:	00034797          	auipc	a5,0x34
    80005c2c:	d2878793          	addi	a5,a5,-728 # 80039950 <xErrorOccurred>
    80005c30:	4705                	li	a4,1
    80005c32:	e398                	sd	a4,0(a5)
    80005c34:	a8e5                	j	80005d2c <prvRecursiveMutexPollingTask+0x188>
    80005c36:	00034797          	auipc	a5,0x34
    80005c3a:	d4278793          	addi	a5,a5,-702 # 80039978 <uxPollingCycles>
    80005c3e:	639c                	ld	a5,0(a5)
    80005c40:	00178713          	addi	a4,a5,1
    80005c44:	00034797          	auipc	a5,0x34
    80005c48:	d3478793          	addi	a5,a5,-716 # 80039978 <uxPollingCycles>
    80005c4c:	e398                	sd	a4,0(a5)
    80005c4e:	00034797          	auipc	a5,0x34
    80005c52:	d3a78793          	addi	a5,a5,-710 # 80039988 <xBlockingTaskHandle>
    80005c56:	639c                	ld	a5,0(a5)
    80005c58:	853e                	mv	a0,a5
    80005c5a:	e51fb0ef          	jal	80001aaa <vTaskResume>
    80005c5e:	00034797          	auipc	a5,0x34
    80005c62:	d2278793          	addi	a5,a5,-734 # 80039980 <xControllingTaskHandle>
    80005c66:	639c                	ld	a5,0(a5)
    80005c68:	853e                	mv	a0,a5
    80005c6a:	e41fb0ef          	jal	80001aaa <vTaskResume>
    80005c6e:	00034797          	auipc	a5,0x34
    80005c72:	cf278793          	addi	a5,a5,-782 # 80039960 <xBlockingIsSuspended>
    80005c76:	6398                	ld	a4,0(a5)
    80005c78:	4785                	li	a5,1
    80005c7a:	00f70a63          	beq	a4,a5,80005c8e <prvRecursiveMutexPollingTask+0xea>
    80005c7e:	00034797          	auipc	a5,0x34
    80005c82:	cda78793          	addi	a5,a5,-806 # 80039958 <xControllingIsSuspended>
    80005c86:	6398                	ld	a4,0(a5)
    80005c88:	4785                	li	a5,1
    80005c8a:	00f71863          	bne	a4,a5,80005c9a <prvRecursiveMutexPollingTask+0xf6>
    80005c8e:	00034797          	auipc	a5,0x34
    80005c92:	cc278793          	addi	a5,a5,-830 # 80039950 <xErrorOccurred>
    80005c96:	4705                	li	a4,1
    80005c98:	e398                	sd	a4,0(a5)
    80005c9a:	4501                	li	a0,0
    80005c9c:	b25fb0ef          	jal	800017c0 <uxTaskPriorityGet>
    80005ca0:	872a                	mv	a4,a0
    80005ca2:	4789                	li	a5,2
    80005ca4:	00f70663          	beq	a4,a5,80005cb0 <prvRecursiveMutexPollingTask+0x10c>
    80005ca8:	30047073          	csrci	mstatus,8
    80005cac:	0001                	nop
    80005cae:	bffd                	j	80005cac <prvRecursiveMutexPollingTask+0x108>
    80005cb0:	00034797          	auipc	a5,0x34
    80005cb4:	cd078793          	addi	a5,a5,-816 # 80039980 <xControllingTaskHandle>
    80005cb8:	639c                	ld	a5,0(a5)
    80005cba:	853e                	mv	a0,a5
    80005cbc:	a65fb0ef          	jal	80001720 <eTaskGetState>
    80005cc0:	87aa                	mv	a5,a0
    80005cc2:	873e                	mv	a4,a5
    80005cc4:	4789                	li	a5,2
    80005cc6:	00f70663          	beq	a4,a5,80005cd2 <prvRecursiveMutexPollingTask+0x12e>
    80005cca:	30047073          	csrci	mstatus,8
    80005cce:	0001                	nop
    80005cd0:	bffd                	j	80005cce <prvRecursiveMutexPollingTask+0x12a>
    80005cd2:	00034797          	auipc	a5,0x34
    80005cd6:	cb678793          	addi	a5,a5,-842 # 80039988 <xBlockingTaskHandle>
    80005cda:	639c                	ld	a5,0(a5)
    80005cdc:	853e                	mv	a0,a5
    80005cde:	a43fb0ef          	jal	80001720 <eTaskGetState>
    80005ce2:	87aa                	mv	a5,a0
    80005ce4:	873e                	mv	a4,a5
    80005ce6:	4789                	li	a5,2
    80005ce8:	00f70663          	beq	a4,a5,80005cf4 <prvRecursiveMutexPollingTask+0x150>
    80005cec:	30047073          	csrci	mstatus,8
    80005cf0:	0001                	nop
    80005cf2:	bffd                	j	80005cf0 <prvRecursiveMutexPollingTask+0x14c>
    80005cf4:	00034797          	auipc	a5,0x34
    80005cf8:	c5478793          	addi	a5,a5,-940 # 80039948 <xMutex>
    80005cfc:	639c                	ld	a5,0(a5)
    80005cfe:	853e                	mv	a0,a5
    80005d00:	b5bfa0ef          	jal	8000085a <xQueueGiveMutexRecursive>
    80005d04:	872a                	mv	a4,a0
    80005d06:	4785                	li	a5,1
    80005d08:	00f70863          	beq	a4,a5,80005d18 <prvRecursiveMutexPollingTask+0x174>
    80005d0c:	00034797          	auipc	a5,0x34
    80005d10:	c4478793          	addi	a5,a5,-956 # 80039950 <xErrorOccurred>
    80005d14:	4705                	li	a4,1
    80005d16:	e398                	sd	a4,0(a5)
    80005d18:	4501                	li	a0,0
    80005d1a:	aa7fb0ef          	jal	800017c0 <uxTaskPriorityGet>
    80005d1e:	87aa                	mv	a5,a0
    80005d20:	e80785e3          	beqz	a5,80005baa <prvRecursiveMutexPollingTask+0x6>
    80005d24:	30047073          	csrci	mstatus,8
    80005d28:	0001                	nop
    80005d2a:	bffd                	j	80005d28 <prvRecursiveMutexPollingTask+0x184>
    80005d2c:	bdbd                	j	80005baa <prvRecursiveMutexPollingTask+0x6>

0000000080005d2e <xAreRecursiveMutexTasksStillRunning>:
    80005d2e:	1141                	addi	sp,sp,-16
    80005d30:	00034797          	auipc	a5,0x34
    80005d34:	c6078793          	addi	a5,a5,-928 # 80039990 <uxLastControllingCycles.2>
    80005d38:	6398                	ld	a4,0(a5)
    80005d3a:	00034797          	auipc	a5,0x34
    80005d3e:	c2e78793          	addi	a5,a5,-978 # 80039968 <uxControllingCycles>
    80005d42:	639c                	ld	a5,0(a5)
    80005d44:	00f71963          	bne	a4,a5,80005d56 <xAreRecursiveMutexTasksStillRunning+0x28>
    80005d48:	00034797          	auipc	a5,0x34
    80005d4c:	c0878793          	addi	a5,a5,-1016 # 80039950 <xErrorOccurred>
    80005d50:	4705                	li	a4,1
    80005d52:	e398                	sd	a4,0(a5)
    80005d54:	a819                	j	80005d6a <xAreRecursiveMutexTasksStillRunning+0x3c>
    80005d56:	00034797          	auipc	a5,0x34
    80005d5a:	c1278793          	addi	a5,a5,-1006 # 80039968 <uxControllingCycles>
    80005d5e:	6398                	ld	a4,0(a5)
    80005d60:	00034797          	auipc	a5,0x34
    80005d64:	c3078793          	addi	a5,a5,-976 # 80039990 <uxLastControllingCycles.2>
    80005d68:	e398                	sd	a4,0(a5)
    80005d6a:	00034797          	auipc	a5,0x34
    80005d6e:	c2e78793          	addi	a5,a5,-978 # 80039998 <uxLastBlockingCycles.1>
    80005d72:	6398                	ld	a4,0(a5)
    80005d74:	00034797          	auipc	a5,0x34
    80005d78:	bfc78793          	addi	a5,a5,-1028 # 80039970 <uxBlockingCycles>
    80005d7c:	639c                	ld	a5,0(a5)
    80005d7e:	00f71963          	bne	a4,a5,80005d90 <xAreRecursiveMutexTasksStillRunning+0x62>
    80005d82:	00034797          	auipc	a5,0x34
    80005d86:	bce78793          	addi	a5,a5,-1074 # 80039950 <xErrorOccurred>
    80005d8a:	4705                	li	a4,1
    80005d8c:	e398                	sd	a4,0(a5)
    80005d8e:	a819                	j	80005da4 <xAreRecursiveMutexTasksStillRunning+0x76>
    80005d90:	00034797          	auipc	a5,0x34
    80005d94:	be078793          	addi	a5,a5,-1056 # 80039970 <uxBlockingCycles>
    80005d98:	6398                	ld	a4,0(a5)
    80005d9a:	00034797          	auipc	a5,0x34
    80005d9e:	bfe78793          	addi	a5,a5,-1026 # 80039998 <uxLastBlockingCycles.1>
    80005da2:	e398                	sd	a4,0(a5)
    80005da4:	00034797          	auipc	a5,0x34
    80005da8:	bfc78793          	addi	a5,a5,-1028 # 800399a0 <uxLastPollingCycles.0>
    80005dac:	6398                	ld	a4,0(a5)
    80005dae:	00034797          	auipc	a5,0x34
    80005db2:	bca78793          	addi	a5,a5,-1078 # 80039978 <uxPollingCycles>
    80005db6:	639c                	ld	a5,0(a5)
    80005db8:	00f71963          	bne	a4,a5,80005dca <xAreRecursiveMutexTasksStillRunning+0x9c>
    80005dbc:	00034797          	auipc	a5,0x34
    80005dc0:	b9478793          	addi	a5,a5,-1132 # 80039950 <xErrorOccurred>
    80005dc4:	4705                	li	a4,1
    80005dc6:	e398                	sd	a4,0(a5)
    80005dc8:	a819                	j	80005dde <xAreRecursiveMutexTasksStillRunning+0xb0>
    80005dca:	00034797          	auipc	a5,0x34
    80005dce:	bae78793          	addi	a5,a5,-1106 # 80039978 <uxPollingCycles>
    80005dd2:	6398                	ld	a4,0(a5)
    80005dd4:	00034797          	auipc	a5,0x34
    80005dd8:	bcc78793          	addi	a5,a5,-1076 # 800399a0 <uxLastPollingCycles.0>
    80005ddc:	e398                	sd	a4,0(a5)
    80005dde:	00034797          	auipc	a5,0x34
    80005de2:	b7278793          	addi	a5,a5,-1166 # 80039950 <xErrorOccurred>
    80005de6:	6398                	ld	a4,0(a5)
    80005de8:	4785                	li	a5,1
    80005dea:	00f71463          	bne	a4,a5,80005df2 <xAreRecursiveMutexTasksStillRunning+0xc4>
    80005dee:	e402                	sd	zero,8(sp)
    80005df0:	a019                	j	80005df6 <xAreRecursiveMutexTasksStillRunning+0xc8>
    80005df2:	4785                	li	a5,1
    80005df4:	e43e                	sd	a5,8(sp)
    80005df6:	67a2                	ld	a5,8(sp)
    80005df8:	853e                	mv	a0,a5
    80005dfa:	0141                	addi	sp,sp,16
    80005dfc:	8082                	ret

0000000080005dfe <strnlen>:
    80005dfe:	00b506b3          	add	a3,a0,a1
    80005e02:	87aa                	mv	a5,a0
    80005e04:	e589                	bnez	a1,80005e0e <strnlen+0x10>
    80005e06:	a829                	j	80005e20 <strnlen+0x22>
    80005e08:	0785                	addi	a5,a5,1
    80005e0a:	00f68863          	beq	a3,a5,80005e1a <strnlen+0x1c>
    80005e0e:	0007c703          	lbu	a4,0(a5)
    80005e12:	fb7d                	bnez	a4,80005e08 <strnlen+0xa>
    80005e14:	40a78533          	sub	a0,a5,a0
    80005e18:	8082                	ret
    80005e1a:	40a68533          	sub	a0,a3,a0
    80005e1e:	8082                	ret
    80005e20:	4501                	li	a0,0
    80005e22:	8082                	ret
