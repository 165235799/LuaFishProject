// Shader created with Shader Forge v1.37 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.37;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:32851,y:32665,varname:node_4013,prsc:2|diff-9720-OUT;n:type:ShaderForge.SFN_Tex2d,id:1879,x:31853,y:32597,ptovrint:False,ptlb:Main Tex,ptin:_MainTex,varname:node_1879,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bf47bfe318501f8428e7d009a07cc19a,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:3951,x:32138,y:33255,ptovrint:False,ptlb:Vein Tex,ptin:_VeinTex,varname:node_3951,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:030cc93e34a51784abf58afbd5c6d6a3,ntxv:0,isnm:False|UVIN-6991-OUT;n:type:ShaderForge.SFN_Add,id:9720,x:32530,y:32835,varname:node_9720,prsc:2|A-9876-OUT,B-3157-OUT;n:type:ShaderForge.SFN_TexCoord,id:9981,x:31066,y:33213,varname:node_9981,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Append,id:6991,x:31906,y:33235,varname:node_6991,prsc:2|A-5399-OUT,B-4877-OUT;n:type:ShaderForge.SFN_Time,id:6167,x:31235,y:32825,varname:node_6167,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5881,x:31446,y:32979,varname:node_5881,prsc:2|A-6167-TSL,B-34-OUT;n:type:ShaderForge.SFN_Add,id:5399,x:31601,y:33132,varname:node_5399,prsc:2|A-5881-OUT,B-9981-U;n:type:ShaderForge.SFN_Time,id:8308,x:31376,y:33379,varname:node_8308,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1331,x:31653,y:33475,varname:node_1331,prsc:2|A-8308-TSL,B-4487-OUT;n:type:ShaderForge.SFN_Add,id:4877,x:31759,y:33303,varname:node_4877,prsc:2|A-9981-V,B-1331-OUT;n:type:ShaderForge.SFN_Color,id:4514,x:31853,y:32798,ptovrint:False,ptlb:Main Color,ptin:_MainColor,varname:node_4514,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:9876,x:32279,y:32773,varname:node_9876,prsc:2|A-1879-RGB,B-4514-RGB,C-3169-OUT;n:type:ShaderForge.SFN_Slider,id:3169,x:31833,y:33001,ptovrint:False,ptlb:Main Tex Int,ptin:_MainTexInt,varname:node_3169,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:5;n:type:ShaderForge.SFN_Color,id:262,x:32089,y:33515,ptovrint:False,ptlb:Vein Color,ptin:_VeinColor,varname:node_262,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:7137,x:32329,y:33485,varname:node_7137,prsc:2|A-3951-RGB,B-262-RGB,C-6567-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6567,x:32089,y:33733,ptovrint:False,ptlb:Vein Ins,ptin:_VeinIns,varname:node_6567,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_VertexColor,id:4758,x:32387,y:33680,varname:node_4758,prsc:2;n:type:ShaderForge.SFN_Multiply,id:3157,x:32586,y:33471,varname:node_3157,prsc:2|A-7137-OUT,B-4758-A;n:type:ShaderForge.SFN_ValueProperty,id:34,x:31037,y:33104,ptovrint:False,ptlb:X Speed,ptin:_XSpeed,varname:node_34,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:4487,x:31098,y:33481,ptovrint:False,ptlb:Y Speed,ptin:_YSpeed,varname:_XSpeed_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;proporder:1879-4514-3169-3951-262-6567-34-4487;pass:END;sub:END;*/

Shader "Shader Forge/Vein Scroll" {
    Properties {
        _MainTex ("Main Tex", 2D) = "white" {}
        _Color ("Main Color", Color) = (0.5,0.5,0.5,1)
        _MainTexInt ("Main Tex Int", Range(0, 5)) = 1
        _VeinTex ("Vein Tex", 2D) = "white" {}
        _VeinColor ("Vein Color", Color) = (0.5,0.5,0.5,1)
        _VeinIns ("Vein Ins", Float ) = 2
        _XSpeed ("X Speed", Float ) = 0
        _YSpeed ("Y Speed", Float ) = 0
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _VeinTex; uniform float4 _VeinTex_ST;
            uniform float4 _Color;
            uniform float _MainTexInt;
            uniform float4 _VeinColor;
            uniform float _VeinIns;
            uniform float _XSpeed;
            uniform float _YSpeed;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(4,5)
                UNITY_FOG_COORDS(6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float4 node_6167 = _Time + _TimeEditor;
                float4 node_8308 = _Time + _TimeEditor;
                float2 node_6991 = float2(((node_6167.r*_XSpeed)+i.uv1.r),(i.uv1.g+(node_8308.r*_YSpeed)));
                float4 _VeinTex_var = tex2D(_VeinTex,TRANSFORM_TEX(node_6991, _VeinTex));
                float3 diffuseColor = ((_MainTex_var.rgb*_Color.rgb*_MainTexInt)+((_VeinTex_var.rgb*_VeinColor.rgb*_VeinIns)*i.vertexColor.a));
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _VeinTex; uniform float4 _VeinTex_ST;
            uniform float4 _Color;
            uniform float _MainTexInt;
            uniform float4 _VeinColor;
            uniform float _VeinIns;
            uniform float _XSpeed;
            uniform float _YSpeed;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(4,5)
                UNITY_FOG_COORDS(6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float4 node_6167 = _Time + _TimeEditor;
                float4 node_8308 = _Time + _TimeEditor;
                float2 node_6991 = float2(((node_6167.r*_XSpeed)+i.uv1.r),(i.uv1.g+(node_8308.r*_YSpeed)));
                float4 _VeinTex_var = tex2D(_VeinTex,TRANSFORM_TEX(node_6991, _VeinTex));
                float3 diffuseColor = ((_MainTex_var.rgb*_Color.rgb*_MainTexInt)+((_VeinTex_var.rgb*_VeinColor.rgb*_VeinIns)*i.vertexColor.a));
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
