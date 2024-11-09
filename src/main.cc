#include <print>

int main(int argc, char **argv)
{
	if(argc < 2)
	{
		std::println("Hello World");
	} else {
		std::println("Hello {}", argv[1]);
	}
}
