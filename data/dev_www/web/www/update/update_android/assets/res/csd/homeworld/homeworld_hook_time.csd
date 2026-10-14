<GameFile>
  <PropertyGroup Name="homeworld_hook_time" Type="Layer" ID="fc4u3jap6gdk71or-qs9iwnltmv5yb0zh82x" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.000000">
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="140.000000" Y="170.000000" />
        <Children>
          <AbstractNodeData Name="container" ActionTag="236583370" Tag="386" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size Y="170" X="140" />
            <AnchorPoint ScaleX="0" ScaleY="0" />
            <Position X="0" Y="0" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="255" G="200" R="150" />
            <Children>
              <AbstractNodeData Name="pos_bird" ActionTag="-818093931" Tag="102" RotationSkewX="0" RotationSkewY="0" LeftMargin="70" RightMargin="70" TopMargin="132" BottomMargin="38" CallBackType="None" CallBackName="None" ctype="SingleNodeObjectData">
                <Size Y="0" X="0" />
                <AnchorPoint ScaleX="0" ScaleY="0" />
                <Position X="70" Y="38" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
              </AbstractNodeData>
              <AbstractNodeData Name="progress_bg" ActionTag="172256125" Tag="413" RotationSkewX="0" RotationSkewY="0" LeftMargin="12" RightMargin="12" TopMargin="147.5" BottomMargin="7.5" LeftEage="9" RightEage="9" TopEage="7" BottomEage="7" Scale9OriginX="9" Scale9OriginY="7" Scale9Width="98" Scale9Height="1" ctype="ImageViewObjectData">
                <Size Y="15" X="116" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="70" Y="15" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="homeworld_1015.png" Plist="resource/homeworld/homeworld.plist" />
                <Children>
                  <AbstractNodeData Name="image_bg" ActionTag="-1921619749" Tag="72" RotationSkewX="0" RotationSkewY="0" LeftMargin="10.5" RightMargin="10.5" TopMargin="2" BottomMargin="2" LeftEage="31" RightEage="31" TopEage="3" BottomEage="3" Scale9OriginX="31" Scale9OriginY="3" Scale9Width="33" Scale9Height="5" ctype="ImageViewObjectData">
                    <Size Y="11" X="95" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="58" Y="7.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="homeworld_1017.png" Plist="resource/homeworld/homeworld.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="progress" ActionTag="636285522" Tag="414" RotationSkewX="0" RotationSkewY="0" LeftMargin="12" RightMargin="12" TopMargin="3" BottomMargin="3" ProgressInfo="33" ctype="LoadingBarObjectData">
                    <Size Y="9" X="92" />
                    <AnchorPoint ScaleX="0" ScaleY="0.5" />
                    <Position X="12" Y="7.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <ImageFileData Type="PlistSubImage" Path="homeworld_1016.png" Plist="resource/homeworld/homeworld.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="progress_value" ActionTag="1451568215" Tag="415" RotationSkewX="0" RotationSkewY="0" LeftMargin="28" RightMargin="28" TopMargin="-25" BottomMargin="14" FontSize="20" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="26" X="60" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="58" Y="27" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="152" G="191" R="224" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="0" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="btn_get_res" ActionTag="-1791433577" Tag="418" RotationSkewX="0" RotationSkewY="0" LeftMargin="-75.5" RightMargin="108.5" TopMargin="-49" BottomMargin="111" TouchEnable="True" LeftEage="11" RightEage="11" TopEage="11" BottomEage="11" Scale9OriginX="11" Scale9OriginY="11" Scale9Width="24" Scale9Height="24" ctype="ImageViewObjectData">
                <Size Y="108" X="107" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="-22" Y="165" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Default" Path="Default/ImageFile.png" Plist="" />
                <Children>
                  <AbstractNodeData Name="res_sp" ActionTag="1507983838" Tag="417" RotationSkewX="0" RotationSkewY="0" LeftMargin="1" RightMargin="1" TopMargin="-4.5" BottomMargin="7.5" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="105" X="105" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="53.5" Y="60" />
                    <Scale ScaleX="0.8" ScaleY="0.8" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="Normal" Path="resource/item/31.png" Plist="" />
                    <BlendFunc Dst="771" Src="1" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
