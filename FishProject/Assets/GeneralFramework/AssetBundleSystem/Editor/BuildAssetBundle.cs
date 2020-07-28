using System;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;

#region 数据项

/// <summary>
/// 包数据
/// </summary>
[Serializable]
public class PackageData
{
    public string PackName;
    public List<string> Paths;

    public PackageData()
    {
        PackName = string.Empty;
        Paths = new List<string>();
    }
}

/// <summary>
/// 热更包数据
/// </summary>
[Serializable]
public class PackageInfo : ScriptableObject
{
    public int VersionNum;
    public List<PackageData> Paths;

    public PackageInfo()
    {
        Paths = new List<PackageData>();
    }
}
#endregion

#region 常量

public class BuildConstant
{
    public const int WINDOW_WIDTH = 800;
    public const int WINDOW_HEIGHT = 800;

    public const int PACK_AREAN_WIDTH = 780;
    public const int PACK_AREAN_HEIGHT = 650;

    public const string ASSET_BUNDLE_VARIANT = "unity3d";

    public enum PlatformType
    {
        IOS = 0,
        Android,
    }

    public static string GetLuaTempPath()
    {
        return Application.dataPath + "/LuaTemp/";
    }

    public static string GetLuaPath()
    {
        return Application.dataPath + "/Lua/";
    }

    public static string GetSavePathPath()
    {
        return "Assets/GeneralFramework/AssetBundleSystem/SavePackPath.asset";
    }
}

#endregion

public class BuildWindow : EditorWindow
{
    private PackageInfo mPackage = null;

    private string mNewPackageName = string.Empty;
    private Vector2 mScrollView = Vector2.zero;
    private int mPlatformIndex = 0;
    private string mOutPath = string.Empty;

    [MenuItem("AssetBudle/Build")]
    public static void ShowWindow()
    {
        EditorWindow.GetWindow(typeof(BuildWindow));
    }

    BuildWindow()
    {
        this.titleContent = new GUIContent("Add Pack Window");
        this.position = new Rect(0, 0, BuildConstant.WINDOW_WIDTH, BuildConstant.WINDOW_HEIGHT);
    }

    private void OnEnable()
    {
        mNewPackageName = string.Empty;
        mPlatformIndex = 0;
        mScrollView = Vector2.zero;
        InitLoadPath();
    }

    void OnGUI()
    {
        GUILayout.BeginArea(new Rect(0, 0, BuildConstant.WINDOW_WIDTH, BuildConstant.WINDOW_HEIGHT));
        {
            SaveAssetPath();
            ShowBuild();
        }
        GUILayout.EndArea();
    }

    /// <summary>
    /// 初始化配置文件
    /// </summary>
    private void InitLoadPath()
    {
        mPackage = ScriptableObject.CreateInstance<PackageInfo>();

        string createPath = BuildConstant.GetSavePathPath();
        if (AssetDatabase.LoadAssetAtPath<PackageInfo>(createPath) == null)
            AssetDatabase.CreateAsset(mPackage, createPath);
        else
            mPackage = AssetDatabase.LoadAssetAtPath<PackageInfo>(createPath);

        AssetDatabase.SaveAssets();
        AssetDatabase.Refresh();
    }

