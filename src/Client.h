#ifndef CLIENT_H
#define CLIENT_H

#include <iostream>
#include <string>
//#include <glm/glm.hpp>

#ifdef __linux__
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#define CLOSESOCKET close
#endif

#ifdef _WIN32
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <winsock2.h>
#include <ws2tcpip.h>
#pragma comment (lib, "Secur32.lib")
#pragma comment (lib, "Ws2_32.lib")
#define CLOSESOCKET closesocket
#endif

//#include <mysql.h>

#include <vector>
#include <mutex>
#include <thread>

#define MAX_PACKET_LENGTH 1024
#define MAX_CLIENTS 256
#define PORT 8888
#define CLIENT_SUCCESS 0

namespace Client
{
	int connectToServer(std::string ip);
	int sendToServer();
	int recvFromServer();
	int disconnectFromServer();
}

#endif
