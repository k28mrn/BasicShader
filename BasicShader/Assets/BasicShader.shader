Shader "Custom/Basic"
{
	Properties
	{
		// _MainTex ("Albedo (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			struct vertexInput {
				float4 vertex : POSITION;
				float2 uv     : TEXCOORD0;
			};

			struct fragmentInput {
				float4 position : SV_POSITION;
				float2 uv       : TEXCOORD0;
			};

			// uniform sampler2D _MainTex;
			
			fragmentInput vert(vertexInput v) {
				fragmentInput o;
				o.position = UnityObjectToClipPos(v.vertex);
				o.uv = v.uv;
				return o;
			}

			float4 frag(fragmentInput i) : COLOR {
				// y軸は反転
				float2 uv = float2(i.uv.x, 1.0 - i.uv.y);

				// 0 ~ 1 ~ 0 に変換;
				uv *= 2.0;
				if (uv.x > 1.0) uv.x = 1.0 - (uv.x - 1.0);
				if (uv.y > 1.0) uv.y = 1.0 - (uv.y - 1.0);

				// fixed4 texColor = tex2D(_MainTex, uv);
				return fixed4(uv.x, uv.y, 0.0, 1.0);
			}

			ENDCG
		}
	}
}