    #region 热更包路径操作
    /// <summary>
    /// 显示整个热更包
    /// </summary>
    private void SaveAssetPath()
    {
        GUILayout.BeginArea(new Rect(10, 10, BuildConstant.PACK_AREAN_WIDTH, BuildConstant.PACK_AREAN_HEIGHT));
        {
            GUILayout.BeginScrollView(mScrollView, GUILayout.Width(BuildConstant.PACK_AREAN_WIDTH - 20), GUILayout.Height(BuildConstant.PACK_AREAN_HEIGHT - 10));
            {
                #region 功能按钮
                GUILayout.Space(10);
                GUILayout.BeginHorizontal();
                mNewPackageName = EditorGUILayout.TextField("包名", mNewPackageName, GUILayout.Width(280), GUILayout.Height(25));
                //添加
                if (GUILayout.Button("添加空包", GUILayout.Width(90), GUILayout.Height(25)))
                {
                    if (mNewPackageName.Equals(string.Empty))
                    {
                        EditorUtility.DisplayDialog("添加包错误", "请输入包名", "确定");
                    }
                    else
                    {
                        PackageData data = new PackageData();
                        data.PackName = mNewPackageName;
                        data.Paths = new List<string>();
                        mPackage.Paths.Add(data);

                        AssetDatabase.SaveAssets();
                        AssetDatabase.Refresh();
                    }
                }

                //删除
                if (GUILayout.Button("删除包", GUILayout.Width(90), GUILayout.Height(25)))
                {
                  
                }

                GUILayout.EndHorizontal();

                #endregion

                #region 显示包

                GUILayout.Space(10);

                GUILayout.BeginVertical();
                for (int i = 0; i < mPackage.Paths.Count; i++)
                {
                    AddPackage(mPackage.Paths[i]);
                }

                GUILayout.EndVertical();

                #endregion
            }
            GUILayout.EndScrollView();
        }
        GUILayout.EndArea();
    }

    /// <summary>
    /// 显示单个热更包信息
    /// </summary>
    /// <param name="data"></param>
    private void AddPackage(PackageData data)
    {
        GUILayout.BeginVertical();
        {
            GUILayout.BeginHorizontal();
            {
                EditorGUILayout.LabelField(data.PackName);
                if (GUILayout.Button("+", GUILayout.Width(60), GUILayout.Height(20)))
                {
                    string path = EditorUtility.OpenFolderPanel("添加路径", "", "");
                    if (!data.Paths.Contains(path) && path.Length > 0)
                    {
                        data.Paths.Add(path);
                    }

                    AssetDatabase.SaveAssets();
                    AssetDatabase.Refresh();
                }

                if (GUILayout.Button("-", GUILayout.Width(60), GUILayout.Height(20)))
                {
                    //删除整个包
                }
            }
            GUILayout.EndHorizontal();


            for (int i = 0; i < data.Paths.Count; i++)
            {
                GUILayout.BeginHorizontal();
                {
                    EditorGUILayout.LabelField(data.Paths[i]);
                    if (GUILayout.Button("-", GUILayout.Width(60), GUILayout.Height(20)))
                    {
                        data.Paths.RemoveAt(i);
                    }
                }
                GUILayout.EndHorizontal();

            }
        }
        GUILayout.EndVertical();
    }

    #endregion

    #region 打包设置按钮

    private void ShowBuild()
    {
        GUILayout.BeginArea(new Rect(10, BuildConstant.PACK_AREAN_HEIGHT, BuildConstant.PACK_AREAN_WIDTH, BuildConstant.WINDOW_HEIGHT - BuildConstant.PACK_AREAN_HEIGHT));
        {
            GUILayout.BeginHorizontal();
            {
                EditorGUILayout.LabelField(mOutPath, GUILayout.MinWidth(100), GUILayout.MinHeight(25));
                if (GUILayout.Button("输出路径", GUILayout.Width(80), GUILayout.Height(25)))
                {
                    mOutPath = EditorUtility.OpenFolderPanel("热更包输出路径", "", "");
                }
            }
            GUILayout.EndHorizontal();

            GUILayout.BeginHorizontal();
            {
                mPlatformIndex = EditorGUILayout.Popup(mPlatformIndex, new string[] { BuildConstant.PlatformType.IOS.ToString(), BuildConstant.PlatformType.Android.ToString() },
                     GUILayout.MinWidth(60), GUILayout.MinWidth(25));
                EditorGUILayout.LabelField(string.Format("当前版本号:{0}", mPackage.VersionNum), GUILayout.MinWidth(60), GUILayout.MinHeight(25));

                if (GUILayout.Button("清空包名", GUILayout.Width(80), GUILayout.Height(25)))
                {
                    ClearAllAssetbundleName();
                }

                if (GUILayout.Button("设置包名", GUILayout.Width(80), GUILayout.Height(25)))
                {
                    SetAllAssetbundleName();
                    AssetDatabase.Refresh();
                }

                if (GUILayout.Button("打包", GUILayout.Width(80), GUILayout.Height(25)))
                {
                    if (!IsCanBuilding(mPlatformIndex))
                    {
                        Debug.LogError("当前平台不能打目标平台的资源包");
                        return;
                    }

                    BuildAssetbundle();
                    mPackage.VersionNum += 1;
                    AssetDatabase.SaveAssets();
                    AssetDatabase.Refresh();
                }

                if (GUILayout.Button("拷贝Lua至临时文件夹", GUILayout.Width(80), GUILayout.Height(25)))
                {
                    if (!IsCanBuilding(mPlatformIndex))
                    {
                        Debug.LogError("当前平台不能打目标平台的资源包");
                        return;
                    }

                    CopyFile(BuildConstant.GetLuaPath(), BuildConstant.GetLuaTempPath());
                    //BuildLua();
                    mPackage.VersionNum += 1;
                    AssetDatabase.SaveAssets();
                    AssetDatabase.Refresh();
                }

                if (GUILayout.Button("设置Lua热更包名", GUILayout.Width(80), GUILayout.Height(25)))
                {
                    SetLuaAssetbundleName(BuildConstant.GetLuaTempPath(), "Lua");
                }

            }
            GUILayout.EndHorizontal();

            
        }
        GUILayout.EndArea();
    }

