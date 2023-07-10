// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/My First Shader" {

	Properties {
		_Tint ("Tint", Color) = (1, 1, 1, 1)
	}

	SubShader {
		Pass {
			CGPROGRAM
				#pragma vertex MyVertexProgram
				#pragma fragment MyFragmentProgram

				#include "UnityCG.cginc"

				float4 _Tint;

				struct MyInterpolators {
					float4 position : SV_POSITION;
					float2 uv : TEXCOORD0;
				};

				struct VertexData {
					float4 position : POSITION;
					float2 uv : TEXCOORD0;
				};

				MyInterpolators MyVertexProgram(VertexData v) {
					MyInterpolators i;
					i.uv = v.uv;
					i.position = UnityObjectToClipPos(v.position);
					return i;
				}

				float4 MyFragmentProgram(MyInterpolators i) : SV_TARGET {
					return float4(i.uv, 1, 1);
				}

			ENDCG
		}
	}
}