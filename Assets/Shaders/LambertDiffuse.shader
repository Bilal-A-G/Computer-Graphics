Shader "Custom/Diffuse"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        
        CGPROGRAM
        #pragma surface surf SimpleLambert

        sampler2D _MainTex;

        float4 LightingSimpleLambert(SurfaceOutput s, fixed3 lightDir, fixed attenuation)
        {
            float diffuseStrength = dot(s.Normal, normalize(lightDir));
            float3 colour = s.Albedo * _LightColor0.rgb * diffuseStrength;
            return float4(colour.rgb, 0);
        }

        struct Input
        {
            float2 uv_MainTex;
        };

        fixed4 _Color;

        void surf (Input IN, inout SurfaceOutput o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
            o.Albedo = c.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
