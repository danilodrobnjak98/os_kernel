
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	a6813103          	ld	sp,-1432(sp) # 80005a68 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	1a0020ef          	jal	ra,800021bc <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_ZN5Riscv13pushRegistersEv>:
.global _ZN5Riscv13pushRegistersEv
.type _ZN5Riscv13pushRegistersEv, @function
_ZN5Riscv13pushRegistersEv:
    addi sp, sp, -256
    80001000:	f0010113          	addi	sp,sp,-256
    // https://sourceware.org/binutils/docs/as/Irp.html
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001004:	00313c23          	sd	gp,24(sp)
    80001008:	02413023          	sd	tp,32(sp)
    8000100c:	02513423          	sd	t0,40(sp)
    80001010:	02613823          	sd	t1,48(sp)
    80001014:	02713c23          	sd	t2,56(sp)
    80001018:	04813023          	sd	s0,64(sp)
    8000101c:	04913423          	sd	s1,72(sp)
    80001020:	04a13823          	sd	a0,80(sp)
    80001024:	04b13c23          	sd	a1,88(sp)
    80001028:	06c13023          	sd	a2,96(sp)
    8000102c:	06d13423          	sd	a3,104(sp)
    80001030:	06e13823          	sd	a4,112(sp)
    80001034:	06f13c23          	sd	a5,120(sp)
    80001038:	09013023          	sd	a6,128(sp)
    8000103c:	09113423          	sd	a7,136(sp)
    80001040:	09213823          	sd	s2,144(sp)
    80001044:	09313c23          	sd	s3,152(sp)
    80001048:	0b413023          	sd	s4,160(sp)
    8000104c:	0b513423          	sd	s5,168(sp)
    80001050:	0b613823          	sd	s6,176(sp)
    80001054:	0b713c23          	sd	s7,184(sp)
    80001058:	0d813023          	sd	s8,192(sp)
    8000105c:	0d913423          	sd	s9,200(sp)
    80001060:	0da13823          	sd	s10,208(sp)
    80001064:	0db13c23          	sd	s11,216(sp)
    80001068:	0fc13023          	sd	t3,224(sp)
    8000106c:	0fd13423          	sd	t4,232(sp)
    80001070:	0fe13823          	sd	t5,240(sp)
    80001074:	0ff13c23          	sd	t6,248(sp)
    ret
    80001078:	00008067          	ret

000000008000107c <_ZN5Riscv12popRegistersEv>:
.type _ZN5Riscv12popRegistersEv, @function
_ZN5Riscv12popRegistersEv:
    // https://sourceware.org/binutils/docs/as/Irp.html
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    8000107c:	01813183          	ld	gp,24(sp)
    80001080:	02013203          	ld	tp,32(sp)
    80001084:	02813283          	ld	t0,40(sp)
    80001088:	03013303          	ld	t1,48(sp)
    8000108c:	03813383          	ld	t2,56(sp)
    80001090:	04013403          	ld	s0,64(sp)
    80001094:	04813483          	ld	s1,72(sp)
    80001098:	05013503          	ld	a0,80(sp)
    8000109c:	05813583          	ld	a1,88(sp)
    800010a0:	06013603          	ld	a2,96(sp)
    800010a4:	06813683          	ld	a3,104(sp)
    800010a8:	07013703          	ld	a4,112(sp)
    800010ac:	07813783          	ld	a5,120(sp)
    800010b0:	08013803          	ld	a6,128(sp)
    800010b4:	08813883          	ld	a7,136(sp)
    800010b8:	09013903          	ld	s2,144(sp)
    800010bc:	09813983          	ld	s3,152(sp)
    800010c0:	0a013a03          	ld	s4,160(sp)
    800010c4:	0a813a83          	ld	s5,168(sp)
    800010c8:	0b013b03          	ld	s6,176(sp)
    800010cc:	0b813b83          	ld	s7,184(sp)
    800010d0:	0c013c03          	ld	s8,192(sp)
    800010d4:	0c813c83          	ld	s9,200(sp)
    800010d8:	0d013d03          	ld	s10,208(sp)
    800010dc:	0d813d83          	ld	s11,216(sp)
    800010e0:	0e013e03          	ld	t3,224(sp)
    800010e4:	0e813e83          	ld	t4,232(sp)
    800010e8:	0f013f03          	ld	t5,240(sp)
    800010ec:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    800010f0:	10010113          	addi	sp,sp,256
    ret
    800010f4:	00008067          	ret

00000000800010f8 <_ZN3CCB13contextSwitchEPNS_7ContextES1_>:
.global _ZN3CCB13contextSwitchEPNS_7ContextES1_
.type _ZN3CCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3CCB13contextSwitchEPNS_7ContextES1_:
    sd ra, 0 * 8(a0)
    800010f8:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    800010fc:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1)
    80001100:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    80001104:	0085b103          	ld	sp,8(a1)

    80001108:	00008067          	ret

000000008000110c <_ZL9fibonaccim>:
#include "../lib/hw.h"
#include "../h/ccb.hpp"
#include "../h/print.hpp"

static uint64 fibonacci(uint64 n)
{
    8000110c:	fe010113          	addi	sp,sp,-32
    80001110:	00113c23          	sd	ra,24(sp)
    80001114:	00813823          	sd	s0,16(sp)
    80001118:	00913423          	sd	s1,8(sp)
    8000111c:	01213023          	sd	s2,0(sp)
    80001120:	02010413          	addi	s0,sp,32
    80001124:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80001128:	00100793          	li	a5,1
    8000112c:	02a7f663          	bgeu	a5,a0,80001158 <_ZL9fibonaccim+0x4c>
    if (n % 4 == 0) CCB::yield();
    80001130:	00357793          	andi	a5,a0,3
    80001134:	02078e63          	beqz	a5,80001170 <_ZL9fibonaccim+0x64>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80001138:	fff48513          	addi	a0,s1,-1
    8000113c:	00000097          	auipc	ra,0x0
    80001140:	fd0080e7          	jalr	-48(ra) # 8000110c <_ZL9fibonaccim>
    80001144:	00050913          	mv	s2,a0
    80001148:	ffe48513          	addi	a0,s1,-2
    8000114c:	00000097          	auipc	ra,0x0
    80001150:	fc0080e7          	jalr	-64(ra) # 8000110c <_ZL9fibonaccim>
    80001154:	00a90533          	add	a0,s2,a0
}
    80001158:	01813083          	ld	ra,24(sp)
    8000115c:	01013403          	ld	s0,16(sp)
    80001160:	00813483          	ld	s1,8(sp)
    80001164:	00013903          	ld	s2,0(sp)
    80001168:	02010113          	addi	sp,sp,32
    8000116c:	00008067          	ret
    if (n % 4 == 0) CCB::yield();
    80001170:	00001097          	auipc	ra,0x1
    80001174:	950080e7          	jalr	-1712(ra) # 80001ac0 <_ZN3CCB5yieldEv>
    80001178:	fc1ff06f          	j	80001138 <_ZL9fibonaccim+0x2c>

000000008000117c <_Z11workerBodyAv>:

void workerBodyA()
{
    8000117c:	fe010113          	addi	sp,sp,-32
    80001180:	00113c23          	sd	ra,24(sp)
    80001184:	00813823          	sd	s0,16(sp)
    80001188:	00913423          	sd	s1,8(sp)
    8000118c:	01213023          	sd	s2,0(sp)
    80001190:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80001194:	00000493          	li	s1,0
    80001198:	0380006f          	j	800011d0 <_Z11workerBodyAv+0x54>
    for (; i < 3; i++)
    {
        printString("A: i=");
    8000119c:	00004517          	auipc	a0,0x4
    800011a0:	e8450513          	addi	a0,a0,-380 # 80005020 <CONSOLE_STATUS+0x10>
    800011a4:	00001097          	auipc	ra,0x1
    800011a8:	f44080e7          	jalr	-188(ra) # 800020e8 <_Z11printStringPKc>
        printInteger(i);
    800011ac:	00048513          	mv	a0,s1
    800011b0:	00001097          	auipc	ra,0x1
    800011b4:	f7c080e7          	jalr	-132(ra) # 8000212c <_Z12printIntegerm>
        printString("\n");
    800011b8:	00004517          	auipc	a0,0x4
    800011bc:	f4850513          	addi	a0,a0,-184 # 80005100 <CONSOLE_STATUS+0xf0>
    800011c0:	00001097          	auipc	ra,0x1
    800011c4:	f28080e7          	jalr	-216(ra) # 800020e8 <_Z11printStringPKc>
    for (; i < 3; i++)
    800011c8:	0014849b          	addiw	s1,s1,1
    800011cc:	0ff4f493          	andi	s1,s1,255
    800011d0:	00200793          	li	a5,2
    800011d4:	fc97f4e3          	bgeu	a5,s1,8000119c <_Z11workerBodyAv+0x20>
    }

    printString("A: yield\n");
    800011d8:	00004517          	auipc	a0,0x4
    800011dc:	e5050513          	addi	a0,a0,-432 # 80005028 <CONSOLE_STATUS+0x18>
    800011e0:	00001097          	auipc	ra,0x1
    800011e4:	f08080e7          	jalr	-248(ra) # 800020e8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800011e8:	00700313          	li	t1,7
    CCB::yield();
    800011ec:	00001097          	auipc	ra,0x1
    800011f0:	8d4080e7          	jalr	-1836(ra) # 80001ac0 <_ZN3CCB5yieldEv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800011f4:	00030913          	mv	s2,t1

    printString("A: t1=");
    800011f8:	00004517          	auipc	a0,0x4
    800011fc:	e4050513          	addi	a0,a0,-448 # 80005038 <CONSOLE_STATUS+0x28>
    80001200:	00001097          	auipc	ra,0x1
    80001204:	ee8080e7          	jalr	-280(ra) # 800020e8 <_Z11printStringPKc>
    printInteger(t1);
    80001208:	00090513          	mv	a0,s2
    8000120c:	00001097          	auipc	ra,0x1
    80001210:	f20080e7          	jalr	-224(ra) # 8000212c <_Z12printIntegerm>
    printString("\n");
    80001214:	00004517          	auipc	a0,0x4
    80001218:	eec50513          	addi	a0,a0,-276 # 80005100 <CONSOLE_STATUS+0xf0>
    8000121c:	00001097          	auipc	ra,0x1
    80001220:	ecc080e7          	jalr	-308(ra) # 800020e8 <_Z11printStringPKc>

    uint64 result = fibonacci(20);
    80001224:	01400513          	li	a0,20
    80001228:	00000097          	auipc	ra,0x0
    8000122c:	ee4080e7          	jalr	-284(ra) # 8000110c <_ZL9fibonaccim>
    80001230:	00050913          	mv	s2,a0
    printString("A: fibonaci=");
    80001234:	00004517          	auipc	a0,0x4
    80001238:	e0c50513          	addi	a0,a0,-500 # 80005040 <CONSOLE_STATUS+0x30>
    8000123c:	00001097          	auipc	ra,0x1
    80001240:	eac080e7          	jalr	-340(ra) # 800020e8 <_Z11printStringPKc>
    printInteger(result);
    80001244:	00090513          	mv	a0,s2
    80001248:	00001097          	auipc	ra,0x1
    8000124c:	ee4080e7          	jalr	-284(ra) # 8000212c <_Z12printIntegerm>
    printString("\n");
    80001250:	00004517          	auipc	a0,0x4
    80001254:	eb050513          	addi	a0,a0,-336 # 80005100 <CONSOLE_STATUS+0xf0>
    80001258:	00001097          	auipc	ra,0x1
    8000125c:	e90080e7          	jalr	-368(ra) # 800020e8 <_Z11printStringPKc>
    80001260:	0380006f          	j	80001298 <_Z11workerBodyAv+0x11c>

    for (; i < 6; i++)
    {
        printString("A: i=");
    80001264:	00004517          	auipc	a0,0x4
    80001268:	dbc50513          	addi	a0,a0,-580 # 80005020 <CONSOLE_STATUS+0x10>
    8000126c:	00001097          	auipc	ra,0x1
    80001270:	e7c080e7          	jalr	-388(ra) # 800020e8 <_Z11printStringPKc>
        printInteger(i);
    80001274:	00048513          	mv	a0,s1
    80001278:	00001097          	auipc	ra,0x1
    8000127c:	eb4080e7          	jalr	-332(ra) # 8000212c <_Z12printIntegerm>
        printString("\n");
    80001280:	00004517          	auipc	a0,0x4
    80001284:	e8050513          	addi	a0,a0,-384 # 80005100 <CONSOLE_STATUS+0xf0>
    80001288:	00001097          	auipc	ra,0x1
    8000128c:	e60080e7          	jalr	-416(ra) # 800020e8 <_Z11printStringPKc>
    for (; i < 6; i++)
    80001290:	0014849b          	addiw	s1,s1,1
    80001294:	0ff4f493          	andi	s1,s1,255
    80001298:	00500793          	li	a5,5
    8000129c:	fc97f4e3          	bgeu	a5,s1,80001264 <_Z11workerBodyAv+0xe8>
    }

    CCB::running->setFinished(true);
    800012a0:	00004797          	auipc	a5,0x4
    800012a4:	7d07b783          	ld	a5,2000(a5) # 80005a70 <_GLOBAL_OFFSET_TABLE_+0x28>
    800012a8:	0007b783          	ld	a5,0(a5)
public:
    ~CCB() { delete[] stack; }

    bool isFinished() const { return finished; }

    void setFinished(bool value) { finished = value; }
    800012ac:	00100713          	li	a4,1
    800012b0:	02e78023          	sb	a4,32(a5)
    CCB::yield();
    800012b4:	00001097          	auipc	ra,0x1
    800012b8:	80c080e7          	jalr	-2036(ra) # 80001ac0 <_ZN3CCB5yieldEv>
}
    800012bc:	01813083          	ld	ra,24(sp)
    800012c0:	01013403          	ld	s0,16(sp)
    800012c4:	00813483          	ld	s1,8(sp)
    800012c8:	00013903          	ld	s2,0(sp)
    800012cc:	02010113          	addi	sp,sp,32
    800012d0:	00008067          	ret

00000000800012d4 <_Z11workerBodyBv>:

