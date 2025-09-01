#executable: distance.o main.o
#	ld -o executable *.o /usr/lib/x86_64-linux-gnu/crt1.o -lm -lc -dynamic-linker=/lib64/ld-linux-x86-64.so.2
#
#distance.o: distance.c
#	gcc -c -o distance.o distance.c
#main.o : main.c
#	gcc -c -o main.o main.c

#qemu_test:
#	qemu-system-aarch64 \
#	-kernel linux/arch/arm64/boot/Image \
#	-nographic -M virt -cpu cortex-a72 \
#	-m 2G \
#	-smp 2
QEMU_run:
	qemu-system-aarch64 \
	-kernel linux/arch/arm64/boot/Image \
	-drive format=raw,file=buildroot/output/images/rootfs.ext4,if=virtio \
	-append "root=/dev/vda console=ttyAMA0 nokaslr" \
	-nographic -M virt -cpu cortex-a72 \
	-m 2G \
	-smp 2


debug:
	qemu-system-aarch64 \
    -kernel linux/arch/arm64/boot/Image \
    -drive format=raw,file=buildroot/output/images/rootfs.ext4,if=virtio \
    -append "root=/dev/vda console=ttyAMA0 nokaslr" \
    -nographic -M virt -cpu cortex-a72 \
    -m 2G \
    -smp 2 \
	-s -S









