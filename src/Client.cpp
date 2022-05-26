#include "Client.h"

#ifdef _WIN32
WSADATA wsaData;
#endif

int connectSocket;
char recvbuf[MAX_PACKET_LENGTH];
int recvbuflen;


int Client::connectToServer(std::string ip)
{
#ifdef _WIN32
	if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0)
	{
		return 1;
	}
#endif

	connectSocket = socket(AF_INET, SOCK_STREAM, 0);
	if (connectSocket == INVALID_SOCKET)
	{
		return 1;
	}

	sockaddr_in client;
	client.sin_family = AF_INET;
	client.sin_port = htons(PORT);
	inet_pton(AF_INET, ip.c_str(), &client.sin_addr);

	if (connect(connectSocket, (sockaddr*)&client, sizeof(client)) == SOCKET_ERROR)
	{
		return 1;
	}



	return 0;
}

int Client::sendToServer()
{
	return 0;
}

int Client::recvFromServer()
{
	return 0;
}

int Client::disconnectFromServer()
{
	closesocket(connectSocket);
#ifdef _WIN32
	WSACleanup();
#endif
	return 0;
}
