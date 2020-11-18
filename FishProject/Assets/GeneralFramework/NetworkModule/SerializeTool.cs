using ProtoBuf;
using System;
using System.IO;
using UnityEngine;

namespace GK.Network
{
    /// <summary>
    /// 序列化工具
    /// </summary>
    public class SerializeTool
    {
        /// <summary>
        /// 消息序列化转二进制
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="meg"></param>
        /// <returns></returns>
        public static byte[] Serizelize<T>(T meg)
        {
            try
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    Serializer.Serialize<T>(ms, meg);
                    return ms.ToArray();
                }
            }
            catch (Exception ex)
            {
                Debug.LogError(">>>>>>>序列化失败" + ex.ToString());
                return null;
            }
        }

        /// <summary>
        /// 反序列化 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="msg"></param>
        /// <returns></returns>
        public static T DeSerialize<T>(byte[] msg)
        {
            T result = default(T);
            try
            {
                using (MemoryStream ms = new MemoryStream(msg))
                {
                    result = Serializer.Deserialize<T>(ms);
                    return result;
                }
            }
            catch (Exception ex)
            {
                Debug.LogError(">>>>>>>反序列化失败" + ex.ToString());
                return result;
            }
        }
    }
}
