int func4(int rdi) {
	long rdi2 = 0xc;
	int eax3;

	if (*(int *)&rdi <= 1) {
		return 1;
	} else {
		*(int *)&rdi2 = (int)(rdi + -1);
		*((int *)&rdi2 + 1) = 0;
		eax3 = func4(rdi2);
		return eax3 * *(int *)&rdi;
	}
}
