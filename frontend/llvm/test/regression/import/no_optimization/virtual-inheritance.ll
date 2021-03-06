; ModuleID = 'virtual-inheritance.cpp.pp.bc'
source_filename = "virtual-inheritance.cpp"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

; CHECK-LABEL: Bundle
; CHECK: target-endianness = little-endian
; CHECK: target-pointer-size = 64 bits
; CHECK: target-triple = x86_64-apple-macosx10.13.0

%struct.E = type { i32 (...)**, %struct.B, %struct.C, i32, %struct.A }
%struct.B = type { i8* }
%struct.C = type { i8 }
%struct.A = type { i32 }
%struct.D = type { i32 (...)**, %struct.C, float, %struct.A, %struct.B }
%struct.F = type <{ i32 (...)**, i32, %struct.A }>
%struct.G = type { i32 (...)**, i8*, %struct.A }
%struct.H = type { %struct.F.base, %struct.G.base, %struct.A }
%struct.F.base = type <{ i32 (...)**, i32 }>
%struct.G.base = type { i32 (...)**, i8* }

@_ZTC1H0_1F = linkonce_odr unnamed_addr constant { [3 x i8*] } { [3 x i8*] [i8* inttoptr (i64 32 to i8*), i8* null, i8* bitcast ({ i8*, i8*, i32, i32, i8*, i64 }* @_ZTI1F to i8*)] }
; CHECK: define {0: [3 x si8*]}* @_ZTC1H0_1F, init {
; CHECK: #1 !entry !exit {
; CHECK:   si8* %1 = bitcast @_ZTI1F
; CHECK:   si8* %2 = sitoptr 32
; CHECK:   store @_ZTC1H0_1F, {0: [%2, null, %1]}, align 1
; CHECK: }
; CHECK: }

@_ZTC1H16_1G = linkonce_odr unnamed_addr constant { [3 x i8*] } { [3 x i8*] [i8* inttoptr (i64 16 to i8*), i8* null, i8* bitcast ({ i8*, i8*, i32, i32, i8*, i64 }* @_ZTI1G to i8*)] }
; CHECK: define {0: [3 x si8*]}* @_ZTC1H16_1G, init {
; CHECK: #1 !entry !exit {
; CHECK:   si8* %1 = bitcast @_ZTI1G
; CHECK:   si8* %2 = sitoptr 16
; CHECK:   store @_ZTC1H16_1G, {0: [%2, null, %1]}, align 1
; CHECK: }
; CHECK: }

@_ZTI1A = linkonce_odr constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTS1A, i32 0, i32 0) }
; CHECK: define {0: si8*, 8: si8*}* @_ZTI1A, init {
; CHECK: #1 !entry !exit {
; CHECK:   si8** %1 = ptrshift @_ZTVN10__cxxabiv117__class_type_infoE, 8 * 2
; CHECK:   si8* %2 = ptrshift @_ZTS1A, 3 * 0, 1 * 0
; CHECK:   si8* %3 = bitcast %1
; CHECK:   store @_ZTI1A, {0: %3, 8: %2}, align 1
; CHECK: }
; CHECK: }

@_ZTI1B = linkonce_odr constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTS1B, i32 0, i32 0) }
; CHECK: define {0: si8*, 8: si8*}* @_ZTI1B, init {
; CHECK: #1 !entry !exit {
; CHECK:   si8** %1 = ptrshift @_ZTVN10__cxxabiv117__class_type_infoE, 8 * 2
; CHECK:   si8* %2 = ptrshift @_ZTS1B, 3 * 0, 1 * 0
; CHECK:   si8* %3 = bitcast %1
; CHECK:   store @_ZTI1B, {0: %3, 8: %2}, align 1
; CHECK: }
; CHECK: }

@_ZTI1C = linkonce_odr constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTS1C, i32 0, i32 0) }
; CHECK: define {0: si8*, 8: si8*}* @_ZTI1C, init {
; CHECK: #1 !entry !exit {
; CHECK:   si8** %1 = ptrshift @_ZTVN10__cxxabiv117__class_type_infoE, 8 * 2
; CHECK:   si8* %2 = ptrshift @_ZTS1C, 3 * 0, 1 * 0
; CHECK:   si8* %3 = bitcast %1
; CHECK:   store @_ZTI1C, {0: %3, 8: %2}, align 1
; CHECK: }
; CHECK: }

@_ZTI1D = linkonce_odr constant { i8*, i8*, i32, i32, i8*, i64, i8*, i64, i8*, i64 } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv121__vmi_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTS1D, i32 0, i32 0), i32 0, i32 3, i8* bitcast ({ i8*, i8* }* @_ZTI1A to i8*), i64 -6141, i8* bitcast ({ i8*, i8* }* @_ZTI1B to i8*), i64 -8189, i8* bitcast ({ i8*, i8* }* @_ZTI1C to i8*), i64 2050 }
; CHECK: define {0: si8*, 8: si8*, 16: si32, 20: si32, 24: si8*, 32: si64, 40: si8*, 48: si64, 56: si8*, 64: si64}* @_ZTI1D, init {
; CHECK: #1 !entry !exit {
; CHECK:   si8** %1 = ptrshift @_ZTVN10__cxxabiv121__vmi_class_type_infoE, 8 * 2
; CHECK:   si8* %2 = bitcast @_ZTI1C
; CHECK:   si8* %3 = bitcast @_ZTI1B
; CHECK:   si8* %4 = bitcast @_ZTI1A
; CHECK:   si8* %5 = ptrshift @_ZTS1D, 3 * 0, 1 * 0
; CHECK:   si8* %6 = bitcast %1
; CHECK:   store @_ZTI1D, {0: %6, 8: %5, 16: 0, 20: 3, 24: %4, 32: -6141, 40: %3, 48: -8189, 56: %2, 64: 2050}, align 1
; CHECK: }
; CHECK: }

@_ZTI1E = linkonce_odr constant { i8*, i8*, i32, i32, i8*, i64, i8*, i64, i8*, i64 } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv121__vmi_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTS1E, i32 0, i32 0), i32 0, i32 3, i8* bitcast ({ i8*, i8* }* @_ZTI1A to i8*), i64 -6141, i8* bitcast ({ i8*, i8* }* @_ZTI1B to i8*), i64 2050, i8* bitcast ({ i8*, i8* }* @_ZTI1C to i8*), i64 4098 }
; CHECK: define {0: si8*, 8: si8*, 16: si32, 20: si32, 24: si8*, 32: si64, 40: si8*, 48: si64, 56: si8*, 64: si64}* @_ZTI1E, init {
; CHECK: #1 !entry !exit {
; CHECK:   si8** %1 = ptrshift @_ZTVN10__cxxabiv121__vmi_class_type_infoE, 8 * 2
; CHECK:   si8* %2 = bitcast @_ZTI1C
; CHECK:   si8* %3 = bitcast @_ZTI1B
; CHECK:   si8* %4 = bitcast @_ZTI1A
; CHECK:   si8* %5 = ptrshift @_ZTS1E, 3 * 0, 1 * 0
; CHECK:   si8* %6 = bitcast %1
; CHECK:   store @_ZTI1E, {0: %6, 8: %5, 16: 0, 20: 3, 24: %4, 32: -6141, 40: %3, 48: 2050, 56: %2, 64: 4098}, align 1
; CHECK: }
; CHECK: }

