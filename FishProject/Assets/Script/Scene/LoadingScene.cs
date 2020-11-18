using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

/// <summary>
/// Loading 场景
/// </summary>
public class LoadingScene : MonoBehaviour
{
    private float LOADING_FG_WIDTH = 700.0f;

    private int mUnloadSceneIndex = -1;
    private int mTargetSceneIndex = -1;
    private bool mIsUnloadScene = false;

    private Text mHitTxt = null;
    private RectTransform mLoadingBar = null;

    private AsyncOperation mUnloadAsync = null;
    private AsyncOperation mLoadAsync = null;

    private void Awake()
    {
        mHitTxt = transform.Find("hitTxt").GetComponent<Text>();
        mLoadingBar = transform.Find("loadBar/FG").GetComponent<RectTransform>();
    }

    private void ClearData()
    {
        mUnloadSceneIndex = -1;
        mTargetSceneIndex = -1;
        mIsUnloadScene = false;
    }

    private void Start()
    {
        mUnloadSceneIndex = LuaSceneTool.CurrentSceneIndex;
        mTargetSceneIndex = LuaSceneTool.SceneIndex;
        mIsUnloadScene = LuaSceneTool.IsUnload;
        LuaSceneTool.ClearSceneData();
        if(mIsUnloadScene)
        {
            StartUnloadScene();
        }
        else
        {
            StartLoadScene();
        }
    }

    private void StartUnloadScene()
    {
        StartCoroutine(UnloadScene());
    }

    private void StartLoadScene()
    {
        StartCoroutine(LoadScene());
    }

    IEnumerator UnloadScene()
    {
        mUnloadAsync = SceneManager.UnloadSceneAsync(mUnloadSceneIndex);
        while (!mUnloadAsync.isDone)
        {
            SetLoading(mUnloadAsync.progress);
            yield return new WaitForEndOfFrame();
        }

        if (mUnloadAsync.isDone)
        {
            SetLoading(1.0f);
            StartLoadScene();
        }

        yield return new WaitForEndOfFrame();
    }

    IEnumerator LoadScene()
    {
        mLoadAsync = SceneManager.LoadSceneAsync(mTargetSceneIndex, LoadSceneMode.Additive);
        while (!mLoadAsync.isDone)
        {
            SetLoading(mLoadAsync.progress);
            yield return new WaitForEndOfFrame();
        }

        if (mLoadAsync.isDone)
        {
            LuaSceneTool.CurrentSceneIndex = mTargetSceneIndex;
            SceneManager.UnloadSceneAsync(1);
            ClearData();
        }
        yield return new WaitForEndOfFrame();
    }

    private void SetLoading(float per)
    {
        mLoadingBar.sizeDelta = new Vector2(LOADING_FG_WIDTH * per, 29.0f);
    }
}
