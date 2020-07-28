// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33404,y:33234,varname:node_4013,prsc:2|diff-8408-OUT,emission-3427-OUT;n:type:ShaderForge.SFN_Tex2d,id:4088,x:32379,y:33210,ptovrint:False,ptlb:Main_Texture,ptin:_Main_Texture,varname:node_4088,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:5019,x:32670,y:33333,ptovrint:False,ptlb:Ice_Texture,ptin:_Ice_Texture,varname:node_5019,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:16a54a7d84c94ee4db0851a2e7e9a0c5,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:8869,x:32670,y:33518,ptovrint:False,ptlb:Ice_Color,ptin:_Ice_Color,varname:node_8869,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:8497,x:32670,y:33693,ptovrint:False,ptlb:Ice_Intensity,ptin:_Ice_Intensity,varname:node_8497,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Multiply,id:5297,x:32932,y:33508,varname:node_5297,prsc:2|A-5019-RGB,B-8869-RGB,C-8497-OUT,D-2604-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:8408,x:33117,y:33194,ptovrint:False,ptlb:Main_Switch,ptin:_Main_Switch,varname:node_8408,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-1490-OUT,B-4088-RGB;n:type:ShaderForge.SFN_Vector1,id:1490,x:32912,y:33296,varname:node_1490,prsc:2,v1:0;n:type:ShaderForge.SFN_SwitchProperty,id:3427,x:33117,y:33394,ptovrint:False,ptlb:Ice_Switch,ptin:_Ice_Switch,varname:node_3427,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-1490-OUT,B-5297-OUT;n:type:ShaderForge.SFN_Desaturate,id:2604,x:32670,y:33787,varname:node_2604,prsc:2|COL-4088-RGB;proporder:4088-5019-8869-8497-8408-3427;pass:END;sub:END;*/

Shader "LX/Fish_Shader" {
    Properties {
        _Main_Texture ("Main_Texture", 2D) = "white" {}
        _Ice_Texture ("Ice_Texture", 2D) = "white" {}
        _Ice_Color ("Ice_Color", Color) = (0.5,0.5,0.5,1)
        _Ice_Intensity ("Ice_Intensity", Float ) = 2
        [MaterialToggle] _Main_Switch ("Main_Switch", Float ) = 0
        [MaterialToggle] _Ice_Switch ("Ice_Switch", Float ) = 0
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
            uniform sampler2D _Main_Texture; uniform float4 _Main_Texture_ST;
            uniform sampler2D _Ice_Texture; uniform float4 _Ice_Texture_ST;
            uniform float4 _Ice_Color;
            uniform float _Ice_Intensity;
            uniform fixed _Main_Switch;
            uniform fixed _Ice_Switch;
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
                float node_1490 = 0.0;
                float4 _Main_Texture_var = tex2D(_Main_Texture,TRANSFORM_TEX(i.uv0, _Main_Texture));
                float3 diffuseColor = lerp( node_1490, _Main_Texture_var.rgb, _Main_Switch );
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float4 _Ice_Texture_var = tex2D(_Ice_Texture,TRANSFORM_TEX(i.uv0, _Ice_Texture));
                float3 emissive = lerp( node_1490, (_Ice_Texture_var.rgb*_Ice_Color.rgb*_Ice_Intensity*dot(_Main_Texture_var.rgb,float3(0.3,0.59,0.11))), _Ice_Switch );
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
            uniform sampler2D _Main_Texture; uniform float4 _Main_Texture_ST;
            uniform sampler2D _Ice_Texture; uniform float4 _Ice_Texture_ST;
            uniform float4 _Ice_Color;
            uniform float _Ice_Intensity;
            uniform fixed _Main_Switch;
            uniform fixed _Ice_Switch;
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
                float node_1490 = 0.0;
                float4 _Main_Texture_var = tex2D(_Main_Texture,TRANSFORM_TEX(i.uv0, _Main_Texture));
                float3 diffuseColor = lerp( node_1490, _Main_Texture_var.rgb, _Main_Switch );
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