@_ZTI1F = linkonce_odr constant { i8*, i8*, i32, i32, i8*, i64 } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv121__vmi_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTS1F, i32 0, i32 0), i32 0, i32 1, i8* bitcast ({ i8*, i8* }* @_ZTI1A to i8*), i64 -6141 }
; CHECK: define {0: si8*, 8: si8*, 16: si32, 20: si32, 24: si8*, 32: si64}* @_ZTI1F, init {
; CHECK: #1 !entry !exit {
; CHECK:   si8** %1 = ptrshift @_ZTVN10__cxxabiv121__vmi_class_type_infoE, 8 * 2
; CHECK:   si8* %2 = bitcast @_ZTI1A
; CHECK:   si8* %3 = ptrshift @_ZTS1F, 3 * 0, 1 * 0
; CHECK:   si8* %4 = bitcast %1
; CHECK:   store @_ZTI1F, {0: %4, 8: %3, 16: 0, 20: 1, 24: %2, 32: -6141}, align 1
; CHECK: }
; CHECK: }

@_ZTI1G = linkonce_odr constant { i8*, i8*, i32, i32, i8*, i64 } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv121__vmi_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTS1G, i32 0, i32 0), i32 0, i32 1, i8* bitcast ({ i8*, i8* }* @_ZTI1A to i8*), i64 -6141 }
; CHECK: define {0: si8*, 8: si8*, 16: si32, 20: si32, 24: si8*, 32: si64}* @_ZTI1G, init {
; CHECK: #1 !entry !exit {
; CHECK:   si8** %1 = ptrshift @_ZTVN10__cxxabiv121__vmi_class_type_infoE, 8 * 2
; CHECK:   si8* %2 = bitcast @_ZTI1A
; CHECK:   si8* %3 = ptrshift @_ZTS1G, 3 * 0, 1 * 0
; CHECK:   si8* %4 = bitcast %1
; CHECK:   store @_ZTI1G, {0: %4, 8: %3, 16: 0, 20: 1, 24: %2, 32: -6141}, align 1
; CHECK: }
; CHECK: }

@_ZTI1H = linkonce_odr constant { i8*, i8*, i32, i32, i8*, i64, i8*, i64 } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv121__vmi_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTS1H, i32 0, i32 0), i32 2, i32 2, i8* bitcast ({ i8*, i8*, i32, i32, i8*, i64 }* @_ZTI1F to i8*), i64 2, i8* bitcast ({ i8*, i8*, i32, i32, i8*, i64 }* @_ZTI1G to i8*), i64 4098 }
; CHECK: define {0: si8*, 8: si8*, 16: si32, 20: si32, 24: si8*, 32: si64, 40: si8*, 48: si64}* @_ZTI1H, init {
; CHECK: #1 !entry !exit {
; CHECK:   si8** %1 = ptrshift @_ZTVN10__cxxabiv121__vmi_class_type_infoE, 8 * 2
; CHECK:   si8* %2 = bitcast @_ZTI1G
; CHECK:   si8* %3 = bitcast @_ZTI1F
; CHECK:   si8* %4 = ptrshift @_ZTS1H, 3 * 0, 1 * 0
; CHECK:   si8* %5 = bitcast %1
; CHECK:   store @_ZTI1H, {0: %5, 8: %4, 16: 2, 20: 2, 24: %3, 32: 2, 40: %2, 48: 4098}, align 1
; CHECK: }
; CHECK: }

@_ZTS1A = linkonce_odr constant [3 x i8] c"1A\00"
; CHECK: define [3 x si8]* @_ZTS1A, init {
; CHECK: #1 !entry !exit {
; CHECK:   store @_ZTS1A, [49, 65, 0], align 1
; CHECK: }
; CHECK: }

@_ZTS1B = linkonce_odr constant [3 x i8] c"1B\00"
; CHECK: define [3 x si8]* @_ZTS1B, init {
; CHECK: #1 !entry !exit {
; CHECK:   store @_ZTS1B, [49, 66, 0], align 1
; CHECK: }
; CHECK: }

@_ZTS1C = linkonce_odr constant [3 x i8] c"1C\00"
; CHECK: define [3 x si8]* @_ZTS1C, init {
; CHECK: #1 !entry !exit {
; CHECK:   store @_ZTS1C, [49, 67, 0], align 1
; CHECK: }
; CHECK: }

@_ZTS1D = linkonce_odr constant [3 x i8] c"1D\00"
; CHECK: define [3 x si8]* @_ZTS1D, init {
; CHECK: #1 !entry !exit {
; CHECK:   store @_ZTS1D, [49, 68, 0], align 1
; CHECK: }
; CHECK: }

@_ZTS1E = linkonce_odr constant [3 x i8] c"1E\00"
; CHECK: define [3 x si8]* @_ZTS1E, init {
; CHECK: #1 !entry !exit {
; CHECK:   store @_ZTS1E, [49, 69, 0], align 1
; CHECK: }
; CHECK: }

@_ZTS1F = linkonce_odr constant [3 x i8] c"1F\00"
; CHECK: define [3 x si8]* @_ZTS1F, init {
; CHECK: #1 !entry !exit {
; CHECK:   store @_ZTS1F, [49, 70, 0], align 1
; CHECK: }
; CHECK: }

@_ZTS1G = linkonce_odr constant [3 x i8] c"1G\00"
; CHECK: define [3 x si8]* @_ZTS1G, init {
; CHECK: #1 !entry !exit {
; CHECK:   store @_ZTS1G, [49, 71, 0], align 1
; CHECK: }
; CHECK: }

@_ZTS1H = linkonce_odr constant [3 x i8] c"1H\00"
; CHECK: define [3 x si8]* @_ZTS1H, init {
; CHECK: #1 !entry !exit {
; CHECK:   store @_ZTS1H, [49, 72, 0], align 1
; CHECK: }
; CHECK: }

@_ZTT1D = linkonce_odr unnamed_addr constant [1 x i8*] [i8* bitcast (i8** getelementptr inbounds ({ [4 x i8*] }, { [4 x i8*] }* @_ZTV1D, i32 0, inrange i32 0, i32 4) to i8*)]
; CHECK: define [1 x si8*]* @_ZTT1D, init {
; CHECK: #1 !entry !exit {
; CHECK:   si8** %1 = ptrshift @_ZTV1D, 32 * 0, 1 * 0, 8 * 4
; CHECK:   si8* %2 = bitcast %1
; CHECK:   store @_ZTT1D, [%2], align 1
; CHECK: }
; CHECK: }

@_ZTT1E = linkonce_odr unnamed_addr constant [1 x i8*] [i8* bitcast (i8** getelementptr inbounds ({ [4 x i8*] }, { [4 x i8*] }* @_ZTV1E, i32 0, inrange i32 0, i32 3) to i8*)]
; CHECK: define [1 x si8*]* @_ZTT1E, init {
; CHECK: #1 !entry !exit {
; CHECK:   si8** %1 = ptrshift @_ZTV1E, 32 * 0, 1 * 0, 8 * 3
; CHECK:   si8* %2 = bitcast %1
; CHECK:   store @_ZTT1E, [%2], align 1
; CHECK: }
; CHECK: }

