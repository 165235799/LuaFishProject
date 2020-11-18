using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Security.Cryptography;
using UnityEditor;
using UnityEngine;

/// <summary>
/// 打包Lua脚本
/// </summary>
public class BuildLuaAssetBundle : EditorWindow
{
    private string TITLE_TXT = "Lua脚本打包";
    private string MD5_FILE_NAME = "FileMd5.txt";
    private int WINDOW_WIDTH = 600;
    private int WINDOW_HEIGHT = 500;
    private int WINDOW_X = 50;
    private int WINDOW_Y = 50;

    private string mTargetPath = string.Empty;
    private string mPathName = string.Empty;
    private string mOutPath = string.Empty;
    private int mPlatformIndex = 0;
    private Dictionary<string, string> mMd5Dict = new Dictionary<string, string>();

    [MenuItem("AssetBundleTools/BuildLuaScript")]
    public static void ShowWindow()
    {
        EditorWindow.GetWindow(typeof(BuildLuaAssetBundle));
    }

    BuildLuaAssetBundle()
    {
        this.titleContent = new GUIContent(TITLE_TXT);
        this.position = new Rect(WINDOW_X, WINDOW_Y, WINDOW_WIDTH, WINDOW_HEIGHT);
    }

    #region 界面显示

    void OnGUI()
    {
        GUILayout.BeginVertical();
        {
            ShowSettingPath();
            ShowButtons();
        }
        GUILayout.EndVertical();
    }

    /// <summary>
    /// 显示设置路径
    /// </summary>
    private void ShowSettingPath()
    {
        GUILayout.BeginVertical();
        {
            GUILayout.BeginVertical();
            {
                GUILayout.BeginHorizontal();
                {
                    EditorGUILayout.LabelField(mTargetPath, GUILayout.MinWidth(300), GUILayout.MinHeight(25));
                    if (GUILayout.Button("打包Lua根目录", GUILayout.Width(120), GUILayout.Height(30)))
                    {
                        mTargetPath = EditorUtility.OpenFolderPanel("需要打包Lua根根目录", "", "");
                    }
                }
                GUILayout.EndHorizontal();

                mPathName = EditorGUILayout.TextField("拷贝文件夹名字", mPathName, GUILayout.Width(280), GUILayout.Height(25));
                GUILayout.BeginHorizontal();
                {
                    EditorGUILayout.LabelField(mOutPath, GUILayout.MinWidth(300), GUILayout.MinHeight(25));
                    if (GUILayout.Button("资源包输出目录", GUILayout.Width(120), GUILayout.Height(30)))
                    {
                        mOutPath = EditorUtility.OpenFolderPanel("资源包输出目录", "", "");
                    }
                }
                GUILayout.EndHorizontal();
            }
            GUILayout.EndVertical();
        }
        GUILayout.EndVertical();
    }

    /// <summary>
    /// 显示功能按钮
    /// </summary>
    private void ShowButtons()
    {
        GUILayout.BeginVertical();
        {
            mPlatformIndex = EditorGUILayout.Popup(mPlatformIndex,
                new string[] { BuildConstant.PlatformType.Android.ToString(), BuildConstant.PlatformType.IOS.ToString() },
                    GUILayout.MaxWidth(260), GUILayout.MaxHeight(25));

            GUILayout.BeginHorizontal();
            {
                if (GUILayout.Button("拷贝Lua脚本", GUILayout.Width(130), GUILayout.Height(30)))
                {
                    OnClickCopyLuaFile();
                }

                if (GUILayout.Button("删除拷贝文件夹", GUILayout.Width(130), GUILayout.Height(30)))
                {
                    OnClickDeleteLuaTempFolder();
                }
            }
            GUILayout.EndHorizontal();

            GUILayout.BeginHorizontal();
            {
                if (GUILayout.Button("清空包名", GUILayout.Width(130), GUILayout.Height(30)))
                {
                    OnClickClearAssetbundleName();
                }

                if (GUILayout.Button("设置包名", GUILayout.Width(130), GUILayout.Height(30)))
                {
                    OnClickSetAssetbundleName();
                }
            }
            GUILayout.EndHorizontal();

            GUILayout.BeginHorizontal();
            {
                if (GUILayout.Button("打包Lua资源包", GUILayout.Width(130), GUILayout.Height(30)))
                {
                    OnClickBuildAssetbundle();
                }

                if (GUILayout.Button("生成MD5", GUILayout.Width(130), GUILayout.Height(30)))
                {
                    OnClickCreateMD5();
                }
            }
            GUILayout.EndHorizontal();

            GUILayout.BeginHorizontal();
            {
                if (GUILayout.Button("一键生成", GUILayout.Width(260), GUILayout.Height(30)))
                {
                   
                }
            }
            GUILayout.EndHorizontal();

        }
        GUILayout.EndVertical();
    }

