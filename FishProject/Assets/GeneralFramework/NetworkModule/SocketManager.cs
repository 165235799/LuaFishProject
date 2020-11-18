using System;
using System.Net;
using System.Net.Sockets;
using System.Threading;
using UnityEngine;

/// <summary>
/// 网络管理
/// </summary>
namespace GK_Framework
{
    public class SocketManager
    {
        private const int BUFFER_SIZE = 1024;
        private string mIPAddress = string.Empty;
        private int mPort = 0;

        private byte[] mBuffer = null;
        private Socket mClientSocket = null;
        private MessageHandler mMessageHandler = null;
        private Thread mConnectThread = null;

        public void SetSocketData(string ip, int prot)
        {
            mIPAddress = ip;
            mPort = prot;
            mMessageHandler = new MessageHandler(ServerMessageForwarding);
        }

        /// <summary>
        /// 分发服务器完整消息
        /// </summary>
        /// <param name="msgType">消息标志</param>
        /// <param name="msg">数据</param>
        private void ServerMessageForwarding(int msgType, byte[] msg)
        {
            
        }

        #region 连接服务器
        
        /// <summary>
        /// 连接服务器
        /// </summary>
        public void ConnectServer()
        {
            try
            {
                IPAddress[] address = Dns.GetHostAddresses(mIPAddress);
                if (address.Length == 0)
                {
                    Debug.LogError("----获取不到地址");
                    return;
                }

                //初始化连接
                if (address[0].AddressFamily == AddressFamily.InterNetworkV6)
                    mClientSocket = new Socket(AddressFamily.InterNetworkV6, SocketType.Stream, ProtocolType.Tcp);
                else
                    mClientSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

                mClientSocket.SendTimeout = 1000;
                mClientSocket.ReceiveTimeout = 1000;
                mClientSocket.NoDelay = true;
                mClientSocket.BeginConnect(address, mPort, ConnectCallback, mClientSocket);

            }
            catch (Exception e)
            {
                CloseSocket();
            }
        }

        /// <summary>
        /// 连接服务器成功回调
        /// </summary>
        /// <param name="ar"></param>
        private void ConnectCallback(IAsyncResult ar)
        {
            try
            {
                mClientSocket.EndConnect(ar);
            }
            catch(Exception e)
            {
                CloseSocket();
            }
        }

        #endregion

        #region 接受消息

        private void Receive()
        {
            try
            {
                mBuffer = new byte[BUFFER_SIZE];
                mClientSocket.BeginReceive(mBuffer, 0, mBuffer.Length, SocketFlags.None, ReceiveCallBack, mClientSocket);
            }
            catch(Exception ex)
            {
                CloseSocket();
            }
        }

        private void ReceiveCallBack(IAsyncResult ar)
        {
            int count = mClientSocket.EndReceive(ar);
            if(count > 0)
            {
                mMessageHandler.HandlerMessage(mBuffer, count);
            }
            Receive();
        }

        #endregion

        #region 发送消息

        public void SendMessage(byte[] data)
        {
            SendMessageToServer(data);
        }

        private void SendMessageToServer(byte[] data)
        {
            if(mClientSocket != null && mClientSocket.Connected)
            {
                mClientSocket.BeginSend(data, 0, data.Length, SocketFlags.None, SendCallback, mClientSocket);
            }
        }

        private void SendCallback(IAsyncResult ar)
        {
            try
            {
                int count = mClientSocket.EndSend(ar);
                Debug.Log("向服务器发送的字节数EndSend" + count);
            }
            catch (Exception e)
            {
                CloseSocket();
            }
        }

        #endregion

        /// <summary>
        /// 断开连接
        /// </summary>
        private void CloseSocket()
        {
            if(mConnectThread != null)
            {
                mConnectThread.Abort();
                mConnectThread = null;
            }

            if(mClientSocket != null)
            {
                mClientSocket.Close();
                mClientSocket = null;
            }
        }
    }
}

