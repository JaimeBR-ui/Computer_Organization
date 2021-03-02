#include <stdio.h>

int punct(char [], int);

int main(void)
{
	char str[100];
	printf("Enter the string: ");
	gets(str);
	int punctuation = punct(str, 100);
	printf("%d\n", punctuation);
	return 0;
}

int punct(char s[], int length)
{
	int count = 0, res = 0;
	while (count < length)
	{
		char c = s[count++];
		switch (c)
		{
			case '\0':
				break;
			case ',':
				res++;
				break;
			case '.':
				res++;
				break;
			case '-':
				res++;
				break;
			case '(':
				res++;
				break;
			case ')':
				res++;
				break;
			case ':':
				res++;
				break;
			case '?':
				res++;
				break;
			case '\'':
				res++;
				break;
			case ';':
				res++;
				break;
			case '!':
				res++;
				break;
			case '"':
				res++;
				break;
		}
	}
	return res;
}
