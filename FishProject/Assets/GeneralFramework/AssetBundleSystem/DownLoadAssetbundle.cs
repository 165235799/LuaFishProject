using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Net;
using UnityEngine;
using UnityEngine.Networking;

public class DownLoadAssetbundle: MonoBehaviour
{
    private const string AssetServerUrl = @"http://127.0.0.1/AssetBundle/";

    private const string MD5FileName = "md5File.txt";
    private const string AssetbundleFileName = "Android";

    //服务器MD5文件(文件名， 文件MD5)
    private Dictionary<string, string> mServerAssetDict = new Dictionary<string, string>();
    //本地MD5文件(文件名, 文件MD5)
    private Dictionary<string, string> mLocalAssetDict = new Dictionary<string, string>();
    //需要下载的文件
    private List<string> mNeedDownFileDict = new List<string>();
    //需要删除的文件
    private List<string> mNeddDeleteFileDict = new List<string>();

    #region 路径管理

    /// <summary>
    /// 获取服务器上文件名完整路径
    /// </summary>
    /// <param name="url"></param>
    /// <param name="fileName"></param>
    /// <returns></returns>
    private string GetOnlineAssetbundleName(string url, string fileName)
    {
        return string.Format("{0}{1}", url, fileName);
    }

    /// <summary>
    /// 获取热更服务器路径
    /// </summary>
    /// <param name="playform"></param>
    /// <returns></returns>
    private string GetAssetServerUrl(RuntimePlatform playform)
    {
        string url = string.Empty;
        if (Application.platform == RuntimePlatform.Android)
        {
            url = AssetServerUrl + "Android/";
        }
        else if (Application.platform == RuntimePlatform.IPhonePlayer)
        {
            url = AssetServerUrl + "IOS/";
        }
        else if (Application.platform == RuntimePlatform.WindowsEditor)
        {
            url = AssetServerUrl + "Android/";
        }

        return url;
    }

    private string GetLocalMD5File()
    {
        return string.Format("{0}/{1}", Application.streamingAssetsPath, MD5FileName);
    }

    /// <summary>
    /// 获取本地资源保存路径
    /// </summary>
    /// <param name="path"></param>
    /// <param name="name"></param>
    /// <returns></returns>
    private string GetLocalSavePath(string path, string name)
    {
        return string.Format("{0}/{1}", path, name);
    }

    #endregion

    public void StartDownload()
    {
        string url = GetAssetServerUrl(RuntimePlatform.Android);
        string md5Url = url + MD5FileName;

        LoadLocalMd5File();
        StartCoroutine(DownloadServerMD5File(md5Url, MD5FileName));
    }

    /// <summary>
    /// 获取本地MD5文件
    /// </summary>
    private void LoadLocalMd5File()
    {
        mLocalAssetDict.Clear();
        if (File.Exists(GetLocalMD5File()))
        {
            StreamReader r = new StreamReader(GetLocalMD5File());
            string fileStr = r.ReadToEnd();
            fileStr = fileStr.Trim();
            string[] fileArray = fileStr.Split(';');
            for(int i = 0; i < fileArray.Length; i++)
            {
                string[] file = fileArray[i].Split('|');
                if (fileArray[i].Length > 0 && file.Length == 2)
                {
                    mLocalAssetDict.Add(file[0], file[1]);
                }
            }
        }
    }

    /// <summary>
    /// 下载网络上的MD5对比文件
    /// </summary>
    /// <param name="path"></param>
    /// <param name="fileName"></param>
    /// <returns></returns>
    IEnumerator DownloadServerMD5File(string path, string fileName)
    {
        UnityWebRequest www = UnityWebRequest.Get(path);

        yield return www.SendWebRequest();
        if(www.error != null)
            throw new System.Exception("www download had an error " + www.error);

        if (www.isDone)
        {
            DownloadHandler fileHandler = www.downloadHandler;
            string[] fileArray = fileHandler.text.Split(';');
            for (int i = 0; i < fileArray.Length; i++)
            {
                string[] file = fileArray[i].Split('|');
                if (fileArray[i].Length > 0 && file.Length == 2)
                {
                    mServerAssetDict.Add(file[0], file[1]);
                }
            }

            //TODO 填充更新表格
            //TODO 填充需要删除的本地文件


        }
    }

    /////// <summary>
    /////// 包热更包保存至本地
    /////// </summary>
    /////// <param name="fileName">文件名</param>
    /////// <param name="bytes">二进制格式</param>
    /////// <param name="count">长度</param>
    private void SaveAssetBundle(string fileName, byte[] bytes, int count)
    {
        Debug.Log(">>>>>>>>>Save: " + (Application.persistentDataPath + "/" + fileName));
        string mdFilePath = GetLocalSavePath(Application.persistentDataPath, fileName);
        FileStream fs = new FileStream(mdFilePath, FileMode.Create, FileAccess.Write);

        fs.Write(bytes, 0, count);
        fs.Flush();
        fs.Close();
        fs.Dispose();

        Debug.Log("下载文件完成");
    }


    //byte[] abBytes = www.downloadHandler.data;
    //AssetBundle abCell = AssetBundle.LoadFromMemory(abBytes);
    //SaveAssetBundle(fileName, abBytes, abBytes.Length);

    //AssetBundleManifest manifest = ab.LoadAsset<AssetBundleManifest>("AssetBundleManifest");
    //SaveAssetBundle(MainAssetbundleName, bys, bys.Length);

    //foreach (string abName in manifest.GetAllAssetBundles())
    //{
    //    UnityWebRequest abWWW = UnityWebRequest.Get(GetWWWUrl() + abName);

    //    yield return abWWW.SendWebRequest();
    //    if (abWWW.isNetworkError)
    //        continue;

    //    if (abWWW.isDone)
    //    {
    //        byte[] abBytes = abWWW.downloadHandler.data;
    //        AssetBundle abCell = AssetBundle.LoadFromMemory(abBytes);
    //        SaveAssetBundle(abName, abBytes, abBytes.Length);
    //    }
    //}
    //IEnumerator DownloadAB(string path)
    //{
    //    yield return new WaitForSeconds(0.5f);

    //    using (UnityWebRequest web = UnityWebRequest.Get(path))
    //    {
    //        yield return web.SendWebRequest();
    //        if (web.error != null)
    //            throw new System.Exception("www download had an error " + web.error);

    //        if(web.isDone)
    //        {
    //            byte[] results = web.downloadHandler.data;
    //            AssetBundle bundle = AssetBundle.LoadFromMemory(web.downloadHandler.data);
    //            byte[] bytes = web.downloadHandler.data;

    //            FileInfo fileInfo = new FileInfo(Application.streamingAssetsPath + "/" + bundle.name);
    //            FileStream fs = fileInfo.Create();

    //            fs.Write(web.downloadHandler.data, 0, web.downloadHandler.data.Length);

    //            fs.Flush();
    //            fs.Close();
    //            fs.Dispose();
    //        }

    //    }
    //}
}

