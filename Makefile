EXEEXT_FOR_BUILD =

# Generate ECC files, with roughly 16 KB of tables per curve.

# Some reasonable choices for 192:
# k =  8, c =  6, S = 256, T =  40 ( 32 A +  8 D) 12 KB
# k = 14, c =  7, S = 256, T =  42 ( 28 A + 14 D) 12 KB
# k = 11, c =  6, S = 192, T =  44 ( 33 A + 11 D)  9 KB
# k = 16, c =  6, S = 128, T =  48 ( 32 A + 16 D)  6 KB
ecc-secp192r1.h: eccdata.stamp
	./eccdata$(EXEEXT_FOR_BUILD) secp192r1 8 6 $(NUMB_BITS) > $@T && mv $@T $@

# Some reasonable choices for 224:
# k = 16, c =  7, S = 256, T =  48 ( 32 A + 16 D) ~16 KB
# k = 10, c =  6, S = 256, T =  50 ( 40 A + 10 D) ~16 KB
# k = 13, c =  6, S = 192, T =  52 ( 39 A + 13 D) ~12 KB
# k =  9, c =  5, S = 160, T =  54 ( 45 A +  9 D) ~10 KB
ecc-secp224r1.h: eccdata.stamp
	./eccdata$(EXEEXT_FOR_BUILD) secp224r1 16 7 $(NUMB_BITS) > $@T && mv $@T $@

# Some reasonable choices for 256:
# k =  9, c =  6, S = 320, T =  54 ( 45 A +  9 D) 20 KB
# k = 11, c =  6, S = 256, T =  55 ( 44 A + 11 D) 16 KB
# k = 19, c =  7, S = 256, T =  57 ( 38 A + 19 D) 16 KB
# k = 15, c =  6, S = 192, T =  60 ( 45 A + 15 D) 12 KB
ecc-secp256r1.h: eccdata.stamp
	./eccdata$(EXEEXT_FOR_BUILD) secp256r1 11 6 $(NUMB_BITS) > $@T && mv $@T $@

# Some reasonable choices for 384:
# k = 16, c =  6, S = 256, T =  80 ( 64 A + 16 D) 24 KB
# k = 28, c =  7, S = 256, T =  84 ( 56 A + 28 D) 24 KB
# k = 11, c =  5, S = 224, T =  88 ( 77 A + 11 D) 21 KB
# k = 22, c =  6, S = 192, T =  88 ( 66 A + 22 D) 18 KB
# k = 13, c =  5, S = 192, T =  91 ( 78 A + 13 D) 18 KB
# k = 16, c =  5, S = 160, T =  96 ( 80 A + 16 D) 15 KB
# k = 32, c =  6, S = 128, T =  96 ( 64 A + 32 D) 12 KB
ecc-secp384r1.h: eccdata.stamp
	./eccdata$(EXEEXT_FOR_BUILD) secp384r1 32 6 $(NUMB_BITS) > $@T && mv $@T $@

# Some reasonable choices for 521:
# k = 29, c =  6, S = 192, T = 116 ( 87 A + 29 D) ~27 KB
# k = 21, c =  5, S = 160, T = 126 (105 A + 21 D) ~23 KB
# k = 44, c =  6, S = 128, T = 132 ( 88 A + 44 D) ~18 KB
# k = 35, c =  5, S =  96, T = 140 (105 A + 35 D) ~14 KB
ecc-secp521r1.h: eccdata.stamp
	./eccdata$(EXEEXT_FOR_BUILD) secp521r1 44 6 $(NUMB_BITS) > $@T && mv $@T $@

# Parameter choices mostly the same as for ecc-secp256r1.h.
ecc-curve25519.h: eccdata.stamp
	./eccdata$(EXEEXT_FOR_BUILD) curve25519 11 6 $(NUMB_BITS) > $@T && mv $@T $@

ecc-curve448.h: eccdata.stamp
	./eccdata$(EXEEXT_FOR_BUILD) curve448 38 6 $(NUMB_BITS) > $@T && mv $@T $@

# Some reasonable choices for 256:
# k =  9, c =  6, S = 320, T =  54 ( 45 A +  9 D) 20 KB
# k = 11, c =  6, S = 256, T =  55 ( 44 A + 11 D) 16 KB
# k = 19, c =  7, S = 256, T =  57 ( 38 A + 19 D) 16 KB
# k = 15, c =  6, S = 192, T =  60 ( 45 A + 15 D) 12 KB
ecc-gost-gc256b.h: eccdata.stamp
	./eccdata$(EXEEXT_FOR_BUILD) gost_gc256b 11 6 $(NUMB_BITS) > $@T && mv $@T $@

# Some reasonable choices for 512:
# k = 22, c =  6, S = 256, T = 110 ( 88 A + 22 D) 32 KB
# k = 29, c =  6, S = 192, T = 116 ( 87 A + 29 D) 24 KB
# k = 21, c =  5, S = 160, T = 126 (105 A + 21 D) 20 KB
# k = 43, c =  6, S = 128, T = 129 ( 86 A + 43 D) 16 KB
# k = 35, c =  5, S =  96, T = 140 (105 A + 35 D) 12 KB
ecc-gost-gc512a.h: eccdata.stamp
	./eccdata$(EXEEXT_FOR_BUILD) gost_gc512a 43 6 $(NUMB_BITS) > $@T && mv $@T $@

all: ecc-secp192r1.h ecc-secp224r1.h ecc-secp256r1.h ecc-secp384r1.h ecc-secp521r1.h \
  ecc-curve25519.h ecc-curve448.h ecc-gost-gc256b.h ecc-gost-gc512a.h
