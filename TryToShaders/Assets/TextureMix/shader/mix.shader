// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Mix"
{
	Properties
	{
		_Int1("Int 1", Int) = 44
		_Int0("Int 0", Int) = 39
		_Albedo0("Albedo0", 2D) = "white" {}
		_Albedo1("Albedo1", 2D) = "white" {}
		_Normal0("Normal0", 2D) = "bump" {}
		_Normal1("Normal1", 2D) = "bump" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityStandardUtils.cginc"
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
			float3 worldPos;
		};

		uniform sampler2D _Normal0;
		uniform float4 _Normal0_ST;
		uniform sampler2D _Normal1;
		uniform float4 _Normal1_ST;
		uniform sampler2D _Albedo0;
		uniform float4 _Albedo0_ST;
		uniform sampler2D _Albedo1;
		uniform float4 _Albedo1_ST;
		uniform int _Int0;
		uniform int _Int1;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Normal0 = i.uv_texcoord * _Normal0_ST.xy + _Normal0_ST.zw;
			float2 uv_Normal1 = i.uv_texcoord * _Normal1_ST.xy + _Normal1_ST.zw;
			o.Normal = BlendNormals( UnpackNormal( tex2D( _Normal0, uv_Normal0 ) ) , UnpackNormal( tex2D( _Normal1, uv_Normal1 ) ) );
			float2 uv_Albedo0 = i.uv_texcoord * _Albedo0_ST.xy + _Albedo0_ST.zw;
			float2 uv_Albedo1 = i.uv_texcoord * _Albedo1_ST.xy + _Albedo1_ST.zw;
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float4 lerpResult4 = lerp( tex2D( _Albedo0, uv_Albedo0 ) , tex2D( _Albedo1, uv_Albedo1 ) , (0.0 + (length( ( ase_vertex3Pos - float3(0,0,0) ) ) - (float)_Int0) * (1.0 - 0.0) / ((float)_Int1 - (float)_Int0)));
			o.Albedo = lerpResult4.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16100
110;134;1757;910;1421.199;357.4152;1;True;True
Node;AmplifyShaderEditor.Vector3Node;9;-934.8561,482.2953;Float;False;Constant;_Vector0;Vector 0;2;0;Create;True;0;0;False;0;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.PosVertexDataNode;8;-950.6299,308.0406;Float;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;7;-602.7667,359.712;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LengthOpNode;6;-395.4892,359.712;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;10;-389.9171,438.8344;Float;False;Property;_Int0;Int 0;1;0;Create;True;0;0;False;0;39;5;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;11;-387.6881,517.956;Float;False;Property;_Int1;Int 1;0;0;Create;True;0;0;False;0;44;10;0;1;INT;0
Node;AmplifyShaderEditor.TFHCRemapNode;5;-162.408,355.3242;Float;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;20;-554.8234,153.3966;Float;True;Property;_Normal1;Normal1;5;0;Create;True;0;0;False;0;None;77fdad851e93f394c9f8a1b1a63b56f3;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;19;-560,-16;Float;True;Property;_Normal0;Normal0;4;0;Create;True;0;0;False;0;None;652a6b8632964ab44afd65de98957cbd;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;14;-562.0101,-210.8317;Float;True;Property;_Albedo1;Albedo1;3;0;Create;True;0;0;False;0;None;1a090d0c73c1cd14ca16a7ce01a06339;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;13;-557.6038,-404.2532;Float;True;Property;_Albedo0;Albedo0;2;0;Create;True;0;0;False;0;None;019de9a76587a724aa0b644a0370d3ff;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;4;166.033,-97.59175;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.BlendNormalsNode;21;162.1766,33.39661;Float;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;388.1434,-60.91226;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;Mix;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;7;0;8;0
WireConnection;7;1;9;0
WireConnection;6;0;7;0
WireConnection;5;0;6;0
WireConnection;5;1;10;0
WireConnection;5;2;11;0
WireConnection;4;0;13;0
WireConnection;4;1;14;0
WireConnection;4;2;5;0
WireConnection;21;0;19;0
WireConnection;21;1;20;0
WireConnection;0;0;4;0
WireConnection;0;1;21;0
ASEEND*/
//CHKSM=F08D07A7FE7C04F89F4CF02E71A483BACB8DEB3B