using System;
using System.IO;

/// <summary>
/// 网络消息处理
/// 负责网络消息粘包，分发
/// </summary>
namespace GK_Framework
{
    //消息构成 =【消息总长度(4byte) + 消息类型(4byte) + 数据长度(4byte) + 数据(Nbyte)】
    public class MessageHandler
    {
        private const int MAX_BUFFER_SZIE = 2046;

        private byte[] mBuffer = null;

        private int mDataSize = 0;
        private int mTempMsgLength = 0;

        private Action<int, byte[]> mHandlerEvent = null;

        public MessageHandler(Action<int, byte[]> handlerEvent)
        {
            mBuffer = new byte[MAX_BUFFER_SZIE];
            mDataSize = 0;
            mHandlerEvent = handlerEvent;
        }

        public void ClearBuffer()
        {
            mDataSize = 0;
            mBuffer = null;
        }

        /// <summary>
        /// 是否是完整消息
        /// </summary>
        /// <param name="data"></param>
        /// <param name="completeLength"></param>
        /// <returns></returns>
        public bool IsCompleteMsg(byte[] data, int completeLength)
        {
            using (MemoryStream memoryStream = new MemoryStream(data))
            {
                BinaryReader binaryReader = new BinaryReader(memoryStream);
                mTempMsgLength = binaryReader.ReadInt32();
                if (mTempMsgLength >= completeLength)
                    return true;
                else
                    return false;
            }
        }

        /// <summary>
        /// 消息处理
        /// </summary>
        /// <param name="data"></param>
        /// <param name="count"></param>
        public void HandlerMessage(byte[] data, int count)
        {
            if (IsCompleteMsg(data, count))
            {
                using (MemoryStream memoryStream = new MemoryStream(data))
                {
                    BinaryReader binaryReader = new BinaryReader(memoryStream);
                    int maxLength = binaryReader.ReadInt32();
                    int messageType = binaryReader.ReadInt32();
                    int messageSize = binaryReader.ReadInt32();
                    byte[] messageByte = binaryReader.ReadBytes(messageSize);
                    if (mHandlerEvent != null)
                    {
                        mHandlerEvent(messageType, messageByte);
                    }
                }
            }
            else
            {
                Array.Copy(data, mBuffer, count);
                mDataSize += count;
                if (IsCompleteMsg(mBuffer, mDataSize))
                {
                    using (MemoryStream memoryStream = new MemoryStream(mBuffer))
                    {
                        BinaryReader binaryReader = new BinaryReader(memoryStream);
                        int maxLength = binaryReader.ReadInt32();
                        int messageType = binaryReader.ReadInt32();
                        int messageSize = binaryReader.ReadInt32();
                        byte[] messageByte = binaryReader.ReadBytes(messageSize);
                        if (mHandlerEvent != null)
                        {
                            mHandlerEvent(messageType, messageByte);
                        }
                    }
                    mDataSize -= count;
                }
            }
        }
    }
}