@_ZTT1F = linkonce_odr unnamed_addr constant [1 x i8*] [i8* bitcast (i8** getelementptr inbounds ({ [3 x i8*] }, { [3 x i8*] }* @_ZTV1F, i32 0, inrange i32 0, i32 3) to i8*)]
; CHECK: define [1 x si8*]* @_ZTT1F, init {
; CHECK: #1 !entry !exit {
; CHECK:   si8** %1 = ptrshift @_ZTV1F, 24 * 0, 1 * 0, 8 * 3
; CHECK:   si8* %2 = bitcast %1
; CHECK:   store @_ZTT1F, [%2], align 1
; CHECK: }
; CHECK: }

@_ZTT1G = linkonce_odr unnamed_addr constant [1 x i8*] [i8* bitcast (i8** getelementptr inbounds ({ [3 x i8*] }, { [3 x i8*] }* @_ZTV1G, i32 0, inrange i32 0, i32 3) to i8*)]
; CHECK: define [1 x si8*]* @_ZTT1G, init {
; CHECK: #1 !entry !exit {
; CHECK:   si8** %1 = ptrshift @_ZTV1G, 24 * 0, 1 * 0, 8 * 3
; CHECK:   si8* %2 = bitcast %1
; CHECK:   store @_ZTT1G, [%2], align 1
; CHECK: }
; CHECK: }

@_ZTT1H = linkonce_odr unnamed_addr constant [4 x i8*] [i8* bitcast (i8** getelementptr inbounds ({ [3 x i8*], [3 x i8*] }, { [3 x i8*], [3 x i8*] }* @_ZTV1H, i32 0, inrange i32 0, i32 3) to i8*), i8* bitcast (i8** getelementptr inbounds ({ [3 x i8*] }, { [3 x i8*] }* @_ZTC1H0_1F, i32 0, inrange i32 0, i32 3) to i8*), i8* bitcast (i8** getelementptr inbounds ({ [3 x i8*] }, { [3 x i8*] }* @_ZTC1H16_1G, i32 0, inrange i32 0, i32 3) to i8*), i8* bitcast (i8** getelementptr inbounds ({ [3 x i8*], [3 x i8*] }, { [3 x i8*], [3 x i8*] }* @_ZTV1H, i32 0, inrange i32 1, i32 3) to i8*)]
; CHECK: define [4 x si8*]* @_ZTT1H, init {
; CHECK: #1 !entry !exit {
; CHECK:   si8** %1 = ptrshift @_ZTV1H, 48 * 0, 1 * 24, 8 * 3
; CHECK:   si8** %2 = ptrshift @_ZTC1H16_1G, 24 * 0, 1 * 0, 8 * 3
; CHECK:   si8** %3 = ptrshift @_ZTC1H0_1F, 24 * 0, 1 * 0, 8 * 3
; CHECK:   si8** %4 = ptrshift @_ZTV1H, 48 * 0, 1 * 0, 8 * 3
; CHECK:   si8* %5 = bitcast %1
; CHECK:   si8* %6 = bitcast %2
; CHECK:   si8* %7 = bitcast %3
; CHECK:   si8* %8 = bitcast %4
; CHECK:   store @_ZTT1H, [%8, %7, %6, %5], align 1
; CHECK: }
; CHECK: }

@_ZTV1D = linkonce_odr unnamed_addr constant { [4 x i8*] } { [4 x i8*] [i8* inttoptr (i64 24 to i8*), i8* inttoptr (i64 16 to i8*), i8* null, i8* bitcast ({ i8*, i8*, i32, i32, i8*, i64, i8*, i64, i8*, i64 }* @_ZTI1D to i8*)] }, align 8
; CHECK: define {0: [4 x si8*]}* @_ZTV1D, align 8, init {
; CHECK: #1 !entry !exit {
; CHECK:   si8* %1 = bitcast @_ZTI1D
; CHECK:   si8* %2 = sitoptr 16
; CHECK:   si8* %3 = sitoptr 24
; CHECK:   store @_ZTV1D, {0: [%3, %2, null, %1]}, align 1
; CHECK: }
; CHECK: }

@_ZTV1E = linkonce_odr unnamed_addr constant { [4 x i8*] } { [4 x i8*] [i8* inttoptr (i64 24 to i8*), i8* null, i8* bitcast ({ i8*, i8*, i32, i32, i8*, i64, i8*, i64, i8*, i64 }* @_ZTI1E to i8*), i8* bitcast (void (%struct.E*)* @_ZN1E1fEv to i8*)] }, align 8
; CHECK: define {0: [4 x si8*]}* @_ZTV1E, align 8, init {
; CHECK: #1 !entry !exit {
; CHECK:   si8* %1 = bitcast @_ZN1E1fEv
; CHECK:   si8* %2 = bitcast @_ZTI1E
; CHECK:   si8* %3 = sitoptr 24
; CHECK:   store @_ZTV1E, {0: [%3, null, %2, %1]}, align 1
; CHECK: }
; CHECK: }

@_ZTV1F = linkonce_odr unnamed_addr constant { [3 x i8*] } { [3 x i8*] [i8* inttoptr (i64 12 to i8*), i8* null, i8* bitcast ({ i8*, i8*, i32, i32, i8*, i64 }* @_ZTI1F to i8*)] }, align 8
; CHECK: define {0: [3 x si8*]}* @_ZTV1F, align 8, init {
; CHECK: #1 !entry !exit {
; CHECK:   si8* %1 = bitcast @_ZTI1F
; CHECK:   si8* %2 = sitoptr 12
; CHECK:   store @_ZTV1F, {0: [%2, null, %1]}, align 1
; CHECK: }
; CHECK: }

@_ZTV1G = linkonce_odr unnamed_addr constant { [3 x i8*] } { [3 x i8*] [i8* inttoptr (i64 16 to i8*), i8* null, i8* bitcast ({ i8*, i8*, i32, i32, i8*, i64 }* @_ZTI1G to i8*)] }, align 8
; CHECK: define {0: [3 x si8*]}* @_ZTV1G, align 8, init {
; CHECK: #1 !entry !exit {
; CHECK:   si8* %1 = bitcast @_ZTI1G
; CHECK:   si8* %2 = sitoptr 16
; CHECK:   store @_ZTV1G, {0: [%2, null, %1]}, align 1
; CHECK: }
; CHECK: }

@_ZTV1H = linkonce_odr unnamed_addr constant { [3 x i8*], [3 x i8*] } { [3 x i8*] [i8* inttoptr (i64 32 to i8*), i8* null, i8* bitcast ({ i8*, i8*, i32, i32, i8*, i64, i8*, i64 }* @_ZTI1H to i8*)], [3 x i8*] [i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 -16 to i8*), i8* bitcast ({ i8*, i8*, i32, i32, i8*, i64, i8*, i64 }* @_ZTI1H to i8*)] }, align 8
; CHECK: define {0: [3 x si8*], 24: [3 x si8*]}* @_ZTV1H, align 8, init {
; CHECK: #1 !entry !exit {
; CHECK:   si8* %1 = bitcast @_ZTI1H
; CHECK:   si8* %2 = sitoptr -16
; CHECK:   si8* %3 = sitoptr 16
; CHECK:   si8* %4 = bitcast @_ZTI1H
; CHECK:   si8* %5 = sitoptr 32
; CHECK:   store @_ZTV1H, {0: [%5, null, %4], 24: [%3, %2, %1]}, align 1
; CHECK: }
; CHECK: }