    #endregion

    #region 功能按钮

    /// <summary>
    /// 拷贝Lua至临时文件夹
    /// </summary>
    private void OnClickCopyLuaFile()
    {
        CopyFile(mTargetPath, BuildConstant.GetLuaCopyPath(mPathName));
        RefreshAsset();
    }

    /// <summary>
    /// 删除Lua临时文件
    /// </summary>
    private void OnClickDeleteLuaTempFolder()
    {
        if (Directory.Exists(BuildConstant.GetLuaCopyPath(mPathName)))
        {
            FileUtil.DeleteFileOrDirectory(BuildConstant.GetLuaCopyPath(mPathName));
        }
        RefreshAsset();
    }

    /// <summary>
    /// 清除热更名字标识
    /// </summary>
    private void OnClickClearAssetbundleName()
    {
        TraversePath(BuildConstant.GetLuaCopyPath(mPathName), string.Empty);
        RefreshAsset();
    }

    /// <summary>
    /// 设置热更文件名字
    /// </summary>
    private void OnClickSetAssetbundleName()
    {
        TraversePath(BuildConstant.GetLuaCopyPath(mPathName), mPathName);
        RefreshAsset();
    }

    /// <summary>
    /// 打热更包
    /// </summary>
    private void OnClickBuildAssetbundle()
    {
        if ((BuildConstant.PlatformType)mPlatformIndex == BuildConstant.PlatformType.Android)
            BuildPipeline.BuildAssetBundles(mOutPath, BuildAssetBundleOptions.None, BuildTarget.Android);
        else
            BuildPipeline.BuildAssetBundles(mOutPath, BuildAssetBundleOptions.None, BuildTarget.iOS);
        RefreshAsset();
    }

    /// <summary>
    /// 记录文件对比MD5
    /// </summary>
    private void OnClickCreateMD5()
    {
        if(mMd5Dict == null)
            mMd5Dict = new Dictionary<string, string>();
        else
            mMd5Dict.Clear();

        SetFileMD5Path(mOutPath);
    }


    #endregion

    #region 刷新资源显示

    private void RefreshAsset()
    {
        AssetDatabase.SaveAssets();
        AssetDatabase.Refresh();
    }

    #endregion

    #region 拷贝Lua至临时文件夹

    /// <summary>
    /// Lua源文件拷贝到临时目录中
    /// </summary>
    /// <param name="srcPath">源文件夹</param>
    /// <param name="tarPath">目标文件夹</param>
    private void CopyFile(string srcPath, string tarPath)
    {
        if (!Directory.Exists(tarPath))
        {
            Directory.CreateDirectory(tarPath);
        }

        DirectoryInfo source = new DirectoryInfo(srcPath);
        DirectoryInfo target = new DirectoryInfo(tarPath);

        FileInfo[] files = source.GetFiles();
        DirectoryInfo[] dirs = source.GetDirectories();
        if (files.Length == 0 && dirs.Length == 0)
        {
            return;
        }

        for (int j = 0; j < dirs.Length; j++)
        {
            CopyFile(dirs[j].FullName, Path.Combine(target.FullName, dirs[j].Name));
        }

        for (int i = 0; i < files.Length; i++)
        {
            if (!files[i].FullName.Contains(".meta"))
                File.Copy(files[i].FullName, Path.Combine(target.FullName, string.Format(files[i].Name + ".bytes")), true);
        }
    }

    #endregion

    #region 设置资源热更名字

