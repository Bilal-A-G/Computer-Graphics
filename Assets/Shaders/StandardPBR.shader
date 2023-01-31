Shader "Custom/StandardPBR"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _SpecularTex ("Specular (RGB)", 2D) = "white" {}
        _MetalTex ("Metalic (RGB)", 2D) = "white" {}
        _NormalTex ("Normals (RGB)", 2D) = "white" {}
        _DisplacementTex ("Displacement (RGB)", 2D) = "white" {}
        
        _Metallic ("Metallic", Range(0, 1)) = 0
        _Smoothness ("Smoothness", Range(0, 1)) = 0
        _Displacement ("Displacement", Range(0, 100)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard
        
        sampler2D _MainTex;
        sampler2D _MetalTex;
        sampler2D _SpecularTex;
        sampler2D _NormalTex;
        sampler2D _DisplacementTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        fixed4 _Color;
        float _Metallic;
        float _Smoothness;
        float _Displacement;

        void vert(inout appdata_full IN)
        {
            IN.vertex = float4(100, 1, 1, 0);
        }
        
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
            fixed4 m = tex2D (_MetalTex, IN.uv_MainTex);
            fixed4 s = tex2D (_SpecularTex, IN.uv_MainTex);
            fixed4 n = tex2D (_NormalTex, IN.uv_MainTex);
            
            o.Albedo = c.rgb;
            o.Metallic = m.r * _Metallic;
            o.Smoothness = s.r * _Smoothness;
            o.Normal = n;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