@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
; CHECK: declare si8** @_ZTVN10__cxxabiv117__class_type_infoE

@_ZTVN10__cxxabiv121__vmi_class_type_infoE = external global i8*
; CHECK: declare si8** @_ZTVN10__cxxabiv121__vmi_class_type_infoE

; Function Attrs: noinline nounwind ssp uwtable
define linkonce_odr void @_ZN1DC1Ev(%struct.D*) unnamed_addr #2 align 2 !dbg !76 {
  %2 = alloca %struct.D*, align 8
  store %struct.D* %0, %struct.D** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.D** %2, metadata !81, metadata !DIExpression()), !dbg !83
  %3 = load %struct.D*, %struct.D** %2, align 8
  %4 = bitcast %struct.D* %3 to i8*, !dbg !84
  %5 = getelementptr inbounds i8, i8* %4, i64 16, !dbg !84
  %6 = bitcast i8* %5 to %struct.A*, !dbg !84
  %7 = bitcast %struct.D* %3 to i8*, !dbg !84
  %8 = getelementptr inbounds i8, i8* %7, i64 24, !dbg !84
  %9 = bitcast i8* %8 to %struct.B*, !dbg !84
  %10 = bitcast %struct.D* %3 to i8*, !dbg !84
  %11 = getelementptr inbounds i8, i8* %10, i64 8, !dbg !84
  %12 = bitcast i8* %11 to %struct.C*, !dbg !84
  %13 = bitcast %struct.D* %3 to i32 (...)***, !dbg !84
  %14 = getelementptr inbounds { [4 x i8*] }, { [4 x i8*] }* @_ZTV1D, i32 0, i32 0, i32 4, !dbg !84
  %15 = bitcast i8** %14 to i32 (...)**, !dbg !84
  store i32 (...)** %15, i32 (...)*** %13, align 8, !dbg !84
  ret void, !dbg !84
}
; CHECK: define void @_ZN1DC1Ev({0: si32 (...)**, 8: {0: ui8}, 12: float, 16: {0: si32}, 24: {0: si8*}}* %1) {
; CHECK: #1 !entry !exit {
; CHECK:   {0: si32 (...)**, 8: {0: ui8}, 12: float, 16: {0: si32}, 24: {0: si8*}}** $2 = allocate {0: si32 (...)**, 8: {0: ui8}, 12: float, 16: {0: si32}, 24: {0: si8*}}*, 1, align 8
; CHECK:   store $2, %1, align 8
; CHECK:   {0: si32 (...)**, 8: {0: si8}, 12: float, 16: {0: si32}, 24: {0: si8*}}** %3 = bitcast $2
; CHECK:   {0: si32 (...)**, 8: {0: si8}, 12: float, 16: {0: si32}, 24: {0: si8*}}* %4 = load %3, align 8
; CHECK:   si8* %5 = bitcast %4
; CHECK:   si8* %6 = ptrshift %5, 1 * 16
; CHECK:   {0: si32}* %7 = bitcast %6
; CHECK:   si8* %8 = bitcast %4
; CHECK:   si8* %9 = ptrshift %8, 1 * 24
; CHECK:   {0: si8*}* %10 = bitcast %9
; CHECK:   si8* %11 = bitcast %4
; CHECK:   si8* %12 = ptrshift %11, 1 * 8
; CHECK:   {0: si8}* %13 = bitcast %12
; CHECK:   si32 (...)*** %14 = bitcast %4
; CHECK:   si8** %15 = ptrshift @_ZTV1D, 32 * 0, 1 * 0, 8 * 4
; CHECK:   si32 (...)** %16 = bitcast %15
; CHECK:   store %14, %16, align 8
; CHECK:   return
; CHECK: }
; CHECK: }

; Function Attrs: noinline nounwind ssp uwtable
define linkonce_odr void @_ZN1E1fEv(%struct.E*) unnamed_addr #2 align 2 !dbg !112 {
  %2 = alloca %struct.E*, align 8
  store %struct.E* %0, %struct.E** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.E** %2, metadata !113, metadata !DIExpression()), !dbg !114
  %3 = load %struct.E*, %struct.E** %2, align 8
  ret void, !dbg !115
}
; CHECK: define void @_ZN1E1fEv({0: si32 (...)**, 8: {0: si8*}, 16: {0: ui8}, 20: si32, 24: {0: si32}}* %1) {
; CHECK: #1 !entry !exit {
; CHECK:   {0: si32 (...)**, 8: {0: si8*}, 16: {0: ui8}, 20: si32, 24: {0: si32}}** $2 = allocate {0: si32 (...)**, 8: {0: si8*}, 16: {0: ui8}, 20: si32, 24: {0: si32}}*, 1, align 8
; CHECK:   store $2, %1, align 8
; CHECK:   {0: si32 (...)**, 8: {0: si8*}, 16: {0: si8}, 20: si32, 24: {0: si32}}** %3 = bitcast $2
; CHECK:   {0: si32 (...)**, 8: {0: si8*}, 16: {0: si8}, 20: si32, 24: {0: si32}}* %4 = load %3, align 8
; CHECK:   return
; CHECK: }
; CHECK: }

; Function Attrs: noinline nounwind ssp uwtable
define linkonce_odr void @_ZN1EC1Ev(%struct.E*) unnamed_addr #2 align 2 !dbg !70 {
  %2 = alloca %struct.E*, align 8
  store %struct.E* %0, %struct.E** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.E** %2, metadata !72, metadata !DIExpression()), !dbg !74
  %3 = load %struct.E*, %struct.E** %2, align 8
  %4 = bitcast %struct.E* %3 to i8*, !dbg !75
  %5 = getelementptr inbounds i8, i8* %4, i64 24, !dbg !75
  %6 = bitcast i8* %5 to %struct.A*, !dbg !75
  %7 = bitcast %struct.E* %3 to i8*, !dbg !75
  %8 = getelementptr inbounds i8, i8* %7, i64 8, !dbg !75
  %9 = bitcast i8* %8 to %struct.B*, !dbg !75
  %10 = bitcast %struct.E* %3 to i8*, !dbg !75
  %11 = getelementptr inbounds i8, i8* %10, i64 16, !dbg !75
  %12 = bitcast i8* %11 to %struct.C*, !dbg !75
  %13 = bitcast %struct.E* %3 to i32 (...)***, !dbg !75
  %14 = getelementptr inbounds { [4 x i8*] }, { [4 x i8*] }* @_ZTV1E, i32 0, i32 0, i32 3, !dbg !75
  %15 = bitcast i8** %14 to i32 (...)**, !dbg !75
  store i32 (...)** %15, i32 (...)*** %13, align 8, !dbg !75
  ret void, !dbg !75
}
; CHECK: define void @_ZN1EC1Ev({0: si32 (...)**, 8: {0: si8*}, 16: {0: ui8}, 20: si32, 24: {0: si32}}* %1) {
; CHECK: #1 !entry !exit {
; CHECK:   {0: si32 (...)**, 8: {0: si8*}, 16: {0: ui8}, 20: si32, 24: {0: si32}}** $2 = allocate {0: si32 (...)**, 8: {0: si8*}, 16: {0: ui8}, 20: si32, 24: {0: si32}}*, 1, align 8
; CHECK:   store $2, %1, align 8
; CHECK:   {0: si32 (...)**, 8: {0: si8*}, 16: {0: si8}, 20: si32, 24: {0: si32}}** %3 = bitcast $2
; CHECK:   {0: si32 (...)**, 8: {0: si8*}, 16: {0: si8}, 20: si32, 24: {0: si32}}* %4 = load %3, align 8
; CHECK:   si8* %5 = bitcast %4
; CHECK:   si8* %6 = ptrshift %5, 1 * 24
; CHECK:   {0: si32}* %7 = bitcast %6
; CHECK:   si8* %8 = bitcast %4
; CHECK:   si8* %9 = ptrshift %8, 1 * 8
; CHECK:   {0: si8*}* %10 = bitcast %9
; CHECK:   si8* %11 = bitcast %4
; CHECK:   si8* %12 = ptrshift %11, 1 * 16
; CHECK:   {0: si8}* %13 = bitcast %12
; CHECK:   si32 (...)*** %14 = bitcast %4
; CHECK:   si8** %15 = ptrshift @_ZTV1E, 32 * 0, 1 * 0, 8 * 3
; CHECK:   si32 (...)** %16 = bitcast %15
; CHECK:   store %14, %16, align 8
; CHECK:   return
; CHECK: }
; CHECK: }