    /// <summary>
    /// 当前平台是否支持目标平台
    /// </summary>
    /// <param name="platformIndex"></param>
    /// <returns></returns>
    private bool IsCanBuilding(int platformIndex)
    {
        if(Application.platform == RuntimePlatform.IPhonePlayer)
        {
            return true;
        }
        else
        {
            if((BuildConstant.PlatformType)platformIndex == BuildConstant.PlatformType.IOS)
                return false;
            else
                return true;
        }
    }

    private void BuildAssetbundle()
    {
        if(mOutPath.Equals(string.Empty))
        {
            Debug.LogError(">>>>>>>>>>>>>>>>>>!!!设置输出目录");
            return;
        }

        if((BuildConstant.PlatformType)mPlatformIndex == BuildConstant.PlatformType.Android)
            BuildPipeline.BuildAssetBundles(mOutPath, BuildAssetBundleOptions.None, BuildTarget.Android);
        else
            BuildPipeline.BuildAssetBundles(mOutPath, BuildAssetBundleOptions.None, BuildTarget.iOS);
    }

    #endregion

    #region 设置/清空Assetbundle包名

    /// <summary>
    /// 设置所有热更文件名字
    /// </summary>
    private void SetAllAssetbundleName()
    {
        //删除不需要的assetbundle名字
        AssetDatabase.RemoveUnusedAssetBundleNames();

        for (int i = 0; i < mPackage.Paths.Count; i++)
        {
            for (int pathIndex = 0; pathIndex < mPackage.Paths[i].Paths.Count; pathIndex++)
            {
                TraversePath(mPackage.Paths[i].Paths[pathIndex], mPackage.Paths[i].PackName);
            }
        }
        AssetDatabase.Refresh();
    }

    private void ClearAllAssetbundleName()
    {
        AssetDatabase.RemoveUnusedAssetBundleNames();

        for (int i = 0; i < mPackage.Paths.Count; i++)
        {
            for (int pathIndex = 0; pathIndex < mPackage.Paths[i].Paths.Count; pathIndex++)
            {
                TraversePath(mPackage.Paths[i].Paths[pathIndex], string.Empty);
            }
        }
        AssetDatabase.Refresh();
    }

    /// <summary>
    /// 遍历所有路径
    /// </summary>
    /// <param name="path"></param>
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

    #region 打包lua

    //打包Lua
    private void BuildLua()
    {
        

       

        AssetDatabase.Refresh();
    }

    /// <summary>
    /// Lua源文件拷贝到临时目录中
    /// </summary>
    /// <param name="srcPath"></param>
    /// <param name="tarPath"></param>
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
                File.Copy(files[i].FullName, Path.Combine(target.FullName, string.Format(files[i].Name + ".byte")), true);
        }
    }

    private void SetLuaAssetbundleName(string path, string packName)
    {
        TraversePath(path, packName);
    }

    #endregion

}