    /// <summary>
    /// 遍历路径，并设置热更名字
    /// </summary>
    /// <param name="path">遍历路径</param>
    /// <param name="assetbundleName">热更名字</param>
    private void TraversePath(string path, string assetbundleName)
    {
        DirectoryInfo dir = new DirectoryInfo(@path);
        FileSystemInfo[] files = dir.GetFileSystemInfos();

        foreach (var item in files)
        {
            int idx = item.ToString().LastIndexOf(@"\");//得到最后一个'\'的索引
            string name = item.ToString().Substring(idx + 1);//截取后面的作为名称

            if (!name.Contains(".meta"))
            {
                CheckFileOrDirectory(item, item.ToString(), assetbundleName);
            }
        }
    }

    /// <summary>
    /// 判断文件是文件夹还是文件
    /// </summary>
    /// <param name="fileSystemInfo"></param>
    /// <param name="path"></param>
    /// <param name="assetbundleName"></param>
    private void CheckFileOrDirectory(FileSystemInfo fileSystemInfo, string path, string assetbundleName)
    {
        FileInfo fileInfo = fileSystemInfo as FileInfo;
        if (fileInfo != null)
        {
            SetFileAssetbundleName(path, assetbundleName);
        }
        else
        {
            TraversePath(path, assetbundleName);
        }
    }

    /// <summary>
    /// 设置热更包名字
    /// </summary>
    /// <param name="path"></param>
    /// <param name="assetbundleName"></param>
    private void SetFileAssetbundleName(string path, string assetbundleName)
    {
        string assetPath = path.Remove(0, Application.dataPath.Length);
        assetPath = assetPath.Insert(0, "Assets");
        AssetImporter import = AssetImporter.GetAtPath(assetPath);
        if (import != null)
        {
            if (assetbundleName.Equals(string.Empty))
            {
                import.SetAssetBundleNameAndVariant(string.Empty, string.Empty);
            }
            else
            {
                import.SetAssetBundleNameAndVariant(assetbundleName, BuildConstant.ASSET_BUNDLE_VARIANT);
            }
            import.SaveAndReimport();
        }
    }

    #endregion

    #region 保存MD5码

    private void SetFileMD5Path(string path)
    {
        DirectoryInfo dir = new DirectoryInfo(@path);
        FileSystemInfo[] files = dir.GetFileSystemInfos();

        foreach (var item in files)
        {
            int idx = item.ToString().LastIndexOf(@"\");//得到最后一个'\'的索引
            string name = item.ToString().Substring(idx + 1);//截取后面的作为名称

            if (!name.Contains(".meta"))
            {
                AddFileMd5(item);
            }
        }
    }

    private void AddFileMd5(FileSystemInfo fileSystemInfo)
    {
        FileInfo fileInfo = fileSystemInfo as FileInfo;
        if (fileInfo != null)
        {

            FileStream fileStream = fileInfo.OpenRead();
            int len = (int)fileStream.Length;
            byte[] data = new byte[len];
            fileStream.Read(data, 0, len);
            fileStream.Close();

            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] result = md5.ComputeHash(data);
            string fileMd5 = string.Empty;
            for (int i = 0; i < result.Length; i++)
            {
                fileMd5 += Convert.ToString(result[i], 16);
            }

            if (mMd5Dict.ContainsKey(fileSystemInfo.Name))
                mMd5Dict[fileSystemInfo.Name] = fileMd5;
            else
                mMd5Dict.Add(fileSystemInfo.Name, fileMd5);

            string path = @"F:\GKProject\LuaFishProject\AssetBundle\Android\md5File.txt";
            AddMd5ToFile(path, fileSystemInfo.Name, fileMd5);
        }
        else
        {
            SetFileMD5Path(fileSystemInfo.ToString());
        }
    }

    private void AddMd5ToFile(string path, string fileName, string md5)
    {
        if (!File.Exists(path))
        {
            Debug.LogWarning("File New ");
            FileStream fs = new FileStream(path, FileMode.Create);
            fs.Close();
            fs.Dispose();
        }

        FileStream addFs = File.Open(path, FileMode.Append, FileAccess.Write);
        string allFile = string.Format("{0}|{1};", fileName, md5);
        byte[] bts = System.Text.Encoding.UTF8.GetBytes(allFile);
        addFs.Write(bts, 0, bts.Length);
        //清空缓存
        addFs.Flush();
        // 关闭流
        addFs.Close();
        //销毁资源
        addFs.Dispose();
    }

    #endregion
}