; Function Attrs: noinline nounwind ssp uwtable
define linkonce_odr void @_ZN1FC1Ev(%struct.F*) unnamed_addr #2 align 2 !dbg !85 {
  %2 = alloca %struct.F*, align 8
  store %struct.F* %0, %struct.F** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.F** %2, metadata !90, metadata !DIExpression()), !dbg !92
  %3 = load %struct.F*, %struct.F** %2, align 8
  %4 = bitcast %struct.F* %3 to i8*, !dbg !93
  %5 = getelementptr inbounds i8, i8* %4, i64 12, !dbg !93
  %6 = bitcast i8* %5 to %struct.A*, !dbg !93
  %7 = bitcast %struct.F* %3 to i32 (...)***, !dbg !93
  %8 = getelementptr inbounds { [3 x i8*] }, { [3 x i8*] }* @_ZTV1F, i32 0, i32 0, i32 3, !dbg !93
  %9 = bitcast i8** %8 to i32 (...)**, !dbg !93
  store i32 (...)** %9, i32 (...)*** %7, align 8, !dbg !93
  ret void, !dbg !93
}
; CHECK: define void @_ZN1FC1Ev(<{0: si32 (...)**, 8: si32, 12: {0: si32}}>* %1) {
; CHECK: #1 !entry !exit {
; CHECK:   <{0: si32 (...)**, 8: si32, 12: {0: si32}}>** $2 = allocate <{0: si32 (...)**, 8: si32, 12: {0: si32}}>*, 1, align 8
; CHECK:   store $2, %1, align 8
; CHECK:   <{0: si32 (...)**, 8: si32, 12: {0: si32}}>** %3 = bitcast $2
; CHECK:   <{0: si32 (...)**, 8: si32, 12: {0: si32}}>* %4 = load %3, align 8
; CHECK:   si8* %5 = bitcast %4
; CHECK:   si8* %6 = ptrshift %5, 1 * 12
; CHECK:   {0: si32}* %7 = bitcast %6
; CHECK:   si32 (...)*** %8 = bitcast %4
; CHECK:   si8** %9 = ptrshift @_ZTV1F, 24 * 0, 1 * 0, 8 * 3
; CHECK:   si32 (...)** %10 = bitcast %9
; CHECK:   store %8, %10, align 8
; CHECK:   return
; CHECK: }
; CHECK: }

; Function Attrs: noinline nounwind ssp uwtable
define linkonce_odr void @_ZN1FC2Ev(%struct.F*, i8**) unnamed_addr #2 align 2 !dbg !116 {
  %3 = alloca %struct.F*, align 8
  %4 = alloca i8**, align 8
  store %struct.F* %0, %struct.F** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.F** %3, metadata !117, metadata !DIExpression()), !dbg !118
  store i8** %1, i8*** %4, align 8
  call void @llvm.dbg.declare(metadata i8*** %4, metadata !119, metadata !DIExpression()), !dbg !118
  %5 = load %struct.F*, %struct.F** %3, align 8
  %6 = load i8**, i8*** %4, align 8
  %7 = load i8*, i8** %6, align 8, !dbg !122
  %8 = bitcast %struct.F* %5 to i32 (...)***, !dbg !122
  %9 = bitcast i8* %7 to i32 (...)**, !dbg !122
  store i32 (...)** %9, i32 (...)*** %8, align 8, !dbg !122
  ret void, !dbg !122
}
; CHECK: define void @_ZN1FC2Ev(<{0: si32 (...)**, 8: si32, 12: {0: si32}}>* %1, si8** %2) {
; CHECK: #1 !entry !exit {
; CHECK:   <{0: si32 (...)**, 8: si32, 12: {0: si32}}>** $3 = allocate <{0: si32 (...)**, 8: si32, 12: {0: si32}}>*, 1, align 8
; CHECK:   si8*** $4 = allocate si8**, 1, align 8
; CHECK:   store $3, %1, align 8
; CHECK:   store $4, %2, align 8
; CHECK:   <{0: si32 (...)**, 8: si32, 12: {0: si32}}>** %5 = bitcast $3
; CHECK:   <{0: si32 (...)**, 8: si32, 12: {0: si32}}>* %6 = load %5, align 8
; CHECK:   si8** %7 = load $4, align 8
; CHECK:   si8* %8 = load %7, align 8
; CHECK:   si32 (...)*** %9 = bitcast %6
; CHECK:   si32 (...)** %10 = bitcast %8
; CHECK:   store %9, %10, align 8
; CHECK:   return
; CHECK: }
; CHECK: }

; Function Attrs: noinline nounwind ssp uwtable
define linkonce_odr void @_ZN1GC1Ev(%struct.G*) unnamed_addr #2 align 2 !dbg !94 {
  %2 = alloca %struct.G*, align 8
  store %struct.G* %0, %struct.G** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.G** %2, metadata !99, metadata !DIExpression()), !dbg !101
  %3 = load %struct.G*, %struct.G** %2, align 8
  %4 = bitcast %struct.G* %3 to i8*, !dbg !102
  %5 = getelementptr inbounds i8, i8* %4, i64 16, !dbg !102
  %6 = bitcast i8* %5 to %struct.A*, !dbg !102
  %7 = bitcast %struct.G* %3 to i32 (...)***, !dbg !102
  %8 = getelementptr inbounds { [3 x i8*] }, { [3 x i8*] }* @_ZTV1G, i32 0, i32 0, i32 3, !dbg !102
  %9 = bitcast i8** %8 to i32 (...)**, !dbg !102
  store i32 (...)** %9, i32 (...)*** %7, align 8, !dbg !102
  ret void, !dbg !102
}
; CHECK: define void @_ZN1GC1Ev({0: si32 (...)**, 8: si8*, 16: {0: si32}}* %1) {
; CHECK: #1 !entry !exit {
; CHECK:   {0: si32 (...)**, 8: si8*, 16: {0: si32}}** $2 = allocate {0: si32 (...)**, 8: si8*, 16: {0: si32}}*, 1, align 8
; CHECK:   store $2, %1, align 8
; CHECK:   {0: si32 (...)**, 8: si8*, 16: {0: si32}}** %3 = bitcast $2
; CHECK:   {0: si32 (...)**, 8: si8*, 16: {0: si32}}* %4 = load %3, align 8
; CHECK:   si8* %5 = bitcast %4
; CHECK:   si8* %6 = ptrshift %5, 1 * 16
; CHECK:   {0: si32}* %7 = bitcast %6
; CHECK:   si32 (...)*** %8 = bitcast %4
; CHECK:   si8** %9 = ptrshift @_ZTV1G, 24 * 0, 1 * 0, 8 * 3
; CHECK:   si32 (...)** %10 = bitcast %9
; CHECK:   store %8, %10, align 8
; CHECK:   return
; CHECK: }
; CHECK: }

