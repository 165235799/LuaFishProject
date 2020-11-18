using LuaInterface;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.Networking;

public class CGScene : MonoBehaviour
{
    private DownLoadAssetbundle mDownloadComponent = null;


    private void Awake()
    {
        AddDownloadComponent();
    }

    private void Start()
    {
        StartDownload();
    }

    #region 下载热更包

    private void AddDownloadComponent()
    {
        if (mDownloadComponent == null)
        {
            GameObject obj = new GameObject();
            obj.transform.parent = transform;
            obj.transform.localPosition = Vector3.zero;
            obj.transform.localScale = Vector3.one;
            obj.name = "DownloadAssetbundle";
            if (obj.GetComponent<DownLoadAssetbundle>() == null)
            {
                mDownloadComponent = obj.AddComponent<DownLoadAssetbundle>();
            }
            else
            {
                mDownloadComponent = obj.GetComponent<DownLoadAssetbundle>();
            }
        }
    }

    private void StartDownload()
    {
        if (mDownloadComponent != null)
            mDownloadComponent.StartDownload();
    }

    #endregion



    #region

    //private string MainAssetbundleName = "Android";

    //private string mAndroidIP = @"http://127.0.0.1/AssetBundle/Android/";
    //private string mIOSIP = @"http://127.0.0.1/AssetBundle/IOS/";

    //private string GetSaveLocalPath()
    //{
    //    return string.Format(Application.persistentDataPath + "/Assetbundle/");
    //}

    //private string GetLocalLuaPath()
    //{
    //    return string.Format(GetSaveLocalPath() + "lua.unity3d");
    //}

    //private string GetWWWUrl()
    //{
    //    string url = string.Empty;
    //    if (Application.platform == RuntimePlatform.Android)
    //    {
    //        url = mAndroidIP;
    //    }
    //    else if (Application.platform == RuntimePlatform.IPhonePlayer)
    //    {
    //        url = mIOSIP;
    //    }
    //    else if (Application.platform == RuntimePlatform.WindowsEditor)
    //    {
    //        url = mAndroidIP;
    //    }

    //    return url;
    //}

    //void Start()
    //{
    //    string url = string.Empty;
    //    if(Application.platform == RuntimePlatform.Android)
    //    {
    //        url = mAndroidIP + MainAssetbundleName;
    //    }
    //    else if(Application.platform == RuntimePlatform.IPhonePlayer)
    //    {
    //        url = mIOSIP + MainAssetbundleName;
    //    }
    //    else if(Application.platform == RuntimePlatform.WindowsEditor)
    //    {
    //        url = mAndroidIP + MainAssetbundleName;
    //    }

    //    if(!Directory.Exists(GetSaveLocalPath()))
    //    {
    //        Directory.CreateDirectory(GetSaveLocalPath());
    //    }

    //    StartCoroutine(DownLoadAssetBundleAndSave(url));
    //    //StartCoroutine(LoadLuaFile());
    //}

    ///// <summary>
    ///// 下载热更包
    ///// </summary>
    ///// <param name="path"></param>
    ///// <returns></returns>
    //IEnumerator DownLoadAssetBundleAndSave(string path)
    //{
    //    UnityWebRequest www = UnityWebRequest.Get(path);

    //    yield return www.SendWebRequest();

    //    if(www.isDone)
    //    {
    //        byte[] bys = www.downloadHandler.data;

    //        AssetBundle ab = AssetBundle.LoadFromMemory(bys);

    //        AssetBundleManifest manifest = ab.LoadAsset<AssetBundleManifest>("AssetBundleManifest");
    //        SaveAssetBundle(MainAssetbundleName, bys, bys.Length);

    //        foreach (string abName in manifest.GetAllAssetBundles())
    //        {
    //            UnityWebRequest abWWW = UnityWebRequest.Get(GetWWWUrl() + abName);

    //            yield return abWWW.SendWebRequest();
    //            if (abWWW.isNetworkError)
    //                continue;

    //            if (abWWW.isDone)
    //            {
    //                byte[] abBytes = abWWW.downloadHandler.data;
    //                AssetBundle abCell = AssetBundle.LoadFromMemory(abBytes);
    //                SaveAssetBundle(abName, abBytes, abBytes.Length);
    //            }
    //        }
    //    }
    //}

    ///// <summary>
    ///// 包热更包保存至本地
    ///// </summary>
    ///// <param name="fileName">文件名</param>
    ///// <param name="bytes">二进制格式</param>
    ///// <param name="count">长度</param>
    //private void SaveAssetBundle(string fileName, byte[] bytes, int count)
    //{
    //    Debug.Log(">>>>>>>>>Save: " + (Application.persistentDataPath + "/" + fileName));

    //    FileStream fs = new FileStream((GetSaveLocalPath() + fileName), FileMode.Create, FileAccess.Write);

    //    fs.Write(bytes, 0, count);
    //    fs.Flush();
    //    fs.Close();
    //    fs.Dispose();

    //    Debug.Log("下载文件完成");
    //}


    //IEnumerator LoadLuaFile()
    //{
    //    string path = "file://" + GetLocalLuaPath();
    //    WWW www = new WWW(path);
    //    yield return www;

    //    AssetBundle luaAsset = www.assetBundle;
    //    LuaFileUtils.Instance.AddSearchBundle(luaAsset.name, luaAsset);
    //}

    #endregion

}
