// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33654,y:33296,varname:node_4013,prsc:2|diff-2879-OUT,emission-9220-OUT;n:type:ShaderForge.SFN_Tex2d,id:4088,x:33256,y:33066,ptovrint:False,ptlb:Main Tex,ptin:_MainTex,varname:node_4088,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:9308,x:33254,y:33653,ptovrint:False,ptlb:Damaskeen Color,ptin:_DamaskeenColor,varname:node_9308,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:7190,x:33254,y:33839,ptovrint:False,ptlb:Damaskeen Strength,ptin:_DamaskeenStrength,varname:node_7190,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:9220,x:33450,y:33634,varname:node_9220,prsc:2|A-8501-OUT,B-9308-RGB,C-7190-OUT;n:type:ShaderForge.SFN_Color,id:3123,x:33256,y:32900,ptovrint:False,ptlb:Main Color,ptin:_MainColor,varname:node_3123,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:2879,x:33452,y:33045,varname:node_2879,prsc:2|A-3123-RGB,B-4088-RGB,C-4748-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4748,x:33256,y:33257,ptovrint:False,ptlb:Main Tex Strength,ptin:_MainTexStrength,varname:_MainTexInt_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Tex2d,id:2752,x:33061,y:33374,ptovrint:False,ptlb:Damaskeen Tex,ptin:_DamaskeenTex,varname:node_2752,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-6334-OUT;n:type:ShaderForge.SFN_Multiply,id:8606,x:32468,y:33626,varname:node_8606,prsc:2|A-7364-OUT,B-6066-TSL;n:type:ShaderForge.SFN_ValueProperty,id:7364,x:32299,y:33588,ptovrint:False,ptlb:Damaskeen Y Speed,ptin:_DamaskeenYSpeed,varname:_node_6389_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_TexCoord,id:1677,x:32286,y:33358,varname:node_1677,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:4160,x:32475,y:33112,varname:node_4160,prsc:2|A-6288-OUT,B-9773-TSL;n:type:ShaderForge.SFN_ValueProperty,id:6288,x:32303,y:33067,ptovrint:False,ptlb:Damaskeen X Speed,ptin:_DamaskeenXSpeed,varname:_node_6389_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Time,id:9773,x:32303,y:33175,varname:node_9773,prsc:2;n:type:ShaderForge.SFN_Add,id:1861,x:32660,y:33211,varname:node_1861,prsc:2|A-4160-OUT,B-6397-OUT;n:type:ShaderForge.SFN_Append,id:6334,x:32851,y:33374,varname:node_6334,prsc:2|A-1861-OUT,B-2036-OUT;n:type:ShaderForge.SFN_Time,id:6066,x:32299,y:33683,varname:node_6066,prsc:2;n:type:ShaderForge.SFN_Add,id:2036,x:32664,y:33538,varname:node_2036,prsc:2|A-1677-V,B-8606-OUT;n:type:ShaderForge.SFN_Multiply,id:8501,x:33254,y:33471,varname:node_8501,prsc:2|A-2752-RGB,B-3421-RGB;n:type:ShaderForge.SFN_Tex2d,id:3421,x:33061,y:33583,ptovrint:False,ptlb:Mask Tex,ptin:_MaskTex,varname:node_3421,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_OneMinus,id:6397,x:32475,y:33315,varname:node_6397,prsc:2|IN-1677-U;proporder:4088-3123-4748-2752-9308-7190-6288-7364-3421;pass:END;sub:END;*/

Shader "LX/Damaskeen_Switch" {
    Properties {
        _MainTex ("Main Tex", 2D) = "white" {}
        _MainColor ("Main Color", Color) = (0.5,0.5,0.5,1)
        _MainTexStrength ("Main Tex Strength", Float ) = 2
        _DamaskeenTex ("Damaskeen Tex", 2D) = "white" {}
        _DamaskeenColor ("Damaskeen Color", Color) = (0.5,0.5,0.5,1)
        _DamaskeenStrength ("Damaskeen Strength", Float ) = 1
        _DamaskeenXSpeed ("Damaskeen X Speed", Float ) = 0
        _DamaskeenYSpeed ("Damaskeen Y Speed", Float ) = 0
        _MaskTex ("Mask Tex", 2D) = "white" {}
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
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _DamaskeenColor;
            uniform float _DamaskeenStrength;
            uniform float4 _MainColor;
            uniform float _MainTexStrength;
            uniform sampler2D _DamaskeenTex; uniform float4 _DamaskeenTex_ST;
            uniform float _DamaskeenYSpeed;
            uniform float _DamaskeenXSpeed;
            uniform sampler2D _MaskTex; uniform float4 _MaskTex_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
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
                float3 diffuseColor = (_MainColor.rgb*_MainTex_var.rgb*_MainTexStrength);
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float4 node_9773 = _Time;
                float4 node_6066 = _Time;
                float2 node_6334 = float2(((_DamaskeenXSpeed*node_9773.r)+(1.0 - i.uv0.r)),(i.uv0.g+(_DamaskeenYSpeed*node_6066.r)));
                float4 _DamaskeenTex_var = tex2D(_DamaskeenTex,TRANSFORM_TEX(node_6334, _DamaskeenTex));
                float4 _MaskTex_var = tex2D(_MaskTex,TRANSFORM_TEX(i.uv0, _MaskTex));
                float3 emissive = ((_DamaskeenTex_var.rgb*_MaskTex_var.rgb)*_DamaskeenColor.rgb*_DamaskeenStrength);
/// Final Color:
                float3 finalColor = diffuse + emissive;
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
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _DamaskeenColor;
            uniform float _DamaskeenStrength;
            uniform float4 _MainColor;
            uniform float _MainTexStrength;
            uniform sampler2D _DamaskeenTex; uniform float4 _DamaskeenTex_ST;
            uniform float _DamaskeenYSpeed;
            uniform float _DamaskeenXSpeed;
            uniform sampler2D _MaskTex; uniform float4 _MaskTex_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
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
                float3 diffuseColor = (_MainColor.rgb*_MainTex_var.rgb*_MainTexStrength);
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