; Function Attrs: noinline nounwind ssp uwtable
define linkonce_odr void @_ZN1GC2Ev(%struct.G*, i8**) unnamed_addr #2 align 2 !dbg !123 {
  %3 = alloca %struct.G*, align 8
  %4 = alloca i8**, align 8
  store %struct.G* %0, %struct.G** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.G** %3, metadata !124, metadata !DIExpression()), !dbg !125
  store i8** %1, i8*** %4, align 8
  call void @llvm.dbg.declare(metadata i8*** %4, metadata !126, metadata !DIExpression()), !dbg !125
  %5 = load %struct.G*, %struct.G** %3, align 8
  %6 = load i8**, i8*** %4, align 8
  %7 = load i8*, i8** %6, align 8, !dbg !127
  %8 = bitcast %struct.G* %5 to i32 (...)***, !dbg !127
  %9 = bitcast i8* %7 to i32 (...)**, !dbg !127
  store i32 (...)** %9, i32 (...)*** %8, align 8, !dbg !127
  ret void, !dbg !127
}
; CHECK: define void @_ZN1GC2Ev({0: si32 (...)**, 8: si8*, 16: {0: si32}}* %1, si8** %2) {
; CHECK: #1 !entry !exit {
; CHECK:   {0: si32 (...)**, 8: si8*, 16: {0: si32}}** $3 = allocate {0: si32 (...)**, 8: si8*, 16: {0: si32}}*, 1, align 8
; CHECK:   si8*** $4 = allocate si8**, 1, align 8
; CHECK:   store $3, %1, align 8
; CHECK:   store $4, %2, align 8
; CHECK:   {0: si32 (...)**, 8: si8*, 16: {0: si32}}** %5 = bitcast $3
; CHECK:   {0: si32 (...)**, 8: si8*, 16: {0: si32}}* %6 = load %5, align 8
; CHECK:   si8** %7 = load $4, align 8
; CHECK:   si8* %8 = load %7, align 8
; CHECK:   si32 (...)*** %9 = bitcast %6
; CHECK:   si32 (...)** %10 = bitcast %8
; CHECK:   store %9, %10, align 8
; CHECK:   return
; CHECK: }
; CHECK: }

; Function Attrs: noinline nounwind ssp uwtable
define linkonce_odr void @_ZN1HC1Ev(%struct.H*) unnamed_addr #2 align 2 !dbg !103 {
  %2 = alloca %struct.H*, align 8
  store %struct.H* %0, %struct.H** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.H** %2, metadata !108, metadata !DIExpression()), !dbg !110
  %3 = load %struct.H*, %struct.H** %2, align 8
  %4 = bitcast %struct.H* %3 to i8*, !dbg !111
  %5 = getelementptr inbounds i8, i8* %4, i64 32, !dbg !111
  %6 = bitcast i8* %5 to %struct.A*, !dbg !111
  %7 = bitcast %struct.H* %3 to %struct.F*, !dbg !111
  %8 = getelementptr inbounds [4 x i8*], [4 x i8*]* @_ZTT1H, i64 0, i64 1, !dbg !111
  call void @_ZN1FC2Ev(%struct.F* %7, i8** %8) #3, !dbg !111
  %9 = bitcast %struct.H* %3 to i8*, !dbg !111
  %10 = getelementptr inbounds i8, i8* %9, i64 16, !dbg !111
  %11 = bitcast i8* %10 to %struct.G*, !dbg !111
  %12 = getelementptr inbounds [4 x i8*], [4 x i8*]* @_ZTT1H, i64 0, i64 2, !dbg !111
  call void @_ZN1GC2Ev(%struct.G* %11, i8** %12) #3, !dbg !111
  %13 = bitcast %struct.H* %3 to i32 (...)***, !dbg !111
  %14 = getelementptr inbounds { [3 x i8*], [3 x i8*] }, { [3 x i8*], [3 x i8*] }* @_ZTV1H, i32 0, i32 0, i32 3, !dbg !111
  %15 = bitcast i8** %14 to i32 (...)**, !dbg !111
  store i32 (...)** %15, i32 (...)*** %13, align 8, !dbg !111
  %16 = bitcast %struct.H* %3 to i8*, !dbg !111
  %17 = getelementptr inbounds i8, i8* %16, i64 16, !dbg !111
  %18 = bitcast i8* %17 to i32 (...)***, !dbg !111
  %19 = getelementptr inbounds { [3 x i8*], [3 x i8*] }, { [3 x i8*], [3 x i8*] }* @_ZTV1H, i32 0, i32 1, i32 3, !dbg !111
  %20 = bitcast i8** %19 to i32 (...)**, !dbg !111
  store i32 (...)** %20, i32 (...)*** %18, align 8, !dbg !111
  ret void, !dbg !111
}
; CHECK: define void @_ZN1HC1Ev({0: <{0: si32 (...)**, 8: si32}>, 16: {0: si32 (...)**, 8: si8*}, 32: {0: si32}}* %1) {
; CHECK: #1 !entry !exit {
; CHECK:   {0: <{0: si32 (...)**, 8: si32}>, 16: {0: si32 (...)**, 8: si8*}, 32: {0: si32}}** $2 = allocate {0: <{0: si32 (...)**, 8: si32}>, 16: {0: si32 (...)**, 8: si8*}, 32: {0: si32}}*, 1, align 8
; CHECK:   store $2, %1, align 8
; CHECK:   {0: <{0: si32 (...)**, 8: si32}>, 16: {0: si32 (...)**, 8: si8*}, 32: {0: si32}}** %3 = bitcast $2
; CHECK:   {0: <{0: si32 (...)**, 8: si32}>, 16: {0: si32 (...)**, 8: si8*}, 32: {0: si32}}* %4 = load %3, align 8
; CHECK:   si8* %5 = bitcast %4
; CHECK:   si8* %6 = ptrshift %5, 1 * 32
; CHECK:   {0: si32}* %7 = bitcast %6
; CHECK:   <{0: si32 (...)**, 8: si32, 12: {0: si32}}>* %8 = bitcast %4
; CHECK:   si8** %9 = ptrshift @_ZTT1H, 32 * 0, 8 * 1
; CHECK:   call @_ZN1FC2Ev(%8, %9)
; CHECK:   si8* %10 = bitcast %4
; CHECK:   si8* %11 = ptrshift %10, 1 * 16
; CHECK:   {0: si32 (...)**, 8: si8*, 16: {0: si32}}* %12 = bitcast %11
; CHECK:   si8** %13 = ptrshift @_ZTT1H, 32 * 0, 8 * 2
; CHECK:   call @_ZN1GC2Ev(%12, %13)
; CHECK:   si32 (...)*** %14 = bitcast %4
; CHECK:   si8** %15 = ptrshift @_ZTV1H, 48 * 0, 1 * 0, 8 * 3
; CHECK:   si32 (...)** %16 = bitcast %15
; CHECK:   store %14, %16, align 8
; CHECK:   si8* %17 = bitcast %4
; CHECK:   si8* %18 = ptrshift %17, 1 * 16
; CHECK:   si32 (...)*** %19 = bitcast %18
; CHECK:   si8** %20 = ptrshift @_ZTV1H, 48 * 0, 1 * 24, 8 * 3
; CHECK:   si32 (...)** %21 = bitcast %20
; CHECK:   store %19, %21, align 8
; CHECK:   return
; CHECK: }
; CHECK: }