void workerBodyB()
{
    800012d4:	fe010113          	addi	sp,sp,-32
    800012d8:	00113c23          	sd	ra,24(sp)
    800012dc:	00813823          	sd	s0,16(sp)
    800012e0:	00913423          	sd	s1,8(sp)
    800012e4:	01213023          	sd	s2,0(sp)
    800012e8:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800012ec:	00a00493          	li	s1,10
    800012f0:	0380006f          	j	80001328 <_Z11workerBodyBv+0x54>
    for (; i < 13; i++)
    {
        printString("B: i=");
    800012f4:	00004517          	auipc	a0,0x4
    800012f8:	d5c50513          	addi	a0,a0,-676 # 80005050 <CONSOLE_STATUS+0x40>
    800012fc:	00001097          	auipc	ra,0x1
    80001300:	dec080e7          	jalr	-532(ra) # 800020e8 <_Z11printStringPKc>
        printInteger(i);
    80001304:	00048513          	mv	a0,s1
    80001308:	00001097          	auipc	ra,0x1
    8000130c:	e24080e7          	jalr	-476(ra) # 8000212c <_Z12printIntegerm>
        printString("\n");
    80001310:	00004517          	auipc	a0,0x4
    80001314:	df050513          	addi	a0,a0,-528 # 80005100 <CONSOLE_STATUS+0xf0>
    80001318:	00001097          	auipc	ra,0x1
    8000131c:	dd0080e7          	jalr	-560(ra) # 800020e8 <_Z11printStringPKc>
    for (; i < 13; i++)
    80001320:	0014849b          	addiw	s1,s1,1
    80001324:	0ff4f493          	andi	s1,s1,255
    80001328:	00c00793          	li	a5,12
    8000132c:	fc97f4e3          	bgeu	a5,s1,800012f4 <_Z11workerBodyBv+0x20>
    }

    printString("B: yield\n");
    80001330:	00004517          	auipc	a0,0x4
    80001334:	d2850513          	addi	a0,a0,-728 # 80005058 <CONSOLE_STATUS+0x48>
    80001338:	00001097          	auipc	ra,0x1
    8000133c:	db0080e7          	jalr	-592(ra) # 800020e8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80001340:	00500313          	li	t1,5
    CCB::yield();
    80001344:	00000097          	auipc	ra,0x0
    80001348:	77c080e7          	jalr	1916(ra) # 80001ac0 <_ZN3CCB5yieldEv>

    uint64 result = fibonacci(23);
    8000134c:	01700513          	li	a0,23
    80001350:	00000097          	auipc	ra,0x0
    80001354:	dbc080e7          	jalr	-580(ra) # 8000110c <_ZL9fibonaccim>
    80001358:	00050913          	mv	s2,a0
    printString("A: fibonaci=");
    8000135c:	00004517          	auipc	a0,0x4
    80001360:	ce450513          	addi	a0,a0,-796 # 80005040 <CONSOLE_STATUS+0x30>
    80001364:	00001097          	auipc	ra,0x1
    80001368:	d84080e7          	jalr	-636(ra) # 800020e8 <_Z11printStringPKc>
    printInteger(result);
    8000136c:	00090513          	mv	a0,s2
    80001370:	00001097          	auipc	ra,0x1
    80001374:	dbc080e7          	jalr	-580(ra) # 8000212c <_Z12printIntegerm>
    printString("\n");
    80001378:	00004517          	auipc	a0,0x4
    8000137c:	d8850513          	addi	a0,a0,-632 # 80005100 <CONSOLE_STATUS+0xf0>
    80001380:	00001097          	auipc	ra,0x1
    80001384:	d68080e7          	jalr	-664(ra) # 800020e8 <_Z11printStringPKc>
    80001388:	0380006f          	j	800013c0 <_Z11workerBodyBv+0xec>

    for (; i < 16; i++)
    {
        printString("B: i=");
    8000138c:	00004517          	auipc	a0,0x4
    80001390:	cc450513          	addi	a0,a0,-828 # 80005050 <CONSOLE_STATUS+0x40>
    80001394:	00001097          	auipc	ra,0x1
    80001398:	d54080e7          	jalr	-684(ra) # 800020e8 <_Z11printStringPKc>
        printInteger(i);
    8000139c:	00048513          	mv	a0,s1
    800013a0:	00001097          	auipc	ra,0x1
    800013a4:	d8c080e7          	jalr	-628(ra) # 8000212c <_Z12printIntegerm>
        printString("\n");
    800013a8:	00004517          	auipc	a0,0x4
    800013ac:	d5850513          	addi	a0,a0,-680 # 80005100 <CONSOLE_STATUS+0xf0>
    800013b0:	00001097          	auipc	ra,0x1
    800013b4:	d38080e7          	jalr	-712(ra) # 800020e8 <_Z11printStringPKc>
    for (; i < 16; i++)
    800013b8:	0014849b          	addiw	s1,s1,1
    800013bc:	0ff4f493          	andi	s1,s1,255
    800013c0:	00f00793          	li	a5,15
    800013c4:	fc97f4e3          	bgeu	a5,s1,8000138c <_Z11workerBodyBv+0xb8>
    }

    CCB::running->setFinished(true);
    800013c8:	00004797          	auipc	a5,0x4
    800013cc:	6a87b783          	ld	a5,1704(a5) # 80005a70 <_GLOBAL_OFFSET_TABLE_+0x28>
    800013d0:	0007b783          	ld	a5,0(a5)
    800013d4:	00100713          	li	a4,1
    800013d8:	02e78023          	sb	a4,32(a5)
    CCB::yield();
    800013dc:	00000097          	auipc	ra,0x0
    800013e0:	6e4080e7          	jalr	1764(ra) # 80001ac0 <_ZN3CCB5yieldEv>
    800013e4:	01813083          	ld	ra,24(sp)
    800013e8:	01013403          	ld	s0,16(sp)
    800013ec:	00813483          	ld	s1,8(sp)
    800013f0:	00013903          	ld	s2,0(sp)
    800013f4:	02010113          	addi	sp,sp,32
    800013f8:	00008067          	ret

00000000800013fc <_Z27test_memory_allocator_arrayv>:
#include "../../h/MemoryAllocator.hpp"
#include "../../lib/console.h"

void test_memory_allocator_array()
{
    800013fc:	fe010113          	addi	sp,sp,-32
    80001400:	00113c23          	sd	ra,24(sp)
    80001404:	00813823          	sd	s0,16(sp)
    80001408:	00913423          	sd	s1,8(sp)
    8000140c:	01213023          	sd	s2,0(sp)
    80001410:	02010413          	addi	s0,sp,32
    int n = 10;
    char* niz = (char*)MemoryAllocator::mem_alloc(n* sizeof(char));
    80001414:	00a00513          	li	a0,10
    80001418:	00001097          	auipc	ra,0x1
    8000141c:	884080e7          	jalr	-1916(ra) # 80001c9c <_ZN15MemoryAllocator9mem_allocEm>
    80001420:	00050913          	mv	s2,a0
    if(niz == nullptr)
    80001424:	02050263          	beqz	a0,80001448 <_Z27test_memory_allocator_arrayv+0x4c>
{
    80001428:	00000793          	li	a5,0
        MemoryAllocator::printString("Neuspesna alokacija! \n");

    for(int i=0;i<n;i++)
    8000142c:	00900713          	li	a4,9
    80001430:	02f74663          	blt	a4,a5,8000145c <_Z27test_memory_allocator_arrayv+0x60>
        niz[i] = 'd';
    80001434:	00f90733          	add	a4,s2,a5
    80001438:	06400693          	li	a3,100
    8000143c:	00d70023          	sb	a3,0(a4)
    for(int i=0;i<n;i++)
    80001440:	0017879b          	addiw	a5,a5,1
    80001444:	fe9ff06f          	j	8000142c <_Z27test_memory_allocator_arrayv+0x30>
        MemoryAllocator::printString("Neuspesna alokacija! \n");
    80001448:	00004517          	auipc	a0,0x4
    8000144c:	c2050513          	addi	a0,a0,-992 # 80005068 <CONSOLE_STATUS+0x58>
    80001450:	00000097          	auipc	ra,0x0
    80001454:	718080e7          	jalr	1816(ra) # 80001b68 <_ZN15MemoryAllocator11printStringEPKc>
    80001458:	fd1ff06f          	j	80001428 <_Z27test_memory_allocator_arrayv+0x2c>

    for(int i = 0; i < n; i++){
    8000145c:	00000493          	li	s1,0
    80001460:	00900793          	li	a5,9
    80001464:	0297c463          	blt	a5,s1,8000148c <_Z27test_memory_allocator_arrayv+0x90>
        __putc(niz[i]);
    80001468:	009907b3          	add	a5,s2,s1
    8000146c:	0007c503          	lbu	a0,0(a5)
    80001470:	00003097          	auipc	ra,0x3
    80001474:	e0c080e7          	jalr	-500(ra) # 8000427c <__putc>
        __putc(' ');
    80001478:	02000513          	li	a0,32
    8000147c:	00003097          	auipc	ra,0x3
    80001480:	e00080e7          	jalr	-512(ra) # 8000427c <__putc>
    for(int i = 0; i < n; i++){
    80001484:	0014849b          	addiw	s1,s1,1
    80001488:	fd9ff06f          	j	80001460 <_Z27test_memory_allocator_arrayv+0x64>
    }

    __putc('\n');
    8000148c:	00a00513          	li	a0,10
    80001490:	00003097          	auipc	ra,0x3
    80001494:	dec080e7          	jalr	-532(ra) # 8000427c <__putc>
    int status = MemoryAllocator::mem_free(niz);
    80001498:	00090513          	mv	a0,s2
    8000149c:	00001097          	auipc	ra,0x1
    800014a0:	a8c080e7          	jalr	-1396(ra) # 80001f28 <_ZN15MemoryAllocator8mem_freeEPv>
    if(status != 0)
    800014a4:	02050663          	beqz	a0,800014d0 <_Z27test_memory_allocator_arrayv+0xd4>
        MemoryAllocator::printString("Neuspesno brisanje! \n");
    800014a8:	00004517          	auipc	a0,0x4
    800014ac:	bd850513          	addi	a0,a0,-1064 # 80005080 <CONSOLE_STATUS+0x70>
    800014b0:	00000097          	auipc	ra,0x0
    800014b4:	6b8080e7          	jalr	1720(ra) # 80001b68 <_ZN15MemoryAllocator11printStringEPKc>


    // excpected output == >
    // d d d d d d d d d d
    // Uspesno brisanje!
}
    800014b8:	01813083          	ld	ra,24(sp)
    800014bc:	01013403          	ld	s0,16(sp)
    800014c0:	00813483          	ld	s1,8(sp)
    800014c4:	00013903          	ld	s2,0(sp)
    800014c8:	02010113          	addi	sp,sp,32
    800014cc:	00008067          	ret
        MemoryAllocator::printString("Uspesno brisanje! \n");
    800014d0:	00004517          	auipc	a0,0x4
    800014d4:	bc850513          	addi	a0,a0,-1080 # 80005098 <CONSOLE_STATUS+0x88>
    800014d8:	00000097          	auipc	ra,0x0
    800014dc:	690080e7          	jalr	1680(ra) # 80001b68 <_ZN15MemoryAllocator11printStringEPKc>
}
    800014e0:	fd9ff06f          	j	800014b8 <_Z27test_memory_allocator_arrayv+0xbc>

00000000800014e4 <_Z12checkNullptrPv>:

void checkNullptr(void* p) {
    static int x = 0;
    if(p == nullptr) {
    800014e4:	00050e63          	beqz	a0,80001500 <_Z12checkNullptrPv+0x1c>
        __putc('?');
        __putc('0' + x);
    }
    x++;
    800014e8:	00004717          	auipc	a4,0x4
    800014ec:	5e870713          	addi	a4,a4,1512 # 80005ad0 <_ZZ12checkNullptrPvE1x>
    800014f0:	00072783          	lw	a5,0(a4)
    800014f4:	0017879b          	addiw	a5,a5,1
    800014f8:	00f72023          	sw	a5,0(a4)
    800014fc:	00008067          	ret
void checkNullptr(void* p) {
    80001500:	ff010113          	addi	sp,sp,-16
    80001504:	00113423          	sd	ra,8(sp)
    80001508:	00813023          	sd	s0,0(sp)
    8000150c:	01010413          	addi	s0,sp,16
        __putc('?');
    80001510:	03f00513          	li	a0,63
    80001514:	00003097          	auipc	ra,0x3
    80001518:	d68080e7          	jalr	-664(ra) # 8000427c <__putc>
        __putc('0' + x);
    8000151c:	00004517          	auipc	a0,0x4
    80001520:	5b452503          	lw	a0,1460(a0) # 80005ad0 <_ZZ12checkNullptrPvE1x>
    80001524:	0305051b          	addiw	a0,a0,48
    80001528:	0ff57513          	andi	a0,a0,255
    8000152c:	00003097          	auipc	ra,0x3
    80001530:	d50080e7          	jalr	-688(ra) # 8000427c <__putc>
    x++;
    80001534:	00004717          	auipc	a4,0x4
    80001538:	59c70713          	addi	a4,a4,1436 # 80005ad0 <_ZZ12checkNullptrPvE1x>
    8000153c:	00072783          	lw	a5,0(a4)
    80001540:	0017879b          	addiw	a5,a5,1
    80001544:	00f72023          	sw	a5,0(a4)
}
    80001548:	00813083          	ld	ra,8(sp)
    8000154c:	00013403          	ld	s0,0(sp)
    80001550:	01010113          	addi	sp,sp,16
    80001554:	00008067          	ret

0000000080001558 <_Z11checkStatusi>:

void checkStatus(int status) {
    static int y = 0;
    if(status) {
    80001558:	00051e63          	bnez	a0,80001574 <_Z11checkStatusi+0x1c>
        __putc('0' + y);
        __putc('?');
    }
    y++;
    8000155c:	00004717          	auipc	a4,0x4
    80001560:	57470713          	addi	a4,a4,1396 # 80005ad0 <_ZZ12checkNullptrPvE1x>
    80001564:	00472783          	lw	a5,4(a4)
    80001568:	0017879b          	addiw	a5,a5,1
    8000156c:	00f72223          	sw	a5,4(a4)
    80001570:	00008067          	ret
void checkStatus(int status) {
    80001574:	ff010113          	addi	sp,sp,-16
    80001578:	00113423          	sd	ra,8(sp)
    8000157c:	00813023          	sd	s0,0(sp)
    80001580:	01010413          	addi	s0,sp,16
        __putc('0' + y);
    80001584:	00004517          	auipc	a0,0x4
    80001588:	55052503          	lw	a0,1360(a0) # 80005ad4 <_ZZ11checkStatusiE1y>
    8000158c:	0305051b          	addiw	a0,a0,48
    80001590:	0ff57513          	andi	a0,a0,255
    80001594:	00003097          	auipc	ra,0x3
    80001598:	ce8080e7          	jalr	-792(ra) # 8000427c <__putc>
        __putc('?');
    8000159c:	03f00513          	li	a0,63
    800015a0:	00003097          	auipc	ra,0x3
    800015a4:	cdc080e7          	jalr	-804(ra) # 8000427c <__putc>
    y++;
    800015a8:	00004717          	auipc	a4,0x4
    800015ac:	52870713          	addi	a4,a4,1320 # 80005ad0 <_ZZ12checkNullptrPvE1x>
    800015b0:	00472783          	lw	a5,4(a4)
    800015b4:	0017879b          	addiw	a5,a5,1
    800015b8:	00f72223          	sw	a5,4(a4)
}
    800015bc:	00813083          	ld	ra,8(sp)
    800015c0:	00013403          	ld	s0,0(sp)
    800015c4:	01010113          	addi	sp,sp,16
    800015c8:	00008067          	ret

00000000800015cc <_Z28test_memory_allocator_matrixv>:

void test_memory_allocator_matrix() {
    800015cc:	fd010113          	addi	sp,sp,-48
    800015d0:	02113423          	sd	ra,40(sp)
    800015d4:	02813023          	sd	s0,32(sp)
    800015d8:	00913c23          	sd	s1,24(sp)
    800015dc:	01213823          	sd	s2,16(sp)
    800015e0:	01313423          	sd	s3,8(sp)
    800015e4:	03010413          	addi	s0,sp,48
    int n = 16;
    char** matrix = (char**)MemoryAllocator::mem_alloc(n*sizeof(char*));
    800015e8:	08000513          	li	a0,128
    800015ec:	00000097          	auipc	ra,0x0
    800015f0:	6b0080e7          	jalr	1712(ra) # 80001c9c <_ZN15MemoryAllocator9mem_allocEm>
    800015f4:	00050913          	mv	s2,a0
    checkNullptr(matrix);
    800015f8:	00000097          	auipc	ra,0x0
    800015fc:	eec080e7          	jalr	-276(ra) # 800014e4 <_Z12checkNullptrPv>
    for(int i = 0; i < n; i++) {
    80001600:	00000493          	li	s1,0
    80001604:	00f00793          	li	a5,15
    80001608:	0297c663          	blt	a5,s1,80001634 <_Z28test_memory_allocator_matrixv+0x68>
        matrix[i] = (char *) MemoryAllocator::mem_alloc(n * sizeof(char));
    8000160c:	00349993          	slli	s3,s1,0x3
    80001610:	013909b3          	add	s3,s2,s3
    80001614:	01000513          	li	a0,16
    80001618:	00000097          	auipc	ra,0x0
    8000161c:	684080e7          	jalr	1668(ra) # 80001c9c <_ZN15MemoryAllocator9mem_allocEm>
    80001620:	00a9b023          	sd	a0,0(s3)
        checkNullptr(matrix[i]);
    80001624:	00000097          	auipc	ra,0x0
    80001628:	ec0080e7          	jalr	-320(ra) # 800014e4 <_Z12checkNullptrPv>
    for(int i = 0; i < n; i++) {
    8000162c:	0014849b          	addiw	s1,s1,1
    80001630:	fd5ff06f          	j	80001604 <_Z28test_memory_allocator_matrixv+0x38>
    }

    for(int i = 0; i < n; i++) {
    80001634:	00000613          	li	a2,0
    80001638:	0080006f          	j	80001640 <_Z28test_memory_allocator_matrixv+0x74>
    8000163c:	0016061b          	addiw	a2,a2,1
    80001640:	00f00793          	li	a5,15
    80001644:	02c7c863          	blt	a5,a2,80001674 <_Z28test_memory_allocator_matrixv+0xa8>
        for(int j = 0; j < n; j++) {
    80001648:	00000793          	li	a5,0
    8000164c:	00f00713          	li	a4,15
    80001650:	fef746e3          	blt	a4,a5,8000163c <_Z28test_memory_allocator_matrixv+0x70>
            matrix[i][j] = 'k';
    80001654:	00361713          	slli	a4,a2,0x3
    80001658:	00e90733          	add	a4,s2,a4
    8000165c:	00073703          	ld	a4,0(a4)
    80001660:	00f70733          	add	a4,a4,a5
    80001664:	06b00693          	li	a3,107
    80001668:	00d70023          	sb	a3,0(a4)
        for(int j = 0; j < n; j++) {
    8000166c:	0017879b          	addiw	a5,a5,1
    80001670:	fddff06f          	j	8000164c <_Z28test_memory_allocator_matrixv+0x80>
        }
    }

    for(int i = 0; i < n; i++) {
    80001674:	00000993          	li	s3,0
    80001678:	0140006f          	j	8000168c <_Z28test_memory_allocator_matrixv+0xc0>
        for(int j = 0; j < n; j++) {
            __putc(matrix[i][j]);
            __putc(' ');
        }
        __putc('\n');
    8000167c:	00a00513          	li	a0,10
    80001680:	00003097          	auipc	ra,0x3
    80001684:	bfc080e7          	jalr	-1028(ra) # 8000427c <__putc>
    for(int i = 0; i < n; i++) {
    80001688:	0019899b          	addiw	s3,s3,1
    8000168c:	00f00793          	li	a5,15
    80001690:	0537c063          	blt	a5,s3,800016d0 <_Z28test_memory_allocator_matrixv+0x104>
        for(int j = 0; j < n; j++) {
    80001694:	00000493          	li	s1,0
    80001698:	00f00793          	li	a5,15
    8000169c:	fe97c0e3          	blt	a5,s1,8000167c <_Z28test_memory_allocator_matrixv+0xb0>
            __putc(matrix[i][j]);
    800016a0:	00399793          	slli	a5,s3,0x3
    800016a4:	00f907b3          	add	a5,s2,a5
    800016a8:	0007b783          	ld	a5,0(a5)
    800016ac:	009787b3          	add	a5,a5,s1
    800016b0:	0007c503          	lbu	a0,0(a5)
    800016b4:	00003097          	auipc	ra,0x3
    800016b8:	bc8080e7          	jalr	-1080(ra) # 8000427c <__putc>
            __putc(' ');
    800016bc:	02000513          	li	a0,32
    800016c0:	00003097          	auipc	ra,0x3
    800016c4:	bbc080e7          	jalr	-1092(ra) # 8000427c <__putc>
        for(int j = 0; j < n; j++) {
    800016c8:	0014849b          	addiw	s1,s1,1
    800016cc:	fcdff06f          	j	80001698 <_Z28test_memory_allocator_matrixv+0xcc>
    }


    for(int i = 0; i < n; i++) {
    800016d0:	00000993          	li	s3,0
    800016d4:	0140006f          	j	800016e8 <_Z28test_memory_allocator_matrixv+0x11c>
        int status = MemoryAllocator::mem_free(matrix[i]);
        if(status != 0)
            MemoryAllocator::printString("Neupseno brisanje! \n");
        checkStatus(status);
    800016d8:	00048513          	mv	a0,s1
    800016dc:	00000097          	auipc	ra,0x0
    800016e0:	e7c080e7          	jalr	-388(ra) # 80001558 <_Z11checkStatusi>
    for(int i = 0; i < n; i++) {
    800016e4:	0019899b          	addiw	s3,s3,1
    800016e8:	00f00793          	li	a5,15
    800016ec:	0337ca63          	blt	a5,s3,80001720 <_Z28test_memory_allocator_matrixv+0x154>
        int status = MemoryAllocator::mem_free(matrix[i]);
    800016f0:	00399793          	slli	a5,s3,0x3
    800016f4:	00f907b3          	add	a5,s2,a5
    800016f8:	0007b503          	ld	a0,0(a5)
    800016fc:	00001097          	auipc	ra,0x1
    80001700:	82c080e7          	jalr	-2004(ra) # 80001f28 <_ZN15MemoryAllocator8mem_freeEPv>
    80001704:	00050493          	mv	s1,a0
        if(status != 0)
    80001708:	fc0508e3          	beqz	a0,800016d8 <_Z28test_memory_allocator_matrixv+0x10c>
            MemoryAllocator::printString("Neupseno brisanje! \n");
    8000170c:	00004517          	auipc	a0,0x4
    80001710:	9a450513          	addi	a0,a0,-1628 # 800050b0 <CONSOLE_STATUS+0xa0>
    80001714:	00000097          	auipc	ra,0x0
    80001718:	454080e7          	jalr	1108(ra) # 80001b68 <_ZN15MemoryAllocator11printStringEPKc>
    8000171c:	fbdff06f          	j	800016d8 <_Z28test_memory_allocator_matrixv+0x10c>
    }
    int status = MemoryAllocator::mem_free(matrix);
    80001720:	00090513          	mv	a0,s2
    80001724:	00001097          	auipc	ra,0x1
    80001728:	804080e7          	jalr	-2044(ra) # 80001f28 <_ZN15MemoryAllocator8mem_freeEPv>
    8000172c:	00050493          	mv	s1,a0
    if(status != 0)
    80001730:	02051663          	bnez	a0,8000175c <_Z28test_memory_allocator_matrixv+0x190>
        MemoryAllocator::printString("Neupseno brisanje! \n");
    checkStatus(status);
    80001734:	00048513          	mv	a0,s1
    80001738:	00000097          	auipc	ra,0x0
    8000173c:	e20080e7          	jalr	-480(ra) # 80001558 <_Z11checkStatusi>

    // matrica 16x16 popunjena sa 'k'
    80001740:	02813083          	ld	ra,40(sp)
    80001744:	02013403          	ld	s0,32(sp)
    80001748:	01813483          	ld	s1,24(sp)
    8000174c:	01013903          	ld	s2,16(sp)
    80001750:	00813983          	ld	s3,8(sp)
    80001754:	03010113          	addi	sp,sp,48
    80001758:	00008067          	ret
        MemoryAllocator::printString("Neupseno brisanje! \n");
    8000175c:	00004517          	auipc	a0,0x4
    80001760:	95450513          	addi	a0,a0,-1708 # 800050b0 <CONSOLE_STATUS+0xa0>
    80001764:	00000097          	auipc	ra,0x0
    80001768:	404080e7          	jalr	1028(ra) # 80001b68 <_ZN15MemoryAllocator11printStringEPKc>
    8000176c:	fc9ff06f          	j	80001734 <_Z28test_memory_allocator_matrixv+0x168>

0000000080001770 <_Z18test_mem_allocatorv>:

extern void test_memory_allocator_array();
extern void test_memory_allocator_matrix();

void test_mem_allocator()
{
    80001770:	ff010113          	addi	sp,sp,-16
    80001774:	00113423          	sd	ra,8(sp)
    80001778:	00813023          	sd	s0,0(sp)
    8000177c:	01010413          	addi	s0,sp,16
    test_memory_allocator_matrix();
    80001780:	00000097          	auipc	ra,0x0
    80001784:	e4c080e7          	jalr	-436(ra) # 800015cc <_Z28test_memory_allocator_matrixv>
    MemoryAllocator::printString("\n");
    80001788:	00004517          	auipc	a0,0x4
    8000178c:	97850513          	addi	a0,a0,-1672 # 80005100 <CONSOLE_STATUS+0xf0>
    80001790:	00000097          	auipc	ra,0x0
    80001794:	3d8080e7          	jalr	984(ra) # 80001b68 <_ZN15MemoryAllocator11printStringEPKc>
    test_memory_allocator_array();
    80001798:	00000097          	auipc	ra,0x0
    8000179c:	c64080e7          	jalr	-924(ra) # 800013fc <_Z27test_memory_allocator_arrayv>

}
    800017a0:	00813083          	ld	ra,8(sp)
    800017a4:	00013403          	ld	s0,0(sp)
    800017a8:	01010113          	addi	sp,sp,16
    800017ac:	00008067          	ret

00000000800017b0 <main>:

int main()
{
    800017b0:	fc010113          	addi	sp,sp,-64
    800017b4:	02113c23          	sd	ra,56(sp)
    800017b8:	02813823          	sd	s0,48(sp)
    800017bc:	02913423          	sd	s1,40(sp)
    800017c0:	03213023          	sd	s2,32(sp)
    800017c4:	04010413          	addi	s0,sp,64
    CCB *coroutines[3];
    MemoryAllocator::mem_init();
    800017c8:	00000097          	auipc	ra,0x0
    800017cc:	3e4080e7          	jalr	996(ra) # 80001bac <_ZN15MemoryAllocator8mem_initEv>
    coroutines[0] = CCB::createCoroutine(nullptr);
    800017d0:	00000513          	li	a0,0
    800017d4:	00000097          	auipc	ra,0x0
    800017d8:	1bc080e7          	jalr	444(ra) # 80001990 <_ZN3CCB15createCoroutineEPFvvE>
    800017dc:	fca43423          	sd	a0,-56(s0)
    CCB::running = coroutines[0];
    800017e0:	00004797          	auipc	a5,0x4
    800017e4:	2907b783          	ld	a5,656(a5) # 80005a70 <_GLOBAL_OFFSET_TABLE_+0x28>
    800017e8:	00a7b023          	sd	a0,0(a5)

    coroutines[1] = CCB::createCoroutine(workerBodyA);
    800017ec:	00004517          	auipc	a0,0x4
    800017f0:	27453503          	ld	a0,628(a0) # 80005a60 <_GLOBAL_OFFSET_TABLE_+0x18>
    800017f4:	00000097          	auipc	ra,0x0
    800017f8:	19c080e7          	jalr	412(ra) # 80001990 <_ZN3CCB15createCoroutineEPFvvE>
    800017fc:	fca43823          	sd	a0,-48(s0)
    printString("CoroutineA created\n");
    80001800:	00004517          	auipc	a0,0x4
    80001804:	8c850513          	addi	a0,a0,-1848 # 800050c8 <CONSOLE_STATUS+0xb8>
    80001808:	00001097          	auipc	ra,0x1
    8000180c:	8e0080e7          	jalr	-1824(ra) # 800020e8 <_Z11printStringPKc>
    coroutines[2] = CCB::createCoroutine(workerBodyB);
    80001810:	00004517          	auipc	a0,0x4
    80001814:	24853503          	ld	a0,584(a0) # 80005a58 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001818:	00000097          	auipc	ra,0x0
    8000181c:	178080e7          	jalr	376(ra) # 80001990 <_ZN3CCB15createCoroutineEPFvvE>
    80001820:	fca43c23          	sd	a0,-40(s0)
    printString("CoroutineB created\n");
    80001824:	00004517          	auipc	a0,0x4
    80001828:	8bc50513          	addi	a0,a0,-1860 # 800050e0 <CONSOLE_STATUS+0xd0>
    8000182c:	00001097          	auipc	ra,0x1
    80001830:	8bc080e7          	jalr	-1860(ra) # 800020e8 <_Z11printStringPKc>
    80001834:	00c0006f          	j	80001840 <main+0x90>

    while (!(coroutines[1]->isFinished() &&
             coroutines[2]->isFinished()))
    {
        CCB::yield();
    80001838:	00000097          	auipc	ra,0x0
    8000183c:	288080e7          	jalr	648(ra) # 80001ac0 <_ZN3CCB5yieldEv>
    while (!(coroutines[1]->isFinished() &&
    80001840:	fd043783          	ld	a5,-48(s0)
    bool isFinished() const { return finished; }
    80001844:	0207c783          	lbu	a5,32(a5)
    80001848:	fe0788e3          	beqz	a5,80001838 <main+0x88>
             coroutines[2]->isFinished()))
    8000184c:	fd843783          	ld	a5,-40(s0)
    80001850:	0207c783          	lbu	a5,32(a5)
    while (!(coroutines[1]->isFinished() &&
    80001854:	fe0782e3          	beqz	a5,80001838 <main+0x88>
    80001858:	fc840493          	addi	s1,s0,-56
    8000185c:	0140006f          	j	80001870 <main+0xc0>
    }

    for (auto &coroutine: coroutines)
    {
        delete coroutine;
    80001860:	00090513          	mv	a0,s2
    80001864:	00000097          	auipc	ra,0x0
    80001868:	0ac080e7          	jalr	172(ra) # 80001910 <_ZdlPv>
    for (auto &coroutine: coroutines)
    8000186c:	00848493          	addi	s1,s1,8
    80001870:	fe040793          	addi	a5,s0,-32
    80001874:	02f48063          	beq	s1,a5,80001894 <main+0xe4>
        delete coroutine;
    80001878:	0004b903          	ld	s2,0(s1)
    8000187c:	fe0908e3          	beqz	s2,8000186c <main+0xbc>
    ~CCB() { delete[] stack; }
    80001880:	00893503          	ld	a0,8(s2)
    80001884:	fc050ee3          	beqz	a0,80001860 <main+0xb0>
    80001888:	00000097          	auipc	ra,0x0
    8000188c:	0c8080e7          	jalr	200(ra) # 80001950 <_ZdaPv>
    80001890:	fd1ff06f          	j	80001860 <main+0xb0>
    }
    printString("Finished\n");
    80001894:	00004517          	auipc	a0,0x4
    80001898:	86450513          	addi	a0,a0,-1948 # 800050f8 <CONSOLE_STATUS+0xe8>
    8000189c:	00001097          	auipc	ra,0x1
    800018a0:	84c080e7          	jalr	-1972(ra) # 800020e8 <_Z11printStringPKc>

    return 0;
}
    800018a4:	00000513          	li	a0,0
    800018a8:	03813083          	ld	ra,56(sp)
    800018ac:	03013403          	ld	s0,48(sp)
    800018b0:	02813483          	ld	s1,40(sp)
    800018b4:	02013903          	ld	s2,32(sp)
    800018b8:	04010113          	addi	sp,sp,64
    800018bc:	00008067          	ret

00000000800018c0 <_Znwm>:
#include "../h/MemoryAllocator.hpp"
using size_t = decltype(sizeof(0));

void *operator new(size_t n)
{
    800018c0:	ff010113          	addi	sp,sp,-16
    800018c4:	00113423          	sd	ra,8(sp)
    800018c8:	00813023          	sd	s0,0(sp)
    800018cc:	01010413          	addi	s0,sp,16
    return MemoryAllocator::mem_alloc(n);
    800018d0:	00000097          	auipc	ra,0x0
    800018d4:	3cc080e7          	jalr	972(ra) # 80001c9c <_ZN15MemoryAllocator9mem_allocEm>
}
    800018d8:	00813083          	ld	ra,8(sp)
    800018dc:	00013403          	ld	s0,0(sp)
    800018e0:	01010113          	addi	sp,sp,16
    800018e4:	00008067          	ret

00000000800018e8 <_Znam>:

void *operator new[](size_t n)
{
    800018e8:	ff010113          	addi	sp,sp,-16
    800018ec:	00113423          	sd	ra,8(sp)
    800018f0:	00813023          	sd	s0,0(sp)
    800018f4:	01010413          	addi	s0,sp,16
    return MemoryAllocator::mem_alloc(n);
    800018f8:	00000097          	auipc	ra,0x0
    800018fc:	3a4080e7          	jalr	932(ra) # 80001c9c <_ZN15MemoryAllocator9mem_allocEm>
}
    80001900:	00813083          	ld	ra,8(sp)
    80001904:	00013403          	ld	s0,0(sp)
    80001908:	01010113          	addi	sp,sp,16
    8000190c:	00008067          	ret

0000000080001910 <_ZdlPv>:

void operator delete(void *p) noexcept
{
    80001910:	ff010113          	addi	sp,sp,-16
    80001914:	00113423          	sd	ra,8(sp)
    80001918:	00813023          	sd	s0,0(sp)
    8000191c:	01010413          	addi	s0,sp,16
   int sts = MemoryAllocator::mem_free(p);
    80001920:	00000097          	auipc	ra,0x0
    80001924:	608080e7          	jalr	1544(ra) # 80001f28 <_ZN15MemoryAllocator8mem_freeEPv>
   if(sts != 0) MemoryAllocator::printString("Neka greska prilikom brisanja!\n");
    80001928:	00051a63          	bnez	a0,8000193c <_ZdlPv+0x2c>
}
    8000192c:	00813083          	ld	ra,8(sp)
    80001930:	00013403          	ld	s0,0(sp)
    80001934:	01010113          	addi	sp,sp,16
    80001938:	00008067          	ret
   if(sts != 0) MemoryAllocator::printString("Neka greska prilikom brisanja!\n");
    8000193c:	00003517          	auipc	a0,0x3
    80001940:	7cc50513          	addi	a0,a0,1996 # 80005108 <CONSOLE_STATUS+0xf8>
    80001944:	00000097          	auipc	ra,0x0
    80001948:	224080e7          	jalr	548(ra) # 80001b68 <_ZN15MemoryAllocator11printStringEPKc>
}
    8000194c:	fe1ff06f          	j	8000192c <_ZdlPv+0x1c>

0000000080001950 <_ZdaPv>:

void operator delete[](void *p) noexcept
{
    80001950:	ff010113          	addi	sp,sp,-16
    80001954:	00113423          	sd	ra,8(sp)
    80001958:	00813023          	sd	s0,0(sp)
    8000195c:	01010413          	addi	s0,sp,16
    int sts = MemoryAllocator::mem_free(p);
    80001960:	00000097          	auipc	ra,0x0
    80001964:	5c8080e7          	jalr	1480(ra) # 80001f28 <_ZN15MemoryAllocator8mem_freeEPv>
    if(sts != 0) MemoryAllocator::printString("Neka greska prilikom brisanja!\n");
    80001968:	00051a63          	bnez	a0,8000197c <_ZdaPv+0x2c>
    8000196c:	00813083          	ld	ra,8(sp)
    80001970:	00013403          	ld	s0,0(sp)
    80001974:	01010113          	addi	sp,sp,16
    80001978:	00008067          	ret
    if(sts != 0) MemoryAllocator::printString("Neka greska prilikom brisanja!\n");
    8000197c:	00003517          	auipc	a0,0x3
    80001980:	78c50513          	addi	a0,a0,1932 # 80005108 <CONSOLE_STATUS+0xf8>
    80001984:	00000097          	auipc	ra,0x0
    80001988:	1e4080e7          	jalr	484(ra) # 80001b68 <_ZN15MemoryAllocator11printStringEPKc>
    8000198c:	fe1ff06f          	j	8000196c <_ZdaPv+0x1c>

0000000080001990 <_ZN3CCB15createCoroutineEPFvvE>:
#include "../h/riscv.hpp"

CCB *CCB::running = nullptr;

CCB *CCB::createCoroutine(Body body)
{
    80001990:	fe010113          	addi	sp,sp,-32
    80001994:	00113c23          	sd	ra,24(sp)
    80001998:	00813823          	sd	s0,16(sp)
    8000199c:	00913423          	sd	s1,8(sp)
    800019a0:	01213023          	sd	s2,0(sp)
    800019a4:	02010413          	addi	s0,sp,32
    800019a8:	00050913          	mv	s2,a0
    return new CCB(body);
    800019ac:	02800513          	li	a0,40
    800019b0:	00000097          	auipc	ra,0x0
    800019b4:	f10080e7          	jalr	-240(ra) # 800018c0 <_Znwm>
    800019b8:	00050493          	mv	s1,a0
            body(body),
            stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
            context({body != nullptr ? (uint64) body : 0,
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
                    }),
            finished(false)
    800019bc:	01253023          	sd	s2,0(a0)
            stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
    800019c0:	00090a63          	beqz	s2,800019d4 <_ZN3CCB15createCoroutineEPFvvE+0x44>
    800019c4:	00002537          	lui	a0,0x2
    800019c8:	00000097          	auipc	ra,0x0
    800019cc:	f20080e7          	jalr	-224(ra) # 800018e8 <_Znam>
    800019d0:	0080006f          	j	800019d8 <_ZN3CCB15createCoroutineEPFvvE+0x48>
    800019d4:	00000513          	li	a0,0
            finished(false)
    800019d8:	00a4b423          	sd	a0,8(s1)
            context({body != nullptr ? (uint64) body : 0,
    800019dc:	02090a63          	beqz	s2,80001a10 <_ZN3CCB15createCoroutineEPFvvE+0x80>
    800019e0:	00090793          	mv	a5,s2
            finished(false)
    800019e4:	00f4b823          	sd	a5,16(s1)
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
    800019e8:	02050863          	beqz	a0,80001a18 <_ZN3CCB15createCoroutineEPFvvE+0x88>
    800019ec:	000027b7          	lui	a5,0x2
    800019f0:	00f50533          	add	a0,a0,a5
            finished(false)
    800019f4:	00a4bc23          	sd	a0,24(s1)
    800019f8:	02048023          	sb	zero,32(s1)
    {
        if (body != nullptr) { Scheduler::put(this); }
    800019fc:	04090063          	beqz	s2,80001a3c <_ZN3CCB15createCoroutineEPFvvE+0xac>
    80001a00:	00048513          	mv	a0,s1
    80001a04:	00000097          	auipc	ra,0x0
    80001a08:	644080e7          	jalr	1604(ra) # 80002048 <_ZN9Scheduler3putEP3CCB>
    80001a0c:	0300006f          	j	80001a3c <_ZN3CCB15createCoroutineEPFvvE+0xac>
            context({body != nullptr ? (uint64) body : 0,
    80001a10:	00000793          	li	a5,0
    80001a14:	fd1ff06f          	j	800019e4 <_ZN3CCB15createCoroutineEPFvvE+0x54>
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
    80001a18:	00000513          	li	a0,0
    80001a1c:	fd9ff06f          	j	800019f4 <_ZN3CCB15createCoroutineEPFvvE+0x64>
    80001a20:	00050913          	mv	s2,a0
    80001a24:	00048513          	mv	a0,s1
    80001a28:	00000097          	auipc	ra,0x0
    80001a2c:	ee8080e7          	jalr	-280(ra) # 80001910 <_ZdlPv>
    80001a30:	00090513          	mv	a0,s2
    80001a34:	00005097          	auipc	ra,0x5
    80001a38:	1a4080e7          	jalr	420(ra) # 80006bd8 <_Unwind_Resume>
}
    80001a3c:	00048513          	mv	a0,s1
    80001a40:	01813083          	ld	ra,24(sp)
    80001a44:	01013403          	ld	s0,16(sp)
    80001a48:	00813483          	ld	s1,8(sp)
    80001a4c:	00013903          	ld	s2,0(sp)
    80001a50:	02010113          	addi	sp,sp,32
    80001a54:	00008067          	ret

0000000080001a58 <_ZN3CCB8dispatchEv>:

    Riscv::popRegisters();
}

void CCB::dispatch()
{
    80001a58:	fe010113          	addi	sp,sp,-32
    80001a5c:	00113c23          	sd	ra,24(sp)
    80001a60:	00813823          	sd	s0,16(sp)
    80001a64:	00913423          	sd	s1,8(sp)
    80001a68:	02010413          	addi	s0,sp,32
    CCB *old = running;
    80001a6c:	00004497          	auipc	s1,0x4
    80001a70:	06c4b483          	ld	s1,108(s1) # 80005ad8 <_ZN3CCB7runningE>
    bool isFinished() const { return finished; }
    80001a74:	0204c783          	lbu	a5,32(s1)
    if (!old->isFinished()) { Scheduler::put(old); }
    80001a78:	02078c63          	beqz	a5,80001ab0 <_ZN3CCB8dispatchEv+0x58>
    running = Scheduler::get();
    80001a7c:	00000097          	auipc	ra,0x0
    80001a80:	564080e7          	jalr	1380(ra) # 80001fe0 <_ZN9Scheduler3getEv>
    80001a84:	00004797          	auipc	a5,0x4
    80001a88:	04a7ba23          	sd	a0,84(a5) # 80005ad8 <_ZN3CCB7runningE>

    CCB::contextSwitch(&old->context, &running->context);
    80001a8c:	01050593          	addi	a1,a0,16 # 2010 <_entry-0x7fffdff0>
    80001a90:	01048513          	addi	a0,s1,16
    80001a94:	fffff097          	auipc	ra,0xfffff
    80001a98:	664080e7          	jalr	1636(ra) # 800010f8 <_ZN3CCB13contextSwitchEPNS_7ContextES1_>
}
    80001a9c:	01813083          	ld	ra,24(sp)
    80001aa0:	01013403          	ld	s0,16(sp)
    80001aa4:	00813483          	ld	s1,8(sp)
    80001aa8:	02010113          	addi	sp,sp,32
    80001aac:	00008067          	ret
    if (!old->isFinished()) { Scheduler::put(old); }
    80001ab0:	00048513          	mv	a0,s1
    80001ab4:	00000097          	auipc	ra,0x0
    80001ab8:	594080e7          	jalr	1428(ra) # 80002048 <_ZN9Scheduler3putEP3CCB>
    80001abc:	fc1ff06f          	j	80001a7c <_ZN3CCB8dispatchEv+0x24>

0000000080001ac0 <_ZN3CCB5yieldEv>:
{
    80001ac0:	ff010113          	addi	sp,sp,-16
    80001ac4:	00113423          	sd	ra,8(sp)
    80001ac8:	00813023          	sd	s0,0(sp)
    80001acc:	01010413          	addi	s0,sp,16
    Riscv::pushRegisters();
    80001ad0:	fffff097          	auipc	ra,0xfffff
    80001ad4:	530080e7          	jalr	1328(ra) # 80001000 <_ZN5Riscv13pushRegistersEv>
    CCB::dispatch();
    80001ad8:	00000097          	auipc	ra,0x0
    80001adc:	f80080e7          	jalr	-128(ra) # 80001a58 <_ZN3CCB8dispatchEv>
    Riscv::popRegisters();
    80001ae0:	fffff097          	auipc	ra,0xfffff
    80001ae4:	59c080e7          	jalr	1436(ra) # 8000107c <_ZN5Riscv12popRegistersEv>
}
    80001ae8:	00813083          	ld	ra,8(sp)
    80001aec:	00013403          	ld	s0,0(sp)
    80001af0:	01010113          	addi	sp,sp,16
    80001af4:	00008067          	ret

0000000080001af8 <_ZN5Riscv10popSppSpieEv>:
#include "../h/riscv.hpp"

void Riscv::popSppSpie()
{
    80001af8:	ff010113          	addi	sp,sp,-16
    80001afc:	00813423          	sd	s0,8(sp)
    80001b00:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80001b04:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80001b08:	10200073          	sret
    80001b0c:	00813403          	ld	s0,8(sp)
    80001b10:	01010113          	addi	sp,sp,16
    80001b14:	00008067          	ret

0000000080001b18 <_ZN8MemBlockC1Em>:
MemBlock* MemoryAllocator::m_head;
MemBlock* MemoryAllocator::m_used;
MemBlockUsed* MemoryAllocator::m_used_head;
MemBlockUsed* MemoryAllocator::m_used_tail;

MemBlock::MemBlock(size_t sz)
    80001b18:	ff010113          	addi	sp,sp,-16
    80001b1c:	00813423          	sd	s0,8(sp)
    80001b20:	01010413          	addi	s0,sp,16
        :
        size(sz),
        next(nullptr),
        prev(nullptr),
        isUsed(false)
    80001b24:	00b53023          	sd	a1,0(a0)
    80001b28:	00053423          	sd	zero,8(a0)
    80001b2c:	00053823          	sd	zero,16(a0)
    80001b30:	00050c23          	sb	zero,24(a0)
{

}
    80001b34:	00813403          	ld	s0,8(sp)
    80001b38:	01010113          	addi	sp,sp,16
    80001b3c:	00008067          	ret

0000000080001b40 <_ZN8MemBlockC1Ev>:

MemBlock::MemBlock()
    80001b40:	ff010113          	addi	sp,sp,-16
    80001b44:	00813423          	sd	s0,8(sp)
    80001b48:	01010413          	addi	s0,sp,16
        :
        size(0),
        next(nullptr),
        prev(nullptr),
        isUsed(false)
    80001b4c:	00053023          	sd	zero,0(a0)
    80001b50:	00053423          	sd	zero,8(a0)
    80001b54:	00053823          	sd	zero,16(a0)
    80001b58:	00050c23          	sb	zero,24(a0)
{

}
    80001b5c:	00813403          	ld	s0,8(sp)
    80001b60:	01010113          	addi	sp,sp,16
    80001b64:	00008067          	ret

0000000080001b68 <_ZN15MemoryAllocator11printStringEPKc>:

void MemoryAllocator::printString(char const *string)
{
    80001b68:	fe010113          	addi	sp,sp,-32
    80001b6c:	00113c23          	sd	ra,24(sp)
    80001b70:	00813823          	sd	s0,16(sp)
    80001b74:	00913423          	sd	s1,8(sp)
    80001b78:	02010413          	addi	s0,sp,32
    80001b7c:	00050493          	mv	s1,a0
    while (*string != '\0')
    80001b80:	0004c503          	lbu	a0,0(s1)
    80001b84:	00050a63          	beqz	a0,80001b98 <_ZN15MemoryAllocator11printStringEPKc+0x30>
    {
        __putc(*string);
    80001b88:	00002097          	auipc	ra,0x2
    80001b8c:	6f4080e7          	jalr	1780(ra) # 8000427c <__putc>
        string++;
    80001b90:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80001b94:	fedff06f          	j	80001b80 <_ZN15MemoryAllocator11printStringEPKc+0x18>
    }
}
    80001b98:	01813083          	ld	ra,24(sp)
    80001b9c:	01013403          	ld	s0,16(sp)
    80001ba0:	00813483          	ld	s1,8(sp)
    80001ba4:	02010113          	addi	sp,sp,32
    80001ba8:	00008067          	ret

0000000080001bac <_ZN15MemoryAllocator8mem_initEv>:

void MemoryAllocator::mem_init()
{
    80001bac:	ff010113          	addi	sp,sp,-16
    80001bb0:	00813423          	sd	s0,8(sp)
    80001bb4:	01010413          	addi	s0,sp,16
    m_head = (MemBlock*)HEAP_START_ADDR;
    80001bb8:	00004797          	auipc	a5,0x4
    80001bbc:	e987b783          	ld	a5,-360(a5) # 80005a50 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001bc0:	0007b703          	ld	a4,0(a5)
    80001bc4:	00004797          	auipc	a5,0x4
    80001bc8:	f1c78793          	addi	a5,a5,-228 # 80005ae0 <_ZN15MemoryAllocator6m_headE>
    80001bcc:	00e7b023          	sd	a4,0(a5)
    m_head->size = (size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR;
    80001bd0:	00004697          	auipc	a3,0x4
    80001bd4:	ea86b683          	ld	a3,-344(a3) # 80005a78 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001bd8:	0006b683          	ld	a3,0(a3)
    80001bdc:	40e686b3          	sub	a3,a3,a4
    80001be0:	00d73023          	sd	a3,0(a4)
    m_head->next = m_head->prev = nullptr;
    80001be4:	0007b703          	ld	a4,0(a5)
    80001be8:	00073823          	sd	zero,16(a4)
    80001bec:	00073423          	sd	zero,8(a4)
    m_head->isUsed = false;
    80001bf0:	00070c23          	sb	zero,24(a4)

    m_used_head = m_used_tail = nullptr;
    80001bf4:	0007b423          	sd	zero,8(a5)
    80001bf8:	0007b823          	sd	zero,16(a5)
}
    80001bfc:	00813403          	ld	s0,8(sp)
    80001c00:	01010113          	addi	sp,sp,16
    80001c04:	00008067          	ret

0000000080001c08 <_ZN15MemoryAllocator14calculate_sizeEm>:

size_t MemoryAllocator::calculate_size(size_t size)
{
    80001c08:	ff010113          	addi	sp,sp,-16
    80001c0c:	00813423          	sd	s0,8(sp)
    80001c10:	01010413          	addi	s0,sp,16
    bool actualSize = size > MEM_BLOCK_SIZE;
    size_t realSize = actualSize ? ((size / MEM_BLOCK_SIZE) + 1) * MEM_BLOCK_SIZE : MEM_BLOCK_SIZE;
    80001c14:	04000793          	li	a5,64
    80001c18:	02a7f063          	bgeu	a5,a0,80001c38 <_ZN15MemoryAllocator14calculate_sizeEm+0x30>
    80001c1c:	00655513          	srli	a0,a0,0x6
    80001c20:	00150513          	addi	a0,a0,1
    80001c24:	00651513          	slli	a0,a0,0x6
    realSize += sizeof(MemBlock);
    return  realSize;
}
    80001c28:	02050513          	addi	a0,a0,32
    80001c2c:	00813403          	ld	s0,8(sp)
    80001c30:	01010113          	addi	sp,sp,16
    80001c34:	00008067          	ret
    size_t realSize = actualSize ? ((size / MEM_BLOCK_SIZE) + 1) * MEM_BLOCK_SIZE : MEM_BLOCK_SIZE;
    80001c38:	04000513          	li	a0,64
    80001c3c:	fedff06f          	j	80001c28 <_ZN15MemoryAllocator14calculate_sizeEm+0x20>

0000000080001c40 <_ZN15MemoryAllocator13find_best_fitEm>:

MemBlock* MemoryAllocator::find_best_fit(size_t size)
{
    80001c40:	ff010113          	addi	sp,sp,-16
    80001c44:	00813423          	sd	s0,8(sp)
    80001c48:	01010413          	addi	s0,sp,16
    80001c4c:	00050693          	mv	a3,a0
    size_t minAvailableSize = 0xFFFFFFFFFFFF; // max uint64 size
    MemBlock* best_fit = nullptr;
    for(MemBlock* current = m_head;current != nullptr; current = current->next)
    80001c50:	00004797          	auipc	a5,0x4
    80001c54:	e907b783          	ld	a5,-368(a5) # 80005ae0 <_ZN15MemoryAllocator6m_headE>
    MemBlock* best_fit = nullptr;
    80001c58:	00000513          	li	a0,0
    size_t minAvailableSize = 0xFFFFFFFFFFFF; // max uint64 size
    80001c5c:	fff00593          	li	a1,-1
    80001c60:	0105d593          	srli	a1,a1,0x10
    80001c64:	0080006f          	j	80001c6c <_ZN15MemoryAllocator13find_best_fitEm+0x2c>
    for(MemBlock* current = m_head;current != nullptr; current = current->next)
    80001c68:	0087b783          	ld	a5,8(a5)
    80001c6c:	02078263          	beqz	a5,80001c90 <_ZN15MemoryAllocator13find_best_fitEm+0x50>
    {
        if(current->size >= size && !current->isUsed && current->size < minAvailableSize)
    80001c70:	0007b703          	ld	a4,0(a5)
    80001c74:	fed76ae3          	bltu	a4,a3,80001c68 <_ZN15MemoryAllocator13find_best_fitEm+0x28>
    80001c78:	0187c603          	lbu	a2,24(a5)
    80001c7c:	fe0616e3          	bnez	a2,80001c68 <_ZN15MemoryAllocator13find_best_fitEm+0x28>
    80001c80:	feb774e3          	bgeu	a4,a1,80001c68 <_ZN15MemoryAllocator13find_best_fitEm+0x28>
        {
            best_fit = current;
    80001c84:	00078513          	mv	a0,a5
            minAvailableSize = current->size;
    80001c88:	00070593          	mv	a1,a4
    80001c8c:	fddff06f          	j	80001c68 <_ZN15MemoryAllocator13find_best_fitEm+0x28>
        }
    }
    return best_fit;
}
    80001c90:	00813403          	ld	s0,8(sp)
    80001c94:	01010113          	addi	sp,sp,16
    80001c98:	00008067          	ret

0000000080001c9c <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc(size_t size)
{
    80001c9c:	fe010113          	addi	sp,sp,-32
    80001ca0:	00113c23          	sd	ra,24(sp)
    80001ca4:	00813823          	sd	s0,16(sp)
    80001ca8:	00913423          	sd	s1,8(sp)
    80001cac:	01213023          	sd	s2,0(sp)
    80001cb0:	02010413          	addi	s0,sp,32
    if(m_head == nullptr)
    80001cb4:	00004497          	auipc	s1,0x4
    80001cb8:	e2c4b483          	ld	s1,-468(s1) # 80005ae0 <_ZN15MemoryAllocator6m_headE>
    80001cbc:	08048263          	beqz	s1,80001d40 <_ZN15MemoryAllocator9mem_allocEm+0xa4>
    {
        printString("ERROR: list of free fragments is empty\n");
        return nullptr;
    }

    if(size <= 0)
    80001cc0:	08050a63          	beqz	a0,80001d54 <_ZN15MemoryAllocator9mem_allocEm+0xb8>
    {
        printString("ERROR: invalid argument\n");
        return nullptr;
    }

    size_t sz = calculate_size(size);
    80001cc4:	00000097          	auipc	ra,0x0
    80001cc8:	f44080e7          	jalr	-188(ra) # 80001c08 <_ZN15MemoryAllocator14calculate_sizeEm>
    80001ccc:	00050913          	mv	s2,a0
    MemBlock* best_fit = find_best_fit(sz);
    80001cd0:	00000097          	auipc	ra,0x0
    80001cd4:	f70080e7          	jalr	-144(ra) # 80001c40 <_ZN15MemoryAllocator13find_best_fitEm>
    80001cd8:	00050493          	mv	s1,a0

    if(best_fit == nullptr)
    80001cdc:	08050863          	beqz	a0,80001d6c <_ZN15MemoryAllocator9mem_allocEm+0xd0>
    {
        printString("ERROR: couldn't find best fit\n");
        return nullptr;
    }

    best_fit->size = best_fit->size - sz;
    80001ce0:	00053703          	ld	a4,0(a0)
    80001ce4:	41270733          	sub	a4,a4,s2
    80001ce8:	00e53023          	sd	a4,0(a0)
    MemBlock* newMemBlock = (MemBlock*)((char*)best_fit + best_fit->size);
    80001cec:	00e50733          	add	a4,a0,a4
    newMemBlock->next = best_fit->next;
    80001cf0:	00853783          	ld	a5,8(a0)
    80001cf4:	00f73423          	sd	a5,8(a4)
    best_fit->next = newMemBlock;
    80001cf8:	00e53423          	sd	a4,8(a0)
    newMemBlock->prev = best_fit;
    80001cfc:	00a73823          	sd	a0,16(a4)
    newMemBlock->size = sz;
    80001d00:	01273023          	sd	s2,0(a4)
    newMemBlock->isUsed = true;
    80001d04:	00100793          	li	a5,1
    80001d08:	00f70c23          	sb	a5,24(a4)

    if(newMemBlock->next)
    80001d0c:	00873783          	ld	a5,8(a4)
    80001d10:	00078463          	beqz	a5,80001d18 <_ZN15MemoryAllocator9mem_allocEm+0x7c>
        newMemBlock->next->prev = newMemBlock;
    80001d14:	00e7b823          	sd	a4,16(a5)

    // adding in list of all used fragments
     if(m_used == nullptr)
    80001d18:	00004797          	auipc	a5,0x4
    80001d1c:	de07b783          	ld	a5,-544(a5) # 80005af8 <_ZN15MemoryAllocator6m_usedE>
    80001d20:	06078063          	beqz	a5,80001d80 <_ZN15MemoryAllocator9mem_allocEm+0xe4>
         m_used = newMemBlock;
         return (void*)((char*)newMemBlock + sizeof(MemBlock));
     }

     MemBlock* ptr = m_used;
     if(newMemBlock <= m_used)
    80001d24:	06e7f663          	bgeu	a5,a4,80001d90 <_ZN15MemoryAllocator9mem_allocEm+0xf4>
         newMemBlock->next = ptr;
         m_used = newMemBlock;
         return (void*)((char*)newMemBlock + sizeof(MemBlock));
     }

     MemBlock* previous = nullptr, * current = ptr;
    80001d28:	00000693          	li	a3,0
     while(current<newMemBlock && current!= nullptr)
    80001d2c:	06e7fe63          	bgeu	a5,a4,80001da8 <_ZN15MemoryAllocator9mem_allocEm+0x10c>
    80001d30:	06078c63          	beqz	a5,80001da8 <_ZN15MemoryAllocator9mem_allocEm+0x10c>
     {
         previous = current;
    80001d34:	00078693          	mv	a3,a5
         current = current->next;
    80001d38:	0087b783          	ld	a5,8(a5)
     while(current<newMemBlock && current!= nullptr)
    80001d3c:	ff1ff06f          	j	80001d2c <_ZN15MemoryAllocator9mem_allocEm+0x90>
        printString("ERROR: list of free fragments is empty\n");
    80001d40:	00003517          	auipc	a0,0x3
    80001d44:	3e850513          	addi	a0,a0,1000 # 80005128 <CONSOLE_STATUS+0x118>
    80001d48:	00000097          	auipc	ra,0x0
    80001d4c:	e20080e7          	jalr	-480(ra) # 80001b68 <_ZN15MemoryAllocator11printStringEPKc>
        return nullptr;
    80001d50:	0700006f          	j	80001dc0 <_ZN15MemoryAllocator9mem_allocEm+0x124>
        printString("ERROR: invalid argument\n");
    80001d54:	00003517          	auipc	a0,0x3
    80001d58:	3fc50513          	addi	a0,a0,1020 # 80005150 <CONSOLE_STATUS+0x140>
    80001d5c:	00000097          	auipc	ra,0x0
    80001d60:	e0c080e7          	jalr	-500(ra) # 80001b68 <_ZN15MemoryAllocator11printStringEPKc>
        return nullptr;
    80001d64:	00000493          	li	s1,0
    80001d68:	0580006f          	j	80001dc0 <_ZN15MemoryAllocator9mem_allocEm+0x124>
        printString("ERROR: couldn't find best fit\n");
    80001d6c:	00003517          	auipc	a0,0x3
    80001d70:	40450513          	addi	a0,a0,1028 # 80005170 <CONSOLE_STATUS+0x160>
    80001d74:	00000097          	auipc	ra,0x0
    80001d78:	df4080e7          	jalr	-524(ra) # 80001b68 <_ZN15MemoryAllocator11printStringEPKc>
        return nullptr;
    80001d7c:	0440006f          	j	80001dc0 <_ZN15MemoryAllocator9mem_allocEm+0x124>
         m_used = newMemBlock;
    80001d80:	00004797          	auipc	a5,0x4
    80001d84:	d6e7bc23          	sd	a4,-648(a5) # 80005af8 <_ZN15MemoryAllocator6m_usedE>
         return (void*)((char*)newMemBlock + sizeof(MemBlock));
    80001d88:	02070493          	addi	s1,a4,32
    80001d8c:	0340006f          	j	80001dc0 <_ZN15MemoryAllocator9mem_allocEm+0x124>
         ptr->prev = newMemBlock;
    80001d90:	00e7b823          	sd	a4,16(a5)
         newMemBlock->next = ptr;
    80001d94:	00f73423          	sd	a5,8(a4)
         m_used = newMemBlock;
    80001d98:	00004797          	auipc	a5,0x4
    80001d9c:	d6e7b023          	sd	a4,-672(a5) # 80005af8 <_ZN15MemoryAllocator6m_usedE>
         return (void*)((char*)newMemBlock + sizeof(MemBlock));
    80001da0:	02070493          	addi	s1,a4,32
    80001da4:	01c0006f          	j	80001dc0 <_ZN15MemoryAllocator9mem_allocEm+0x124>
     }
     if(current != nullptr)
    80001da8:	02078a63          	beqz	a5,80001ddc <_ZN15MemoryAllocator9mem_allocEm+0x140>
     {
         previous->next = newMemBlock;
    80001dac:	00e6b423          	sd	a4,8(a3)
         newMemBlock->next = current;
    80001db0:	00f73423          	sd	a5,8(a4)
         newMemBlock->prev = previous;
    80001db4:	00d73823          	sd	a3,16(a4)
         current->prev = newMemBlock;
    80001db8:	00e7b823          	sd	a4,16(a5)
         return (void*)((char*)newMemBlock + sizeof(MemBlock));
    80001dbc:	02070493          	addi	s1,a4,32
     }
    previous->next = newMemBlock;
    newMemBlock->prev = previous;
    return (void*)((char*)newMemBlock + sizeof(MemBlock));
}
    80001dc0:	00048513          	mv	a0,s1
    80001dc4:	01813083          	ld	ra,24(sp)
    80001dc8:	01013403          	ld	s0,16(sp)
    80001dcc:	00813483          	ld	s1,8(sp)
    80001dd0:	00013903          	ld	s2,0(sp)
    80001dd4:	02010113          	addi	sp,sp,32
    80001dd8:	00008067          	ret
    previous->next = newMemBlock;
    80001ddc:	00e6b423          	sd	a4,8(a3)
    newMemBlock->prev = previous;
    80001de0:	00d73823          	sd	a3,16(a4)
    return (void*)((char*)newMemBlock + sizeof(MemBlock));
    80001de4:	02070493          	addi	s1,a4,32
    80001de8:	fd9ff06f          	j	80001dc0 <_ZN15MemoryAllocator9mem_allocEm+0x124>

0000000080001dec <_ZN15MemoryAllocator17get_current_blockEPv>:

MemBlock* MemoryAllocator::get_current_block(void* block_ptr)
{
    80001dec:	fe010113          	addi	sp,sp,-32
    80001df0:	00113c23          	sd	ra,24(sp)
    80001df4:	00813823          	sd	s0,16(sp)
    80001df8:	00913423          	sd	s1,8(sp)
    80001dfc:	02010413          	addi	s0,sp,32
    MemBlock* current;
    current = (MemBlock*)((unsigned  char*)block_ptr -sizeof(MemBlock));
    80001e00:	fe050493          	addi	s1,a0,-32
    if(current == nullptr)
    80001e04:	00048e63          	beqz	s1,80001e20 <_ZN15MemoryAllocator17get_current_blockEPv+0x34>
    {
        printString("ERROR wrong argument mem_free \n");
        return nullptr;
    }
    return current;
}
    80001e08:	00048513          	mv	a0,s1
    80001e0c:	01813083          	ld	ra,24(sp)
    80001e10:	01013403          	ld	s0,16(sp)
    80001e14:	00813483          	ld	s1,8(sp)
    80001e18:	02010113          	addi	sp,sp,32
    80001e1c:	00008067          	ret
        printString("ERROR wrong argument mem_free \n");
    80001e20:	00003517          	auipc	a0,0x3
    80001e24:	37050513          	addi	a0,a0,880 # 80005190 <CONSOLE_STATUS+0x180>
    80001e28:	00000097          	auipc	ra,0x0
    80001e2c:	d40080e7          	jalr	-704(ra) # 80001b68 <_ZN15MemoryAllocator11printStringEPKc>
        return nullptr;
    80001e30:	fd9ff06f          	j	80001e08 <_ZN15MemoryAllocator17get_current_blockEPv+0x1c>

0000000080001e34 <_ZN15MemoryAllocator12merge_blocksEP8MemBlock>:

void MemoryAllocator::merge_blocks(MemBlock* cur)
{
    80001e34:	ff010113          	addi	sp,sp,-16
    80001e38:	00813423          	sd	s0,8(sp)
    80001e3c:	01010413          	addi	s0,sp,16
    MemBlock* nextCurrent = cur->next;
    80001e40:	00853783          	ld	a5,8(a0)
    MemBlock* prevCurrent = cur->prev;
    80001e44:	01053683          	ld	a3,16(a0)
    // next
    if(nextCurrent == nullptr || nextCurrent->isUsed)
    80001e48:	06078463          	beqz	a5,80001eb0 <_ZN15MemoryAllocator12merge_blocksEP8MemBlock+0x7c>
    80001e4c:	0187c703          	lbu	a4,24(a5)
    80001e50:	06071063          	bnez	a4,80001eb0 <_ZN15MemoryAllocator12merge_blocksEP8MemBlock+0x7c>
        return;

    cur->size += nextCurrent->size + sizeof(MemBlock);
    80001e54:	0007b703          	ld	a4,0(a5)
    80001e58:	00053603          	ld	a2,0(a0)
    80001e5c:	00c70733          	add	a4,a4,a2
    80001e60:	02070713          	addi	a4,a4,32
    80001e64:	00e53023          	sd	a4,0(a0)
    cur->next = cur->next->next;
    80001e68:	0087b783          	ld	a5,8(a5)
    80001e6c:	00f53423          	sd	a5,8(a0)
    if(cur->next != nullptr)
    80001e70:	00078463          	beqz	a5,80001e78 <_ZN15MemoryAllocator12merge_blocksEP8MemBlock+0x44>
        cur->next->prev = cur;
    80001e74:	00a7b823          	sd	a0,16(a5)

    // prev
    if(prevCurrent == nullptr || prevCurrent->isUsed)
    80001e78:	02068c63          	beqz	a3,80001eb0 <_ZN15MemoryAllocator12merge_blocksEP8MemBlock+0x7c>
    80001e7c:	0186c783          	lbu	a5,24(a3)
    80001e80:	02079863          	bnez	a5,80001eb0 <_ZN15MemoryAllocator12merge_blocksEP8MemBlock+0x7c>
        return;

    prevCurrent->size +=cur->size + sizeof (MemBlock);
    80001e84:	00053783          	ld	a5,0(a0)
    80001e88:	0006b703          	ld	a4,0(a3)
    80001e8c:	00e787b3          	add	a5,a5,a4
    80001e90:	02078793          	addi	a5,a5,32
    80001e94:	00f6b023          	sd	a5,0(a3)
    cur->prev->next = cur->next;
    80001e98:	01053703          	ld	a4,16(a0)
    80001e9c:	00853783          	ld	a5,8(a0)
    80001ea0:	00f73423          	sd	a5,8(a4)
    if(cur->next != nullptr)
    80001ea4:	00078663          	beqz	a5,80001eb0 <_ZN15MemoryAllocator12merge_blocksEP8MemBlock+0x7c>
    {
        cur->next->prev = cur->prev;
    80001ea8:	01053703          	ld	a4,16(a0)
    80001eac:	00e7b823          	sd	a4,16(a5)
    }
    return;
}
    80001eb0:	00813403          	ld	s0,8(sp)
    80001eb4:	01010113          	addi	sp,sp,16
    80001eb8:	00008067          	ret

0000000080001ebc <_ZN15MemoryAllocator12remove_blockEP8MemBlock>:

void MemoryAllocator::remove_block(MemBlock* current)
{
    80001ebc:	ff010113          	addi	sp,sp,-16
    80001ec0:	00813423          	sd	s0,8(sp)
    80001ec4:	01010413          	addi	s0,sp,16
    MemBlock* curr = m_used;
    80001ec8:	00004797          	auipc	a5,0x4
    80001ecc:	c307b783          	ld	a5,-976(a5) # 80005af8 <_ZN15MemoryAllocator6m_usedE>
    MemBlock* previous = nullptr;

    if (curr == current)
    80001ed0:	00a78e63          	beq	a5,a0,80001eec <_ZN15MemoryAllocator12remove_blockEP8MemBlock+0x30>
    MemBlock* previous = nullptr;
    80001ed4:	00000713          	li	a4,0
            m_used->prev = nullptr;
        curr = nullptr;
        return;
    }

    while (curr != nullptr && curr != current)
    80001ed8:	02078663          	beqz	a5,80001f04 <_ZN15MemoryAllocator12remove_blockEP8MemBlock+0x48>
    80001edc:	02a78463          	beq	a5,a0,80001f04 <_ZN15MemoryAllocator12remove_blockEP8MemBlock+0x48>
    {
        previous = curr;
    80001ee0:	00078713          	mv	a4,a5
        curr = curr->next;
    80001ee4:	0087b783          	ld	a5,8(a5)
    while (curr != nullptr && curr != current)
    80001ee8:	ff1ff06f          	j	80001ed8 <_ZN15MemoryAllocator12remove_blockEP8MemBlock+0x1c>
        m_used = curr->next;
    80001eec:	0087b783          	ld	a5,8(a5)
    80001ef0:	00004717          	auipc	a4,0x4
    80001ef4:	c0f73423          	sd	a5,-1016(a4) # 80005af8 <_ZN15MemoryAllocator6m_usedE>
        if (m_used != nullptr)
    80001ef8:	02078263          	beqz	a5,80001f1c <_ZN15MemoryAllocator12remove_blockEP8MemBlock+0x60>
            m_used->prev = nullptr;
    80001efc:	0007b823          	sd	zero,16(a5)
        return;
    80001f00:	01c0006f          	j	80001f1c <_ZN15MemoryAllocator12remove_blockEP8MemBlock+0x60>
    }

    if (curr == nullptr)
    80001f04:	00078c63          	beqz	a5,80001f1c <_ZN15MemoryAllocator12remove_blockEP8MemBlock+0x60>
        return;

    previous->next = curr->next;
    80001f08:	0087b683          	ld	a3,8(a5)
    80001f0c:	00d73423          	sd	a3,8(a4)
    if (curr->next != nullptr)
    80001f10:	0087b783          	ld	a5,8(a5)
    80001f14:	00078463          	beqz	a5,80001f1c <_ZN15MemoryAllocator12remove_blockEP8MemBlock+0x60>
        curr->next->prev = previous;
    80001f18:	00e7b823          	sd	a4,16(a5)
    curr = nullptr;
}
    80001f1c:	00813403          	ld	s0,8(sp)
    80001f20:	01010113          	addi	sp,sp,16
    80001f24:	00008067          	ret

0000000080001f28 <_ZN15MemoryAllocator8mem_freeEPv>:


int MemoryAllocator::mem_free(void* ptr)
{
    80001f28:	fe010113          	addi	sp,sp,-32
    80001f2c:	00113c23          	sd	ra,24(sp)
    80001f30:	00813823          	sd	s0,16(sp)
    80001f34:	00913423          	sd	s1,8(sp)
    80001f38:	02010413          	addi	s0,sp,32
    if(ptr == nullptr)
    80001f3c:	04050263          	beqz	a0,80001f80 <_ZN15MemoryAllocator8mem_freeEPv+0x58>
    {
        printString("ERROR: invalid argument in mem_free\n");
        return -1;
    }

    MemBlock* current = get_current_block(ptr);
    80001f40:	00000097          	auipc	ra,0x0
    80001f44:	eac080e7          	jalr	-340(ra) # 80001dec <_ZN15MemoryAllocator17get_current_blockEPv>
    80001f48:	00050493          	mv	s1,a0
    if(current == nullptr) return -1;
    80001f4c:	04050663          	beqz	a0,80001f98 <_ZN15MemoryAllocator8mem_freeEPv+0x70>

    current->isUsed = false;
    80001f50:	00050c23          	sb	zero,24(a0)
    merge_blocks(current);
    80001f54:	00000097          	auipc	ra,0x0
    80001f58:	ee0080e7          	jalr	-288(ra) # 80001e34 <_ZN15MemoryAllocator12merge_blocksEP8MemBlock>
    remove_block(current);
    80001f5c:	00048513          	mv	a0,s1
    80001f60:	00000097          	auipc	ra,0x0
    80001f64:	f5c080e7          	jalr	-164(ra) # 80001ebc <_ZN15MemoryAllocator12remove_blockEP8MemBlock>

    return 0;
    80001f68:	00000513          	li	a0,0
}
    80001f6c:	01813083          	ld	ra,24(sp)
    80001f70:	01013403          	ld	s0,16(sp)
    80001f74:	00813483          	ld	s1,8(sp)
    80001f78:	02010113          	addi	sp,sp,32
    80001f7c:	00008067          	ret
        printString("ERROR: invalid argument in mem_free\n");
    80001f80:	00003517          	auipc	a0,0x3
    80001f84:	23050513          	addi	a0,a0,560 # 800051b0 <CONSOLE_STATUS+0x1a0>
    80001f88:	00000097          	auipc	ra,0x0
    80001f8c:	be0080e7          	jalr	-1056(ra) # 80001b68 <_ZN15MemoryAllocator11printStringEPKc>
        return -1;
    80001f90:	fff00513          	li	a0,-1
    80001f94:	fd9ff06f          	j	80001f6c <_ZN15MemoryAllocator8mem_freeEPv+0x44>
    if(current == nullptr) return -1;
    80001f98:	fff00513          	li	a0,-1
    80001f9c:	fd1ff06f          	j	80001f6c <_ZN15MemoryAllocator8mem_freeEPv+0x44>

0000000080001fa0 <_Z41__static_initialization_and_destruction_0ii>:
}

void Scheduler::put(CCB *ccb)
{
    readyCoroutineQueue.addLast(ccb);
    80001fa0:	ff010113          	addi	sp,sp,-16
    80001fa4:	00813423          	sd	s0,8(sp)
    80001fa8:	01010413          	addi	s0,sp,16
    80001fac:	00100793          	li	a5,1
    80001fb0:	00f50863          	beq	a0,a5,80001fc0 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80001fb4:	00813403          	ld	s0,8(sp)
    80001fb8:	01010113          	addi	sp,sp,16
    80001fbc:	00008067          	ret
    80001fc0:	000107b7          	lui	a5,0x10
    80001fc4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001fc8:	fef596e3          	bne	a1,a5,80001fb4 <_Z41__static_initialization_and_destruction_0ii+0x14>
    };

    Elem *head, *tail;

public:
    List() : head(0), tail(0) {}
    80001fcc:	00004797          	auipc	a5,0x4
    80001fd0:	b3478793          	addi	a5,a5,-1228 # 80005b00 <_ZN9Scheduler19readyCoroutineQueueE>
    80001fd4:	0007b023          	sd	zero,0(a5)
    80001fd8:	0007b423          	sd	zero,8(a5)
    80001fdc:	fd9ff06f          	j	80001fb4 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080001fe0 <_ZN9Scheduler3getEv>:
{
    80001fe0:	fe010113          	addi	sp,sp,-32
    80001fe4:	00113c23          	sd	ra,24(sp)
    80001fe8:	00813823          	sd	s0,16(sp)
    80001fec:	00913423          	sd	s1,8(sp)
    80001ff0:	02010413          	addi	s0,sp,32
        }
    }

    T *removeFirst()
    {
        if (!head) { return 0; }
    80001ff4:	00004517          	auipc	a0,0x4
    80001ff8:	b0c53503          	ld	a0,-1268(a0) # 80005b00 <_ZN9Scheduler19readyCoroutineQueueE>
    80001ffc:	04050263          	beqz	a0,80002040 <_ZN9Scheduler3getEv+0x60>

        Elem *elem = head;
        head = head->next;
    80002000:	00853783          	ld	a5,8(a0)
    80002004:	00004717          	auipc	a4,0x4
    80002008:	aef73e23          	sd	a5,-1284(a4) # 80005b00 <_ZN9Scheduler19readyCoroutineQueueE>
        if (!head) { tail = 0; }
    8000200c:	02078463          	beqz	a5,80002034 <_ZN9Scheduler3getEv+0x54>

        T *ret = elem->data;
    80002010:	00053483          	ld	s1,0(a0)
        delete elem;
    80002014:	00000097          	auipc	ra,0x0
    80002018:	8fc080e7          	jalr	-1796(ra) # 80001910 <_ZdlPv>
}
    8000201c:	00048513          	mv	a0,s1
    80002020:	01813083          	ld	ra,24(sp)
    80002024:	01013403          	ld	s0,16(sp)
    80002028:	00813483          	ld	s1,8(sp)
    8000202c:	02010113          	addi	sp,sp,32
    80002030:	00008067          	ret
        if (!head) { tail = 0; }
    80002034:	00004797          	auipc	a5,0x4
    80002038:	ac07ba23          	sd	zero,-1324(a5) # 80005b08 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    8000203c:	fd5ff06f          	j	80002010 <_ZN9Scheduler3getEv+0x30>
        if (!head) { return 0; }
    80002040:	00050493          	mv	s1,a0
    return readyCoroutineQueue.removeFirst();
    80002044:	fd9ff06f          	j	8000201c <_ZN9Scheduler3getEv+0x3c>

0000000080002048 <_ZN9Scheduler3putEP3CCB>:
{
    80002048:	fe010113          	addi	sp,sp,-32
    8000204c:	00113c23          	sd	ra,24(sp)
    80002050:	00813823          	sd	s0,16(sp)
    80002054:	00913423          	sd	s1,8(sp)
    80002058:	02010413          	addi	s0,sp,32
    8000205c:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    80002060:	01000513          	li	a0,16
    80002064:	00000097          	auipc	ra,0x0
    80002068:	85c080e7          	jalr	-1956(ra) # 800018c0 <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    8000206c:	00953023          	sd	s1,0(a0)
    80002070:	00053423          	sd	zero,8(a0)
        if (tail)
    80002074:	00004797          	auipc	a5,0x4
    80002078:	a947b783          	ld	a5,-1388(a5) # 80005b08 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    8000207c:	02078263          	beqz	a5,800020a0 <_ZN9Scheduler3putEP3CCB+0x58>
            tail->next = elem;
    80002080:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80002084:	00004797          	auipc	a5,0x4
    80002088:	a8a7b223          	sd	a0,-1404(a5) # 80005b08 <_ZN9Scheduler19readyCoroutineQueueE+0x8>
    8000208c:	01813083          	ld	ra,24(sp)
    80002090:	01013403          	ld	s0,16(sp)
    80002094:	00813483          	ld	s1,8(sp)
    80002098:	02010113          	addi	sp,sp,32
    8000209c:	00008067          	ret
            head = tail = elem;
    800020a0:	00004797          	auipc	a5,0x4
    800020a4:	a6078793          	addi	a5,a5,-1440 # 80005b00 <_ZN9Scheduler19readyCoroutineQueueE>
    800020a8:	00a7b423          	sd	a0,8(a5)
    800020ac:	00a7b023          	sd	a0,0(a5)
    800020b0:	fddff06f          	j	8000208c <_ZN9Scheduler3putEP3CCB+0x44>

00000000800020b4 <_GLOBAL__sub_I__ZN9Scheduler19readyCoroutineQueueE>:
    800020b4:	ff010113          	addi	sp,sp,-16
    800020b8:	00113423          	sd	ra,8(sp)
    800020bc:	00813023          	sd	s0,0(sp)
    800020c0:	01010413          	addi	s0,sp,16
    800020c4:	000105b7          	lui	a1,0x10
    800020c8:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    800020cc:	00100513          	li	a0,1
    800020d0:	00000097          	auipc	ra,0x0
    800020d4:	ed0080e7          	jalr	-304(ra) # 80001fa0 <_Z41__static_initialization_and_destruction_0ii>
    800020d8:	00813083          	ld	ra,8(sp)
    800020dc:	00013403          	ld	s0,0(sp)
    800020e0:	01010113          	addi	sp,sp,16
    800020e4:	00008067          	ret

00000000800020e8 <_Z11printStringPKc>:
#include "../h/print.hpp"
#include "../lib/console.h"

void printString(char const *string)
{
    800020e8:	fe010113          	addi	sp,sp,-32
    800020ec:	00113c23          	sd	ra,24(sp)
    800020f0:	00813823          	sd	s0,16(sp)
    800020f4:	00913423          	sd	s1,8(sp)
    800020f8:	02010413          	addi	s0,sp,32
    800020fc:	00050493          	mv	s1,a0
    while (*string != '\0')
    80002100:	0004c503          	lbu	a0,0(s1)
    80002104:	00050a63          	beqz	a0,80002118 <_Z11printStringPKc+0x30>
    {
        __putc(*string);
    80002108:	00002097          	auipc	ra,0x2
    8000210c:	174080e7          	jalr	372(ra) # 8000427c <__putc>
        string++;
    80002110:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80002114:	fedff06f          	j	80002100 <_Z11printStringPKc+0x18>
    }
}
    80002118:	01813083          	ld	ra,24(sp)
    8000211c:	01013403          	ld	s0,16(sp)
    80002120:	00813483          	ld	s1,8(sp)
    80002124:	02010113          	addi	sp,sp,32
    80002128:	00008067          	ret

000000008000212c <_Z12printIntegerm>:

void printInteger(uint64 integer)
{
    8000212c:	fd010113          	addi	sp,sp,-48
    80002130:	02113423          	sd	ra,40(sp)
    80002134:	02813023          	sd	s0,32(sp)
    80002138:	00913c23          	sd	s1,24(sp)
    8000213c:	03010413          	addi	s0,sp,48
    {
        neg = 1;
        x = -integer;
    } else
    {
        x = integer;
    80002140:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    80002144:	00000493          	li	s1,0
    do
    {
        buf[i++] = digits[x % 10];
    80002148:	00a00613          	li	a2,10
    8000214c:	02c5773b          	remuw	a4,a0,a2
    80002150:	02071693          	slli	a3,a4,0x20
    80002154:	0206d693          	srli	a3,a3,0x20
    80002158:	00003717          	auipc	a4,0x3
    8000215c:	08070713          	addi	a4,a4,128 # 800051d8 <_ZZ12printIntegermE6digits>
    80002160:	00d70733          	add	a4,a4,a3
    80002164:	00074703          	lbu	a4,0(a4)
    80002168:	fe040693          	addi	a3,s0,-32
    8000216c:	009687b3          	add	a5,a3,s1
    80002170:	0014849b          	addiw	s1,s1,1
    80002174:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    80002178:	0005071b          	sext.w	a4,a0
    8000217c:	02c5553b          	divuw	a0,a0,a2
    80002180:	00900793          	li	a5,9
    80002184:	fce7e2e3          	bltu	a5,a4,80002148 <_Z12printIntegerm+0x1c>
    if (neg)
        buf[i++] = '-';

    while (--i >= 0)
    80002188:	fff4849b          	addiw	s1,s1,-1
    8000218c:	0004ce63          	bltz	s1,800021a8 <_Z12printIntegerm+0x7c>
        __putc(buf[i]);
    80002190:	fe040793          	addi	a5,s0,-32
    80002194:	009787b3          	add	a5,a5,s1
    80002198:	ff07c503          	lbu	a0,-16(a5)
    8000219c:	00002097          	auipc	ra,0x2
    800021a0:	0e0080e7          	jalr	224(ra) # 8000427c <__putc>
    800021a4:	fe5ff06f          	j	80002188 <_Z12printIntegerm+0x5c>
    800021a8:	02813083          	ld	ra,40(sp)
    800021ac:	02013403          	ld	s0,32(sp)
    800021b0:	01813483          	ld	s1,24(sp)
    800021b4:	03010113          	addi	sp,sp,48
    800021b8:	00008067          	ret

00000000800021bc <start>:
    800021bc:	ff010113          	addi	sp,sp,-16
    800021c0:	00813423          	sd	s0,8(sp)
    800021c4:	01010413          	addi	s0,sp,16
    800021c8:	300027f3          	csrr	a5,mstatus
    800021cc:	ffffe737          	lui	a4,0xffffe
    800021d0:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff7a8f>
    800021d4:	00e7f7b3          	and	a5,a5,a4
    800021d8:	00001737          	lui	a4,0x1
    800021dc:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800021e0:	00e7e7b3          	or	a5,a5,a4
    800021e4:	30079073          	csrw	mstatus,a5
    800021e8:	00000797          	auipc	a5,0x0
    800021ec:	16078793          	addi	a5,a5,352 # 80002348 <system_main>
    800021f0:	34179073          	csrw	mepc,a5
    800021f4:	00000793          	li	a5,0
    800021f8:	18079073          	csrw	satp,a5
    800021fc:	000107b7          	lui	a5,0x10
    80002200:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002204:	30279073          	csrw	medeleg,a5
    80002208:	30379073          	csrw	mideleg,a5
    8000220c:	104027f3          	csrr	a5,sie
    80002210:	2227e793          	ori	a5,a5,546
    80002214:	10479073          	csrw	sie,a5
    80002218:	fff00793          	li	a5,-1
    8000221c:	00a7d793          	srli	a5,a5,0xa
    80002220:	3b079073          	csrw	pmpaddr0,a5
    80002224:	00f00793          	li	a5,15
    80002228:	3a079073          	csrw	pmpcfg0,a5
    8000222c:	f14027f3          	csrr	a5,mhartid
    80002230:	0200c737          	lui	a4,0x200c
    80002234:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002238:	0007869b          	sext.w	a3,a5
    8000223c:	00269713          	slli	a4,a3,0x2
    80002240:	000f4637          	lui	a2,0xf4
    80002244:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002248:	00d70733          	add	a4,a4,a3
    8000224c:	0037979b          	slliw	a5,a5,0x3
    80002250:	020046b7          	lui	a3,0x2004
    80002254:	00d787b3          	add	a5,a5,a3
    80002258:	00c585b3          	add	a1,a1,a2
    8000225c:	00371693          	slli	a3,a4,0x3
    80002260:	00004717          	auipc	a4,0x4
    80002264:	8b070713          	addi	a4,a4,-1872 # 80005b10 <timer_scratch>
    80002268:	00b7b023          	sd	a1,0(a5)
    8000226c:	00d70733          	add	a4,a4,a3
    80002270:	00f73c23          	sd	a5,24(a4)
    80002274:	02c73023          	sd	a2,32(a4)
    80002278:	34071073          	csrw	mscratch,a4
    8000227c:	00000797          	auipc	a5,0x0
    80002280:	6e478793          	addi	a5,a5,1764 # 80002960 <timervec>
    80002284:	30579073          	csrw	mtvec,a5
    80002288:	300027f3          	csrr	a5,mstatus
    8000228c:	0087e793          	ori	a5,a5,8
    80002290:	30079073          	csrw	mstatus,a5
    80002294:	304027f3          	csrr	a5,mie
    80002298:	0807e793          	ori	a5,a5,128
    8000229c:	30479073          	csrw	mie,a5
    800022a0:	f14027f3          	csrr	a5,mhartid
    800022a4:	0007879b          	sext.w	a5,a5
    800022a8:	00078213          	mv	tp,a5
    800022ac:	30200073          	mret
    800022b0:	00813403          	ld	s0,8(sp)
    800022b4:	01010113          	addi	sp,sp,16
    800022b8:	00008067          	ret

00000000800022bc <timerinit>:
    800022bc:	ff010113          	addi	sp,sp,-16
    800022c0:	00813423          	sd	s0,8(sp)
    800022c4:	01010413          	addi	s0,sp,16
    800022c8:	f14027f3          	csrr	a5,mhartid
    800022cc:	0200c737          	lui	a4,0x200c
    800022d0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800022d4:	0007869b          	sext.w	a3,a5
    800022d8:	00269713          	slli	a4,a3,0x2
    800022dc:	000f4637          	lui	a2,0xf4
    800022e0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800022e4:	00d70733          	add	a4,a4,a3
    800022e8:	0037979b          	slliw	a5,a5,0x3
    800022ec:	020046b7          	lui	a3,0x2004
    800022f0:	00d787b3          	add	a5,a5,a3
    800022f4:	00c585b3          	add	a1,a1,a2
    800022f8:	00371693          	slli	a3,a4,0x3
    800022fc:	00004717          	auipc	a4,0x4
    80002300:	81470713          	addi	a4,a4,-2028 # 80005b10 <timer_scratch>
    80002304:	00b7b023          	sd	a1,0(a5)
    80002308:	00d70733          	add	a4,a4,a3
    8000230c:	00f73c23          	sd	a5,24(a4)
    80002310:	02c73023          	sd	a2,32(a4)
    80002314:	34071073          	csrw	mscratch,a4
    80002318:	00000797          	auipc	a5,0x0
    8000231c:	64878793          	addi	a5,a5,1608 # 80002960 <timervec>
    80002320:	30579073          	csrw	mtvec,a5
    80002324:	300027f3          	csrr	a5,mstatus
    80002328:	0087e793          	ori	a5,a5,8
    8000232c:	30079073          	csrw	mstatus,a5
    80002330:	304027f3          	csrr	a5,mie
    80002334:	0807e793          	ori	a5,a5,128
    80002338:	30479073          	csrw	mie,a5
    8000233c:	00813403          	ld	s0,8(sp)
    80002340:	01010113          	addi	sp,sp,16
    80002344:	00008067          	ret

0000000080002348 <system_main>:
    80002348:	fe010113          	addi	sp,sp,-32
    8000234c:	00813823          	sd	s0,16(sp)
    80002350:	00913423          	sd	s1,8(sp)
    80002354:	00113c23          	sd	ra,24(sp)
    80002358:	02010413          	addi	s0,sp,32
    8000235c:	00000097          	auipc	ra,0x0
    80002360:	0c4080e7          	jalr	196(ra) # 80002420 <cpuid>
    80002364:	00003497          	auipc	s1,0x3
    80002368:	73c48493          	addi	s1,s1,1852 # 80005aa0 <started>
    8000236c:	02050263          	beqz	a0,80002390 <system_main+0x48>
    80002370:	0004a783          	lw	a5,0(s1)
    80002374:	0007879b          	sext.w	a5,a5
    80002378:	fe078ce3          	beqz	a5,80002370 <system_main+0x28>
    8000237c:	0ff0000f          	fence
    80002380:	00003517          	auipc	a0,0x3
    80002384:	e9850513          	addi	a0,a0,-360 # 80005218 <_ZZ12printIntegermE6digits+0x40>
    80002388:	00001097          	auipc	ra,0x1
    8000238c:	a74080e7          	jalr	-1420(ra) # 80002dfc <panic>
    80002390:	00001097          	auipc	ra,0x1
    80002394:	9c8080e7          	jalr	-1592(ra) # 80002d58 <consoleinit>
    80002398:	00001097          	auipc	ra,0x1
    8000239c:	154080e7          	jalr	340(ra) # 800034ec <printfinit>
    800023a0:	00003517          	auipc	a0,0x3
    800023a4:	d6050513          	addi	a0,a0,-672 # 80005100 <CONSOLE_STATUS+0xf0>
    800023a8:	00001097          	auipc	ra,0x1
    800023ac:	ab0080e7          	jalr	-1360(ra) # 80002e58 <__printf>
    800023b0:	00003517          	auipc	a0,0x3
    800023b4:	e3850513          	addi	a0,a0,-456 # 800051e8 <_ZZ12printIntegermE6digits+0x10>
    800023b8:	00001097          	auipc	ra,0x1
    800023bc:	aa0080e7          	jalr	-1376(ra) # 80002e58 <__printf>
    800023c0:	00003517          	auipc	a0,0x3
    800023c4:	d4050513          	addi	a0,a0,-704 # 80005100 <CONSOLE_STATUS+0xf0>
    800023c8:	00001097          	auipc	ra,0x1
    800023cc:	a90080e7          	jalr	-1392(ra) # 80002e58 <__printf>
    800023d0:	00001097          	auipc	ra,0x1
    800023d4:	4a8080e7          	jalr	1192(ra) # 80003878 <kinit>
    800023d8:	00000097          	auipc	ra,0x0
    800023dc:	148080e7          	jalr	328(ra) # 80002520 <trapinit>
    800023e0:	00000097          	auipc	ra,0x0
    800023e4:	16c080e7          	jalr	364(ra) # 8000254c <trapinithart>
    800023e8:	00000097          	auipc	ra,0x0
    800023ec:	5b8080e7          	jalr	1464(ra) # 800029a0 <plicinit>
    800023f0:	00000097          	auipc	ra,0x0
    800023f4:	5d8080e7          	jalr	1496(ra) # 800029c8 <plicinithart>
    800023f8:	00000097          	auipc	ra,0x0
    800023fc:	078080e7          	jalr	120(ra) # 80002470 <userinit>
    80002400:	0ff0000f          	fence
    80002404:	00100793          	li	a5,1
    80002408:	00003517          	auipc	a0,0x3
    8000240c:	df850513          	addi	a0,a0,-520 # 80005200 <_ZZ12printIntegermE6digits+0x28>
    80002410:	00f4a023          	sw	a5,0(s1)
    80002414:	00001097          	auipc	ra,0x1
    80002418:	a44080e7          	jalr	-1468(ra) # 80002e58 <__printf>
    8000241c:	0000006f          	j	8000241c <system_main+0xd4>

0000000080002420 <cpuid>:
    80002420:	ff010113          	addi	sp,sp,-16
    80002424:	00813423          	sd	s0,8(sp)
    80002428:	01010413          	addi	s0,sp,16
    8000242c:	00020513          	mv	a0,tp
    80002430:	00813403          	ld	s0,8(sp)
    80002434:	0005051b          	sext.w	a0,a0
    80002438:	01010113          	addi	sp,sp,16
    8000243c:	00008067          	ret

0000000080002440 <mycpu>:
    80002440:	ff010113          	addi	sp,sp,-16
    80002444:	00813423          	sd	s0,8(sp)
    80002448:	01010413          	addi	s0,sp,16
    8000244c:	00020793          	mv	a5,tp
    80002450:	00813403          	ld	s0,8(sp)
    80002454:	0007879b          	sext.w	a5,a5
    80002458:	00779793          	slli	a5,a5,0x7
    8000245c:	00004517          	auipc	a0,0x4
    80002460:	6e450513          	addi	a0,a0,1764 # 80006b40 <cpus>
    80002464:	00f50533          	add	a0,a0,a5
    80002468:	01010113          	addi	sp,sp,16
    8000246c:	00008067          	ret

0000000080002470 <userinit>:
    80002470:	ff010113          	addi	sp,sp,-16
    80002474:	00813423          	sd	s0,8(sp)
    80002478:	01010413          	addi	s0,sp,16
    8000247c:	00813403          	ld	s0,8(sp)
    80002480:	01010113          	addi	sp,sp,16
    80002484:	fffff317          	auipc	t1,0xfffff
    80002488:	32c30067          	jr	812(t1) # 800017b0 <main>

000000008000248c <either_copyout>:
    8000248c:	ff010113          	addi	sp,sp,-16
    80002490:	00813023          	sd	s0,0(sp)
    80002494:	00113423          	sd	ra,8(sp)
    80002498:	01010413          	addi	s0,sp,16
    8000249c:	02051663          	bnez	a0,800024c8 <either_copyout+0x3c>
    800024a0:	00058513          	mv	a0,a1
    800024a4:	00060593          	mv	a1,a2
    800024a8:	0006861b          	sext.w	a2,a3
    800024ac:	00002097          	auipc	ra,0x2
    800024b0:	c58080e7          	jalr	-936(ra) # 80004104 <__memmove>
    800024b4:	00813083          	ld	ra,8(sp)
    800024b8:	00013403          	ld	s0,0(sp)
    800024bc:	00000513          	li	a0,0
    800024c0:	01010113          	addi	sp,sp,16
    800024c4:	00008067          	ret
    800024c8:	00003517          	auipc	a0,0x3
    800024cc:	d7850513          	addi	a0,a0,-648 # 80005240 <_ZZ12printIntegermE6digits+0x68>
    800024d0:	00001097          	auipc	ra,0x1
    800024d4:	92c080e7          	jalr	-1748(ra) # 80002dfc <panic>

00000000800024d8 <either_copyin>:
    800024d8:	ff010113          	addi	sp,sp,-16
    800024dc:	00813023          	sd	s0,0(sp)
    800024e0:	00113423          	sd	ra,8(sp)
    800024e4:	01010413          	addi	s0,sp,16
    800024e8:	02059463          	bnez	a1,80002510 <either_copyin+0x38>
    800024ec:	00060593          	mv	a1,a2
    800024f0:	0006861b          	sext.w	a2,a3
    800024f4:	00002097          	auipc	ra,0x2
    800024f8:	c10080e7          	jalr	-1008(ra) # 80004104 <__memmove>
    800024fc:	00813083          	ld	ra,8(sp)
    80002500:	00013403          	ld	s0,0(sp)
    80002504:	00000513          	li	a0,0
    80002508:	01010113          	addi	sp,sp,16
    8000250c:	00008067          	ret
    80002510:	00003517          	auipc	a0,0x3
    80002514:	d5850513          	addi	a0,a0,-680 # 80005268 <_ZZ12printIntegermE6digits+0x90>
    80002518:	00001097          	auipc	ra,0x1
    8000251c:	8e4080e7          	jalr	-1820(ra) # 80002dfc <panic>

0000000080002520 <trapinit>:
    80002520:	ff010113          	addi	sp,sp,-16
    80002524:	00813423          	sd	s0,8(sp)
    80002528:	01010413          	addi	s0,sp,16
    8000252c:	00813403          	ld	s0,8(sp)
    80002530:	00003597          	auipc	a1,0x3
    80002534:	d6058593          	addi	a1,a1,-672 # 80005290 <_ZZ12printIntegermE6digits+0xb8>
    80002538:	00004517          	auipc	a0,0x4
    8000253c:	68850513          	addi	a0,a0,1672 # 80006bc0 <tickslock>
    80002540:	01010113          	addi	sp,sp,16
    80002544:	00001317          	auipc	t1,0x1
    80002548:	5c430067          	jr	1476(t1) # 80003b08 <initlock>

000000008000254c <trapinithart>:
    8000254c:	ff010113          	addi	sp,sp,-16
    80002550:	00813423          	sd	s0,8(sp)
    80002554:	01010413          	addi	s0,sp,16
    80002558:	00000797          	auipc	a5,0x0
    8000255c:	2f878793          	addi	a5,a5,760 # 80002850 <kernelvec>
    80002560:	10579073          	csrw	stvec,a5
    80002564:	00813403          	ld	s0,8(sp)
    80002568:	01010113          	addi	sp,sp,16
    8000256c:	00008067          	ret

0000000080002570 <usertrap>:
    80002570:	ff010113          	addi	sp,sp,-16
    80002574:	00813423          	sd	s0,8(sp)
    80002578:	01010413          	addi	s0,sp,16
    8000257c:	00813403          	ld	s0,8(sp)
    80002580:	01010113          	addi	sp,sp,16
    80002584:	00008067          	ret

0000000080002588 <usertrapret>:
    80002588:	ff010113          	addi	sp,sp,-16
    8000258c:	00813423          	sd	s0,8(sp)
    80002590:	01010413          	addi	s0,sp,16
    80002594:	00813403          	ld	s0,8(sp)
    80002598:	01010113          	addi	sp,sp,16
    8000259c:	00008067          	ret

00000000800025a0 <kerneltrap>:
    800025a0:	fe010113          	addi	sp,sp,-32
    800025a4:	00813823          	sd	s0,16(sp)
    800025a8:	00113c23          	sd	ra,24(sp)
    800025ac:	00913423          	sd	s1,8(sp)
    800025b0:	02010413          	addi	s0,sp,32
    800025b4:	142025f3          	csrr	a1,scause
    800025b8:	100027f3          	csrr	a5,sstatus
    800025bc:	0027f793          	andi	a5,a5,2
    800025c0:	10079c63          	bnez	a5,800026d8 <kerneltrap+0x138>
    800025c4:	142027f3          	csrr	a5,scause
    800025c8:	0207ce63          	bltz	a5,80002604 <kerneltrap+0x64>
    800025cc:	00003517          	auipc	a0,0x3
    800025d0:	d0c50513          	addi	a0,a0,-756 # 800052d8 <_ZZ12printIntegermE6digits+0x100>
    800025d4:	00001097          	auipc	ra,0x1
    800025d8:	884080e7          	jalr	-1916(ra) # 80002e58 <__printf>
    800025dc:	141025f3          	csrr	a1,sepc
    800025e0:	14302673          	csrr	a2,stval
    800025e4:	00003517          	auipc	a0,0x3
    800025e8:	d0450513          	addi	a0,a0,-764 # 800052e8 <_ZZ12printIntegermE6digits+0x110>
    800025ec:	00001097          	auipc	ra,0x1
    800025f0:	86c080e7          	jalr	-1940(ra) # 80002e58 <__printf>
    800025f4:	00003517          	auipc	a0,0x3
    800025f8:	d0c50513          	addi	a0,a0,-756 # 80005300 <_ZZ12printIntegermE6digits+0x128>
    800025fc:	00001097          	auipc	ra,0x1
    80002600:	800080e7          	jalr	-2048(ra) # 80002dfc <panic>
    80002604:	0ff7f713          	andi	a4,a5,255
    80002608:	00900693          	li	a3,9
    8000260c:	04d70063          	beq	a4,a3,8000264c <kerneltrap+0xac>
    80002610:	fff00713          	li	a4,-1
    80002614:	03f71713          	slli	a4,a4,0x3f
    80002618:	00170713          	addi	a4,a4,1
    8000261c:	fae798e3          	bne	a5,a4,800025cc <kerneltrap+0x2c>
    80002620:	00000097          	auipc	ra,0x0
    80002624:	e00080e7          	jalr	-512(ra) # 80002420 <cpuid>
    80002628:	06050663          	beqz	a0,80002694 <kerneltrap+0xf4>
    8000262c:	144027f3          	csrr	a5,sip
    80002630:	ffd7f793          	andi	a5,a5,-3
    80002634:	14479073          	csrw	sip,a5
    80002638:	01813083          	ld	ra,24(sp)
    8000263c:	01013403          	ld	s0,16(sp)
    80002640:	00813483          	ld	s1,8(sp)
    80002644:	02010113          	addi	sp,sp,32
    80002648:	00008067          	ret
    8000264c:	00000097          	auipc	ra,0x0
    80002650:	3c8080e7          	jalr	968(ra) # 80002a14 <plic_claim>
    80002654:	00a00793          	li	a5,10
    80002658:	00050493          	mv	s1,a0
    8000265c:	06f50863          	beq	a0,a5,800026cc <kerneltrap+0x12c>
    80002660:	fc050ce3          	beqz	a0,80002638 <kerneltrap+0x98>
    80002664:	00050593          	mv	a1,a0
    80002668:	00003517          	auipc	a0,0x3
    8000266c:	c5050513          	addi	a0,a0,-944 # 800052b8 <_ZZ12printIntegermE6digits+0xe0>
    80002670:	00000097          	auipc	ra,0x0
    80002674:	7e8080e7          	jalr	2024(ra) # 80002e58 <__printf>
    80002678:	01013403          	ld	s0,16(sp)
    8000267c:	01813083          	ld	ra,24(sp)
    80002680:	00048513          	mv	a0,s1
    80002684:	00813483          	ld	s1,8(sp)
    80002688:	02010113          	addi	sp,sp,32
    8000268c:	00000317          	auipc	t1,0x0
    80002690:	3c030067          	jr	960(t1) # 80002a4c <plic_complete>
    80002694:	00004517          	auipc	a0,0x4
    80002698:	52c50513          	addi	a0,a0,1324 # 80006bc0 <tickslock>
    8000269c:	00001097          	auipc	ra,0x1
    800026a0:	490080e7          	jalr	1168(ra) # 80003b2c <acquire>
    800026a4:	00003717          	auipc	a4,0x3
    800026a8:	40070713          	addi	a4,a4,1024 # 80005aa4 <ticks>
    800026ac:	00072783          	lw	a5,0(a4)
    800026b0:	00004517          	auipc	a0,0x4
    800026b4:	51050513          	addi	a0,a0,1296 # 80006bc0 <tickslock>
    800026b8:	0017879b          	addiw	a5,a5,1
    800026bc:	00f72023          	sw	a5,0(a4)
    800026c0:	00001097          	auipc	ra,0x1
    800026c4:	538080e7          	jalr	1336(ra) # 80003bf8 <release>
    800026c8:	f65ff06f          	j	8000262c <kerneltrap+0x8c>
    800026cc:	00001097          	auipc	ra,0x1
    800026d0:	094080e7          	jalr	148(ra) # 80003760 <uartintr>
    800026d4:	fa5ff06f          	j	80002678 <kerneltrap+0xd8>
    800026d8:	00003517          	auipc	a0,0x3
    800026dc:	bc050513          	addi	a0,a0,-1088 # 80005298 <_ZZ12printIntegermE6digits+0xc0>
    800026e0:	00000097          	auipc	ra,0x0
    800026e4:	71c080e7          	jalr	1820(ra) # 80002dfc <panic>

00000000800026e8 <clockintr>:
    800026e8:	fe010113          	addi	sp,sp,-32
    800026ec:	00813823          	sd	s0,16(sp)
    800026f0:	00913423          	sd	s1,8(sp)
    800026f4:	00113c23          	sd	ra,24(sp)
    800026f8:	02010413          	addi	s0,sp,32
    800026fc:	00004497          	auipc	s1,0x4
    80002700:	4c448493          	addi	s1,s1,1220 # 80006bc0 <tickslock>
    80002704:	00048513          	mv	a0,s1
    80002708:	00001097          	auipc	ra,0x1
    8000270c:	424080e7          	jalr	1060(ra) # 80003b2c <acquire>
    80002710:	00003717          	auipc	a4,0x3
    80002714:	39470713          	addi	a4,a4,916 # 80005aa4 <ticks>
    80002718:	00072783          	lw	a5,0(a4)
    8000271c:	01013403          	ld	s0,16(sp)
    80002720:	01813083          	ld	ra,24(sp)
    80002724:	00048513          	mv	a0,s1
    80002728:	0017879b          	addiw	a5,a5,1
    8000272c:	00813483          	ld	s1,8(sp)
    80002730:	00f72023          	sw	a5,0(a4)
    80002734:	02010113          	addi	sp,sp,32
    80002738:	00001317          	auipc	t1,0x1
    8000273c:	4c030067          	jr	1216(t1) # 80003bf8 <release>

0000000080002740 <devintr>:
    80002740:	142027f3          	csrr	a5,scause
    80002744:	00000513          	li	a0,0
    80002748:	0007c463          	bltz	a5,80002750 <devintr+0x10>
    8000274c:	00008067          	ret
    80002750:	fe010113          	addi	sp,sp,-32
    80002754:	00813823          	sd	s0,16(sp)
    80002758:	00113c23          	sd	ra,24(sp)
    8000275c:	00913423          	sd	s1,8(sp)
    80002760:	02010413          	addi	s0,sp,32
    80002764:	0ff7f713          	andi	a4,a5,255
    80002768:	00900693          	li	a3,9
    8000276c:	04d70c63          	beq	a4,a3,800027c4 <devintr+0x84>
    80002770:	fff00713          	li	a4,-1
    80002774:	03f71713          	slli	a4,a4,0x3f
    80002778:	00170713          	addi	a4,a4,1
    8000277c:	00e78c63          	beq	a5,a4,80002794 <devintr+0x54>
    80002780:	01813083          	ld	ra,24(sp)
    80002784:	01013403          	ld	s0,16(sp)
    80002788:	00813483          	ld	s1,8(sp)
    8000278c:	02010113          	addi	sp,sp,32
    80002790:	00008067          	ret
    80002794:	00000097          	auipc	ra,0x0
    80002798:	c8c080e7          	jalr	-884(ra) # 80002420 <cpuid>
    8000279c:	06050663          	beqz	a0,80002808 <devintr+0xc8>
    800027a0:	144027f3          	csrr	a5,sip
    800027a4:	ffd7f793          	andi	a5,a5,-3
    800027a8:	14479073          	csrw	sip,a5
    800027ac:	01813083          	ld	ra,24(sp)
    800027b0:	01013403          	ld	s0,16(sp)
    800027b4:	00813483          	ld	s1,8(sp)
    800027b8:	00200513          	li	a0,2
    800027bc:	02010113          	addi	sp,sp,32
    800027c0:	00008067          	ret
    800027c4:	00000097          	auipc	ra,0x0
    800027c8:	250080e7          	jalr	592(ra) # 80002a14 <plic_claim>
    800027cc:	00a00793          	li	a5,10
    800027d0:	00050493          	mv	s1,a0
    800027d4:	06f50663          	beq	a0,a5,80002840 <devintr+0x100>
    800027d8:	00100513          	li	a0,1
    800027dc:	fa0482e3          	beqz	s1,80002780 <devintr+0x40>
    800027e0:	00048593          	mv	a1,s1
    800027e4:	00003517          	auipc	a0,0x3
    800027e8:	ad450513          	addi	a0,a0,-1324 # 800052b8 <_ZZ12printIntegermE6digits+0xe0>
    800027ec:	00000097          	auipc	ra,0x0
    800027f0:	66c080e7          	jalr	1644(ra) # 80002e58 <__printf>
    800027f4:	00048513          	mv	a0,s1
    800027f8:	00000097          	auipc	ra,0x0
    800027fc:	254080e7          	jalr	596(ra) # 80002a4c <plic_complete>
    80002800:	00100513          	li	a0,1
    80002804:	f7dff06f          	j	80002780 <devintr+0x40>
    80002808:	00004517          	auipc	a0,0x4
    8000280c:	3b850513          	addi	a0,a0,952 # 80006bc0 <tickslock>
    80002810:	00001097          	auipc	ra,0x1
    80002814:	31c080e7          	jalr	796(ra) # 80003b2c <acquire>
    80002818:	00003717          	auipc	a4,0x3
    8000281c:	28c70713          	addi	a4,a4,652 # 80005aa4 <ticks>
    80002820:	00072783          	lw	a5,0(a4)
    80002824:	00004517          	auipc	a0,0x4
    80002828:	39c50513          	addi	a0,a0,924 # 80006bc0 <tickslock>
    8000282c:	0017879b          	addiw	a5,a5,1
    80002830:	00f72023          	sw	a5,0(a4)
    80002834:	00001097          	auipc	ra,0x1
    80002838:	3c4080e7          	jalr	964(ra) # 80003bf8 <release>
    8000283c:	f65ff06f          	j	800027a0 <devintr+0x60>
    80002840:	00001097          	auipc	ra,0x1
    80002844:	f20080e7          	jalr	-224(ra) # 80003760 <uartintr>
    80002848:	fadff06f          	j	800027f4 <devintr+0xb4>
    8000284c:	0000                	unimp
	...

0000000080002850 <kernelvec>:
    80002850:	f0010113          	addi	sp,sp,-256
    80002854:	00113023          	sd	ra,0(sp)
    80002858:	00213423          	sd	sp,8(sp)
    8000285c:	00313823          	sd	gp,16(sp)
    80002860:	00413c23          	sd	tp,24(sp)
    80002864:	02513023          	sd	t0,32(sp)
    80002868:	02613423          	sd	t1,40(sp)
    8000286c:	02713823          	sd	t2,48(sp)
    80002870:	02813c23          	sd	s0,56(sp)
    80002874:	04913023          	sd	s1,64(sp)
    80002878:	04a13423          	sd	a0,72(sp)
    8000287c:	04b13823          	sd	a1,80(sp)
    80002880:	04c13c23          	sd	a2,88(sp)
    80002884:	06d13023          	sd	a3,96(sp)
    80002888:	06e13423          	sd	a4,104(sp)
    8000288c:	06f13823          	sd	a5,112(sp)
    80002890:	07013c23          	sd	a6,120(sp)
    80002894:	09113023          	sd	a7,128(sp)
    80002898:	09213423          	sd	s2,136(sp)
    8000289c:	09313823          	sd	s3,144(sp)
    800028a0:	09413c23          	sd	s4,152(sp)
    800028a4:	0b513023          	sd	s5,160(sp)
    800028a8:	0b613423          	sd	s6,168(sp)
    800028ac:	0b713823          	sd	s7,176(sp)
    800028b0:	0b813c23          	sd	s8,184(sp)
    800028b4:	0d913023          	sd	s9,192(sp)
    800028b8:	0da13423          	sd	s10,200(sp)
    800028bc:	0db13823          	sd	s11,208(sp)
    800028c0:	0dc13c23          	sd	t3,216(sp)
    800028c4:	0fd13023          	sd	t4,224(sp)
    800028c8:	0fe13423          	sd	t5,232(sp)
    800028cc:	0ff13823          	sd	t6,240(sp)
    800028d0:	cd1ff0ef          	jal	ra,800025a0 <kerneltrap>
    800028d4:	00013083          	ld	ra,0(sp)
    800028d8:	00813103          	ld	sp,8(sp)
    800028dc:	01013183          	ld	gp,16(sp)
    800028e0:	02013283          	ld	t0,32(sp)
    800028e4:	02813303          	ld	t1,40(sp)
    800028e8:	03013383          	ld	t2,48(sp)
    800028ec:	03813403          	ld	s0,56(sp)
    800028f0:	04013483          	ld	s1,64(sp)
    800028f4:	04813503          	ld	a0,72(sp)
    800028f8:	05013583          	ld	a1,80(sp)
    800028fc:	05813603          	ld	a2,88(sp)
    80002900:	06013683          	ld	a3,96(sp)
    80002904:	06813703          	ld	a4,104(sp)
    80002908:	07013783          	ld	a5,112(sp)
    8000290c:	07813803          	ld	a6,120(sp)
    80002910:	08013883          	ld	a7,128(sp)
    80002914:	08813903          	ld	s2,136(sp)
    80002918:	09013983          	ld	s3,144(sp)
    8000291c:	09813a03          	ld	s4,152(sp)
    80002920:	0a013a83          	ld	s5,160(sp)
    80002924:	0a813b03          	ld	s6,168(sp)
    80002928:	0b013b83          	ld	s7,176(sp)
    8000292c:	0b813c03          	ld	s8,184(sp)
    80002930:	0c013c83          	ld	s9,192(sp)
    80002934:	0c813d03          	ld	s10,200(sp)
    80002938:	0d013d83          	ld	s11,208(sp)
    8000293c:	0d813e03          	ld	t3,216(sp)
    80002940:	0e013e83          	ld	t4,224(sp)
    80002944:	0e813f03          	ld	t5,232(sp)
    80002948:	0f013f83          	ld	t6,240(sp)
    8000294c:	10010113          	addi	sp,sp,256
    80002950:	10200073          	sret
    80002954:	00000013          	nop
    80002958:	00000013          	nop
    8000295c:	00000013          	nop

0000000080002960 <timervec>:
    80002960:	34051573          	csrrw	a0,mscratch,a0
    80002964:	00b53023          	sd	a1,0(a0)
    80002968:	00c53423          	sd	a2,8(a0)
    8000296c:	00d53823          	sd	a3,16(a0)
    80002970:	01853583          	ld	a1,24(a0)
    80002974:	02053603          	ld	a2,32(a0)
    80002978:	0005b683          	ld	a3,0(a1)
    8000297c:	00c686b3          	add	a3,a3,a2
    80002980:	00d5b023          	sd	a3,0(a1)
    80002984:	00200593          	li	a1,2
    80002988:	14459073          	csrw	sip,a1
    8000298c:	01053683          	ld	a3,16(a0)
    80002990:	00853603          	ld	a2,8(a0)
    80002994:	00053583          	ld	a1,0(a0)
    80002998:	34051573          	csrrw	a0,mscratch,a0
    8000299c:	30200073          	mret

00000000800029a0 <plicinit>:
    800029a0:	ff010113          	addi	sp,sp,-16
    800029a4:	00813423          	sd	s0,8(sp)
    800029a8:	01010413          	addi	s0,sp,16
    800029ac:	00813403          	ld	s0,8(sp)
    800029b0:	0c0007b7          	lui	a5,0xc000
    800029b4:	00100713          	li	a4,1
    800029b8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800029bc:	00e7a223          	sw	a4,4(a5)
    800029c0:	01010113          	addi	sp,sp,16
    800029c4:	00008067          	ret

00000000800029c8 <plicinithart>:
    800029c8:	ff010113          	addi	sp,sp,-16
    800029cc:	00813023          	sd	s0,0(sp)
    800029d0:	00113423          	sd	ra,8(sp)
    800029d4:	01010413          	addi	s0,sp,16
    800029d8:	00000097          	auipc	ra,0x0
    800029dc:	a48080e7          	jalr	-1464(ra) # 80002420 <cpuid>
    800029e0:	0085171b          	slliw	a4,a0,0x8
    800029e4:	0c0027b7          	lui	a5,0xc002
    800029e8:	00e787b3          	add	a5,a5,a4
    800029ec:	40200713          	li	a4,1026
    800029f0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800029f4:	00813083          	ld	ra,8(sp)
    800029f8:	00013403          	ld	s0,0(sp)
    800029fc:	00d5151b          	slliw	a0,a0,0xd
    80002a00:	0c2017b7          	lui	a5,0xc201
    80002a04:	00a78533          	add	a0,a5,a0
    80002a08:	00052023          	sw	zero,0(a0)
    80002a0c:	01010113          	addi	sp,sp,16
    80002a10:	00008067          	ret

0000000080002a14 <plic_claim>:
    80002a14:	ff010113          	addi	sp,sp,-16
    80002a18:	00813023          	sd	s0,0(sp)
    80002a1c:	00113423          	sd	ra,8(sp)
    80002a20:	01010413          	addi	s0,sp,16
    80002a24:	00000097          	auipc	ra,0x0
    80002a28:	9fc080e7          	jalr	-1540(ra) # 80002420 <cpuid>
    80002a2c:	00813083          	ld	ra,8(sp)
    80002a30:	00013403          	ld	s0,0(sp)
    80002a34:	00d5151b          	slliw	a0,a0,0xd
    80002a38:	0c2017b7          	lui	a5,0xc201
    80002a3c:	00a78533          	add	a0,a5,a0
    80002a40:	00452503          	lw	a0,4(a0)
    80002a44:	01010113          	addi	sp,sp,16
    80002a48:	00008067          	ret

0000000080002a4c <plic_complete>:
    80002a4c:	fe010113          	addi	sp,sp,-32
    80002a50:	00813823          	sd	s0,16(sp)
    80002a54:	00913423          	sd	s1,8(sp)
    80002a58:	00113c23          	sd	ra,24(sp)
    80002a5c:	02010413          	addi	s0,sp,32
    80002a60:	00050493          	mv	s1,a0
    80002a64:	00000097          	auipc	ra,0x0
    80002a68:	9bc080e7          	jalr	-1604(ra) # 80002420 <cpuid>
    80002a6c:	01813083          	ld	ra,24(sp)
    80002a70:	01013403          	ld	s0,16(sp)
    80002a74:	00d5179b          	slliw	a5,a0,0xd
    80002a78:	0c201737          	lui	a4,0xc201
    80002a7c:	00f707b3          	add	a5,a4,a5
    80002a80:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80002a84:	00813483          	ld	s1,8(sp)
    80002a88:	02010113          	addi	sp,sp,32
    80002a8c:	00008067          	ret

0000000080002a90 <consolewrite>:
    80002a90:	fb010113          	addi	sp,sp,-80
    80002a94:	04813023          	sd	s0,64(sp)
    80002a98:	04113423          	sd	ra,72(sp)
    80002a9c:	02913c23          	sd	s1,56(sp)
    80002aa0:	03213823          	sd	s2,48(sp)
    80002aa4:	03313423          	sd	s3,40(sp)
    80002aa8:	03413023          	sd	s4,32(sp)
    80002aac:	01513c23          	sd	s5,24(sp)
    80002ab0:	05010413          	addi	s0,sp,80
    80002ab4:	06c05c63          	blez	a2,80002b2c <consolewrite+0x9c>
    80002ab8:	00060993          	mv	s3,a2
    80002abc:	00050a13          	mv	s4,a0
    80002ac0:	00058493          	mv	s1,a1
    80002ac4:	00000913          	li	s2,0
    80002ac8:	fff00a93          	li	s5,-1
    80002acc:	01c0006f          	j	80002ae8 <consolewrite+0x58>
    80002ad0:	fbf44503          	lbu	a0,-65(s0)
    80002ad4:	0019091b          	addiw	s2,s2,1
    80002ad8:	00148493          	addi	s1,s1,1
    80002adc:	00001097          	auipc	ra,0x1
    80002ae0:	a9c080e7          	jalr	-1380(ra) # 80003578 <uartputc>
    80002ae4:	03298063          	beq	s3,s2,80002b04 <consolewrite+0x74>
    80002ae8:	00048613          	mv	a2,s1
    80002aec:	00100693          	li	a3,1
    80002af0:	000a0593          	mv	a1,s4
    80002af4:	fbf40513          	addi	a0,s0,-65
    80002af8:	00000097          	auipc	ra,0x0
    80002afc:	9e0080e7          	jalr	-1568(ra) # 800024d8 <either_copyin>
    80002b00:	fd5518e3          	bne	a0,s5,80002ad0 <consolewrite+0x40>
    80002b04:	04813083          	ld	ra,72(sp)
    80002b08:	04013403          	ld	s0,64(sp)
    80002b0c:	03813483          	ld	s1,56(sp)
    80002b10:	02813983          	ld	s3,40(sp)
    80002b14:	02013a03          	ld	s4,32(sp)
    80002b18:	01813a83          	ld	s5,24(sp)
    80002b1c:	00090513          	mv	a0,s2
    80002b20:	03013903          	ld	s2,48(sp)
    80002b24:	05010113          	addi	sp,sp,80
    80002b28:	00008067          	ret
    80002b2c:	00000913          	li	s2,0
    80002b30:	fd5ff06f          	j	80002b04 <consolewrite+0x74>

0000000080002b34 <consoleread>:
    80002b34:	f9010113          	addi	sp,sp,-112
    80002b38:	06813023          	sd	s0,96(sp)
    80002b3c:	04913c23          	sd	s1,88(sp)
    80002b40:	05213823          	sd	s2,80(sp)
    80002b44:	05313423          	sd	s3,72(sp)
    80002b48:	05413023          	sd	s4,64(sp)
    80002b4c:	03513c23          	sd	s5,56(sp)
    80002b50:	03613823          	sd	s6,48(sp)
    80002b54:	03713423          	sd	s7,40(sp)
    80002b58:	03813023          	sd	s8,32(sp)
    80002b5c:	06113423          	sd	ra,104(sp)
    80002b60:	01913c23          	sd	s9,24(sp)
    80002b64:	07010413          	addi	s0,sp,112
    80002b68:	00060b93          	mv	s7,a2
    80002b6c:	00050913          	mv	s2,a0
    80002b70:	00058c13          	mv	s8,a1
    80002b74:	00060b1b          	sext.w	s6,a2
    80002b78:	00004497          	auipc	s1,0x4
    80002b7c:	07048493          	addi	s1,s1,112 # 80006be8 <cons>
    80002b80:	00400993          	li	s3,4
    80002b84:	fff00a13          	li	s4,-1
    80002b88:	00a00a93          	li	s5,10
    80002b8c:	05705e63          	blez	s7,80002be8 <consoleread+0xb4>
    80002b90:	09c4a703          	lw	a4,156(s1)
    80002b94:	0984a783          	lw	a5,152(s1)
    80002b98:	0007071b          	sext.w	a4,a4
    80002b9c:	08e78463          	beq	a5,a4,80002c24 <consoleread+0xf0>
    80002ba0:	07f7f713          	andi	a4,a5,127
    80002ba4:	00e48733          	add	a4,s1,a4
    80002ba8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80002bac:	0017869b          	addiw	a3,a5,1
    80002bb0:	08d4ac23          	sw	a3,152(s1)
    80002bb4:	00070c9b          	sext.w	s9,a4
    80002bb8:	0b370663          	beq	a4,s3,80002c64 <consoleread+0x130>
    80002bbc:	00100693          	li	a3,1
    80002bc0:	f9f40613          	addi	a2,s0,-97
    80002bc4:	000c0593          	mv	a1,s8
    80002bc8:	00090513          	mv	a0,s2
    80002bcc:	f8e40fa3          	sb	a4,-97(s0)
    80002bd0:	00000097          	auipc	ra,0x0
    80002bd4:	8bc080e7          	jalr	-1860(ra) # 8000248c <either_copyout>
    80002bd8:	01450863          	beq	a0,s4,80002be8 <consoleread+0xb4>
    80002bdc:	001c0c13          	addi	s8,s8,1
    80002be0:	fffb8b9b          	addiw	s7,s7,-1
    80002be4:	fb5c94e3          	bne	s9,s5,80002b8c <consoleread+0x58>
    80002be8:	000b851b          	sext.w	a0,s7
    80002bec:	06813083          	ld	ra,104(sp)
    80002bf0:	06013403          	ld	s0,96(sp)
    80002bf4:	05813483          	ld	s1,88(sp)
    80002bf8:	05013903          	ld	s2,80(sp)
    80002bfc:	04813983          	ld	s3,72(sp)
    80002c00:	04013a03          	ld	s4,64(sp)
    80002c04:	03813a83          	ld	s5,56(sp)
    80002c08:	02813b83          	ld	s7,40(sp)
    80002c0c:	02013c03          	ld	s8,32(sp)
    80002c10:	01813c83          	ld	s9,24(sp)
    80002c14:	40ab053b          	subw	a0,s6,a0
    80002c18:	03013b03          	ld	s6,48(sp)
    80002c1c:	07010113          	addi	sp,sp,112
    80002c20:	00008067          	ret
    80002c24:	00001097          	auipc	ra,0x1
    80002c28:	1d8080e7          	jalr	472(ra) # 80003dfc <push_on>
    80002c2c:	0984a703          	lw	a4,152(s1)
    80002c30:	09c4a783          	lw	a5,156(s1)
    80002c34:	0007879b          	sext.w	a5,a5
    80002c38:	fef70ce3          	beq	a4,a5,80002c30 <consoleread+0xfc>
    80002c3c:	00001097          	auipc	ra,0x1
    80002c40:	234080e7          	jalr	564(ra) # 80003e70 <pop_on>
    80002c44:	0984a783          	lw	a5,152(s1)
    80002c48:	07f7f713          	andi	a4,a5,127
    80002c4c:	00e48733          	add	a4,s1,a4
    80002c50:	01874703          	lbu	a4,24(a4)
    80002c54:	0017869b          	addiw	a3,a5,1
    80002c58:	08d4ac23          	sw	a3,152(s1)
    80002c5c:	00070c9b          	sext.w	s9,a4
    80002c60:	f5371ee3          	bne	a4,s3,80002bbc <consoleread+0x88>
    80002c64:	000b851b          	sext.w	a0,s7
    80002c68:	f96bf2e3          	bgeu	s7,s6,80002bec <consoleread+0xb8>
    80002c6c:	08f4ac23          	sw	a5,152(s1)
    80002c70:	f7dff06f          	j	80002bec <consoleread+0xb8>

0000000080002c74 <consputc>:
    80002c74:	10000793          	li	a5,256
    80002c78:	00f50663          	beq	a0,a5,80002c84 <consputc+0x10>
    80002c7c:	00001317          	auipc	t1,0x1
    80002c80:	9f430067          	jr	-1548(t1) # 80003670 <uartputc_sync>
    80002c84:	ff010113          	addi	sp,sp,-16
    80002c88:	00113423          	sd	ra,8(sp)
    80002c8c:	00813023          	sd	s0,0(sp)
    80002c90:	01010413          	addi	s0,sp,16
    80002c94:	00800513          	li	a0,8
    80002c98:	00001097          	auipc	ra,0x1
    80002c9c:	9d8080e7          	jalr	-1576(ra) # 80003670 <uartputc_sync>
    80002ca0:	02000513          	li	a0,32
    80002ca4:	00001097          	auipc	ra,0x1
    80002ca8:	9cc080e7          	jalr	-1588(ra) # 80003670 <uartputc_sync>
    80002cac:	00013403          	ld	s0,0(sp)
    80002cb0:	00813083          	ld	ra,8(sp)
    80002cb4:	00800513          	li	a0,8
    80002cb8:	01010113          	addi	sp,sp,16
    80002cbc:	00001317          	auipc	t1,0x1
    80002cc0:	9b430067          	jr	-1612(t1) # 80003670 <uartputc_sync>

0000000080002cc4 <consoleintr>:
    80002cc4:	fe010113          	addi	sp,sp,-32
    80002cc8:	00813823          	sd	s0,16(sp)
    80002ccc:	00913423          	sd	s1,8(sp)
    80002cd0:	01213023          	sd	s2,0(sp)
    80002cd4:	00113c23          	sd	ra,24(sp)
    80002cd8:	02010413          	addi	s0,sp,32
    80002cdc:	00004917          	auipc	s2,0x4
    80002ce0:	f0c90913          	addi	s2,s2,-244 # 80006be8 <cons>
    80002ce4:	00050493          	mv	s1,a0
    80002ce8:	00090513          	mv	a0,s2
    80002cec:	00001097          	auipc	ra,0x1
    80002cf0:	e40080e7          	jalr	-448(ra) # 80003b2c <acquire>
    80002cf4:	02048c63          	beqz	s1,80002d2c <consoleintr+0x68>
    80002cf8:	0a092783          	lw	a5,160(s2)
    80002cfc:	09892703          	lw	a4,152(s2)
    80002d00:	07f00693          	li	a3,127
    80002d04:	40e7873b          	subw	a4,a5,a4
    80002d08:	02e6e263          	bltu	a3,a4,80002d2c <consoleintr+0x68>
    80002d0c:	00d00713          	li	a4,13
    80002d10:	04e48063          	beq	s1,a4,80002d50 <consoleintr+0x8c>
    80002d14:	07f7f713          	andi	a4,a5,127
    80002d18:	00e90733          	add	a4,s2,a4
    80002d1c:	0017879b          	addiw	a5,a5,1
    80002d20:	0af92023          	sw	a5,160(s2)
    80002d24:	00970c23          	sb	s1,24(a4)
    80002d28:	08f92e23          	sw	a5,156(s2)
    80002d2c:	01013403          	ld	s0,16(sp)
    80002d30:	01813083          	ld	ra,24(sp)
    80002d34:	00813483          	ld	s1,8(sp)
    80002d38:	00013903          	ld	s2,0(sp)
    80002d3c:	00004517          	auipc	a0,0x4
    80002d40:	eac50513          	addi	a0,a0,-340 # 80006be8 <cons>
    80002d44:	02010113          	addi	sp,sp,32
    80002d48:	00001317          	auipc	t1,0x1
    80002d4c:	eb030067          	jr	-336(t1) # 80003bf8 <release>
    80002d50:	00a00493          	li	s1,10
    80002d54:	fc1ff06f          	j	80002d14 <consoleintr+0x50>

0000000080002d58 <consoleinit>:
    80002d58:	fe010113          	addi	sp,sp,-32
    80002d5c:	00113c23          	sd	ra,24(sp)
    80002d60:	00813823          	sd	s0,16(sp)
    80002d64:	00913423          	sd	s1,8(sp)
    80002d68:	02010413          	addi	s0,sp,32
    80002d6c:	00004497          	auipc	s1,0x4
    80002d70:	e7c48493          	addi	s1,s1,-388 # 80006be8 <cons>
    80002d74:	00048513          	mv	a0,s1
    80002d78:	00002597          	auipc	a1,0x2
    80002d7c:	59858593          	addi	a1,a1,1432 # 80005310 <_ZZ12printIntegermE6digits+0x138>
    80002d80:	00001097          	auipc	ra,0x1
    80002d84:	d88080e7          	jalr	-632(ra) # 80003b08 <initlock>
    80002d88:	00000097          	auipc	ra,0x0
    80002d8c:	7ac080e7          	jalr	1964(ra) # 80003534 <uartinit>
    80002d90:	01813083          	ld	ra,24(sp)
    80002d94:	01013403          	ld	s0,16(sp)
    80002d98:	00000797          	auipc	a5,0x0
    80002d9c:	d9c78793          	addi	a5,a5,-612 # 80002b34 <consoleread>
    80002da0:	0af4bc23          	sd	a5,184(s1)
    80002da4:	00000797          	auipc	a5,0x0
    80002da8:	cec78793          	addi	a5,a5,-788 # 80002a90 <consolewrite>
    80002dac:	0cf4b023          	sd	a5,192(s1)
    80002db0:	00813483          	ld	s1,8(sp)
    80002db4:	02010113          	addi	sp,sp,32
    80002db8:	00008067          	ret

0000000080002dbc <console_read>:
    80002dbc:	ff010113          	addi	sp,sp,-16
    80002dc0:	00813423          	sd	s0,8(sp)
    80002dc4:	01010413          	addi	s0,sp,16
    80002dc8:	00813403          	ld	s0,8(sp)
    80002dcc:	00004317          	auipc	t1,0x4
    80002dd0:	ed433303          	ld	t1,-300(t1) # 80006ca0 <devsw+0x10>
    80002dd4:	01010113          	addi	sp,sp,16
    80002dd8:	00030067          	jr	t1

0000000080002ddc <console_write>:
    80002ddc:	ff010113          	addi	sp,sp,-16
    80002de0:	00813423          	sd	s0,8(sp)
    80002de4:	01010413          	addi	s0,sp,16
    80002de8:	00813403          	ld	s0,8(sp)
    80002dec:	00004317          	auipc	t1,0x4
    80002df0:	ebc33303          	ld	t1,-324(t1) # 80006ca8 <devsw+0x18>
    80002df4:	01010113          	addi	sp,sp,16
    80002df8:	00030067          	jr	t1

0000000080002dfc <panic>:
    80002dfc:	fe010113          	addi	sp,sp,-32
    80002e00:	00113c23          	sd	ra,24(sp)
    80002e04:	00813823          	sd	s0,16(sp)
    80002e08:	00913423          	sd	s1,8(sp)
    80002e0c:	02010413          	addi	s0,sp,32
    80002e10:	00050493          	mv	s1,a0
    80002e14:	00002517          	auipc	a0,0x2
    80002e18:	50450513          	addi	a0,a0,1284 # 80005318 <_ZZ12printIntegermE6digits+0x140>
    80002e1c:	00004797          	auipc	a5,0x4
    80002e20:	f207a623          	sw	zero,-212(a5) # 80006d48 <pr+0x18>
    80002e24:	00000097          	auipc	ra,0x0
    80002e28:	034080e7          	jalr	52(ra) # 80002e58 <__printf>
    80002e2c:	00048513          	mv	a0,s1
    80002e30:	00000097          	auipc	ra,0x0
    80002e34:	028080e7          	jalr	40(ra) # 80002e58 <__printf>
    80002e38:	00002517          	auipc	a0,0x2
    80002e3c:	2c850513          	addi	a0,a0,712 # 80005100 <CONSOLE_STATUS+0xf0>
    80002e40:	00000097          	auipc	ra,0x0
    80002e44:	018080e7          	jalr	24(ra) # 80002e58 <__printf>
    80002e48:	00100793          	li	a5,1
    80002e4c:	00003717          	auipc	a4,0x3
    80002e50:	c4f72e23          	sw	a5,-932(a4) # 80005aa8 <panicked>
    80002e54:	0000006f          	j	80002e54 <panic+0x58>

0000000080002e58 <__printf>:
    80002e58:	f3010113          	addi	sp,sp,-208
    80002e5c:	08813023          	sd	s0,128(sp)
    80002e60:	07313423          	sd	s3,104(sp)
    80002e64:	09010413          	addi	s0,sp,144
    80002e68:	05813023          	sd	s8,64(sp)
    80002e6c:	08113423          	sd	ra,136(sp)
    80002e70:	06913c23          	sd	s1,120(sp)
    80002e74:	07213823          	sd	s2,112(sp)
    80002e78:	07413023          	sd	s4,96(sp)
    80002e7c:	05513c23          	sd	s5,88(sp)
    80002e80:	05613823          	sd	s6,80(sp)
    80002e84:	05713423          	sd	s7,72(sp)
    80002e88:	03913c23          	sd	s9,56(sp)
    80002e8c:	03a13823          	sd	s10,48(sp)
    80002e90:	03b13423          	sd	s11,40(sp)
    80002e94:	00004317          	auipc	t1,0x4
    80002e98:	e9c30313          	addi	t1,t1,-356 # 80006d30 <pr>
    80002e9c:	01832c03          	lw	s8,24(t1)
    80002ea0:	00b43423          	sd	a1,8(s0)
    80002ea4:	00c43823          	sd	a2,16(s0)
    80002ea8:	00d43c23          	sd	a3,24(s0)
    80002eac:	02e43023          	sd	a4,32(s0)
    80002eb0:	02f43423          	sd	a5,40(s0)
    80002eb4:	03043823          	sd	a6,48(s0)
    80002eb8:	03143c23          	sd	a7,56(s0)
    80002ebc:	00050993          	mv	s3,a0
    80002ec0:	4a0c1663          	bnez	s8,8000336c <__printf+0x514>
    80002ec4:	60098c63          	beqz	s3,800034dc <__printf+0x684>
    80002ec8:	0009c503          	lbu	a0,0(s3)
    80002ecc:	00840793          	addi	a5,s0,8
    80002ed0:	f6f43c23          	sd	a5,-136(s0)
    80002ed4:	00000493          	li	s1,0
    80002ed8:	22050063          	beqz	a0,800030f8 <__printf+0x2a0>
    80002edc:	00002a37          	lui	s4,0x2
    80002ee0:	00018ab7          	lui	s5,0x18
    80002ee4:	000f4b37          	lui	s6,0xf4
    80002ee8:	00989bb7          	lui	s7,0x989
    80002eec:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002ef0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002ef4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002ef8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80002efc:	00148c9b          	addiw	s9,s1,1
    80002f00:	02500793          	li	a5,37
    80002f04:	01998933          	add	s2,s3,s9
    80002f08:	38f51263          	bne	a0,a5,8000328c <__printf+0x434>
    80002f0c:	00094783          	lbu	a5,0(s2)
    80002f10:	00078c9b          	sext.w	s9,a5
    80002f14:	1e078263          	beqz	a5,800030f8 <__printf+0x2a0>
    80002f18:	0024849b          	addiw	s1,s1,2
    80002f1c:	07000713          	li	a4,112
    80002f20:	00998933          	add	s2,s3,s1
    80002f24:	38e78a63          	beq	a5,a4,800032b8 <__printf+0x460>
    80002f28:	20f76863          	bltu	a4,a5,80003138 <__printf+0x2e0>
    80002f2c:	42a78863          	beq	a5,a0,8000335c <__printf+0x504>
    80002f30:	06400713          	li	a4,100
    80002f34:	40e79663          	bne	a5,a4,80003340 <__printf+0x4e8>
    80002f38:	f7843783          	ld	a5,-136(s0)
    80002f3c:	0007a603          	lw	a2,0(a5)
    80002f40:	00878793          	addi	a5,a5,8
    80002f44:	f6f43c23          	sd	a5,-136(s0)
    80002f48:	42064a63          	bltz	a2,8000337c <__printf+0x524>
    80002f4c:	00a00713          	li	a4,10
    80002f50:	02e677bb          	remuw	a5,a2,a4
    80002f54:	00002d97          	auipc	s11,0x2
    80002f58:	3ecd8d93          	addi	s11,s11,1004 # 80005340 <digits>
    80002f5c:	00900593          	li	a1,9
    80002f60:	0006051b          	sext.w	a0,a2
    80002f64:	00000c93          	li	s9,0
    80002f68:	02079793          	slli	a5,a5,0x20
    80002f6c:	0207d793          	srli	a5,a5,0x20
    80002f70:	00fd87b3          	add	a5,s11,a5
    80002f74:	0007c783          	lbu	a5,0(a5)
    80002f78:	02e656bb          	divuw	a3,a2,a4
    80002f7c:	f8f40023          	sb	a5,-128(s0)
    80002f80:	14c5d863          	bge	a1,a2,800030d0 <__printf+0x278>
    80002f84:	06300593          	li	a1,99
    80002f88:	00100c93          	li	s9,1
    80002f8c:	02e6f7bb          	remuw	a5,a3,a4
    80002f90:	02079793          	slli	a5,a5,0x20
    80002f94:	0207d793          	srli	a5,a5,0x20
    80002f98:	00fd87b3          	add	a5,s11,a5
    80002f9c:	0007c783          	lbu	a5,0(a5)
    80002fa0:	02e6d73b          	divuw	a4,a3,a4
    80002fa4:	f8f400a3          	sb	a5,-127(s0)
    80002fa8:	12a5f463          	bgeu	a1,a0,800030d0 <__printf+0x278>
    80002fac:	00a00693          	li	a3,10
    80002fb0:	00900593          	li	a1,9
    80002fb4:	02d777bb          	remuw	a5,a4,a3
    80002fb8:	02079793          	slli	a5,a5,0x20
    80002fbc:	0207d793          	srli	a5,a5,0x20
    80002fc0:	00fd87b3          	add	a5,s11,a5
    80002fc4:	0007c503          	lbu	a0,0(a5)
    80002fc8:	02d757bb          	divuw	a5,a4,a3
    80002fcc:	f8a40123          	sb	a0,-126(s0)
    80002fd0:	48e5f263          	bgeu	a1,a4,80003454 <__printf+0x5fc>
    80002fd4:	06300513          	li	a0,99
    80002fd8:	02d7f5bb          	remuw	a1,a5,a3
    80002fdc:	02059593          	slli	a1,a1,0x20
    80002fe0:	0205d593          	srli	a1,a1,0x20
    80002fe4:	00bd85b3          	add	a1,s11,a1
    80002fe8:	0005c583          	lbu	a1,0(a1)
    80002fec:	02d7d7bb          	divuw	a5,a5,a3
    80002ff0:	f8b401a3          	sb	a1,-125(s0)
    80002ff4:	48e57263          	bgeu	a0,a4,80003478 <__printf+0x620>
    80002ff8:	3e700513          	li	a0,999
    80002ffc:	02d7f5bb          	remuw	a1,a5,a3
    80003000:	02059593          	slli	a1,a1,0x20
    80003004:	0205d593          	srli	a1,a1,0x20
    80003008:	00bd85b3          	add	a1,s11,a1
    8000300c:	0005c583          	lbu	a1,0(a1)
    80003010:	02d7d7bb          	divuw	a5,a5,a3
    80003014:	f8b40223          	sb	a1,-124(s0)
    80003018:	46e57663          	bgeu	a0,a4,80003484 <__printf+0x62c>
    8000301c:	02d7f5bb          	remuw	a1,a5,a3
    80003020:	02059593          	slli	a1,a1,0x20
    80003024:	0205d593          	srli	a1,a1,0x20
    80003028:	00bd85b3          	add	a1,s11,a1
    8000302c:	0005c583          	lbu	a1,0(a1)
    80003030:	02d7d7bb          	divuw	a5,a5,a3
    80003034:	f8b402a3          	sb	a1,-123(s0)
    80003038:	46ea7863          	bgeu	s4,a4,800034a8 <__printf+0x650>
    8000303c:	02d7f5bb          	remuw	a1,a5,a3
    80003040:	02059593          	slli	a1,a1,0x20
    80003044:	0205d593          	srli	a1,a1,0x20
    80003048:	00bd85b3          	add	a1,s11,a1
    8000304c:	0005c583          	lbu	a1,0(a1)
    80003050:	02d7d7bb          	divuw	a5,a5,a3
    80003054:	f8b40323          	sb	a1,-122(s0)
    80003058:	3eeaf863          	bgeu	s5,a4,80003448 <__printf+0x5f0>
    8000305c:	02d7f5bb          	remuw	a1,a5,a3
    80003060:	02059593          	slli	a1,a1,0x20
    80003064:	0205d593          	srli	a1,a1,0x20
    80003068:	00bd85b3          	add	a1,s11,a1
    8000306c:	0005c583          	lbu	a1,0(a1)
    80003070:	02d7d7bb          	divuw	a5,a5,a3
    80003074:	f8b403a3          	sb	a1,-121(s0)
    80003078:	42eb7e63          	bgeu	s6,a4,800034b4 <__printf+0x65c>
    8000307c:	02d7f5bb          	remuw	a1,a5,a3
    80003080:	02059593          	slli	a1,a1,0x20
    80003084:	0205d593          	srli	a1,a1,0x20
    80003088:	00bd85b3          	add	a1,s11,a1
    8000308c:	0005c583          	lbu	a1,0(a1)
    80003090:	02d7d7bb          	divuw	a5,a5,a3
    80003094:	f8b40423          	sb	a1,-120(s0)
    80003098:	42ebfc63          	bgeu	s7,a4,800034d0 <__printf+0x678>
    8000309c:	02079793          	slli	a5,a5,0x20
    800030a0:	0207d793          	srli	a5,a5,0x20
    800030a4:	00fd8db3          	add	s11,s11,a5
    800030a8:	000dc703          	lbu	a4,0(s11)
    800030ac:	00a00793          	li	a5,10
    800030b0:	00900c93          	li	s9,9
    800030b4:	f8e404a3          	sb	a4,-119(s0)
    800030b8:	00065c63          	bgez	a2,800030d0 <__printf+0x278>
    800030bc:	f9040713          	addi	a4,s0,-112
    800030c0:	00f70733          	add	a4,a4,a5
    800030c4:	02d00693          	li	a3,45
    800030c8:	fed70823          	sb	a3,-16(a4)
    800030cc:	00078c93          	mv	s9,a5
    800030d0:	f8040793          	addi	a5,s0,-128
    800030d4:	01978cb3          	add	s9,a5,s9
    800030d8:	f7f40d13          	addi	s10,s0,-129
    800030dc:	000cc503          	lbu	a0,0(s9)
    800030e0:	fffc8c93          	addi	s9,s9,-1
    800030e4:	00000097          	auipc	ra,0x0
    800030e8:	b90080e7          	jalr	-1136(ra) # 80002c74 <consputc>
    800030ec:	ffac98e3          	bne	s9,s10,800030dc <__printf+0x284>
    800030f0:	00094503          	lbu	a0,0(s2)
    800030f4:	e00514e3          	bnez	a0,80002efc <__printf+0xa4>
    800030f8:	1a0c1663          	bnez	s8,800032a4 <__printf+0x44c>
    800030fc:	08813083          	ld	ra,136(sp)
    80003100:	08013403          	ld	s0,128(sp)
    80003104:	07813483          	ld	s1,120(sp)
    80003108:	07013903          	ld	s2,112(sp)
    8000310c:	06813983          	ld	s3,104(sp)
    80003110:	06013a03          	ld	s4,96(sp)
    80003114:	05813a83          	ld	s5,88(sp)
    80003118:	05013b03          	ld	s6,80(sp)
    8000311c:	04813b83          	ld	s7,72(sp)
    80003120:	04013c03          	ld	s8,64(sp)
    80003124:	03813c83          	ld	s9,56(sp)
    80003128:	03013d03          	ld	s10,48(sp)
    8000312c:	02813d83          	ld	s11,40(sp)
    80003130:	0d010113          	addi	sp,sp,208
    80003134:	00008067          	ret
    80003138:	07300713          	li	a4,115
    8000313c:	1ce78a63          	beq	a5,a4,80003310 <__printf+0x4b8>
    80003140:	07800713          	li	a4,120
    80003144:	1ee79e63          	bne	a5,a4,80003340 <__printf+0x4e8>
    80003148:	f7843783          	ld	a5,-136(s0)
    8000314c:	0007a703          	lw	a4,0(a5)
    80003150:	00878793          	addi	a5,a5,8
    80003154:	f6f43c23          	sd	a5,-136(s0)
    80003158:	28074263          	bltz	a4,800033dc <__printf+0x584>
    8000315c:	00002d97          	auipc	s11,0x2
    80003160:	1e4d8d93          	addi	s11,s11,484 # 80005340 <digits>
    80003164:	00f77793          	andi	a5,a4,15
    80003168:	00fd87b3          	add	a5,s11,a5
    8000316c:	0007c683          	lbu	a3,0(a5)
    80003170:	00f00613          	li	a2,15
    80003174:	0007079b          	sext.w	a5,a4
    80003178:	f8d40023          	sb	a3,-128(s0)
    8000317c:	0047559b          	srliw	a1,a4,0x4
    80003180:	0047569b          	srliw	a3,a4,0x4
    80003184:	00000c93          	li	s9,0
    80003188:	0ee65063          	bge	a2,a4,80003268 <__printf+0x410>
    8000318c:	00f6f693          	andi	a3,a3,15
    80003190:	00dd86b3          	add	a3,s11,a3
    80003194:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80003198:	0087d79b          	srliw	a5,a5,0x8
    8000319c:	00100c93          	li	s9,1
    800031a0:	f8d400a3          	sb	a3,-127(s0)
    800031a4:	0cb67263          	bgeu	a2,a1,80003268 <__printf+0x410>
    800031a8:	00f7f693          	andi	a3,a5,15
    800031ac:	00dd86b3          	add	a3,s11,a3
    800031b0:	0006c583          	lbu	a1,0(a3)
    800031b4:	00f00613          	li	a2,15
    800031b8:	0047d69b          	srliw	a3,a5,0x4
    800031bc:	f8b40123          	sb	a1,-126(s0)
    800031c0:	0047d593          	srli	a1,a5,0x4
    800031c4:	28f67e63          	bgeu	a2,a5,80003460 <__printf+0x608>
    800031c8:	00f6f693          	andi	a3,a3,15
    800031cc:	00dd86b3          	add	a3,s11,a3
    800031d0:	0006c503          	lbu	a0,0(a3)
    800031d4:	0087d813          	srli	a6,a5,0x8
    800031d8:	0087d69b          	srliw	a3,a5,0x8
    800031dc:	f8a401a3          	sb	a0,-125(s0)
    800031e0:	28b67663          	bgeu	a2,a1,8000346c <__printf+0x614>
    800031e4:	00f6f693          	andi	a3,a3,15
    800031e8:	00dd86b3          	add	a3,s11,a3
    800031ec:	0006c583          	lbu	a1,0(a3)
    800031f0:	00c7d513          	srli	a0,a5,0xc
    800031f4:	00c7d69b          	srliw	a3,a5,0xc
    800031f8:	f8b40223          	sb	a1,-124(s0)
    800031fc:	29067a63          	bgeu	a2,a6,80003490 <__printf+0x638>
    80003200:	00f6f693          	andi	a3,a3,15
    80003204:	00dd86b3          	add	a3,s11,a3
    80003208:	0006c583          	lbu	a1,0(a3)
    8000320c:	0107d813          	srli	a6,a5,0x10
    80003210:	0107d69b          	srliw	a3,a5,0x10
    80003214:	f8b402a3          	sb	a1,-123(s0)
    80003218:	28a67263          	bgeu	a2,a0,8000349c <__printf+0x644>
    8000321c:	00f6f693          	andi	a3,a3,15
    80003220:	00dd86b3          	add	a3,s11,a3
    80003224:	0006c683          	lbu	a3,0(a3)
    80003228:	0147d79b          	srliw	a5,a5,0x14
    8000322c:	f8d40323          	sb	a3,-122(s0)
    80003230:	21067663          	bgeu	a2,a6,8000343c <__printf+0x5e4>
    80003234:	02079793          	slli	a5,a5,0x20
    80003238:	0207d793          	srli	a5,a5,0x20
    8000323c:	00fd8db3          	add	s11,s11,a5
    80003240:	000dc683          	lbu	a3,0(s11)
    80003244:	00800793          	li	a5,8
    80003248:	00700c93          	li	s9,7
    8000324c:	f8d403a3          	sb	a3,-121(s0)
    80003250:	00075c63          	bgez	a4,80003268 <__printf+0x410>
    80003254:	f9040713          	addi	a4,s0,-112
    80003258:	00f70733          	add	a4,a4,a5
    8000325c:	02d00693          	li	a3,45
    80003260:	fed70823          	sb	a3,-16(a4)
    80003264:	00078c93          	mv	s9,a5
    80003268:	f8040793          	addi	a5,s0,-128
    8000326c:	01978cb3          	add	s9,a5,s9
    80003270:	f7f40d13          	addi	s10,s0,-129
    80003274:	000cc503          	lbu	a0,0(s9)
    80003278:	fffc8c93          	addi	s9,s9,-1
    8000327c:	00000097          	auipc	ra,0x0
    80003280:	9f8080e7          	jalr	-1544(ra) # 80002c74 <consputc>
    80003284:	ff9d18e3          	bne	s10,s9,80003274 <__printf+0x41c>
    80003288:	0100006f          	j	80003298 <__printf+0x440>
    8000328c:	00000097          	auipc	ra,0x0
    80003290:	9e8080e7          	jalr	-1560(ra) # 80002c74 <consputc>
    80003294:	000c8493          	mv	s1,s9
    80003298:	00094503          	lbu	a0,0(s2)
    8000329c:	c60510e3          	bnez	a0,80002efc <__printf+0xa4>
    800032a0:	e40c0ee3          	beqz	s8,800030fc <__printf+0x2a4>
    800032a4:	00004517          	auipc	a0,0x4
    800032a8:	a8c50513          	addi	a0,a0,-1396 # 80006d30 <pr>
    800032ac:	00001097          	auipc	ra,0x1
    800032b0:	94c080e7          	jalr	-1716(ra) # 80003bf8 <release>
    800032b4:	e49ff06f          	j	800030fc <__printf+0x2a4>
    800032b8:	f7843783          	ld	a5,-136(s0)
    800032bc:	03000513          	li	a0,48
    800032c0:	01000d13          	li	s10,16
    800032c4:	00878713          	addi	a4,a5,8
    800032c8:	0007bc83          	ld	s9,0(a5)
    800032cc:	f6e43c23          	sd	a4,-136(s0)
    800032d0:	00000097          	auipc	ra,0x0
    800032d4:	9a4080e7          	jalr	-1628(ra) # 80002c74 <consputc>
    800032d8:	07800513          	li	a0,120
    800032dc:	00000097          	auipc	ra,0x0
    800032e0:	998080e7          	jalr	-1640(ra) # 80002c74 <consputc>
    800032e4:	00002d97          	auipc	s11,0x2
    800032e8:	05cd8d93          	addi	s11,s11,92 # 80005340 <digits>
    800032ec:	03ccd793          	srli	a5,s9,0x3c
    800032f0:	00fd87b3          	add	a5,s11,a5
    800032f4:	0007c503          	lbu	a0,0(a5)
    800032f8:	fffd0d1b          	addiw	s10,s10,-1
    800032fc:	004c9c93          	slli	s9,s9,0x4
    80003300:	00000097          	auipc	ra,0x0
    80003304:	974080e7          	jalr	-1676(ra) # 80002c74 <consputc>
    80003308:	fe0d12e3          	bnez	s10,800032ec <__printf+0x494>
    8000330c:	f8dff06f          	j	80003298 <__printf+0x440>
    80003310:	f7843783          	ld	a5,-136(s0)
    80003314:	0007bc83          	ld	s9,0(a5)
    80003318:	00878793          	addi	a5,a5,8
    8000331c:	f6f43c23          	sd	a5,-136(s0)
    80003320:	000c9a63          	bnez	s9,80003334 <__printf+0x4dc>
    80003324:	1080006f          	j	8000342c <__printf+0x5d4>
    80003328:	001c8c93          	addi	s9,s9,1
    8000332c:	00000097          	auipc	ra,0x0
    80003330:	948080e7          	jalr	-1720(ra) # 80002c74 <consputc>
    80003334:	000cc503          	lbu	a0,0(s9)
    80003338:	fe0518e3          	bnez	a0,80003328 <__printf+0x4d0>
    8000333c:	f5dff06f          	j	80003298 <__printf+0x440>
    80003340:	02500513          	li	a0,37
    80003344:	00000097          	auipc	ra,0x0
    80003348:	930080e7          	jalr	-1744(ra) # 80002c74 <consputc>
    8000334c:	000c8513          	mv	a0,s9
    80003350:	00000097          	auipc	ra,0x0
    80003354:	924080e7          	jalr	-1756(ra) # 80002c74 <consputc>
    80003358:	f41ff06f          	j	80003298 <__printf+0x440>
    8000335c:	02500513          	li	a0,37
    80003360:	00000097          	auipc	ra,0x0
    80003364:	914080e7          	jalr	-1772(ra) # 80002c74 <consputc>
    80003368:	f31ff06f          	j	80003298 <__printf+0x440>
    8000336c:	00030513          	mv	a0,t1
    80003370:	00000097          	auipc	ra,0x0
    80003374:	7bc080e7          	jalr	1980(ra) # 80003b2c <acquire>
    80003378:	b4dff06f          	j	80002ec4 <__printf+0x6c>
    8000337c:	40c0053b          	negw	a0,a2
    80003380:	00a00713          	li	a4,10
    80003384:	02e576bb          	remuw	a3,a0,a4
    80003388:	00002d97          	auipc	s11,0x2
    8000338c:	fb8d8d93          	addi	s11,s11,-72 # 80005340 <digits>
    80003390:	ff700593          	li	a1,-9
    80003394:	02069693          	slli	a3,a3,0x20
    80003398:	0206d693          	srli	a3,a3,0x20
    8000339c:	00dd86b3          	add	a3,s11,a3
    800033a0:	0006c683          	lbu	a3,0(a3)
    800033a4:	02e557bb          	divuw	a5,a0,a4
    800033a8:	f8d40023          	sb	a3,-128(s0)
    800033ac:	10b65e63          	bge	a2,a1,800034c8 <__printf+0x670>
    800033b0:	06300593          	li	a1,99
    800033b4:	02e7f6bb          	remuw	a3,a5,a4
    800033b8:	02069693          	slli	a3,a3,0x20
    800033bc:	0206d693          	srli	a3,a3,0x20
    800033c0:	00dd86b3          	add	a3,s11,a3
    800033c4:	0006c683          	lbu	a3,0(a3)
    800033c8:	02e7d73b          	divuw	a4,a5,a4
    800033cc:	00200793          	li	a5,2
    800033d0:	f8d400a3          	sb	a3,-127(s0)
    800033d4:	bca5ece3          	bltu	a1,a0,80002fac <__printf+0x154>
    800033d8:	ce5ff06f          	j	800030bc <__printf+0x264>
    800033dc:	40e007bb          	negw	a5,a4
    800033e0:	00002d97          	auipc	s11,0x2
    800033e4:	f60d8d93          	addi	s11,s11,-160 # 80005340 <digits>
    800033e8:	00f7f693          	andi	a3,a5,15
    800033ec:	00dd86b3          	add	a3,s11,a3
    800033f0:	0006c583          	lbu	a1,0(a3)
    800033f4:	ff100613          	li	a2,-15
    800033f8:	0047d69b          	srliw	a3,a5,0x4
    800033fc:	f8b40023          	sb	a1,-128(s0)
    80003400:	0047d59b          	srliw	a1,a5,0x4
    80003404:	0ac75e63          	bge	a4,a2,800034c0 <__printf+0x668>
    80003408:	00f6f693          	andi	a3,a3,15
    8000340c:	00dd86b3          	add	a3,s11,a3
    80003410:	0006c603          	lbu	a2,0(a3)
    80003414:	00f00693          	li	a3,15
    80003418:	0087d79b          	srliw	a5,a5,0x8
    8000341c:	f8c400a3          	sb	a2,-127(s0)
    80003420:	d8b6e4e3          	bltu	a3,a1,800031a8 <__printf+0x350>
    80003424:	00200793          	li	a5,2
    80003428:	e2dff06f          	j	80003254 <__printf+0x3fc>
    8000342c:	00002c97          	auipc	s9,0x2
    80003430:	ef4c8c93          	addi	s9,s9,-268 # 80005320 <_ZZ12printIntegermE6digits+0x148>
    80003434:	02800513          	li	a0,40
    80003438:	ef1ff06f          	j	80003328 <__printf+0x4d0>
    8000343c:	00700793          	li	a5,7
    80003440:	00600c93          	li	s9,6
    80003444:	e0dff06f          	j	80003250 <__printf+0x3f8>
    80003448:	00700793          	li	a5,7
    8000344c:	00600c93          	li	s9,6
    80003450:	c69ff06f          	j	800030b8 <__printf+0x260>
    80003454:	00300793          	li	a5,3
    80003458:	00200c93          	li	s9,2
    8000345c:	c5dff06f          	j	800030b8 <__printf+0x260>
    80003460:	00300793          	li	a5,3
    80003464:	00200c93          	li	s9,2
    80003468:	de9ff06f          	j	80003250 <__printf+0x3f8>
    8000346c:	00400793          	li	a5,4
    80003470:	00300c93          	li	s9,3
    80003474:	dddff06f          	j	80003250 <__printf+0x3f8>
    80003478:	00400793          	li	a5,4
    8000347c:	00300c93          	li	s9,3
    80003480:	c39ff06f          	j	800030b8 <__printf+0x260>
    80003484:	00500793          	li	a5,5
    80003488:	00400c93          	li	s9,4
    8000348c:	c2dff06f          	j	800030b8 <__printf+0x260>
    80003490:	00500793          	li	a5,5
    80003494:	00400c93          	li	s9,4
    80003498:	db9ff06f          	j	80003250 <__printf+0x3f8>
    8000349c:	00600793          	li	a5,6
    800034a0:	00500c93          	li	s9,5
    800034a4:	dadff06f          	j	80003250 <__printf+0x3f8>
    800034a8:	00600793          	li	a5,6
    800034ac:	00500c93          	li	s9,5
    800034b0:	c09ff06f          	j	800030b8 <__printf+0x260>
    800034b4:	00800793          	li	a5,8
    800034b8:	00700c93          	li	s9,7
    800034bc:	bfdff06f          	j	800030b8 <__printf+0x260>
    800034c0:	00100793          	li	a5,1
    800034c4:	d91ff06f          	j	80003254 <__printf+0x3fc>
    800034c8:	00100793          	li	a5,1
    800034cc:	bf1ff06f          	j	800030bc <__printf+0x264>
    800034d0:	00900793          	li	a5,9
    800034d4:	00800c93          	li	s9,8
    800034d8:	be1ff06f          	j	800030b8 <__printf+0x260>
    800034dc:	00002517          	auipc	a0,0x2
    800034e0:	e4c50513          	addi	a0,a0,-436 # 80005328 <_ZZ12printIntegermE6digits+0x150>
    800034e4:	00000097          	auipc	ra,0x0
    800034e8:	918080e7          	jalr	-1768(ra) # 80002dfc <panic>

00000000800034ec <printfinit>:
    800034ec:	fe010113          	addi	sp,sp,-32
    800034f0:	00813823          	sd	s0,16(sp)
    800034f4:	00913423          	sd	s1,8(sp)
    800034f8:	00113c23          	sd	ra,24(sp)
    800034fc:	02010413          	addi	s0,sp,32
    80003500:	00004497          	auipc	s1,0x4
    80003504:	83048493          	addi	s1,s1,-2000 # 80006d30 <pr>
    80003508:	00048513          	mv	a0,s1
    8000350c:	00002597          	auipc	a1,0x2
    80003510:	e2c58593          	addi	a1,a1,-468 # 80005338 <_ZZ12printIntegermE6digits+0x160>
    80003514:	00000097          	auipc	ra,0x0
    80003518:	5f4080e7          	jalr	1524(ra) # 80003b08 <initlock>
    8000351c:	01813083          	ld	ra,24(sp)
    80003520:	01013403          	ld	s0,16(sp)
    80003524:	0004ac23          	sw	zero,24(s1)
    80003528:	00813483          	ld	s1,8(sp)
    8000352c:	02010113          	addi	sp,sp,32
    80003530:	00008067          	ret

0000000080003534 <uartinit>:
    80003534:	ff010113          	addi	sp,sp,-16
    80003538:	00813423          	sd	s0,8(sp)
    8000353c:	01010413          	addi	s0,sp,16
    80003540:	100007b7          	lui	a5,0x10000
    80003544:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80003548:	f8000713          	li	a4,-128
    8000354c:	00e781a3          	sb	a4,3(a5)
    80003550:	00300713          	li	a4,3
    80003554:	00e78023          	sb	a4,0(a5)
    80003558:	000780a3          	sb	zero,1(a5)
    8000355c:	00e781a3          	sb	a4,3(a5)
    80003560:	00700693          	li	a3,7
    80003564:	00d78123          	sb	a3,2(a5)
    80003568:	00e780a3          	sb	a4,1(a5)
    8000356c:	00813403          	ld	s0,8(sp)
    80003570:	01010113          	addi	sp,sp,16
    80003574:	00008067          	ret

0000000080003578 <uartputc>:
    80003578:	00002797          	auipc	a5,0x2
    8000357c:	5307a783          	lw	a5,1328(a5) # 80005aa8 <panicked>
    80003580:	00078463          	beqz	a5,80003588 <uartputc+0x10>
    80003584:	0000006f          	j	80003584 <uartputc+0xc>
    80003588:	fd010113          	addi	sp,sp,-48
    8000358c:	02813023          	sd	s0,32(sp)
    80003590:	00913c23          	sd	s1,24(sp)
    80003594:	01213823          	sd	s2,16(sp)
    80003598:	01313423          	sd	s3,8(sp)
    8000359c:	02113423          	sd	ra,40(sp)
    800035a0:	03010413          	addi	s0,sp,48
    800035a4:	00002917          	auipc	s2,0x2
    800035a8:	50c90913          	addi	s2,s2,1292 # 80005ab0 <uart_tx_r>
    800035ac:	00093783          	ld	a5,0(s2)
    800035b0:	00002497          	auipc	s1,0x2
    800035b4:	50848493          	addi	s1,s1,1288 # 80005ab8 <uart_tx_w>
    800035b8:	0004b703          	ld	a4,0(s1)
    800035bc:	02078693          	addi	a3,a5,32
    800035c0:	00050993          	mv	s3,a0
    800035c4:	02e69c63          	bne	a3,a4,800035fc <uartputc+0x84>
    800035c8:	00001097          	auipc	ra,0x1
    800035cc:	834080e7          	jalr	-1996(ra) # 80003dfc <push_on>
    800035d0:	00093783          	ld	a5,0(s2)
    800035d4:	0004b703          	ld	a4,0(s1)
    800035d8:	02078793          	addi	a5,a5,32
    800035dc:	00e79463          	bne	a5,a4,800035e4 <uartputc+0x6c>
    800035e0:	0000006f          	j	800035e0 <uartputc+0x68>
    800035e4:	00001097          	auipc	ra,0x1
    800035e8:	88c080e7          	jalr	-1908(ra) # 80003e70 <pop_on>
    800035ec:	00093783          	ld	a5,0(s2)
    800035f0:	0004b703          	ld	a4,0(s1)
    800035f4:	02078693          	addi	a3,a5,32
    800035f8:	fce688e3          	beq	a3,a4,800035c8 <uartputc+0x50>
    800035fc:	01f77693          	andi	a3,a4,31
    80003600:	00003597          	auipc	a1,0x3
    80003604:	75058593          	addi	a1,a1,1872 # 80006d50 <uart_tx_buf>
    80003608:	00d586b3          	add	a3,a1,a3
    8000360c:	00170713          	addi	a4,a4,1
    80003610:	01368023          	sb	s3,0(a3)
    80003614:	00e4b023          	sd	a4,0(s1)
    80003618:	10000637          	lui	a2,0x10000
    8000361c:	02f71063          	bne	a4,a5,8000363c <uartputc+0xc4>
    80003620:	0340006f          	j	80003654 <uartputc+0xdc>
    80003624:	00074703          	lbu	a4,0(a4)
    80003628:	00f93023          	sd	a5,0(s2)
    8000362c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003630:	00093783          	ld	a5,0(s2)
    80003634:	0004b703          	ld	a4,0(s1)
    80003638:	00f70e63          	beq	a4,a5,80003654 <uartputc+0xdc>
    8000363c:	00564683          	lbu	a3,5(a2)
    80003640:	01f7f713          	andi	a4,a5,31
    80003644:	00e58733          	add	a4,a1,a4
    80003648:	0206f693          	andi	a3,a3,32
    8000364c:	00178793          	addi	a5,a5,1
    80003650:	fc069ae3          	bnez	a3,80003624 <uartputc+0xac>
    80003654:	02813083          	ld	ra,40(sp)
    80003658:	02013403          	ld	s0,32(sp)
    8000365c:	01813483          	ld	s1,24(sp)
    80003660:	01013903          	ld	s2,16(sp)
    80003664:	00813983          	ld	s3,8(sp)
    80003668:	03010113          	addi	sp,sp,48
    8000366c:	00008067          	ret

0000000080003670 <uartputc_sync>:
    80003670:	ff010113          	addi	sp,sp,-16
    80003674:	00813423          	sd	s0,8(sp)
    80003678:	01010413          	addi	s0,sp,16
    8000367c:	00002717          	auipc	a4,0x2
    80003680:	42c72703          	lw	a4,1068(a4) # 80005aa8 <panicked>
    80003684:	02071663          	bnez	a4,800036b0 <uartputc_sync+0x40>
    80003688:	00050793          	mv	a5,a0
    8000368c:	100006b7          	lui	a3,0x10000
    80003690:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80003694:	02077713          	andi	a4,a4,32
    80003698:	fe070ce3          	beqz	a4,80003690 <uartputc_sync+0x20>
    8000369c:	0ff7f793          	andi	a5,a5,255
    800036a0:	00f68023          	sb	a5,0(a3)
    800036a4:	00813403          	ld	s0,8(sp)
    800036a8:	01010113          	addi	sp,sp,16
    800036ac:	00008067          	ret
    800036b0:	0000006f          	j	800036b0 <uartputc_sync+0x40>

00000000800036b4 <uartstart>:
    800036b4:	ff010113          	addi	sp,sp,-16
    800036b8:	00813423          	sd	s0,8(sp)
    800036bc:	01010413          	addi	s0,sp,16
    800036c0:	00002617          	auipc	a2,0x2
    800036c4:	3f060613          	addi	a2,a2,1008 # 80005ab0 <uart_tx_r>
    800036c8:	00002517          	auipc	a0,0x2
    800036cc:	3f050513          	addi	a0,a0,1008 # 80005ab8 <uart_tx_w>
    800036d0:	00063783          	ld	a5,0(a2)
    800036d4:	00053703          	ld	a4,0(a0)
    800036d8:	04f70263          	beq	a4,a5,8000371c <uartstart+0x68>
    800036dc:	100005b7          	lui	a1,0x10000
    800036e0:	00003817          	auipc	a6,0x3
    800036e4:	67080813          	addi	a6,a6,1648 # 80006d50 <uart_tx_buf>
    800036e8:	01c0006f          	j	80003704 <uartstart+0x50>
    800036ec:	0006c703          	lbu	a4,0(a3)
    800036f0:	00f63023          	sd	a5,0(a2)
    800036f4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800036f8:	00063783          	ld	a5,0(a2)
    800036fc:	00053703          	ld	a4,0(a0)
    80003700:	00f70e63          	beq	a4,a5,8000371c <uartstart+0x68>
    80003704:	01f7f713          	andi	a4,a5,31
    80003708:	00e806b3          	add	a3,a6,a4
    8000370c:	0055c703          	lbu	a4,5(a1)
    80003710:	00178793          	addi	a5,a5,1
    80003714:	02077713          	andi	a4,a4,32
    80003718:	fc071ae3          	bnez	a4,800036ec <uartstart+0x38>
    8000371c:	00813403          	ld	s0,8(sp)
    80003720:	01010113          	addi	sp,sp,16
    80003724:	00008067          	ret

0000000080003728 <uartgetc>:
    80003728:	ff010113          	addi	sp,sp,-16
    8000372c:	00813423          	sd	s0,8(sp)
    80003730:	01010413          	addi	s0,sp,16
    80003734:	10000737          	lui	a4,0x10000
    80003738:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000373c:	0017f793          	andi	a5,a5,1
    80003740:	00078c63          	beqz	a5,80003758 <uartgetc+0x30>
    80003744:	00074503          	lbu	a0,0(a4)
    80003748:	0ff57513          	andi	a0,a0,255
    8000374c:	00813403          	ld	s0,8(sp)
    80003750:	01010113          	addi	sp,sp,16
    80003754:	00008067          	ret
    80003758:	fff00513          	li	a0,-1
    8000375c:	ff1ff06f          	j	8000374c <uartgetc+0x24>

0000000080003760 <uartintr>:
    80003760:	100007b7          	lui	a5,0x10000
    80003764:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80003768:	0017f793          	andi	a5,a5,1
    8000376c:	0a078463          	beqz	a5,80003814 <uartintr+0xb4>
    80003770:	fe010113          	addi	sp,sp,-32
    80003774:	00813823          	sd	s0,16(sp)
    80003778:	00913423          	sd	s1,8(sp)
    8000377c:	00113c23          	sd	ra,24(sp)
    80003780:	02010413          	addi	s0,sp,32
    80003784:	100004b7          	lui	s1,0x10000
    80003788:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000378c:	0ff57513          	andi	a0,a0,255
    80003790:	fffff097          	auipc	ra,0xfffff
    80003794:	534080e7          	jalr	1332(ra) # 80002cc4 <consoleintr>
    80003798:	0054c783          	lbu	a5,5(s1)
    8000379c:	0017f793          	andi	a5,a5,1
    800037a0:	fe0794e3          	bnez	a5,80003788 <uartintr+0x28>
    800037a4:	00002617          	auipc	a2,0x2
    800037a8:	30c60613          	addi	a2,a2,780 # 80005ab0 <uart_tx_r>
    800037ac:	00002517          	auipc	a0,0x2
    800037b0:	30c50513          	addi	a0,a0,780 # 80005ab8 <uart_tx_w>
    800037b4:	00063783          	ld	a5,0(a2)
    800037b8:	00053703          	ld	a4,0(a0)
    800037bc:	04f70263          	beq	a4,a5,80003800 <uartintr+0xa0>
    800037c0:	100005b7          	lui	a1,0x10000
    800037c4:	00003817          	auipc	a6,0x3
    800037c8:	58c80813          	addi	a6,a6,1420 # 80006d50 <uart_tx_buf>
    800037cc:	01c0006f          	j	800037e8 <uartintr+0x88>
    800037d0:	0006c703          	lbu	a4,0(a3)
    800037d4:	00f63023          	sd	a5,0(a2)
    800037d8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800037dc:	00063783          	ld	a5,0(a2)
    800037e0:	00053703          	ld	a4,0(a0)
    800037e4:	00f70e63          	beq	a4,a5,80003800 <uartintr+0xa0>
    800037e8:	01f7f713          	andi	a4,a5,31
    800037ec:	00e806b3          	add	a3,a6,a4
    800037f0:	0055c703          	lbu	a4,5(a1)
    800037f4:	00178793          	addi	a5,a5,1
    800037f8:	02077713          	andi	a4,a4,32
    800037fc:	fc071ae3          	bnez	a4,800037d0 <uartintr+0x70>
    80003800:	01813083          	ld	ra,24(sp)
    80003804:	01013403          	ld	s0,16(sp)
    80003808:	00813483          	ld	s1,8(sp)
    8000380c:	02010113          	addi	sp,sp,32
    80003810:	00008067          	ret
    80003814:	00002617          	auipc	a2,0x2
    80003818:	29c60613          	addi	a2,a2,668 # 80005ab0 <uart_tx_r>
    8000381c:	00002517          	auipc	a0,0x2
    80003820:	29c50513          	addi	a0,a0,668 # 80005ab8 <uart_tx_w>
    80003824:	00063783          	ld	a5,0(a2)
    80003828:	00053703          	ld	a4,0(a0)
    8000382c:	04f70263          	beq	a4,a5,80003870 <uartintr+0x110>
    80003830:	100005b7          	lui	a1,0x10000
    80003834:	00003817          	auipc	a6,0x3
    80003838:	51c80813          	addi	a6,a6,1308 # 80006d50 <uart_tx_buf>
    8000383c:	01c0006f          	j	80003858 <uartintr+0xf8>
    80003840:	0006c703          	lbu	a4,0(a3)
    80003844:	00f63023          	sd	a5,0(a2)
    80003848:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000384c:	00063783          	ld	a5,0(a2)
    80003850:	00053703          	ld	a4,0(a0)
    80003854:	02f70063          	beq	a4,a5,80003874 <uartintr+0x114>
    80003858:	01f7f713          	andi	a4,a5,31
    8000385c:	00e806b3          	add	a3,a6,a4
    80003860:	0055c703          	lbu	a4,5(a1)
    80003864:	00178793          	addi	a5,a5,1
    80003868:	02077713          	andi	a4,a4,32
    8000386c:	fc071ae3          	bnez	a4,80003840 <uartintr+0xe0>
    80003870:	00008067          	ret
    80003874:	00008067          	ret

0000000080003878 <kinit>:
    80003878:	fc010113          	addi	sp,sp,-64
    8000387c:	02913423          	sd	s1,40(sp)
    80003880:	fffff7b7          	lui	a5,0xfffff
    80003884:	00004497          	auipc	s1,0x4
    80003888:	4eb48493          	addi	s1,s1,1259 # 80007d6f <end+0xfff>
    8000388c:	02813823          	sd	s0,48(sp)
    80003890:	01313c23          	sd	s3,24(sp)
    80003894:	00f4f4b3          	and	s1,s1,a5
    80003898:	02113c23          	sd	ra,56(sp)
    8000389c:	03213023          	sd	s2,32(sp)
    800038a0:	01413823          	sd	s4,16(sp)
    800038a4:	01513423          	sd	s5,8(sp)
    800038a8:	04010413          	addi	s0,sp,64
    800038ac:	000017b7          	lui	a5,0x1
    800038b0:	01100993          	li	s3,17
    800038b4:	00f487b3          	add	a5,s1,a5
    800038b8:	01b99993          	slli	s3,s3,0x1b
    800038bc:	06f9e063          	bltu	s3,a5,8000391c <kinit+0xa4>
    800038c0:	00003a97          	auipc	s5,0x3
    800038c4:	4b0a8a93          	addi	s5,s5,1200 # 80006d70 <end>
    800038c8:	0754ec63          	bltu	s1,s5,80003940 <kinit+0xc8>
    800038cc:	0734fa63          	bgeu	s1,s3,80003940 <kinit+0xc8>
    800038d0:	00088a37          	lui	s4,0x88
    800038d4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800038d8:	00002917          	auipc	s2,0x2
    800038dc:	1e890913          	addi	s2,s2,488 # 80005ac0 <kmem>
    800038e0:	00ca1a13          	slli	s4,s4,0xc
    800038e4:	0140006f          	j	800038f8 <kinit+0x80>
    800038e8:	000017b7          	lui	a5,0x1
    800038ec:	00f484b3          	add	s1,s1,a5
    800038f0:	0554e863          	bltu	s1,s5,80003940 <kinit+0xc8>
    800038f4:	0534f663          	bgeu	s1,s3,80003940 <kinit+0xc8>
    800038f8:	00001637          	lui	a2,0x1
    800038fc:	00100593          	li	a1,1
    80003900:	00048513          	mv	a0,s1
    80003904:	00000097          	auipc	ra,0x0
    80003908:	5e4080e7          	jalr	1508(ra) # 80003ee8 <__memset>
    8000390c:	00093783          	ld	a5,0(s2)
    80003910:	00f4b023          	sd	a5,0(s1)
    80003914:	00993023          	sd	s1,0(s2)
    80003918:	fd4498e3          	bne	s1,s4,800038e8 <kinit+0x70>
    8000391c:	03813083          	ld	ra,56(sp)
    80003920:	03013403          	ld	s0,48(sp)
    80003924:	02813483          	ld	s1,40(sp)
    80003928:	02013903          	ld	s2,32(sp)
    8000392c:	01813983          	ld	s3,24(sp)
    80003930:	01013a03          	ld	s4,16(sp)
    80003934:	00813a83          	ld	s5,8(sp)
    80003938:	04010113          	addi	sp,sp,64
    8000393c:	00008067          	ret
    80003940:	00002517          	auipc	a0,0x2
    80003944:	a1850513          	addi	a0,a0,-1512 # 80005358 <digits+0x18>
    80003948:	fffff097          	auipc	ra,0xfffff
    8000394c:	4b4080e7          	jalr	1204(ra) # 80002dfc <panic>

0000000080003950 <freerange>:
    80003950:	fc010113          	addi	sp,sp,-64
    80003954:	000017b7          	lui	a5,0x1
    80003958:	02913423          	sd	s1,40(sp)
    8000395c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80003960:	009504b3          	add	s1,a0,s1
    80003964:	fffff537          	lui	a0,0xfffff
    80003968:	02813823          	sd	s0,48(sp)
    8000396c:	02113c23          	sd	ra,56(sp)
    80003970:	03213023          	sd	s2,32(sp)
    80003974:	01313c23          	sd	s3,24(sp)
    80003978:	01413823          	sd	s4,16(sp)
    8000397c:	01513423          	sd	s5,8(sp)
    80003980:	01613023          	sd	s6,0(sp)
    80003984:	04010413          	addi	s0,sp,64
    80003988:	00a4f4b3          	and	s1,s1,a0
    8000398c:	00f487b3          	add	a5,s1,a5
    80003990:	06f5e463          	bltu	a1,a5,800039f8 <freerange+0xa8>
    80003994:	00003a97          	auipc	s5,0x3
    80003998:	3dca8a93          	addi	s5,s5,988 # 80006d70 <end>
    8000399c:	0954e263          	bltu	s1,s5,80003a20 <freerange+0xd0>
    800039a0:	01100993          	li	s3,17
    800039a4:	01b99993          	slli	s3,s3,0x1b
    800039a8:	0734fc63          	bgeu	s1,s3,80003a20 <freerange+0xd0>
    800039ac:	00058a13          	mv	s4,a1
    800039b0:	00002917          	auipc	s2,0x2
    800039b4:	11090913          	addi	s2,s2,272 # 80005ac0 <kmem>
    800039b8:	00002b37          	lui	s6,0x2
    800039bc:	0140006f          	j	800039d0 <freerange+0x80>
    800039c0:	000017b7          	lui	a5,0x1
    800039c4:	00f484b3          	add	s1,s1,a5
    800039c8:	0554ec63          	bltu	s1,s5,80003a20 <freerange+0xd0>
    800039cc:	0534fa63          	bgeu	s1,s3,80003a20 <freerange+0xd0>
    800039d0:	00001637          	lui	a2,0x1
    800039d4:	00100593          	li	a1,1
    800039d8:	00048513          	mv	a0,s1
    800039dc:	00000097          	auipc	ra,0x0
    800039e0:	50c080e7          	jalr	1292(ra) # 80003ee8 <__memset>
    800039e4:	00093703          	ld	a4,0(s2)
    800039e8:	016487b3          	add	a5,s1,s6
    800039ec:	00e4b023          	sd	a4,0(s1)
    800039f0:	00993023          	sd	s1,0(s2)
    800039f4:	fcfa76e3          	bgeu	s4,a5,800039c0 <freerange+0x70>
    800039f8:	03813083          	ld	ra,56(sp)
    800039fc:	03013403          	ld	s0,48(sp)
    80003a00:	02813483          	ld	s1,40(sp)
    80003a04:	02013903          	ld	s2,32(sp)
    80003a08:	01813983          	ld	s3,24(sp)
    80003a0c:	01013a03          	ld	s4,16(sp)
    80003a10:	00813a83          	ld	s5,8(sp)
    80003a14:	00013b03          	ld	s6,0(sp)
    80003a18:	04010113          	addi	sp,sp,64
    80003a1c:	00008067          	ret
    80003a20:	00002517          	auipc	a0,0x2
    80003a24:	93850513          	addi	a0,a0,-1736 # 80005358 <digits+0x18>
    80003a28:	fffff097          	auipc	ra,0xfffff
    80003a2c:	3d4080e7          	jalr	980(ra) # 80002dfc <panic>

0000000080003a30 <kfree>:
    80003a30:	fe010113          	addi	sp,sp,-32
    80003a34:	00813823          	sd	s0,16(sp)
    80003a38:	00113c23          	sd	ra,24(sp)
    80003a3c:	00913423          	sd	s1,8(sp)
    80003a40:	02010413          	addi	s0,sp,32
    80003a44:	03451793          	slli	a5,a0,0x34
    80003a48:	04079c63          	bnez	a5,80003aa0 <kfree+0x70>
    80003a4c:	00003797          	auipc	a5,0x3
    80003a50:	32478793          	addi	a5,a5,804 # 80006d70 <end>
    80003a54:	00050493          	mv	s1,a0
    80003a58:	04f56463          	bltu	a0,a5,80003aa0 <kfree+0x70>
    80003a5c:	01100793          	li	a5,17
    80003a60:	01b79793          	slli	a5,a5,0x1b
    80003a64:	02f57e63          	bgeu	a0,a5,80003aa0 <kfree+0x70>
    80003a68:	00001637          	lui	a2,0x1
    80003a6c:	00100593          	li	a1,1
    80003a70:	00000097          	auipc	ra,0x0
    80003a74:	478080e7          	jalr	1144(ra) # 80003ee8 <__memset>
    80003a78:	00002797          	auipc	a5,0x2
    80003a7c:	04878793          	addi	a5,a5,72 # 80005ac0 <kmem>
    80003a80:	0007b703          	ld	a4,0(a5)
    80003a84:	01813083          	ld	ra,24(sp)
    80003a88:	01013403          	ld	s0,16(sp)
    80003a8c:	00e4b023          	sd	a4,0(s1)
    80003a90:	0097b023          	sd	s1,0(a5)
    80003a94:	00813483          	ld	s1,8(sp)
    80003a98:	02010113          	addi	sp,sp,32
    80003a9c:	00008067          	ret
    80003aa0:	00002517          	auipc	a0,0x2
    80003aa4:	8b850513          	addi	a0,a0,-1864 # 80005358 <digits+0x18>
    80003aa8:	fffff097          	auipc	ra,0xfffff
    80003aac:	354080e7          	jalr	852(ra) # 80002dfc <panic>

0000000080003ab0 <kalloc>:
    80003ab0:	fe010113          	addi	sp,sp,-32
    80003ab4:	00813823          	sd	s0,16(sp)
    80003ab8:	00913423          	sd	s1,8(sp)
    80003abc:	00113c23          	sd	ra,24(sp)
    80003ac0:	02010413          	addi	s0,sp,32
    80003ac4:	00002797          	auipc	a5,0x2
    80003ac8:	ffc78793          	addi	a5,a5,-4 # 80005ac0 <kmem>
    80003acc:	0007b483          	ld	s1,0(a5)
    80003ad0:	02048063          	beqz	s1,80003af0 <kalloc+0x40>
    80003ad4:	0004b703          	ld	a4,0(s1)
    80003ad8:	00001637          	lui	a2,0x1
    80003adc:	00500593          	li	a1,5
    80003ae0:	00048513          	mv	a0,s1
    80003ae4:	00e7b023          	sd	a4,0(a5)
    80003ae8:	00000097          	auipc	ra,0x0
    80003aec:	400080e7          	jalr	1024(ra) # 80003ee8 <__memset>
    80003af0:	01813083          	ld	ra,24(sp)
    80003af4:	01013403          	ld	s0,16(sp)
    80003af8:	00048513          	mv	a0,s1
    80003afc:	00813483          	ld	s1,8(sp)
    80003b00:	02010113          	addi	sp,sp,32
    80003b04:	00008067          	ret

0000000080003b08 <initlock>:
    80003b08:	ff010113          	addi	sp,sp,-16
    80003b0c:	00813423          	sd	s0,8(sp)
    80003b10:	01010413          	addi	s0,sp,16
    80003b14:	00813403          	ld	s0,8(sp)
    80003b18:	00b53423          	sd	a1,8(a0)
    80003b1c:	00052023          	sw	zero,0(a0)
    80003b20:	00053823          	sd	zero,16(a0)
    80003b24:	01010113          	addi	sp,sp,16
    80003b28:	00008067          	ret

0000000080003b2c <acquire>:
    80003b2c:	fe010113          	addi	sp,sp,-32
    80003b30:	00813823          	sd	s0,16(sp)
    80003b34:	00913423          	sd	s1,8(sp)
    80003b38:	00113c23          	sd	ra,24(sp)
    80003b3c:	01213023          	sd	s2,0(sp)
    80003b40:	02010413          	addi	s0,sp,32
    80003b44:	00050493          	mv	s1,a0
    80003b48:	10002973          	csrr	s2,sstatus
    80003b4c:	100027f3          	csrr	a5,sstatus
    80003b50:	ffd7f793          	andi	a5,a5,-3
    80003b54:	10079073          	csrw	sstatus,a5
    80003b58:	fffff097          	auipc	ra,0xfffff
    80003b5c:	8e8080e7          	jalr	-1816(ra) # 80002440 <mycpu>
    80003b60:	07852783          	lw	a5,120(a0)
    80003b64:	06078e63          	beqz	a5,80003be0 <acquire+0xb4>
    80003b68:	fffff097          	auipc	ra,0xfffff
    80003b6c:	8d8080e7          	jalr	-1832(ra) # 80002440 <mycpu>
    80003b70:	07852783          	lw	a5,120(a0)
    80003b74:	0004a703          	lw	a4,0(s1)
    80003b78:	0017879b          	addiw	a5,a5,1
    80003b7c:	06f52c23          	sw	a5,120(a0)
    80003b80:	04071063          	bnez	a4,80003bc0 <acquire+0x94>
    80003b84:	00100713          	li	a4,1
    80003b88:	00070793          	mv	a5,a4
    80003b8c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003b90:	0007879b          	sext.w	a5,a5
    80003b94:	fe079ae3          	bnez	a5,80003b88 <acquire+0x5c>
    80003b98:	0ff0000f          	fence
    80003b9c:	fffff097          	auipc	ra,0xfffff
    80003ba0:	8a4080e7          	jalr	-1884(ra) # 80002440 <mycpu>
    80003ba4:	01813083          	ld	ra,24(sp)
    80003ba8:	01013403          	ld	s0,16(sp)
    80003bac:	00a4b823          	sd	a0,16(s1)
    80003bb0:	00013903          	ld	s2,0(sp)
    80003bb4:	00813483          	ld	s1,8(sp)
    80003bb8:	02010113          	addi	sp,sp,32
    80003bbc:	00008067          	ret
    80003bc0:	0104b903          	ld	s2,16(s1)
    80003bc4:	fffff097          	auipc	ra,0xfffff
    80003bc8:	87c080e7          	jalr	-1924(ra) # 80002440 <mycpu>
    80003bcc:	faa91ce3          	bne	s2,a0,80003b84 <acquire+0x58>
    80003bd0:	00001517          	auipc	a0,0x1
    80003bd4:	79050513          	addi	a0,a0,1936 # 80005360 <digits+0x20>
    80003bd8:	fffff097          	auipc	ra,0xfffff
    80003bdc:	224080e7          	jalr	548(ra) # 80002dfc <panic>
    80003be0:	00195913          	srli	s2,s2,0x1
    80003be4:	fffff097          	auipc	ra,0xfffff
    80003be8:	85c080e7          	jalr	-1956(ra) # 80002440 <mycpu>
    80003bec:	00197913          	andi	s2,s2,1
    80003bf0:	07252e23          	sw	s2,124(a0)
    80003bf4:	f75ff06f          	j	80003b68 <acquire+0x3c>

0000000080003bf8 <release>:
    80003bf8:	fe010113          	addi	sp,sp,-32
    80003bfc:	00813823          	sd	s0,16(sp)
    80003c00:	00113c23          	sd	ra,24(sp)
    80003c04:	00913423          	sd	s1,8(sp)
    80003c08:	01213023          	sd	s2,0(sp)
    80003c0c:	02010413          	addi	s0,sp,32
    80003c10:	00052783          	lw	a5,0(a0)
    80003c14:	00079a63          	bnez	a5,80003c28 <release+0x30>
    80003c18:	00001517          	auipc	a0,0x1
    80003c1c:	75050513          	addi	a0,a0,1872 # 80005368 <digits+0x28>
    80003c20:	fffff097          	auipc	ra,0xfffff
    80003c24:	1dc080e7          	jalr	476(ra) # 80002dfc <panic>
    80003c28:	01053903          	ld	s2,16(a0)
    80003c2c:	00050493          	mv	s1,a0
    80003c30:	fffff097          	auipc	ra,0xfffff
    80003c34:	810080e7          	jalr	-2032(ra) # 80002440 <mycpu>
    80003c38:	fea910e3          	bne	s2,a0,80003c18 <release+0x20>
    80003c3c:	0004b823          	sd	zero,16(s1)
    80003c40:	0ff0000f          	fence
    80003c44:	0f50000f          	fence	iorw,ow
    80003c48:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003c4c:	ffffe097          	auipc	ra,0xffffe
    80003c50:	7f4080e7          	jalr	2036(ra) # 80002440 <mycpu>
    80003c54:	100027f3          	csrr	a5,sstatus
    80003c58:	0027f793          	andi	a5,a5,2
    80003c5c:	04079a63          	bnez	a5,80003cb0 <release+0xb8>
    80003c60:	07852783          	lw	a5,120(a0)
    80003c64:	02f05e63          	blez	a5,80003ca0 <release+0xa8>
    80003c68:	fff7871b          	addiw	a4,a5,-1
    80003c6c:	06e52c23          	sw	a4,120(a0)
    80003c70:	00071c63          	bnez	a4,80003c88 <release+0x90>
    80003c74:	07c52783          	lw	a5,124(a0)
    80003c78:	00078863          	beqz	a5,80003c88 <release+0x90>
    80003c7c:	100027f3          	csrr	a5,sstatus
    80003c80:	0027e793          	ori	a5,a5,2
    80003c84:	10079073          	csrw	sstatus,a5
    80003c88:	01813083          	ld	ra,24(sp)
    80003c8c:	01013403          	ld	s0,16(sp)
    80003c90:	00813483          	ld	s1,8(sp)
    80003c94:	00013903          	ld	s2,0(sp)
    80003c98:	02010113          	addi	sp,sp,32
    80003c9c:	00008067          	ret
    80003ca0:	00001517          	auipc	a0,0x1
    80003ca4:	6e850513          	addi	a0,a0,1768 # 80005388 <digits+0x48>
    80003ca8:	fffff097          	auipc	ra,0xfffff
    80003cac:	154080e7          	jalr	340(ra) # 80002dfc <panic>
    80003cb0:	00001517          	auipc	a0,0x1
    80003cb4:	6c050513          	addi	a0,a0,1728 # 80005370 <digits+0x30>
    80003cb8:	fffff097          	auipc	ra,0xfffff
    80003cbc:	144080e7          	jalr	324(ra) # 80002dfc <panic>

0000000080003cc0 <holding>:
    80003cc0:	00052783          	lw	a5,0(a0)
    80003cc4:	00079663          	bnez	a5,80003cd0 <holding+0x10>
    80003cc8:	00000513          	li	a0,0
    80003ccc:	00008067          	ret
    80003cd0:	fe010113          	addi	sp,sp,-32
    80003cd4:	00813823          	sd	s0,16(sp)
    80003cd8:	00913423          	sd	s1,8(sp)
    80003cdc:	00113c23          	sd	ra,24(sp)
    80003ce0:	02010413          	addi	s0,sp,32
    80003ce4:	01053483          	ld	s1,16(a0)
    80003ce8:	ffffe097          	auipc	ra,0xffffe
    80003cec:	758080e7          	jalr	1880(ra) # 80002440 <mycpu>
    80003cf0:	01813083          	ld	ra,24(sp)
    80003cf4:	01013403          	ld	s0,16(sp)
    80003cf8:	40a48533          	sub	a0,s1,a0
    80003cfc:	00153513          	seqz	a0,a0
    80003d00:	00813483          	ld	s1,8(sp)
    80003d04:	02010113          	addi	sp,sp,32
    80003d08:	00008067          	ret

0000000080003d0c <push_off>:
    80003d0c:	fe010113          	addi	sp,sp,-32
    80003d10:	00813823          	sd	s0,16(sp)
    80003d14:	00113c23          	sd	ra,24(sp)
    80003d18:	00913423          	sd	s1,8(sp)
    80003d1c:	02010413          	addi	s0,sp,32
    80003d20:	100024f3          	csrr	s1,sstatus
    80003d24:	100027f3          	csrr	a5,sstatus
    80003d28:	ffd7f793          	andi	a5,a5,-3
    80003d2c:	10079073          	csrw	sstatus,a5
    80003d30:	ffffe097          	auipc	ra,0xffffe
    80003d34:	710080e7          	jalr	1808(ra) # 80002440 <mycpu>
    80003d38:	07852783          	lw	a5,120(a0)
    80003d3c:	02078663          	beqz	a5,80003d68 <push_off+0x5c>
    80003d40:	ffffe097          	auipc	ra,0xffffe
    80003d44:	700080e7          	jalr	1792(ra) # 80002440 <mycpu>
    80003d48:	07852783          	lw	a5,120(a0)
    80003d4c:	01813083          	ld	ra,24(sp)
    80003d50:	01013403          	ld	s0,16(sp)
    80003d54:	0017879b          	addiw	a5,a5,1
    80003d58:	06f52c23          	sw	a5,120(a0)
    80003d5c:	00813483          	ld	s1,8(sp)
    80003d60:	02010113          	addi	sp,sp,32
    80003d64:	00008067          	ret
    80003d68:	0014d493          	srli	s1,s1,0x1
    80003d6c:	ffffe097          	auipc	ra,0xffffe
    80003d70:	6d4080e7          	jalr	1748(ra) # 80002440 <mycpu>
    80003d74:	0014f493          	andi	s1,s1,1
    80003d78:	06952e23          	sw	s1,124(a0)
    80003d7c:	fc5ff06f          	j	80003d40 <push_off+0x34>

0000000080003d80 <pop_off>:
    80003d80:	ff010113          	addi	sp,sp,-16
    80003d84:	00813023          	sd	s0,0(sp)
    80003d88:	00113423          	sd	ra,8(sp)
    80003d8c:	01010413          	addi	s0,sp,16
    80003d90:	ffffe097          	auipc	ra,0xffffe
    80003d94:	6b0080e7          	jalr	1712(ra) # 80002440 <mycpu>
    80003d98:	100027f3          	csrr	a5,sstatus
    80003d9c:	0027f793          	andi	a5,a5,2
    80003da0:	04079663          	bnez	a5,80003dec <pop_off+0x6c>
    80003da4:	07852783          	lw	a5,120(a0)
    80003da8:	02f05a63          	blez	a5,80003ddc <pop_off+0x5c>
    80003dac:	fff7871b          	addiw	a4,a5,-1
    80003db0:	06e52c23          	sw	a4,120(a0)
    80003db4:	00071c63          	bnez	a4,80003dcc <pop_off+0x4c>
    80003db8:	07c52783          	lw	a5,124(a0)
    80003dbc:	00078863          	beqz	a5,80003dcc <pop_off+0x4c>
    80003dc0:	100027f3          	csrr	a5,sstatus
    80003dc4:	0027e793          	ori	a5,a5,2
    80003dc8:	10079073          	csrw	sstatus,a5
    80003dcc:	00813083          	ld	ra,8(sp)
    80003dd0:	00013403          	ld	s0,0(sp)
    80003dd4:	01010113          	addi	sp,sp,16
    80003dd8:	00008067          	ret
    80003ddc:	00001517          	auipc	a0,0x1
    80003de0:	5ac50513          	addi	a0,a0,1452 # 80005388 <digits+0x48>
    80003de4:	fffff097          	auipc	ra,0xfffff
    80003de8:	018080e7          	jalr	24(ra) # 80002dfc <panic>
    80003dec:	00001517          	auipc	a0,0x1
    80003df0:	58450513          	addi	a0,a0,1412 # 80005370 <digits+0x30>
    80003df4:	fffff097          	auipc	ra,0xfffff
    80003df8:	008080e7          	jalr	8(ra) # 80002dfc <panic>

0000000080003dfc <push_on>:
    80003dfc:	fe010113          	addi	sp,sp,-32
    80003e00:	00813823          	sd	s0,16(sp)
    80003e04:	00113c23          	sd	ra,24(sp)
    80003e08:	00913423          	sd	s1,8(sp)
    80003e0c:	02010413          	addi	s0,sp,32
    80003e10:	100024f3          	csrr	s1,sstatus
    80003e14:	100027f3          	csrr	a5,sstatus
    80003e18:	0027e793          	ori	a5,a5,2
    80003e1c:	10079073          	csrw	sstatus,a5
    80003e20:	ffffe097          	auipc	ra,0xffffe
    80003e24:	620080e7          	jalr	1568(ra) # 80002440 <mycpu>
    80003e28:	07852783          	lw	a5,120(a0)
    80003e2c:	02078663          	beqz	a5,80003e58 <push_on+0x5c>
    80003e30:	ffffe097          	auipc	ra,0xffffe
    80003e34:	610080e7          	jalr	1552(ra) # 80002440 <mycpu>
    80003e38:	07852783          	lw	a5,120(a0)
    80003e3c:	01813083          	ld	ra,24(sp)
    80003e40:	01013403          	ld	s0,16(sp)
    80003e44:	0017879b          	addiw	a5,a5,1
    80003e48:	06f52c23          	sw	a5,120(a0)
    80003e4c:	00813483          	ld	s1,8(sp)
    80003e50:	02010113          	addi	sp,sp,32
    80003e54:	00008067          	ret
    80003e58:	0014d493          	srli	s1,s1,0x1
    80003e5c:	ffffe097          	auipc	ra,0xffffe
    80003e60:	5e4080e7          	jalr	1508(ra) # 80002440 <mycpu>
    80003e64:	0014f493          	andi	s1,s1,1
    80003e68:	06952e23          	sw	s1,124(a0)
    80003e6c:	fc5ff06f          	j	80003e30 <push_on+0x34>

0000000080003e70 <pop_on>:
    80003e70:	ff010113          	addi	sp,sp,-16
    80003e74:	00813023          	sd	s0,0(sp)
    80003e78:	00113423          	sd	ra,8(sp)
    80003e7c:	01010413          	addi	s0,sp,16
    80003e80:	ffffe097          	auipc	ra,0xffffe
    80003e84:	5c0080e7          	jalr	1472(ra) # 80002440 <mycpu>
    80003e88:	100027f3          	csrr	a5,sstatus
    80003e8c:	0027f793          	andi	a5,a5,2
    80003e90:	04078463          	beqz	a5,80003ed8 <pop_on+0x68>
    80003e94:	07852783          	lw	a5,120(a0)
    80003e98:	02f05863          	blez	a5,80003ec8 <pop_on+0x58>
    80003e9c:	fff7879b          	addiw	a5,a5,-1
    80003ea0:	06f52c23          	sw	a5,120(a0)
    80003ea4:	07853783          	ld	a5,120(a0)
    80003ea8:	00079863          	bnez	a5,80003eb8 <pop_on+0x48>
    80003eac:	100027f3          	csrr	a5,sstatus
    80003eb0:	ffd7f793          	andi	a5,a5,-3
    80003eb4:	10079073          	csrw	sstatus,a5
    80003eb8:	00813083          	ld	ra,8(sp)
    80003ebc:	00013403          	ld	s0,0(sp)
    80003ec0:	01010113          	addi	sp,sp,16
    80003ec4:	00008067          	ret
    80003ec8:	00001517          	auipc	a0,0x1
    80003ecc:	4e850513          	addi	a0,a0,1256 # 800053b0 <digits+0x70>
    80003ed0:	fffff097          	auipc	ra,0xfffff
    80003ed4:	f2c080e7          	jalr	-212(ra) # 80002dfc <panic>
    80003ed8:	00001517          	auipc	a0,0x1
    80003edc:	4b850513          	addi	a0,a0,1208 # 80005390 <digits+0x50>
    80003ee0:	fffff097          	auipc	ra,0xfffff
    80003ee4:	f1c080e7          	jalr	-228(ra) # 80002dfc <panic>

0000000080003ee8 <__memset>:
    80003ee8:	ff010113          	addi	sp,sp,-16
    80003eec:	00813423          	sd	s0,8(sp)
    80003ef0:	01010413          	addi	s0,sp,16
    80003ef4:	1a060e63          	beqz	a2,800040b0 <__memset+0x1c8>
    80003ef8:	40a007b3          	neg	a5,a0
    80003efc:	0077f793          	andi	a5,a5,7
    80003f00:	00778693          	addi	a3,a5,7
    80003f04:	00b00813          	li	a6,11
    80003f08:	0ff5f593          	andi	a1,a1,255
    80003f0c:	fff6071b          	addiw	a4,a2,-1
    80003f10:	1b06e663          	bltu	a3,a6,800040bc <__memset+0x1d4>
    80003f14:	1cd76463          	bltu	a4,a3,800040dc <__memset+0x1f4>
    80003f18:	1a078e63          	beqz	a5,800040d4 <__memset+0x1ec>
    80003f1c:	00b50023          	sb	a1,0(a0)
    80003f20:	00100713          	li	a4,1
    80003f24:	1ae78463          	beq	a5,a4,800040cc <__memset+0x1e4>
    80003f28:	00b500a3          	sb	a1,1(a0)
    80003f2c:	00200713          	li	a4,2
    80003f30:	1ae78a63          	beq	a5,a4,800040e4 <__memset+0x1fc>
    80003f34:	00b50123          	sb	a1,2(a0)
    80003f38:	00300713          	li	a4,3
    80003f3c:	18e78463          	beq	a5,a4,800040c4 <__memset+0x1dc>
    80003f40:	00b501a3          	sb	a1,3(a0)
    80003f44:	00400713          	li	a4,4
    80003f48:	1ae78263          	beq	a5,a4,800040ec <__memset+0x204>
    80003f4c:	00b50223          	sb	a1,4(a0)
    80003f50:	00500713          	li	a4,5
    80003f54:	1ae78063          	beq	a5,a4,800040f4 <__memset+0x20c>
    80003f58:	00b502a3          	sb	a1,5(a0)
    80003f5c:	00700713          	li	a4,7
    80003f60:	18e79e63          	bne	a5,a4,800040fc <__memset+0x214>
    80003f64:	00b50323          	sb	a1,6(a0)
    80003f68:	00700e93          	li	t4,7
    80003f6c:	00859713          	slli	a4,a1,0x8
    80003f70:	00e5e733          	or	a4,a1,a4
    80003f74:	01059e13          	slli	t3,a1,0x10
    80003f78:	01c76e33          	or	t3,a4,t3
    80003f7c:	01859313          	slli	t1,a1,0x18
    80003f80:	006e6333          	or	t1,t3,t1
    80003f84:	02059893          	slli	a7,a1,0x20
    80003f88:	40f60e3b          	subw	t3,a2,a5
    80003f8c:	011368b3          	or	a7,t1,a7
    80003f90:	02859813          	slli	a6,a1,0x28
    80003f94:	0108e833          	or	a6,a7,a6
    80003f98:	03059693          	slli	a3,a1,0x30
    80003f9c:	003e589b          	srliw	a7,t3,0x3
    80003fa0:	00d866b3          	or	a3,a6,a3
    80003fa4:	03859713          	slli	a4,a1,0x38
    80003fa8:	00389813          	slli	a6,a7,0x3
    80003fac:	00f507b3          	add	a5,a0,a5
    80003fb0:	00e6e733          	or	a4,a3,a4
    80003fb4:	000e089b          	sext.w	a7,t3
    80003fb8:	00f806b3          	add	a3,a6,a5
    80003fbc:	00e7b023          	sd	a4,0(a5)
    80003fc0:	00878793          	addi	a5,a5,8
    80003fc4:	fed79ce3          	bne	a5,a3,80003fbc <__memset+0xd4>
    80003fc8:	ff8e7793          	andi	a5,t3,-8
    80003fcc:	0007871b          	sext.w	a4,a5
    80003fd0:	01d787bb          	addw	a5,a5,t4
    80003fd4:	0ce88e63          	beq	a7,a4,800040b0 <__memset+0x1c8>
    80003fd8:	00f50733          	add	a4,a0,a5
    80003fdc:	00b70023          	sb	a1,0(a4)
    80003fe0:	0017871b          	addiw	a4,a5,1
    80003fe4:	0cc77663          	bgeu	a4,a2,800040b0 <__memset+0x1c8>
    80003fe8:	00e50733          	add	a4,a0,a4
    80003fec:	00b70023          	sb	a1,0(a4)
    80003ff0:	0027871b          	addiw	a4,a5,2
    80003ff4:	0ac77e63          	bgeu	a4,a2,800040b0 <__memset+0x1c8>
    80003ff8:	00e50733          	add	a4,a0,a4
    80003ffc:	00b70023          	sb	a1,0(a4)
    80004000:	0037871b          	addiw	a4,a5,3
    80004004:	0ac77663          	bgeu	a4,a2,800040b0 <__memset+0x1c8>
    80004008:	00e50733          	add	a4,a0,a4
    8000400c:	00b70023          	sb	a1,0(a4)
    80004010:	0047871b          	addiw	a4,a5,4
    80004014:	08c77e63          	bgeu	a4,a2,800040b0 <__memset+0x1c8>
    80004018:	00e50733          	add	a4,a0,a4
    8000401c:	00b70023          	sb	a1,0(a4)
    80004020:	0057871b          	addiw	a4,a5,5
    80004024:	08c77663          	bgeu	a4,a2,800040b0 <__memset+0x1c8>
    80004028:	00e50733          	add	a4,a0,a4
    8000402c:	00b70023          	sb	a1,0(a4)
    80004030:	0067871b          	addiw	a4,a5,6
    80004034:	06c77e63          	bgeu	a4,a2,800040b0 <__memset+0x1c8>
    80004038:	00e50733          	add	a4,a0,a4
    8000403c:	00b70023          	sb	a1,0(a4)
    80004040:	0077871b          	addiw	a4,a5,7
    80004044:	06c77663          	bgeu	a4,a2,800040b0 <__memset+0x1c8>
    80004048:	00e50733          	add	a4,a0,a4
    8000404c:	00b70023          	sb	a1,0(a4)
    80004050:	0087871b          	addiw	a4,a5,8
    80004054:	04c77e63          	bgeu	a4,a2,800040b0 <__memset+0x1c8>
    80004058:	00e50733          	add	a4,a0,a4
    8000405c:	00b70023          	sb	a1,0(a4)
    80004060:	0097871b          	addiw	a4,a5,9
    80004064:	04c77663          	bgeu	a4,a2,800040b0 <__memset+0x1c8>
    80004068:	00e50733          	add	a4,a0,a4
    8000406c:	00b70023          	sb	a1,0(a4)
    80004070:	00a7871b          	addiw	a4,a5,10
    80004074:	02c77e63          	bgeu	a4,a2,800040b0 <__memset+0x1c8>
    80004078:	00e50733          	add	a4,a0,a4
    8000407c:	00b70023          	sb	a1,0(a4)
    80004080:	00b7871b          	addiw	a4,a5,11
    80004084:	02c77663          	bgeu	a4,a2,800040b0 <__memset+0x1c8>
    80004088:	00e50733          	add	a4,a0,a4
    8000408c:	00b70023          	sb	a1,0(a4)
    80004090:	00c7871b          	addiw	a4,a5,12
    80004094:	00c77e63          	bgeu	a4,a2,800040b0 <__memset+0x1c8>
    80004098:	00e50733          	add	a4,a0,a4
    8000409c:	00b70023          	sb	a1,0(a4)
    800040a0:	00d7879b          	addiw	a5,a5,13
    800040a4:	00c7f663          	bgeu	a5,a2,800040b0 <__memset+0x1c8>
    800040a8:	00f507b3          	add	a5,a0,a5
    800040ac:	00b78023          	sb	a1,0(a5)
    800040b0:	00813403          	ld	s0,8(sp)
    800040b4:	01010113          	addi	sp,sp,16
    800040b8:	00008067          	ret
    800040bc:	00b00693          	li	a3,11
    800040c0:	e55ff06f          	j	80003f14 <__memset+0x2c>
    800040c4:	00300e93          	li	t4,3
    800040c8:	ea5ff06f          	j	80003f6c <__memset+0x84>
    800040cc:	00100e93          	li	t4,1
    800040d0:	e9dff06f          	j	80003f6c <__memset+0x84>
    800040d4:	00000e93          	li	t4,0
    800040d8:	e95ff06f          	j	80003f6c <__memset+0x84>
    800040dc:	00000793          	li	a5,0
    800040e0:	ef9ff06f          	j	80003fd8 <__memset+0xf0>
    800040e4:	00200e93          	li	t4,2
    800040e8:	e85ff06f          	j	80003f6c <__memset+0x84>
    800040ec:	00400e93          	li	t4,4
    800040f0:	e7dff06f          	j	80003f6c <__memset+0x84>
    800040f4:	00500e93          	li	t4,5
    800040f8:	e75ff06f          	j	80003f6c <__memset+0x84>
    800040fc:	00600e93          	li	t4,6
    80004100:	e6dff06f          	j	80003f6c <__memset+0x84>

0000000080004104 <__memmove>:
    80004104:	ff010113          	addi	sp,sp,-16
    80004108:	00813423          	sd	s0,8(sp)
    8000410c:	01010413          	addi	s0,sp,16
    80004110:	0e060863          	beqz	a2,80004200 <__memmove+0xfc>
    80004114:	fff6069b          	addiw	a3,a2,-1
    80004118:	0006881b          	sext.w	a6,a3
    8000411c:	0ea5e863          	bltu	a1,a0,8000420c <__memmove+0x108>
    80004120:	00758713          	addi	a4,a1,7
    80004124:	00a5e7b3          	or	a5,a1,a0
    80004128:	40a70733          	sub	a4,a4,a0
    8000412c:	0077f793          	andi	a5,a5,7
    80004130:	00f73713          	sltiu	a4,a4,15
    80004134:	00174713          	xori	a4,a4,1
    80004138:	0017b793          	seqz	a5,a5
    8000413c:	00e7f7b3          	and	a5,a5,a4
    80004140:	10078863          	beqz	a5,80004250 <__memmove+0x14c>
    80004144:	00900793          	li	a5,9
    80004148:	1107f463          	bgeu	a5,a6,80004250 <__memmove+0x14c>
    8000414c:	0036581b          	srliw	a6,a2,0x3
    80004150:	fff8081b          	addiw	a6,a6,-1
    80004154:	02081813          	slli	a6,a6,0x20
    80004158:	01d85893          	srli	a7,a6,0x1d
    8000415c:	00858813          	addi	a6,a1,8
    80004160:	00058793          	mv	a5,a1
    80004164:	00050713          	mv	a4,a0
    80004168:	01088833          	add	a6,a7,a6
    8000416c:	0007b883          	ld	a7,0(a5)
    80004170:	00878793          	addi	a5,a5,8
    80004174:	00870713          	addi	a4,a4,8
    80004178:	ff173c23          	sd	a7,-8(a4)
    8000417c:	ff0798e3          	bne	a5,a6,8000416c <__memmove+0x68>
    80004180:	ff867713          	andi	a4,a2,-8
    80004184:	02071793          	slli	a5,a4,0x20
    80004188:	0207d793          	srli	a5,a5,0x20
    8000418c:	00f585b3          	add	a1,a1,a5
    80004190:	40e686bb          	subw	a3,a3,a4
    80004194:	00f507b3          	add	a5,a0,a5
    80004198:	06e60463          	beq	a2,a4,80004200 <__memmove+0xfc>
    8000419c:	0005c703          	lbu	a4,0(a1)
    800041a0:	00e78023          	sb	a4,0(a5)
    800041a4:	04068e63          	beqz	a3,80004200 <__memmove+0xfc>
    800041a8:	0015c603          	lbu	a2,1(a1)
    800041ac:	00100713          	li	a4,1
    800041b0:	00c780a3          	sb	a2,1(a5)
    800041b4:	04e68663          	beq	a3,a4,80004200 <__memmove+0xfc>
    800041b8:	0025c603          	lbu	a2,2(a1)
    800041bc:	00200713          	li	a4,2
    800041c0:	00c78123          	sb	a2,2(a5)
    800041c4:	02e68e63          	beq	a3,a4,80004200 <__memmove+0xfc>
    800041c8:	0035c603          	lbu	a2,3(a1)
    800041cc:	00300713          	li	a4,3
    800041d0:	00c781a3          	sb	a2,3(a5)
    800041d4:	02e68663          	beq	a3,a4,80004200 <__memmove+0xfc>
    800041d8:	0045c603          	lbu	a2,4(a1)
    800041dc:	00400713          	li	a4,4
    800041e0:	00c78223          	sb	a2,4(a5)
    800041e4:	00e68e63          	beq	a3,a4,80004200 <__memmove+0xfc>
    800041e8:	0055c603          	lbu	a2,5(a1)
    800041ec:	00500713          	li	a4,5
    800041f0:	00c782a3          	sb	a2,5(a5)
    800041f4:	00e68663          	beq	a3,a4,80004200 <__memmove+0xfc>
    800041f8:	0065c703          	lbu	a4,6(a1)
    800041fc:	00e78323          	sb	a4,6(a5)
    80004200:	00813403          	ld	s0,8(sp)
    80004204:	01010113          	addi	sp,sp,16
    80004208:	00008067          	ret
    8000420c:	02061713          	slli	a4,a2,0x20
    80004210:	02075713          	srli	a4,a4,0x20
    80004214:	00e587b3          	add	a5,a1,a4
    80004218:	f0f574e3          	bgeu	a0,a5,80004120 <__memmove+0x1c>
    8000421c:	02069613          	slli	a2,a3,0x20
    80004220:	02065613          	srli	a2,a2,0x20
    80004224:	fff64613          	not	a2,a2
    80004228:	00e50733          	add	a4,a0,a4
    8000422c:	00c78633          	add	a2,a5,a2
    80004230:	fff7c683          	lbu	a3,-1(a5)
    80004234:	fff78793          	addi	a5,a5,-1
    80004238:	fff70713          	addi	a4,a4,-1
    8000423c:	00d70023          	sb	a3,0(a4)
    80004240:	fec798e3          	bne	a5,a2,80004230 <__memmove+0x12c>
    80004244:	00813403          	ld	s0,8(sp)
    80004248:	01010113          	addi	sp,sp,16
    8000424c:	00008067          	ret
    80004250:	02069713          	slli	a4,a3,0x20
    80004254:	02075713          	srli	a4,a4,0x20
    80004258:	00170713          	addi	a4,a4,1
    8000425c:	00e50733          	add	a4,a0,a4
    80004260:	00050793          	mv	a5,a0
    80004264:	0005c683          	lbu	a3,0(a1)
    80004268:	00178793          	addi	a5,a5,1
    8000426c:	00158593          	addi	a1,a1,1
    80004270:	fed78fa3          	sb	a3,-1(a5)
    80004274:	fee798e3          	bne	a5,a4,80004264 <__memmove+0x160>
    80004278:	f89ff06f          	j	80004200 <__memmove+0xfc>

000000008000427c <__putc>:
    8000427c:	fe010113          	addi	sp,sp,-32
    80004280:	00813823          	sd	s0,16(sp)
    80004284:	00113c23          	sd	ra,24(sp)
    80004288:	02010413          	addi	s0,sp,32
    8000428c:	00050793          	mv	a5,a0
    80004290:	fef40593          	addi	a1,s0,-17
    80004294:	00100613          	li	a2,1
    80004298:	00000513          	li	a0,0
    8000429c:	fef407a3          	sb	a5,-17(s0)
    800042a0:	fffff097          	auipc	ra,0xfffff
    800042a4:	b3c080e7          	jalr	-1220(ra) # 80002ddc <console_write>
    800042a8:	01813083          	ld	ra,24(sp)
    800042ac:	01013403          	ld	s0,16(sp)
    800042b0:	02010113          	addi	sp,sp,32
    800042b4:	00008067          	ret

00000000800042b8 <__getc>:
    800042b8:	fe010113          	addi	sp,sp,-32
    800042bc:	00813823          	sd	s0,16(sp)
    800042c0:	00113c23          	sd	ra,24(sp)
    800042c4:	02010413          	addi	s0,sp,32
    800042c8:	fe840593          	addi	a1,s0,-24
    800042cc:	00100613          	li	a2,1
    800042d0:	00000513          	li	a0,0
    800042d4:	fffff097          	auipc	ra,0xfffff
    800042d8:	ae8080e7          	jalr	-1304(ra) # 80002dbc <console_read>
    800042dc:	fe844503          	lbu	a0,-24(s0)
    800042e0:	01813083          	ld	ra,24(sp)
    800042e4:	01013403          	ld	s0,16(sp)
    800042e8:	02010113          	addi	sp,sp,32
    800042ec:	00008067          	ret

00000000800042f0 <console_handler>:
    800042f0:	fe010113          	addi	sp,sp,-32
    800042f4:	00813823          	sd	s0,16(sp)
    800042f8:	00113c23          	sd	ra,24(sp)
    800042fc:	00913423          	sd	s1,8(sp)
    80004300:	02010413          	addi	s0,sp,32
    80004304:	14202773          	csrr	a4,scause
    80004308:	100027f3          	csrr	a5,sstatus
    8000430c:	0027f793          	andi	a5,a5,2
    80004310:	06079e63          	bnez	a5,8000438c <console_handler+0x9c>
    80004314:	00074c63          	bltz	a4,8000432c <console_handler+0x3c>
    80004318:	01813083          	ld	ra,24(sp)
    8000431c:	01013403          	ld	s0,16(sp)
    80004320:	00813483          	ld	s1,8(sp)
    80004324:	02010113          	addi	sp,sp,32
    80004328:	00008067          	ret
    8000432c:	0ff77713          	andi	a4,a4,255
    80004330:	00900793          	li	a5,9
    80004334:	fef712e3          	bne	a4,a5,80004318 <console_handler+0x28>
    80004338:	ffffe097          	auipc	ra,0xffffe
    8000433c:	6dc080e7          	jalr	1756(ra) # 80002a14 <plic_claim>
    80004340:	00a00793          	li	a5,10
    80004344:	00050493          	mv	s1,a0
    80004348:	02f50c63          	beq	a0,a5,80004380 <console_handler+0x90>
    8000434c:	fc0506e3          	beqz	a0,80004318 <console_handler+0x28>
    80004350:	00050593          	mv	a1,a0
    80004354:	00001517          	auipc	a0,0x1
    80004358:	f6450513          	addi	a0,a0,-156 # 800052b8 <_ZZ12printIntegermE6digits+0xe0>
    8000435c:	fffff097          	auipc	ra,0xfffff
    80004360:	afc080e7          	jalr	-1284(ra) # 80002e58 <__printf>
    80004364:	01013403          	ld	s0,16(sp)
    80004368:	01813083          	ld	ra,24(sp)
    8000436c:	00048513          	mv	a0,s1
    80004370:	00813483          	ld	s1,8(sp)
    80004374:	02010113          	addi	sp,sp,32
    80004378:	ffffe317          	auipc	t1,0xffffe
    8000437c:	6d430067          	jr	1748(t1) # 80002a4c <plic_complete>
    80004380:	fffff097          	auipc	ra,0xfffff
    80004384:	3e0080e7          	jalr	992(ra) # 80003760 <uartintr>
    80004388:	fddff06f          	j	80004364 <console_handler+0x74>
    8000438c:	00001517          	auipc	a0,0x1
    80004390:	02c50513          	addi	a0,a0,44 # 800053b8 <digits+0x78>
    80004394:	fffff097          	auipc	ra,0xfffff
    80004398:	a68080e7          	jalr	-1432(ra) # 80002dfc <panic>
	...
