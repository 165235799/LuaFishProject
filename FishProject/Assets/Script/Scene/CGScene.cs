using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.Networking;

public class CGScene : MonoBehaviour
{
    private string MainAssetbundleName = "Android";

    private string mAndroidIP = @"http://127.0.0.1/AssetBundle/Android/";
    private string mIOSIP = @"http://127.0.0.1/AssetBundle/IOS/";

    private string GetSaveLocalPath()
    {
        return string.Format(Application.persistentDataPath + "/Assetbundle/");
    }

    private string GetWWWUrl()
    {
        string url = string.Empty;
        if (Application.platform == RuntimePlatform.Android)
        {
            url = mAndroidIP;
        }
        else if (Application.platform == RuntimePlatform.IPhonePlayer)
        {
            url = mIOSIP;
        }
        else if (Application.platform == RuntimePlatform.WindowsEditor)
        {
            url = mAndroidIP;
        }

        return url;
    }

    void Start()
    {
        string url = string.Empty;
        if(Application.platform == RuntimePlatform.Android)
        {
            url = mAndroidIP + MainAssetbundleName;
        }
        else if(Application.platform == RuntimePlatform.IPhonePlayer)
        {
            url = mIOSIP + MainAssetbundleName;
        }
        else if(Application.platform == RuntimePlatform.WindowsEditor)
        {
            url = mAndroidIP + MainAssetbundleName;
        }

        if(!Directory.Exists(GetSaveLocalPath()))
        {
            Directory.CreateDirectory(GetSaveLocalPath());
        }

        StartCoroutine(DownLoadAssetBundleAndSave(url));
    }

    IEnumerator DownLoadAssetBundleAndSave(string path)
    {
        UnityWebRequest www = UnityWebRequest.Get(path);

        yield return www.SendWebRequest();

        if(www.isDone)
        {
            byte[] bys = www.downloadHandler.data;

            AssetBundle ab = AssetBundle.LoadFromMemory(bys);

            AssetBundleManifest manifest = ab.LoadAsset<AssetBundleManifest>("AssetBundleManifest");
            SaveAssetBundle(MainAssetbundleName, bys, bys.Length);

            foreach (string abName in manifest.GetAllAssetBundles())
            {
                UnityWebRequest abWWW = UnityWebRequest.Get(GetWWWUrl() + abName);

                yield return abWWW.SendWebRequest();
                if (abWWW.isNetworkError)
                    continue;

                if (abWWW.isDone)
                {
                    byte[] abBytes = abWWW.downloadHandler.data;
                    AssetBundle abCell = AssetBundle.LoadFromMemory(abBytes);
                    SaveAssetBundle(abName, abBytes, abBytes.Length);
                }
            }
        }
    }

   

    private void SaveAssetBundle(string fileName, byte[] bytes, int count)
    {
        Debug.Log(">>>>>>>>>Save: " + (Application.persistentDataPath + "/" + fileName));

        FileStream fs = new FileStream((GetSaveLocalPath() + fileName),FileMode.Create, FileAccess.Write);

        fs.Write(bytes, 0, count);
        fs.Flush();
        fs.Close();
        fs.Dispose();

        Debug.Log("下载文件完成");
    }
}