; Function Attrs: noinline norecurse nounwind ssp uwtable
define i32 @main() #0 !dbg !8 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.E, align 8
  %3 = alloca %struct.D, align 8
  %4 = alloca %struct.F, align 8
  %5 = alloca %struct.G, align 8
  %6 = alloca %struct.H, align 8
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata %struct.E* %2, metadata !12, metadata !DIExpression()), !dbg !38
  call void @_ZN1EC1Ev(%struct.E* %2) #3, !dbg !38
  call void @llvm.dbg.declare(metadata %struct.D* %3, metadata !39, metadata !DIExpression()), !dbg !48
  call void @_ZN1DC1Ev(%struct.D* %3) #3, !dbg !48
  call void @llvm.dbg.declare(metadata %struct.F* %4, metadata !49, metadata !DIExpression()), !dbg !55
  call void @_ZN1FC1Ev(%struct.F* %4) #3, !dbg !55
  call void @llvm.dbg.declare(metadata %struct.G* %5, metadata !56, metadata !DIExpression()), !dbg !62
  call void @_ZN1GC1Ev(%struct.G* %5) #3, !dbg !62
  call void @llvm.dbg.declare(metadata %struct.H* %6, metadata !63, metadata !DIExpression()), !dbg !68
  call void @_ZN1HC1Ev(%struct.H* %6) #3, !dbg !68
  ret i32 0, !dbg !69
}
; CHECK: define si32 @main() {
; CHECK: #1 !entry !exit {
; CHECK:   si32* $1 = allocate si32, 1, align 4
; CHECK:   {0: si32 (...)**, 8: {0: si8*}, 16: {0: ui8}, 20: si32, 24: {0: si32}}* $2 = allocate {0: si32 (...)**, 8: {0: si8*}, 16: {0: ui8}, 20: si32, 24: {0: si32}}, 1, align 8
; CHECK:   {0: si32 (...)**, 8: {0: ui8}, 12: float, 16: {0: si32}, 24: {0: si8*}}* $3 = allocate {0: si32 (...)**, 8: {0: ui8}, 12: float, 16: {0: si32}, 24: {0: si8*}}, 1, align 8
; CHECK:   <{0: si32 (...)**, 8: si32, 12: {0: si32}}>* $4 = allocate <{0: si32 (...)**, 8: si32, 12: {0: si32}}>, 1, align 8
; CHECK:   {0: si32 (...)**, 8: si8*, 16: {0: si32}}* $5 = allocate {0: si32 (...)**, 8: si8*, 16: {0: si32}}, 1, align 8
; CHECK:   {0: <{0: si32 (...)**, 8: si32}>, 16: {0: si32 (...)**, 8: si8*}, 32: {0: si32}}* $6 = allocate {0: <{0: si32 (...)**, 8: si32}>, 16: {0: si32 (...)**, 8: si8*}, 32: {0: si32}}, 1, align 8
; CHECK:   store $1, 0, align 4
; CHECK:   call @_ZN1EC1Ev($2)
; CHECK:   call @_ZN1DC1Ev($3)
; CHECK:   call @_ZN1FC1Ev($4)
; CHECK:   call @_ZN1GC1Ev($5)
; CHECK:   call @_ZN1HC1Ev($6)
; CHECK:   return 0
; CHECK: }
; CHECK: }

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { noinline norecurse nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { noinline nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 7.0.0 (tags/RELEASE_700/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "virtual-inheritance.cpp", directory: "/Users/marthaud/ikos/ikos-git/frontend/llvm/test/regression/import/no_optimization")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
!8 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 33, type: !9, isLocal: false, isDefinition: true, scopeLine: 33, flags: DIFlagPrototyped, isOptimized: false, unit: !0, retainedNodes: !2)
!9 = !DISubroutineType(types: !10)
!10 = !{!11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "e", scope: !8, file: !1, line: 34, type: !13)
!13 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "E", file: !1, line: 13, size: 256, flags: DIFlagTypePassByReference, elements: !14, vtableHolder: !13, identifier: "_ZTS1E")
!14 = !{!15, !19, !25, !30, !33, !34}
!15 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !13, baseType: !16, offset: 24, flags: DIFlagVirtual, extraData: i32 0)
!16 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "A", file: !1, line: 1, size: 32, flags: DIFlagTypePassByValue | DIFlagTrivial, elements: !17, identifier: "_ZTS1A")
!17 = !{!18}
!18 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !16, file: !1, line: 2, baseType: !11, size: 32)
!19 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !13, baseType: !20, offset: 64, extraData: i32 0)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "B", file: !1, line: 5, size: 64, flags: DIFlagTypePassByValue | DIFlagTrivial, elements: !21, identifier: "_ZTS1B")
!21 = !{!22}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !20, file: !1, line: 6, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!25 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !13, baseType: !26, offset: 128, extraData: i32 0)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "C", file: !1, line: 9, size: 8, flags: DIFlagTypePassByValue | DIFlagTrivial, elements: !27, identifier: "_ZTS1C")
!27 = !{!28}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !26, file: !1, line: 10, baseType: !29, size: 8)
!29 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$E", scope: !1, file: !1, baseType: !31, size: 64, flags: DIFlagArtificial)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "__vtbl_ptr_type", baseType: !9, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !13, file: !1, line: 14, baseType: !11, size: 32, offset: 160)
!34 = !DISubprogram(name: "f", linkageName: "_ZN1E1fEv", scope: !13, file: !1, line: 16, type: !35, isLocal: false, isDefinition: false, scopeLine: 16, containingType: !13, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 0, flags: DIFlagPrototyped, isOptimized: false)
!35 = !DISubroutineType(types: !36)
!36 = !{null, !37}
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!38 = !DILocation(line: 34, column: 5, scope: !8)
!39 = !DILocalVariable(name: "d", scope: !8, file: !1, line: 35, type: !40)
!40 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "D", file: !1, line: 19, size: 256, flags: DIFlagTypePassByReference, elements: !41, vtableHolder: !40, identifier: "_ZTS1D")
!41 = !{!42, !43, !44, !45, !46}
!42 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !40, baseType: !16, offset: 24, flags: DIFlagVirtual, extraData: i32 0)
!43 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !40, baseType: !20, offset: 32, flags: DIFlagVirtual, extraData: i32 0)
!44 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !40, baseType: !26, offset: 64, extraData: i32 0)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$D", scope: !1, file: !1, baseType: !31, size: 64, flags: DIFlagArtificial)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !40, file: !1, line: 20, baseType: !47, size: 32, offset: 96)
!47 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!48 = !DILocation(line: 35, column: 5, scope: !8)
!49 = !DILocalVariable(name: "f", scope: !8, file: !1, line: 36, type: !50)
!50 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "F", file: !1, line: 23, size: 128, flags: DIFlagTypePassByReference, elements: !51, vtableHolder: !50, identifier: "_ZTS1F")
!51 = !{!52, !53, !54}
!52 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !50, baseType: !16, offset: 24, flags: DIFlagVirtual, extraData: i32 0)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$F", scope: !1, file: !1, baseType: !31, size: 64, flags: DIFlagArtificial)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !50, file: !1, line: 24, baseType: !11, size: 32, offset: 64)
!55 = !DILocation(line: 36, column: 5, scope: !8)
!56 = !DILocalVariable(name: "g", scope: !8, file: !1, line: 37, type: !57)
!57 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "G", file: !1, line: 27, size: 192, flags: DIFlagTypePassByReference, elements: !58, vtableHolder: !57, identifier: "_ZTS1G")
!58 = !{!59, !60, !61}
!59 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !57, baseType: !16, offset: 24, flags: DIFlagVirtual, extraData: i32 0)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$G", scope: !1, file: !1, baseType: !31, size: 64, flags: DIFlagArtificial)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !57, file: !1, line: 28, baseType: !23, size: 64, offset: 64)
!62 = !DILocation(line: 37, column: 5, scope: !8)
!63 = !DILocalVariable(name: "h", scope: !8, file: !1, line: 38, type: !64)
!64 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "H", file: !1, line: 31, size: 320, flags: DIFlagTypePassByReference, elements: !65, vtableHolder: !50, identifier: "_ZTS1H")
!65 = !{!66, !67}
!66 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !64, baseType: !50, extraData: i32 0)
!67 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !64, baseType: !57, offset: 128, extraData: i32 0)
!68 = !DILocation(line: 38, column: 5, scope: !8)
!69 = !DILocation(line: 39, column: 3, scope: !8)
!70 = distinct !DISubprogram(name: "E", linkageName: "_ZN1EC1Ev", scope: !13, file: !1, line: 13, type: !35, isLocal: false, isDefinition: true, scopeLine: 13, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !71, retainedNodes: !2)
!71 = !DISubprogram(name: "E", scope: !13, type: !35, isLocal: false, isDefinition: false, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false)
!72 = !DILocalVariable(name: "this", arg: 1, scope: !70, type: !73, flags: DIFlagArtificial | DIFlagObjectPointer)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!74 = !DILocation(line: 0, scope: !70)
!75 = !DILocation(line: 13, column: 8, scope: !70)
!76 = distinct !DISubprogram(name: "D", linkageName: "_ZN1DC1Ev", scope: !40, file: !1, line: 19, type: !77, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !80, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{null, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!80 = !DISubprogram(name: "D", scope: !40, type: !77, isLocal: false, isDefinition: false, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false)
!81 = !DILocalVariable(name: "this", arg: 1, scope: !76, type: !82, flags: DIFlagArtificial | DIFlagObjectPointer)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!83 = !DILocation(line: 0, scope: !76)
!84 = !DILocation(line: 19, column: 8, scope: !76)
!85 = distinct !DISubprogram(name: "F", linkageName: "_ZN1FC1Ev", scope: !50, file: !1, line: 23, type: !86, isLocal: false, isDefinition: true, scopeLine: 23, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !89, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{null, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!89 = !DISubprogram(name: "F", scope: !50, type: !86, isLocal: false, isDefinition: false, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false)
!90 = !DILocalVariable(name: "this", arg: 1, scope: !85, type: !91, flags: DIFlagArtificial | DIFlagObjectPointer)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!92 = !DILocation(line: 0, scope: !85)
!93 = !DILocation(line: 23, column: 8, scope: !85)
!94 = distinct !DISubprogram(name: "G", linkageName: "_ZN1GC1Ev", scope: !57, file: !1, line: 27, type: !95, isLocal: false, isDefinition: true, scopeLine: 27, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !98, retainedNodes: !2)
!95 = !DISubroutineType(types: !96)
!96 = !{null, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!98 = !DISubprogram(name: "G", scope: !57, type: !95, isLocal: false, isDefinition: false, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false)
!99 = !DILocalVariable(name: "this", arg: 1, scope: !94, type: !100, flags: DIFlagArtificial | DIFlagObjectPointer)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!101 = !DILocation(line: 0, scope: !94)
!102 = !DILocation(line: 27, column: 8, scope: !94)
!103 = distinct !DISubprogram(name: "H", linkageName: "_ZN1HC1Ev", scope: !64, file: !1, line: 31, type: !104, isLocal: false, isDefinition: true, scopeLine: 31, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !107, retainedNodes: !2)
!104 = !DISubroutineType(types: !105)
!105 = !{null, !106}
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!107 = !DISubprogram(name: "H", scope: !64, type: !104, isLocal: false, isDefinition: false, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false)
!108 = !DILocalVariable(name: "this", arg: 1, scope: !103, type: !109, flags: DIFlagArtificial | DIFlagObjectPointer)
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!110 = !DILocation(line: 0, scope: !103)
!111 = !DILocation(line: 31, column: 8, scope: !103)
!112 = distinct !DISubprogram(name: "f", linkageName: "_ZN1E1fEv", scope: !13, file: !1, line: 16, type: !35, isLocal: false, isDefinition: true, scopeLine: 16, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !34, retainedNodes: !2)
!113 = !DILocalVariable(name: "this", arg: 1, scope: !112, type: !73, flags: DIFlagArtificial | DIFlagObjectPointer)
!114 = !DILocation(line: 0, scope: !112)
!115 = !DILocation(line: 16, column: 21, scope: !112)
!116 = distinct !DISubprogram(name: "F", linkageName: "_ZN1FC2Ev", scope: !50, file: !1, line: 23, type: !86, isLocal: false, isDefinition: true, scopeLine: 23, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !89, retainedNodes: !2)
!117 = !DILocalVariable(name: "this", arg: 1, scope: !116, type: !91, flags: DIFlagArtificial | DIFlagObjectPointer)
!118 = !DILocation(line: 0, scope: !116)
!119 = !DILocalVariable(name: "vtt", arg: 2, scope: !116, type: !120, flags: DIFlagArtificial)
!120 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !121, size: 64)
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!122 = !DILocation(line: 23, column: 8, scope: !116)
!123 = distinct !DISubprogram(name: "G", linkageName: "_ZN1GC2Ev", scope: !57, file: !1, line: 27, type: !95, isLocal: false, isDefinition: true, scopeLine: 27, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !98, retainedNodes: !2)
!124 = !DILocalVariable(name: "this", arg: 1, scope: !123, type: !100, flags: DIFlagArtificial | DIFlagObjectPointer)
!125 = !DILocation(line: 0, scope: !123)
!126 = !DILocalVariable(name: "vtt", arg: 2, scope: !123, type: !120, flags: DIFlagArtificial)
!127 = !DILocation(line: 27, column: 8, scope: !123)
